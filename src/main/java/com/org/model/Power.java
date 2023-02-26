package com.org.model;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
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
@TableName("m_power")
@ApiModel(value = "Power对象", description = "")
public class Power implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty("主键，表的唯一标识")
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty("普通用户，管理员")
    @TableField("power")
    private String power;


}
