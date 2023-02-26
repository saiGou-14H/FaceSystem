package com.org.controller;

import com.auth0.jwt.interfaces.Claim;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.org.config.utils.JwtUtil;
import com.org.mapper.MeetingMapper;
import com.org.model.Meeting;
import com.org.model.Result;
import com.org.model.UserMeeting;
import com.org.model.dto.Meeting1DTO;
import com.org.model.vo.MeetingVO;
import com.org.service.IMeetingService;
import com.org.service.IUserMeetingService;
import com.org.service.IUserService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.SneakyThrows;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author B.M
 * @since 2022-05-31
 */
@Api(value = "会议接口")
@RestController
@RequestMapping("/meeting")
public class MeetingController {

    @Autowired
    private IMeetingService meetingService;
    @Autowired
    private IUserMeetingService userMeetingService;
    @Autowired
    private IUserService userService;
    @Autowired
    private MeetingMapper meetingMapper;

    //add
    @ApiOperation(value = "创建会议")
    @PostMapping("/createMeeting")
    public Result createMeeting(HttpServletRequest request, @RequestBody Meeting meeting) {
        System.out.println(meeting.toString());
        meetingService.save(meeting);           //插入会议数据
        System.out.println(meetingService.toString());

        UserMeeting userMeeting = new UserMeeting();
        userMeeting.setUmPower(3);
        userMeeting.setUserId(JwtUtil.getUserId(request));
        userMeeting.setMeetingId(meeting.getId());
        //插入用户与会议的关联

        if(!userMeetingService.save(userMeeting)) {
            Result.failure(500,"创建会议失败");
        }

        return Result.success(meeting.getId());
    }

    /*delete*/
    @ApiOperation(value = "管理员-删除会议")
    @GetMapping("/deleteMeeting")
    public Result deleteUserMeeting(HttpServletRequest request, Integer meetingid) {
        System.out.println("meetingid="+meetingid);

        QueryWrapper qw = new QueryWrapper();
        qw.eq("user_id",JwtUtil.getUserId(request));
        qw.eq("meeting_id", meetingid);

        userMeetingService.remove(qw);              //删除用户-会议关联
        //再删除会议
        int flag = meetingMapper.deleteById(meetingid);
        if(flag>0) {
            System.out.println(flag);
            Result.failure(500,"删除会议失败");
        }

        return Result.success(200,"成功删除会议");
    }
//    @ApiOperation(value = "管理员-删除会议时间段")
//    @GetMapping("/deleteMeetingTime")
//    public Result deleteMeetingTime(Integer meetingid) {
//        if() {
//
//        }
//        return Result.success(200,"成功删除原会议时间段");
//    }

    //update
    @ApiOperation(value = "修改会议信息")
    @PostMapping("/updateMeeting" )
    public Result updatMeeting(@RequestBody Meeting meeting) {

        UpdateWrapper uw = new UpdateWrapper();
        uw.eq("id", meeting.getId());

        if(!meetingService.update(meeting, uw)) return Result.failure(500, "更新失败");

        return Result.success(200,"更新成功");
    }

    @ApiOperation(value = "代签")
    @GetMapping("/signByAdmin")
    public Result signByAdmin(Integer userid, Integer meetingid) {
        if(!userMeetingService.signByAdmin(userid, meetingid)) {
            return Result.failure(500, "请检查！");
        }

        return Result.success(200, "代签成功");
    }
    @ApiOperation(value = "管理员-取消签到")
    @GetMapping("/deleteSignByAdmin")
    public Result deleteSignByAdmin(Integer userid, Integer meetingid) {
        if(!userMeetingService.deleteSignByAdmin(userid, meetingid)) {
            return Result.failure(500, "请检查！");
        }

        return Result.success(200, "取消签到成功");
    }

    /*search*/
    @ApiOperation(value = "查找我的信息 包括我参加或创建的全部会议")
    @GetMapping("/searchUserMeeting")
    public Result searchUserMeeting(HttpServletRequest request) {

        String token = request.getHeader("token");
        Map<String, Claim> userData = JwtUtil.verifyToken(token);
        //解析token
        Integer id = userData.get("userid").asInt();

        List<MeetingVO> userList = userService.searchUserMeeting(id);
        System.out.println("查找我的信息 包括我参加或创建的全部会议："+id);

        return Result.success(userList);
    }
    @ApiOperation(value = "模糊查找用户/管理员参加、创建的会议")
    @PostMapping("/searchUserMeetingByWant")
    public Result searchUserMeetingByWant(@RequestBody Meeting1DTO meeting1DTO, HttpServletRequest request) {

        String token = request.getHeader("token");
        Map<String, Claim> userData = JwtUtil.verifyToken(token);
        //解析token
        meeting1DTO.setUserid(userData.get("userid").asInt());

        List<MeetingVO> userList = meetingService.searchUserMeetingByWant(meeting1DTO);

        return Result.success(userList);
    }

    @ApiOperation(value = "分页查询用户参加或创建的全部会议")
    @GetMapping("/searchMeetingByPage")
    public Result searchMeetingByPage(HttpServletRequest request, Integer page, Integer row) {
        List<Meeting> meetingList =
                meetingService.searchMeetingByPage(JwtUtil.getUserId(request), (page-1)*row, row);
        return Result.success(meetingList);
    }

    @ApiOperation(value = "查询会议参会人员的信息")
    @GetMapping("/searchUserMessage")
    public Result searchUserMessage(Integer meetingid) {

        System.out.println("进入"+meetingid+"会议签到界面");
        List<UserMeeting> userMeetings = userMeetingService.searchUserMessage(meetingid);

        return Result.success(userMeetings);
    }

    @ApiOperation(value = "导出参会人员信息模板")
    @GetMapping ("/downloadUserModel")
    @SneakyThrows
    public Result downloadUserModel(HttpServletResponse response){
        //meetingid=0默认未下载模板
        meetingService.download(response, 0);
        return null;                        //不返回null的话会报错
    }
    @ApiOperation(value = "导出会议参会情况")
    @GetMapping ("/downloadMeetingData")
    @SneakyThrows
    public Result download(HttpServletResponse response,@RequestParam("meetingid") Integer meetingid){

        if(meetingService.download(response, meetingid) == null) {
            System.out.println("导出数据失败");
            return Result.failure(500, "此会议不存在");
        };
        return null;                        //不然会报错
    }

    @ApiOperation(value = "查找会议中已签到的用户")
    @GetMapping ("/searchUserSateOK")
    public Result searchUserSateOK(Integer meetingid) {
        return Result.success(meetingService.searchUserSateOK(meetingid));
    }
    @ApiOperation(value = "查找会议中未签到的用户")
    @GetMapping ("/searchUserSateNO")
    public Result searchUserSateNO(Integer meetingid) {
        return Result.success(meetingService.searchUserSateNO(meetingid));
    }
    @ApiOperation(value = "模糊查找会议中已签到的用户")
    @GetMapping ("/searchUserSateOKByWant")
    public Result searchUserSateOKByWant(Integer meetingid, String username) {
        Map<String, Object> map = new HashMap<>();
        map.put("meetingid", meetingid);
        map.put("username", username);
        return Result.success(meetingService.searchUserSateOKByWant(map));
    }
    @ApiOperation(value = "模糊查找会议中未签到的用户")
    @GetMapping ("/searchUserSateNOByWant")
    public Result searchUserSateNOByWant(Integer meetingid, String username) {
        Map<String, Object> map = new HashMap<>();
        map.put("meetingid", meetingid);
        map.put("username", username);
        return Result.success(meetingService.searchUserSateNOByWant(map));
    }

    @ApiOperation(value = "查找单个会议的主持人")
    @GetMapping("/searchHost")
    public Result searchHost(Integer meetingid){
        return Result.success(meetingService.searchHost(meetingid));
    }

    @ApiOperation(value = "查找用户/单个会议的基本信息")
    @GetMapping("/searchSingleMeeting")
    public Result searchSingleMeeting(Integer meetingid){

        return Result.success(meetingService.searchSingleMeeting(meetingid));
    }

    @ApiOperation(value = "查找全部会议的基本信息")
    @GetMapping("/searchAllMeeting")
    public Result searchAllMeeting() {

        Map<String, Object> map = new HashMap<>();

        List<MeetingVO> meetingList = meetingService.searchAllMeeting();
        long count = meetingService.count();                //再查找会议数目
        map.put("meetings", meetingList);
        map.put("count", count);

        return Result.success(map);
    }

    @ApiOperation(value = "管理员-模糊查询会议")
    @PostMapping("/searchMeeting")
    public Result searchMeeting(@RequestBody Meeting1DTO meeting1DTO) {
        return Result.success(meetingService.searchMeeting(meeting1DTO));
    }

}
