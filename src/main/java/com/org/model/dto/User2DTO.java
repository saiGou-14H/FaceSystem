package com.org.model.dto;

import com.org.model.User;
import io.swagger.annotations.ApiParam;
import lombok.Data;

@Data                   //用来接收修改信息的
public class User2DTO {

    @ApiParam("user对象")
    private User user;

    @ApiParam("base64人脸字符串")
    private String base64Face;

    @ApiParam("部门id")
    private Integer departmentid;
}
