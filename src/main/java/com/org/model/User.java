package com.org.model;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.org.config.handler.MD5Handler;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;
import java.util.List;

/**
 * <p>
 * 
 * </p>
 *
 * @author B.M
 * @since 2022-05-31
 */
@Getter
@Setter
@TableName(value="m_user",autoResultMap = true)     //autoResultMap = true  要有否则查询时无法解密
@ApiModel(value = "User对象", description = "")
public class User implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty("主键，用户的唯一描述")
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty("qq邮箱")
    @TableField("email")
    private String email;

    @ApiModelProperty("用户密码")
    @TableField(value = "password", typeHandler = MD5Handler.class)  //typeHandle设置成自己编写的MD5Handler
    private String password;

    @ApiModelProperty("用户名")
    @TableField("username")
    private String username;

    @ApiModelProperty("用户权限")
    @TableField("power")
    private String power;

    @ApiModelProperty("备注名")
    @TableField("nickname")
    private String nickname;

    @ApiModelProperty("性别")
    @TableField("sex")
    private String sex;

    @ApiModelProperty("年龄")
    @TableField("age")
    private Integer age;

    @ApiModelProperty("电话号码")
    @TableField("phone")
    private String phone;

    @ApiModelProperty("人脸照片存放地址")
    @TableField("face_url")
    private String faceUrl;

    @ApiModelProperty("头像存放地址")
    @TableField("head_url")
    private String headUrl;

    @ApiModelProperty("用户描述")
    @TableField("introduce")
    private String introduce;

    @ApiModelProperty("ip地址")
    @TableField("ip")
    private String ip;

    @TableField(exist = false)
    private List<Meeting> meetings;        //关联生成的字段

    @TableField(exist = false)
    private List<Menu> menus;        //关联生成的字段
}
