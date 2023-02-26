package com.org.model;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;

/**
 * <p>
 * 
 * </p>
 *
 * @author B.M
 * @since 2022-07-03
 */
@Getter
@Setter
@TableName("m_user_department")
@ApiModel(value = "UserDepartment对象", description = "")
public class UserDepartment implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty("用户id")
    @TableField("userid")
    private Integer userid;

    @ApiModelProperty("部门id")
    @TableField("departmentid")
    private Integer departmentid;


}
