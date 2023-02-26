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
 * @since 2022-05-31
 */
@Getter
@Setter
@TableName("m_role_menu")
@ApiModel(value = "RoleMenu对象", description = "")
public class RoleMenu implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty("角色表id")
    @TableField("role_id")
    private Integer roleId;

    @ApiModelProperty("菜单表id")
    @TableField("menu_id")
    private Integer menuId;


}
