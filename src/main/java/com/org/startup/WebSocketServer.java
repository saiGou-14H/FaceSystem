package com.org.startup;

import com.alibaba.fastjson2.JSON;
import com.alibaba.fastjson2.JSONObject;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.org.config.utils.HttpClientUtils;
import com.org.config.utils.ImageUtil;
import com.org.model.Meeting;
import com.org.model.User;
import com.org.service.IMeetingService;
import com.org.service.IUserMeetingService;
import com.org.service.IUserService;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.apache.http.HttpEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpUriRequest;
import org.apache.http.util.EntityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import javax.websocket.*;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.*;

import static com.org.config.utils.HttpClientUtils.client;
import static com.org.config.utils.HttpClientUtils.getRequestMethod;

/**
 * Created with IntelliJ IDEA.
 * @ Auther:
 * @ Date: 2020/06/16/14:35
 * @ Description:
 * @ ServerEndpoint 注解是一个类层次的注解，它的功能主要是将目前的类定义成一个websocket服务器端,
 * 注解的值将被用于监听用户连接的终端访问URL地址,客户端可以通过这个URL来连接到WebSocket服务器端
 */
@Component
@Slf4j
@Service
@ServerEndpoint("/api/websocket/{sid}")
public class WebSocketServer {
    //静态变量，用来记录当前在线连接数。应该把它设计成线程安全的。
    private static int onlineCount = 0;
    //concurrent包的线程安全Set，用来存放每个客户端对应的MyWebSocket对象。
    private static CopyOnWriteArraySet<WebSocketServer> webSocketSet = new CopyOnWriteArraySet<WebSocketServer>();


    //与某个客户端的连接会话，需要通过它来给客户端发送数据
    private Session session;

    private static IUserMeetingService userMeetingService;
    private static IUserService userService;
    private static IMeetingService meetingService;
    @Autowired
    public void runIUserMeetingService(IUserMeetingService userMeetingService)
    {WebSocketServer.userMeetingService=userMeetingService;}
    @Autowired
    public void runIUserService(IUserService userService)
    {WebSocketServer.userService=userService;}
    @Autowired
    public void runIMeetingService(IMeetingService meetingService)
    {WebSocketServer.meetingService=meetingService;}


    ExecutorService cachedThreadPool = Executors.newCachedThreadPool();

    //接收sid
    private String sid = "";
    //public static IDetRecordService pp;
    /**
     * 连接建立成功调用的方法
     */
    @OnOpen
    public void onOpen(Session session, @PathParam("sid") String sid) {

        this.session = session;
        webSocketSet.add(this);     //加入set中
        this.sid = sid;
        addOnlineCount();           //在线数加1
        try {
            sendMessage(JSON.toJSONString(listingResult(Integer.valueOf(sid))));                 //返回给前端数据
        }catch (Exception e) {e.printStackTrace();}
//        try {
//            //sendMessage("conn_success");
//            log.info("有新窗口开始监听:" + sid + ",当前在线人数为:" + getOnlineCount());
//        } catch (IOException e) {
//            log.error("websocket IO Exception");
//        }
    }

    /**
     * 连接关闭调用的方法
     */
    @OnClose
    public void onClose() {
        webSocketSet.remove(this);  //从set中删除
        subOnlineCount();           //在线数减1
        //断开连接情况下，更新主板占用情况为释放
        log.info("释放的sid为："+sid);
        //这里写你 释放的时候，要处理的业务
        log.info("有一闸机关闭！当前在线闸机数为" + getOnlineCount());
    }

    /**
     * 收到客户端消息后调用的方法
     * @ Param message 客户端发送过来的消息
     */
    @OnMessage
    public void onMessage(String message){
        //log.info("收到来自窗口" + sid + "的信息:\n" + message);
        //Map jsonObject=JSONObject.parseObject(message,Map.class);
        socketThread runnable = new socketThread(message);                      //开启线程打开关闭http请求
//        Thread sonThread = new Thread(runnable);                                           //启用线程
//        sonThread.start();
        //Future future= cachedThreadPool.submit(runnable);
        //future.get();
        try {           //加入线程池并获取结果,记得要get()
            cachedThreadPool.submit(runnable).get();
        } catch (Exception e) {e.printStackTrace();}

        System.out.println("线程名为："+Thread.currentThread().getName()+"在工作");

        Integer meetingid = 0;
        String pythonMessage = "None";
//        while (sonThread.isAlive()) {
            meetingid = runnable.meetingid;
            pythonMessage = runnable.pythonMessage;
//        }
        System.out.println("python传来消息"+pythonMessage);
        if(pythonMessage!=null && !pythonMessage.equals("None") && !pythonMessage.equals("{}")) {
            JSONObject jsonObject =  JSON.parseObject(pythonMessage);
            for(Map.Entry<String, Object> entry: jsonObject.entrySet()) {                        //id为键，用户名为值
                Integer userid=0;
                Object obj = entry.getValue();
                if(obj instanceof String) {
                    //System.out.println("key:" + entry.getKey() + ",value:" + entry.getValue());
                    userid = Integer.parseInt(entry.getKey());
                    try {
                        sendMessage(JSON.toJSONString(successResult(userid)));                 //返回给前端数据
                        userMeetingService.sign(userid, meetingid);                             //更新数据
                        System.out.println(meetingid+"会议："+userid+"-"+entry.getValue()+"签到了");
                    }catch (Exception e) {e.printStackTrace();}
                } else {System.out.println("键值类型错误");}
            }
        }
        //群发消息
//        for (WebSocketServer item : webSocketSet) {
//            try {
//                item.sendMessage(pythonMessage);
//            } catch (IOException e) {
//                e.printStackTrace();
//            }
//        }
    }
    /*
     * 返回会议信息给前端
     * */
    public Map<String, String> listingResult(Integer meetingid) {
        Meeting meeting=null;
        try{
            meeting = meetingService.getOne(new QueryWrapper<Meeting>().eq("id", meetingid));  //查找会议
        }catch (Exception e) {e.printStackTrace();}

        Map<String, String> result = new HashMap<>();   //封装结果
        Map<String, String> mapResult = new HashMap<>();
        if(meeting!=null){
            /*python需要的完整信息*/
            try{
                String time = meeting.getMeetingTime();
                String startTime = time.substring(0,16);
                String endTime = time.substring(0,11)+time.substring(17);

                result.put("theme", meeting.getName());
                result.put("startTime",startTime);
                result.put("signTime", meeting.getSignTime());
                result.put("endTime", endTime);
                mapResult.put("data", JSON.toJSONString(result));
                mapResult.put("code", "201");
            }catch (Exception e) {e.printStackTrace();}
        }else{
            result.put("error", "不存在该会议ID");
            mapResult.put("data", JSON.toJSONString(result));
            mapResult.put("code", "202");
        }

        return mapResult;
    }

    /*
     * 返回用户id和用户名和头像给前端
     * */
    public Map<String, String> successResult(Integer userid) {
        User user = null;
        try{
           user = userService.getOne(new QueryWrapper<User>().eq("id", userid));  //查找用户
        }catch (Exception e) {e.printStackTrace();}


        Map<String, String> result = new HashMap<>();   //封装结果
        Map<String, String> mapResult = new HashMap<>();
        if(user!=null){
            /*python需要的完整信息*/
            try{
                String base64str = ImageUtil.PicToBase64(user);
                result.put("Type", "BASE64S");
                result.put("base64", base64str);
                result.put("userid", String.valueOf(userid));
                result.put("name", user.getUsername());
                /*python需要的完整信息*/
                mapResult.put("data", JSON.toJSONString(result));
                mapResult.put("code", "200");
            }catch (Exception e) {e.printStackTrace();}
        }else{
            result.put("error", "不存在该用户");
            mapResult.put("data", JSON.toJSONString(result));
            mapResult.put("code", "203");
        }

        return mapResult;
    }
    /**
     * @ Param session
     * @ Param error
     */
    @OnError
    public void onError(Session session, Throwable error) {
        log.error("发生错误");
        error.printStackTrace();
    }

    /**
     * 实现服务器主动推送
     */
    public void sendMessage(String message) throws IOException {
        this.session.getBasicRemote().sendText(message);
    }

    /**
     * 群发自定义消息
     */
    public static void sendInfo(String message, @PathParam("sid") String sid) throws IOException {
        log.info("推送消息到窗口" + sid + "，推送内容:" + message);

        for (WebSocketServer item : webSocketSet) {
            try {
                //这里可以设定只推送给这个sid的，为null则全部推送
                if (sid == null) {
//                    item.sendMessage(message);
                } else if (item.sid.equals(sid)) {
                    item.sendMessage(message);
                }
            } catch (IOException e) {
                continue;
            }
        }
    }

    public static synchronized int getOnlineCount() {
        return onlineCount;
    }
    public static synchronized void addOnlineCount() {
        WebSocketServer.onlineCount++;
    }
    public static synchronized void subOnlineCount() {
        WebSocketServer.onlineCount--;
    }
    public static CopyOnWriteArraySet<WebSocketServer> getWebSocketSet() {
        return webSocketSet;
    }
}

class socketThread implements Runnable {

    String message;
    String pythonMessage;
    Integer meetingid;

    socketThread(String message){
        this.message=message;
    }

    @Override
    @SneakyThrows
    public void run() {
        HttpClientUtils.getConnection();                                        //打开http请求
        Map<String, Object> map = null;
        Map<String, String> result = new HashMap<>();

        try {
            map = (Map) JSON.parse(message);
            JSONObject data = (JSONObject) map.get("data");
            meetingid = Integer.parseInt(String.valueOf(data.get("meetingid")));    //取出当前会议id
            System.out.println("meetingid:"+meetingid);
            result.put("data", JSON.toJSONString(data));
        } catch (Exception e) {}
        CloseableHttpResponse httpResponse = null;

        if (map != null) {
            try {
                HttpUriRequest post = getRequestMethod(result, "http://www.saigoumvp.work:5001/searchface", "post");
                httpResponse = (CloseableHttpResponse) client.execute(post);
                if (httpResponse.getStatusLine().getStatusCode() == 200) {              //接收python识别的信息
                    HttpEntity entity = httpResponse.getEntity();
                    pythonMessage = EntityUtils.toString(entity, "utf-8");
                }
                /*关闭响应*/
                if(httpResponse != null) {httpResponse.close();}
            } catch (Exception e) {if(httpResponse != null) {httpResponse.close();}}
//            HttpClientUtils.getClose();         // 关闭连接
        }
    }
}