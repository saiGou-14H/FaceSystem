package com.org.model;

import com.baomidou.mybatisplus.annotation.*;
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
 * @since 2022-05-31
 */
@Getter
@Setter
@TableName("m_user_meeting")
@ApiModel(value = "UserMeeting对象", description = "")
public class UserMeeting implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty("主键，会议数据标识")
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty("用户在本会议的权限")
    @TableField("um_power")
    private Integer umPower;

    @ApiModelProperty("会议数据创建时间")
    @TableField(value = "create_time", fill = FieldFill.INSERT)
    private LocalDateTime createTime;

    @ApiModelProperty("非空，外键，关联用户id")
    @TableField("user_id")
    private Integer userId;

    @ApiModelProperty("非空，外键，关联会议id")
    @TableField("meeting_id")
    private Integer meetingId;

    @ApiModelProperty("会议数据更新时间")
    @TableField(value = "update_time", fill = FieldFill.INSERT_UPDATE)
    private LocalDateTime updateTime;

    @ApiModelProperty("签到或进入会议时间")
    @TableField("start_time")
    private LocalDateTime startTime;

    @ApiModelProperty("签到状态,默认0未签到")
    @TableField("state")
    private Integer state;

    @ApiModelProperty("签退或离开会议时间	")
    @TableField("end_time")
    private LocalDateTime endTime;

    @ApiModelProperty("逻辑删除")
    @TableField("deleted")
    @TableLogic
    private Integer deleted;

}
