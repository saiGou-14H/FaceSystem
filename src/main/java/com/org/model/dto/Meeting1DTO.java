package com.org.model.dto;

import io.swagger.annotations.Api;
import lombok.Data;

@Api(value = "会议DTO")
@Data
public class Meeting1DTO {           //会议id主持人会议名会议室

    private Integer userid;
    private String host;
    private String meetingname;
    private String meetingroom;

}
