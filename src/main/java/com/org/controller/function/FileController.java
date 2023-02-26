package com.org.controller.function;

import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.org.model.Result;
import com.org.model.User;
import com.org.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.net.URLEncoder;

@Controller
@RequestMapping("file")
public class FileController {

    @Autowired
    private IUserService userService;

    /*法一，上传文件*/
    //@RequestParam("file") 将name=file控件得到的文件封装成CommonsMultipartFile 对象
    //批量上传CommonsMultipartFile则为数组即可
//    @RequestMapping("/upload1")
//    @ResponseBody
//    public Result fileUpload(@RequestParam("file") CommonsMultipartFile file , HttpServletRequest request) throws IOException {
//        Result result = new Result();
//
//        //获取文件名 : file.getOriginalFilename();
//        String uploadFileName = file.getOriginalFilename();
//
//        //如果文件名为空，直接回到首页！
//        if ("".equals(uploadFileName)){
//            result.setCode(500);
//            result.setMessage("文件为空");
//            return result;
//        }
//        System.out.println("上传文件名 : "+uploadFileName);
//
//        //上传路径保存设置
//        String path = request.getServletContext().getRealPath("/upload");
//        System.out.println(path);
//        //如果路径不存在，创建一个
//        File realPath = new File(path);
//        if (!realPath.exists()){
//            realPath.mkdir();
//        }
//        System.out.println("上传文件保存地址："+realPath);
//
//        InputStream is = file.getInputStream(); //文件输入流
//        OutputStream os = new FileOutputStream(new File(realPath,uploadFileName)); //文件输出流
//
//        //读取写出
//        int len=0;
//        byte[] buffer = new byte[1024];
//        while ((len=is.read(buffer))!=-1){
//            os.write(buffer,0,len);
//            os.flush();
//        }
//        os.close();
//        is.close();
//
//
//        return "success";
//    }

    /*法二，上传文件
     * 采用file.Transto 来保存上传的文件
     */
    /*上传头像*/
    @RequestMapping("/uploadHead")
    @ResponseBody
    public Result uploadHead(@RequestParam("head") CommonsMultipartFile file, HttpServletRequest request) throws IOException {
        Result result = new Result();
        String src = "/upload/head";        //设置头像保存路径

        //上传路径保存设置
        String path = request.getServletContext().getRealPath(src);
        File realPath = new File(path);
        if (!realPath.exists()){            //如果没有目录就创建
            realPath.mkdir();
        }

        //上传文件地址
        System.out.println("头像保存路径："+realPath);
        HttpSession session = request.getSession();
        UpdateWrapper<User> uWrapper = new UpdateWrapper<>();
        uWrapper.eq("email", session.getAttribute("email"));    //从session中取email
        User user = new User();
        user.setHeadUrl(src);
        userService.update(user, uWrapper);                                 //更新数据库

        //通过CommonsMultipartFile的方法直接写文件（注意这个时候）
        file.transferTo(new File(realPath +"/"+ file.getOriginalFilename()));
        result.setCode(200);
        result.setMessage(src);

        return result;                      //返回状态码和头像保存地址
    }
    /*上传人脸*/
    @RequestMapping("/uploadFace")
    @ResponseBody
    public Result uploadFace(@RequestParam("face") CommonsMultipartFile file, HttpServletRequest request) throws IOException {
        Result result = new Result();
        String src = "/upload/face";

        //上传路径保存设置
        String path = request.getServletContext().getRealPath(src);
        File realPath = new File(path);
        if (!realPath.exists()){
            realPath.mkdir();
        }

        //上传文件地址
        System.out.println("人脸照片保存路径："+realPath);
        UpdateWrapper<User> uWrapper = new UpdateWrapper<>();
        HttpSession session = request.getSession();
        uWrapper.eq("email", session.getAttribute("email"));    //从session中取email
        User user = new User();
        user.setFaceUrl(src);
        userService.update(user, uWrapper);                                 //更新数据库

        result.setCode(200);
        result.setMessage(src);

        //通过CommonsMultipartFile的方法直接写文件（注意这个时候）
        file.transferTo(new File(realPath +"/"+ file.getOriginalFilename()));

        return result;
    }
    /*上传文件*/
    @RequestMapping("/uploadFile")
    @ResponseBody
    public Result uploadFile(@RequestParam("file") CommonsMultipartFile file, HttpServletRequest request) throws IOException {
        Result result = new Result();
        String src = "/upload/file";        //设置文件保存路径

        //上传路径保存设置
        String path = request.getServletContext().getRealPath(src);
        File realPath = new File(path);
        if (!realPath.exists()){            //如果没有目录就创建
            realPath.mkdir();
        }
        //上传文件地址
        System.out.println("文件保存路径："+realPath);
        HttpSession session = request.getSession();
        UpdateWrapper<User> uWrapper = new UpdateWrapper<>();
        uWrapper.eq("email", session.getAttribute("email"));    //从session中取email
        User user = new User();
        user.setHeadUrl(src);
        userService.update(user, uWrapper);                                 //更新数据库

        //通过CommonsMultipartFile的方法直接写文件（注意这个时候）
        file.transferTo(new File(realPath +"/"+ file.getOriginalFilename()));

        result.setCode(200);
        result.setMessage(src);

        return result;
    }

    /*下载文件*/
    @RequestMapping(value="/download")
    public Result downloads(HttpServletResponse response, HttpServletRequest request, @RequestParam("filename") String filename) throws Exception{
        Result result = new Result();
        String src = "/upload/file";        //设置文件下载路径

        //要下载的图片地址
        String  path = request.getServletContext().getRealPath(src);
        String  fileName = filename;

        //1、设置response 响应头
        response.reset(); //设置页面不缓存,清空buffer
        response.setCharacterEncoding("UTF-8"); //字符编码
        response.setContentType("multipart/form-data"); //二进制传输数据
        //设置响应头
        response.setHeader("Content-Disposition",
                "attachment;fileName="+ URLEncoder.encode(fileName, "UTF-8"));

        File file = new File(path,fileName);

        if(!file.exists()) {            //如果文件不存在
            result.setCode(500);
            result.setMessage("文件不存在");
            return result;
        }
        else {
            //2、 读取文件--输入流
            InputStream input = new FileInputStream(file);
            //3、 写出文件--输出流
            OutputStream out = response.getOutputStream();

            byte[] buff = new byte[1024];
            int index = 0;
            //4、执行 写出操作
            while ((index = input.read(buff)) != -1) {
                out.write(buff, 0, index);
                out.flush();
            }
            out.close();
            input.close();

            result.setCode(200);
            result.setMessage("文件下载成功");
        }

        return result;
    }

}