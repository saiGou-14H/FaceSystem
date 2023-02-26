package com.org.model.dto;

import com.org.config.utils.MD5Util;
import io.swagger.annotations.ApiParam;
import lombok.Data;

import java.util.List;

@Data
public class UserDTO {

    @ApiParam("判断前端功能类型")
    private String Type;

    @ApiParam("用户id数组")
    private List<Integer> idList;

    @ApiParam("会议id")
    private Integer meetingid;

    @ApiParam("用户邮箱")
    private String email;

    @ApiParam("用户名")
    private String username;

    @ApiParam("人脸base64")
    private String base64Face;

    private String oldpassword;

    private String newpassword;

    public void setOldpassword(String oldpassword) {
        this.oldpassword = MD5Util.getMD5(oldpassword);
    }

    public void setNewpassword(String newpassword) {
        this.newpassword = MD5Util.getMD5(newpassword);
    }
}
