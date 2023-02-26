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
 * @since 2022-06-21
 */
@Getter
@Setter
@TableName("m_power_menu")
@ApiModel(value = "PowerMenu对象", description = "")
public class PowerMenu implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty("权限表id")
    @TableField("power_id")
    private Integer powerId;

    @ApiModelProperty("角色表id")
    @TableField("menu_id")
    private Integer menuId;


}
