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
import java.time.LocalDateTime;

/**
 * <p>
 * 
 * </p>
 *
 * @author B.M
 * @since 2022-06-27
 */
@Getter
@Setter
@TableName("m_facility")
@ApiModel(value = "Facility对象", description = "")
public class Facility implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty("主键，设备的唯一标识")
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty("设备名称")
    @TableField("facility_name")
    private String facilityName;

    @ApiModelProperty("设备状态")
    @TableField("facility_state")
    private String facilityState;

    @ApiModelProperty("设备购入时间")
    @TableField("buy_time")
    private LocalDateTime buyTime;


}
