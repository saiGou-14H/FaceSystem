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
 * @since 2022-06-27
 */
@Getter
@Setter
@TableName("m_facility_room")
@ApiModel(value = "FacilityRoom对象", description = "")
public class FacilityRoom implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty("闸机id")
    @TableField("facilityid")
    private Integer facilityid;

    @ApiModelProperty("会议室id")
    @TableField("roomid")
    private Integer roomid;


}
