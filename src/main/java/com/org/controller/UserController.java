package com.org.controller;

import Decoder.BASE64Encoder;
import com.alibaba.fastjson2.JSON;
import com.alibaba.fastjson2.JSONObject;
import com.auth0.jwt.interfaces.Claim;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.org.config.utils.*;
import com.org.model.*;
import com.org.model.dto.User2DTO;
import com.org.model.dto.UserDTO;
import com.org.model.vo.User2VO;
import com.org.service.IUserDepartmentService;
import com.org.service.IUserMeetingService;
import com.org.service.IUserRoleService;
import com.org.service.IUserService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.SneakyThrows;
import org.apache.http.HttpEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpUriRequest;
import org.apache.http.util.EntityUtils;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFPictureData;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.testng.annotations.Test;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.math.BigDecimal;
import java.util.*;

import static com.org.config.utils.HttpClientUtils.client;
import static com.org.config.utils.HttpClientUtils.getRequestMethod;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author B.M
 * @since 2022-05-31
 */
@Api(value = "用户接口")
@RestController
@RequestMapping("user")
public class UserController {

    @Autowired
    private IUserService userService;
    @Autowired
    private IUserRoleService userRoleService;
    @Autowired
    private IUserMeetingService userMeetingService;
    @Autowired
    private IUserDepartmentService userDepartmentService;

    //add
    @ApiOperation(value = "验证新用户")
    @GetMapping(value = "preinsertUser")
    public Result preinsertUser(String email) {
        QueryWrapper<User> qw = new QueryWrapper<>();
        qw.eq("email", email);
        User oldUser =  userService.getOne(qw);         //先查询此账号是否被注册

        String mailCode = null;
        if(oldUser == null) {                           //没有的话
            mailCode = new MailUtil().sendSimpleEmail(email);
        } else {return Result.failure(500, "该账号已被注册");}

        return Result.success(mailCode);
    }

    @ApiOperation(value = "管理员/用户-新增用户")
    @PostMapping("/insertUser")
    public Result insertUser(@RequestBody User user, Integer departmentid) {

        if(userService.getOne(new QueryWrapper<User>().eq("email", user.getEmail())) != null) {
            return Result.failure(500, "该邮箱已被注册，请检查邮箱是否正确");
        }

        userService.save(user);                     //往用户表插入数据

        QueryWrapper<UserRole> qw =  new QueryWrapper<>();
        qw.eq("user_id", user.getId());
        UserRole userRole = new UserRole();
        userRole.setUserId(user.getId());
        userRole.setRoleId(1);                      //默认是普通用户
        userRoleService.save(userRole);             //往用户角色表建立关联

        UserDepartment userDepartment = new UserDepartment();
        userDepartment.setUserid(user.getId());
        userDepartment.setDepartmentid(departmentid);
        userDepartmentService.save(userDepartment);

        Map<String,Object> map = new HashMap<>();
        map.put("id",user.getId());
        map.put("username",user.getUsername());
        map.put("email",user.getEmail());

        return Result.success(map);
    }

    @ApiOperation(value = "管理员-批量注册1")      //通过前端导入图片
    @PostMapping("/insertUsers1")
    public Result insertUsers1(@RequestBody List<UserDTO> userList, Integer meetingid) {
        List<User> users = new ArrayList<>();                //已经存在的用户
        int success = 0;                                    //计算插入成功
        int failure = 0;                                    //计算插入失败

        Iterator<UserDTO> iterator = userList.iterator();
        UserDTO newUser = null;
        User oldUser = null;
        /*需要存入数据库的*/
        User user = null;
        UserRole userRole = null;
        UserMeeting userMeeting = null;

        while (iterator.hasNext()) {
            newUser = iterator.next();
            QueryWrapper<User> qw =  new QueryWrapper<>();
            qw.eq("email", newUser.getEmail());
            oldUser = userService.getOne(qw);
            if(oldUser != null) {                           //如果已存在此用户
                users.add(oldUser);
                System.out.println("用户"+oldUser.getEmail()+"-"+oldUser.getUsername()+"已存在");
                failure++;
            } else {
                user = new User();
                /*用户基本信息*/
                user.setEmail(newUser.getEmail());
                user.setUsername(newUser.getUsername());
                user.setPassword(newUser.getEmail());
                /*用户人脸位置*/
                String base64str = newUser.getBase64Face();
                Map<String, String> filemap = ImageUtil.Base64ToPicByAdmin("face", base64str, user);
                user.setFaceUrl(filemap.get("src")+filemap.get("picName"));
                userService.save(user);                     //往用户表插入数据
                /*再将此用户人脸传给python*/
                try {
                    addFace(user, base64str);
                }catch (Exception e) {e.printStackTrace();}

                /*用户权限*/
                userRole = new UserRole();
                userRole.setUserId(user.getId());
                userRole.setRoleId(1);                      //默认是普通用户
                userRoleService.save(userRole);             //往用户角色表建立关联
                /*用户和会议关联*/
                if(meetingid > 0) {
                    userMeeting = new UserMeeting();
                    userMeeting.setUmPower(1);              //默认普通用户
                    userMeeting.setUserId(user.getId());    //设置用户id
                    userMeeting.setMeetingId(meetingid);    //设置会议id
                    userMeetingService.save(userMeeting);
                }
                success++;
            }
        }

        String message = "导入"+userList.size()+"用户，成功注册"+success+"位，已返回存在用户"+failure+"位";
        return Result.success(200, message, users);
    }

    @ApiOperation(value = "管理员-批量注册2")              //通过导入Excel表
    @PostMapping("/insertUsers2")
    public Result insertUsers2(@RequestParam("Excel_user") MultipartFile file, Integer meetingid) throws Exception {
        List<User> users = new ArrayList<>();           //已经存在的用户
        int success = 0;                                //计算插入成功
        int failure = 0;                                //计算插入失败

        /*获取文件流*/
        FileInputStream inputStream = (FileInputStream) file.getInputStream();
        /*创建工作簿*/
        Workbook workbook = new XSSFWorkbook(inputStream);
        Sheet sheet = workbook.getSheetAt(0);

        /*获取表中内容*/
        Row rowTitle = sheet.getRow(0);
        int rowCount = sheet.getPhysicalNumberOfRows();
        /*判断老用户*/
        User oldUser = null;
        /*需要存入数据库的*/
        User newUser = null;
        UserRole userRole = null;
        UserMeeting userMeeting = null;
        List<XSSFPictureData> pictures = (List<XSSFPictureData>) workbook.getAllPictures();
        // 对字节数组Base64编码
        BASE64Encoder encoder = new BASE64Encoder();
        for(int rowNum=1; rowNum<rowCount; rowNum++) {
            Row rowData = sheet.getRow(rowNum);
            newUser = new User();
            userRole = new UserRole();
            userMeeting = new UserMeeting();
            boolean flag = true;
            // 返回Base64编码过的字节数组字符串
            String base64str = null;

            if(rowData != null) {
                int colCount = rowTitle.getPhysicalNumberOfCells();//获取所有列数
                for(int colNum=0; colNum<colCount; colNum++) {
                    Cell cell = rowData.getCell(colNum);
                    flag = true;
                    if(cell != null) {
                        switch (colNum) {
                            case 0:     //直接先从邮箱判断是否老用户
                                newUser.setEmail(cell.getStringCellValue());

                                QueryWrapper<User> qw =  new QueryWrapper<>();
                                qw.eq("email", newUser.getEmail());
                                oldUser = userService.getOne(qw);
                                if(oldUser != null) {            //如果已存在此用户
                                    users.add(oldUser);
                                    System.out.println("用户"+oldUser.getEmail()+"-"+oldUser.getUsername()+"已存在");
                                    failure++;
                                    flag = false;                           //跳出这行数据的读取
                                    break;
                                }
                                break;
                            case 1:
                                newUser.setPassword(cell.toString().substring(0,cell.toString().length()-2));
                                break;
                            case 2:
                                newUser.setUsername(cell.getStringCellValue());
                                break;
                            case 3:
                                newUser.setSex(cell.getStringCellValue());
                                break;
                            case 4:
                                newUser.setAge(Integer.parseInt(cell.toString().substring(0,cell.toString().length()-2)));
                                break;
                            case 5:
                                BigDecimal db = new BigDecimal(cell.toString());
                                newUser.setPhone(db.toPlainString());
                                break;
                            case 6:
                                break;
                        }
                    }
                    if(!flag) {
                        System.out.println("已存在"+oldUser.getUsername());
                        break;
                    }
                }

                //读取图片
//                List<XSSFPictureData> pictures = (List<XSSFPictureData>) workbook.getAllPictures();
                System.out.println("---------------"+rowNum+"---------------");
                XSSFPictureData pictureData = pictures.get(rowNum-1);

                byte[] picData = pictureData.getData();
                Map<String, String> filemap = ImageUtil.ByteToPic("face", picData, newUser);
                /*用户人脸位置,如果是老用户，不对他进行注册但会更新人脸头像*/
                newUser.setFaceUrl(filemap.get("src")+filemap.get("picName"));
                /*进行编码*/
                base64str = encoder.encode(Objects.requireNonNull(picData));
            }
            if(flag) {
                userService.save(newUser);                     //往用户表插入数据
                /*再将此用户人脸传给python*/
                try {
                    addFace(newUser, base64str);
                }catch (Exception e) {e.printStackTrace();}
                /*用户权限*/
                userRole.setUserId(newUser.getId());
                userRole.setRoleId(1);                      //默认是普通用户
                userRoleService.save(userRole);             //往用户角色表建立关联
                /*用户和会议关联*/
                //System.out.println("用户id："+newUser.getId()+",会议id"+meetingid);
                if(meetingid > 0) {
                    userMeeting.setUmPower(1);              //默认普通用户
                    userMeeting.setUserId(newUser.getId());             //设置用户id
                    userMeeting.setMeetingId(meetingid);   //设置会议id
                    userMeetingService.save(userMeeting);
                }
                success++;
            }
        }

        inputStream.close();            //关闭流

        String message = "导入"+(success+failure)+"用户，成功注册"+success+"位，已返回存在用户"+failure+"位";
        return Result.success(200, message, users);
    }

    @ApiOperation(value = "导入zip新增用户人脸")
    @PostMapping("/insertHeadByZip")
    public Result insertHeadByZip(@RequestParam("Zip_head") MultipartFile multipartFile) throws Exception {
        File tempFile = FileUtil.multipartFileToFile(multipartFile);       //转为File

        String destDirPath = FileUtil.ZipUncompress(tempFile);                                                       //解压
        tempFile.delete();                  //删除零时文件
        /*遍历人脸*/
        Map<String, Object> map = FileUtil.traverseFace(new File(destDirPath+"/新建文件夹"));
        for(Object key: map.keySet()) {
            Object object = map.get(key);

            String picName = String.valueOf(key);
            System.out.println(picName);
            String[] s = picName.substring(0,picName.length()-4).split("_"); //去掉图片格式后再分割
            System.out.println(s[0]+""+s[1]);

        }

        return Result.success(200, "批量导入成功，已存在的用户有") ;
    }


    @ApiOperation(value = "添加、修改用户进入会议")
    @PostMapping("/insertUserMeeting")
    @SneakyThrows
    public Result insertUserMeeting(@RequestBody UserDTO userDTO) {
        /*移除旧的关联，除了主持人*/
        if(userDTO.getType().equals("修改")) {userMeetingService.deleteOld(userDTO.getMeetingid());}

        List list = new ArrayList<>();
        Iterator<Integer> iterator = userDTO.getIdList().iterator();
        while (iterator.hasNext()) {                             //使用迭代器遍历集合
            UserMeeting userMeeting = new UserMeeting();
            userMeeting.setUmPower(1);              //默认普通用户
            userMeeting.setUserId(iterator.next());             //设置用户id
            userMeeting.setMeetingId(userDTO.getMeetingid());   //设置会议id
            QueryWrapper<UserMeeting> qw = new QueryWrapper();
            qw.eq("user_id", userMeeting.getUserId());
            qw.eq("meeting_id", userDTO.getMeetingid());
            if(userMeetingService.getOne(qw) == null) {
                userMeetingService.save(userMeeting);
            } else {list.add(userMeeting.getUserId());}

        }
        if(list.size() > 0) {return Result.success(200, "成功添加,部分用户以在会议中"+list);}

        return Result.success(200, "成功添加");
    }

    //delete
    @ApiOperation(value = "用户-注销账号")
    @GetMapping("/deleteUser")                               //注销用户
    public Result deleteUser(HttpServletRequest request) {
        Integer userid = JwtUtil.getUserId(request);
        /*找到用户后先从python中删除人脸*/
        QueryWrapper<User> qw = new QueryWrapper<>();
        qw.eq("id", userid);
        User user = userService.getOne(qw);
        try {
            deleteFaceFromJava(user);       //从java中删除人脸
            if(!user.getHeadUrl().equals("/images/head/default.jpg")) {
                deleteHead(user);               //删除头像
            }
            deleteface(user);
        } catch (Exception e) {e.printStackTrace();}

        /*删除关联*/
        QueryWrapper qw1 = new QueryWrapper();
        qw1.eq("userid", userid);
        QueryWrapper qw2 = new QueryWrapper();
        qw2.eq("user_id", userid);

        userDepartmentService.remove(qw1);
        userMeetingService.deleteOld2(userid);
        userMeetingService.deleteOld3(userid);
        userRoleService.remove(qw2);

        userService.removeById(userid); //最后从用户表中删除

        return Result.success(200, "Already delete user ");
    }

    @ApiOperation(value = "管理员-删除用户")
    @GetMapping("/deleteUserByAdmin")
    public Result deleteUser(Integer userid) {

        /*找到用户后先从python中删除人脸*/
        QueryWrapper<User> qw = new QueryWrapper<>();
        qw.eq("id", userid);
        User user = userService.getOne(qw);
        try {
            deleteFaceFromJava(user);       //从java中删除人脸
            if(!user.getHeadUrl().equals("/images/head/default.jpg")) {
                deleteHead(user);               //删除头像
            }
            deleteface(user);
        } catch (Exception e) {e.printStackTrace();}

        /*删除关联*/
        QueryWrapper qw1 = new QueryWrapper();
        qw1.eq("userid", userid);
        QueryWrapper qw2 = new QueryWrapper();
        qw2.eq("user_id", userid);

        userDepartmentService.remove(qw1);
        userMeetingService.deleteOld2(userid);
        userMeetingService.deleteOld3(userid);
        userRoleService.remove(qw2);

        userService.removeById(userid); //最后从用户表中删除

        return Result.success(200, "Already delete user ");
    }

    //update
    @ApiOperation(value = "用户-修改信息")
    @PostMapping("/updateUser")
    public Result updateUser(HttpServletRequest request, @RequestBody User user) throws FileNotFoundException {

        UpdateWrapper<User> uWrapper = new UpdateWrapper<>();
        uWrapper.eq("id", JwtUtil.getUserId(request));    //从token中取email
        /*重新修改人脸头像路径*/
        user.setFaceUrl("/images/face/"+JwtUtil.getEmail(request)+"_"+user.getUsername()+".jpg");
        User oldUser =  userService.getOne(uWrapper);
        if(!user.getFaceUrl().equals(oldUser.getFaceUrl())) {                   //如果新路径与数据库中不同
            File path = new File(ResourceUtils.getURL("").getPath());
            //对人脸 头像重命名
            File oldFile1 = new File(path+oldUser.getFaceUrl());
            oldFile1.renameTo(new File(path+user.getFaceUrl()));
            if(!oldUser.getHeadUrl().equals("/images/head/default.jpg")) {      //如果是默认头像则不改
                user.setHeadUrl("/images/head/"+user.getEmail()+"_"+user.getUsername()+".jpg");//设置新的头像路径
                File oldFile2 = new File(path+oldUser.getHeadUrl());
                oldFile2.renameTo(new File(path+user.getHeadUrl()));
            }
        }
        if(!userService.update(user, uWrapper)) {return Result.failure(500, "修改失败");}
        return Result.success(200, "Already update user");
    }
    @ApiOperation(value = "管理员-修改用户信息")
    @PostMapping("/updateUserByAdmin")
    public Result updateUserByAdmin(@RequestBody User2DTO user2DTO) throws FileNotFoundException {

        User user = user2DTO.getUser();
        String base64Face = user2DTO.getBase64Face();
        Integer departmentid = user2DTO.getDepartmentid();
        QueryWrapper<User> uWrapper = new QueryWrapper<>();
        uWrapper.eq("email", user.getEmail());
        User newUser = userService.getOne(uWrapper);
        if(newUser != null) {
            if(newUser.getId().equals(user.getId())) {           //如果id、邮箱都相同 执行修改
                userService.updateUserMes(user);
            } else {return Result.failure(500, "请检查邮箱是否正确");}       //否则有人已经用到这个邮箱
        } else {
            /*重新修改人脸头像路径*/
            user.setFaceUrl("/images/face/"+user.getEmail()+"_"+user.getUsername()+".jpg");
            User oldUser =  userService.getOne(new QueryWrapper<User>().eq("id", user.getId()));
            if(!user.getFaceUrl().equals(oldUser.getFaceUrl())) {                   //如果新路径与数据库中不同
                File path = new File(ResourceUtils.getURL("").getPath());
                //对人脸 头像重命名
                File oldFile1 = new File(path+oldUser.getFaceUrl());
                oldFile1.renameTo(new File(path+user.getFaceUrl()));
                if(!oldUser.getHeadUrl().equals("/images/head/default.jpg")) {      //如果是默认头像则不改
                    File oldFile2 = new File(path+oldUser.getHeadUrl());
                    oldFile2.renameTo(new File(path+user.getHeadUrl()));
                    user.setHeadUrl("/images/head/"+user.getEmail()+"_"+user.getUsername()+".jpg");//设置新的头像路径
                }
            }
            userService.updateUserMes(user);                //为空证明新邮箱是真的
        }

        if(!base64Face.equals("")) {
            /*用户人脸位置*/
            Map<String, String> filemap = ImageUtil.Base64ToPicByAdmin("face", base64Face, user);
            user.setFaceUrl(filemap.get("src")+filemap.get("picName"));
            /*再将此用户人脸传给python*/
            try {addFace(user, base64Face);}catch (Exception e) {e.printStackTrace();}
        }

        if(departmentid > 0) {
            /*删除旧关联*/
            QueryWrapper<UserDepartment> qw = new QueryWrapper();
            qw.eq("userid", user.getId());
            userDepartmentService.remove(qw);
            /*添加新的*/
            UserDepartment userDepartment = new UserDepartment();
            userDepartment.setUserid(user.getId());
            userDepartment.setDepartmentid(departmentid);
            userDepartmentService.save(userDepartment);
        }

        return Result.success(200, "Already update user");
    }
    @ApiOperation(value = "管理员-重置用户人脸")
    @PostMapping("/reSetFace")
    public Result reSetFace(Integer userid) {
        QueryWrapper<User> qw = new QueryWrapper<>();
        qw.eq("id", userid);
        User user = userService.getOne(qw);
        try {
            deleteface(user);
            deleteFaceFromJava(user);
        } catch (Exception e) {e.printStackTrace();}
        return Result.success(200, "Already update user");
    }

    @ApiOperation(value = "修改密码")
    @PostMapping("/updatePassword")
    public Result updatePassword(HttpServletRequest request, @RequestBody UserDTO userDTO) {

        QueryWrapper qw = new QueryWrapper();
        qw.eq("email", JwtUtil.getEmail(request));
        qw.eq("password", userDTO.getOldpassword());
        System.out.println(userDTO);

        if(userService.getOne(qw) == null) {return Result.failure(500, "请检查您的旧密码");}

        userDTO.setEmail(JwtUtil.getEmail(request));
        userService.updatePassword(userDTO);

        return Result.success(200, "修改成功");
    }
/*康华写的*/
    @ApiOperation(value = "管理员修改信息")
    @PostMapping("/powerupdateUser")
    public Result powerUpdateUser(@RequestBody User user) {
        UpdateWrapper<User> uWrapper = new UpdateWrapper<>();
        uWrapper.eq("email", user.getEmail());
        /*重新修改人脸头像路径*/
        user.setFaceUrl("/images/face/"+user.getEmail()+"_"+user.getUsername()+".jpg");
        user.setHeadUrl("/images/head/"+user.getEmail()+"_"+user.getUsername()+".jpg");
        userService.update(user, uWrapper);
        return Result.success(200, "Already update user");
    }

    @ApiOperation(value = "管理员修改密码")
    @PostMapping("/powerupdatePassword")
    public Result powerupdatePassword(@RequestBody UserDTO userDTO) {
        userDTO.setEmail(userDTO.getEmail());
        userService.updatePassword(userDTO);
        return Result.success(200, "修改成功");
    }

    @ApiOperation(value = "管理员-修改用户角色")
    @GetMapping("/updateUserRole")
    public Result updateUserRole(Integer userid, Integer role) {
        UpdateWrapper<UserRole> uWrapper = new UpdateWrapper<>();

        uWrapper.eq("user_id", userid);
        UserRole userRole = new UserRole();
        userRole.setRoleId(role);
        userRoleService.update(userRole, uWrapper);

        return Result.success(200, "Already update user-rank");
    }

    @ApiOperation(value = "上传头像-base64")
    @PostMapping("/uploadHead")
    @SneakyThrows
    public Result uploadHead(@RequestBody Map<String, Object> map, HttpServletRequest request) {
        String base64str = (String) map.get("base46Str");

        Map<String, String> filemap = ImageUtil.Base64ToPic("head", base64str, request);

        UpdateWrapper<User> uWrapper = new UpdateWrapper<>();
        uWrapper.eq("email", JwtUtil.getEmail(request));    //从token中取email
        /*更新用户数据*/
        User user = new User();
        user.setHeadUrl(filemap.get("src")+filemap.get("picName"));
        userService.update(user, uWrapper);                                 //更新数据库

        return Result.success(filemap);
    }

    @ApiOperation(value = "上传人脸-表单上传")
    @PostMapping("/uploadFace1")              //CommonsMultipartFile
    @SneakyThrows
    public Result uploadFace1(@RequestParam("face") MultipartFile file, HttpServletRequest request) {

        Map<String, String> map = null;

        //获取根目录
        File path = new File(ResourceUtils.getURL("").getPath());//加了classpath:的话就会多出\target\classes
        if(!path.exists()) path = new File("");

        //通过CommonsMultipartFile的方法直接写文件（注意这个时候）
        //获取文件原本的名字file.getOriginalFilename()
        String picName = "/"+JwtUtil.getEmail(request)+"_"+JwtUtil.getUserName(request)+".jpg";

        String src = "/images/face";

        /*如果上传目录为/static/upload/face，则可以如下获取：
         *在开发测试模式时，得到的地址为：{项目跟目录}/target/static/images/upload/
         *在打包成jar正式发布时，得到的地址为：{发布jar包目录}/static/images/upload/*/
        File realPath = new File(path.getAbsolutePath(),src);
        if(!realPath.exists()) {realPath.mkdirs();}

        File ss = new File(realPath + picName);
        file.transferTo(ss);

        //上传文件地址
        UpdateWrapper<User> uWrapper = new UpdateWrapper<>();
        uWrapper.eq("email", JwtUtil.getEmail(request));    //从token中取email
        /*更新用户数据*/
        User user = new User();
        user.setFaceUrl(src+picName);
        userService.update(user, uWrapper);                        //更新数据库

        System.out.println("人脸照片保存路径："+realPath);
        System.out.println("图片完整路径："+realPath + picName);

        map = new HashMap<>();
        map.put("src", src);
        map.put("picName", picName);
        try {                                           //传给python
            addFace(userService.getOne(uWrapper), ImageUtil.PicToBase64(user));
        } catch (Exception e) {e.printStackTrace();}

        return Result.success(map);
    }

    @ApiOperation(value = "上传人脸-拍照上传")
    @PostMapping("/uploadFace2")
    public Result uploadFace2(@RequestBody Map<String, Object> map, HttpServletRequest request) {
        String base64str = (String) map.get("base46Str");

        Map<String, String> filemap = ImageUtil.Base64ToPic("face", base64str, request);

        UpdateWrapper<User> uWrapper = new UpdateWrapper<>();
        uWrapper.eq("email", JwtUtil.getEmail(request));    //从token中取email
        /*更新用户数据*/
        User user = new User();
        user.setFaceUrl(filemap.get("src")+filemap.get("picName"));
        userService.update(user, uWrapper);                                 //更新数据库

        try {
            addFace(userService.getOne(uWrapper), base64str);
        } catch (Exception e) {e.printStackTrace();}

        return Result.success(filemap);
    }

    @ApiOperation(value = "上传人脸-注册时拍照上传")
    @PostMapping("/uploadFaceEmail")              //CommonsMultipartFile
    public Result uploadFaceEmail(@RequestBody Map<String, Object> map) {
        String base64str = (String) map.get("base46Str");
        User user = new User();
        user.setEmail((String) map.get("email"));
        user.setId((Integer) map.get("id"));
        user.setUsername((String) map.get("username"));
        Map<String, String> filemap = ImageUtil.Base64ToPic1("face", base64str, user);

        UpdateWrapper<User> uWrapper = new UpdateWrapper<>();
        uWrapper.eq("email",user.getEmail());
        /*更新用户数据*/
        User user1 = new User();
        user1.setFaceUrl(filemap.get("src")+filemap.get("picName"));
        userService.update(user1, uWrapper);                                 //更新数据库
        try {
            addFace(userService.getOne(uWrapper), base64str);
        }catch (Exception e) {e.printStackTrace();}

        return Result.success(filemap);
    }

    /*
    search
    *
     */
    @ApiOperation(value = "查找本用户的信息")
    @GetMapping("/searchOneUser")
    public Result findSigle(HttpServletRequest request) {
        String token = request.getHeader("token");                  //从请求头中获取前端传过来的token
        Map<String, Claim> userData = JwtUtil.verifyToken(token);         //解析token

        return Result.success(userService.searchOneUser(userData.get("userid").asInt()));
    }

    @ApiOperation(value = "管理员-查找全部用户的基本信息")
    @GetMapping("searchAllUser")
    public Result findAll(){
        return Result.success(userService.searchOneUser(0));
    }

    @ApiOperation(value = "管理员-模糊查询全部用户的基本信息")
    @PostMapping ("searchAllUserByWant")
    public Result searchAllUserByWant(@RequestBody JSONObject user){
        Map<String, String> map = new HashMap<>();
        map.put("email", String.valueOf(user.get("email")));
        map.put("username", String.valueOf(user.get("username")));
        return Result.success(userService.searchAllUserByWant(map));
    }

    @ApiOperation(value = "查找用户的菜单信息")
    @GetMapping("searchUserMenu")
    @SneakyThrows
    public Result searchUserMenu(HttpServletRequest request) {
        List<Menu> menuList = userService.searchUserMenu(JwtUtil.getUserId(request));
        return Result.success(menuList) ;
    }

    /*
     * 会议开始前用户个人人脸的上传
     * */
    @SneakyThrows
    public Result addFace(User user, String base64str) {

        Map<String, String> result = new HashMap<>();   //封装结果
        Map<String, String> mapResult = new HashMap<>();
//
//        //获取根目录
//        File path = new File(ResourceUtils.getURL("").getPath());
//        File realPath = new File(path.getAbsolutePath());
//
        List<User2VO> user2VO = userService.searchOneUser(user.getId());
//
        HttpClientUtils.getConnection();        //打开http请求
        CloseableHttpResponse httpResponse = null;
        String pythonMessage = null;
//
//        String src = user2VO.get(0).getFaceUrl();
//
//        String imagePath = realPath + src;
//        byte[] data = null;
//        // 读取图片字节数组
//        InputStream in = new FileInputStream(imagePath);
//        data = new byte[in.available()];
//        in.read(data);
//        in.close();                 //关闭流
//        // 对字节数组Base64编码
//        BASE64Encoder encoder = new BASE64Encoder();
//        //返回Base64编码过的字节数组字符串
//        String base64str = encoder.encode(Objects.requireNonNull(data));
        /*data*/
        result.put("Type", "BASE64");
        result.put("base64", base64str);
        result.put("userid", String.valueOf(user.getId()));
        result.put("name", user.getUsername());
        /*python需要的完整信息*/
        mapResult.put("data", JSON.toJSONString(result));
        mapResult.put("code", "200");

        HttpUriRequest post = getRequestMethod(mapResult, "http://www.saigoumvp.work:5001/addface", "post");
        httpResponse = (CloseableHttpResponse) client.execute(post);            //发送post请求
        System.out.println("已上传至python");

        if (httpResponse.getStatusLine().getStatusCode() == 200) {              //接收python识别的信息
            HttpEntity entity = httpResponse.getEntity();
            pythonMessage = EntityUtils.toString(entity, "utf-8");
            System.out.println(pythonMessage);                                  //响应
        }
        httpResponse.close();                                                   //关闭响应

        return Result.success(user2VO);
    }

    @ApiOperation(value = "删除人脸")
    @SneakyThrows
    public void deleteface(User user) {

        CloseableHttpResponse httpResponse = null;
        String pythonMessage = null;

        HttpClientUtils.getConnection();        //打开http请求

        Map<String, String> retultmap = new HashMap<>();
        Map<String, Integer> map = new HashMap<>();
        map.put("userid", user.getId());
        retultmap.put("data", JSON.toJSONString(map));

        HttpUriRequest post = getRequestMethod(retultmap, "http://www.saigoumvp.work:5001/deleteface", "post");
        httpResponse = (CloseableHttpResponse) client.execute(post);            //发送post请求

        if (httpResponse.getStatusLine().getStatusCode() == 200) {              //接收python识别的信息
            HttpEntity entity = httpResponse.getEntity();
            pythonMessage = EntityUtils.toString(entity, "utf-8");
            System.out.println(pythonMessage);                                  //响应
        }
        httpResponse.close();
    }

    /**
     * 删除java人脸照片
     */
    public void deleteFaceFromJava(User user) throws FileNotFoundException {
        //获取根目录
        File path = new File(ResourceUtils.getURL("").getPath());
        File file = new File(path+user.getFaceUrl());
        file.delete();
    }
    /**
     * 删除头像
     */
    public void deleteHead(User user) throws FileNotFoundException {
        //获取根目录
        File path = new File(ResourceUtils.getURL("").getPath());
        File file = new File(path+user.getHeadUrl());
        file.delete();
    }

//    @Test
//    public void fun() {
//        long maxMemory = Runtime.getRuntime().maxMemory();//java虚拟机使用的最大内存量
//        long totalMemory = Runtime.getRuntime().totalMemory();//java虚拟机内存总量
//
//        System.out.println("MAX_MEMORY = " + maxMemory + "(字节)、" + (maxMemory / (double) 1024 / 1024) + "MB");
//        System.out.println("TOTAL_MEMORY = " + totalMemory + "(字节)、" + (totalMemory / (double) 1024 / 1024) + "MB");
//    }
}