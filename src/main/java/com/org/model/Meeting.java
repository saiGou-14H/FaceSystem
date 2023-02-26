package com.org.model;

import com.alibaba.excel.annotation.ExcelIgnore;
import com.baomidou.mybatisplus.annotation.*;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.EqualsAndHashCode;
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
@TableName("m_meeting")
@EqualsAndHashCode
@ApiModel(value = "Meeting对象", description = "")
public class Meeting implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty("主键，自增,会议标号标识")
    @TableId(value = "id", type = IdType.AUTO)
    @ExcelIgnore                //导出excel时忽略此字段
    private Integer id;

    @ApiModelProperty("会议创建时间")
    @TableField(value = "create_time", fill = FieldFill.INSERT)
    private LocalDateTime createTime;

    @ApiModelProperty("会议名")
    @TableField("name")
    @ExcelIgnore
    private String name;

    @ApiModelProperty("会议链接")
    @TableField("link")
    private String link;

    @ApiModelProperty("会议介绍")
    @TableField("introduce")
    private String introduce;

    @ApiModelProperty("会议更新时间")
    @TableField(value = "update_time", fill = FieldFill.INSERT_UPDATE)
    private LocalDateTime updateTime;

    @ApiModelProperty("会议时间段")
    @TableField("meeting_time")
    private String meetingTime;

    @ApiModelProperty("会议开始签到时间")
    @TableField("sign_time")
    private String signTime;

    @ApiModelProperty("签到人数")
    @TableField("sign_number")
    private Integer signNumber;

    @ApiModelProperty("到会人数")
    @TableField("user_number")
    private Integer userNumber;

    @ApiModelProperty("会议信息")
    @TableField("file_url")
    private String fileUrl;

    @ApiModelProperty("是否为线上会议")
    @TableField("online")
    private boolean online;

    @ApiModelProperty("逻辑删除")
    @TableField("deleted")
    @TableLogic
    @ExcelIgnore
    private Integer deleted;

    @TableField(exist = false)
    private String host;        //关联生成的字段,使用 transient 、 static 修饰属性也不会插入数据库中
}
