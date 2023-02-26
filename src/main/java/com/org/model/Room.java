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
import java.util.List;

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
@TableName("m_room")
@ApiModel(value = "Room对象", description = "")
public class Room implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty("主键，自增,会议室标识")
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty("会议室名")
    @TableField("room_name")
    private String roomName;

    @ApiModelProperty("会议室地址")
    @TableField("room_addr")
    private String roomAddr;

    @ApiModelProperty("容纳人数")
    @TableField("peoples")
    private Integer peoples;

    @ApiModelProperty("会议室状态，默认1为可用")
    @TableField("meetroom_state")
    private Integer meetroomState;

    @TableField(exist = false)
    private List<Facility> facilities;        //闸机设备
}
