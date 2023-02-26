package com.org.model.vo;


import lombok.Data;

import java.time.LocalDateTime;

@Data
public class MeetingVO {

    private Integer id;

    private String name;

    private String host;

    private String roomName;

    private Integer online;

    private LocalDateTime createTime;

    private String link;

    private String meetingTime;

    private String signTime;

    private String introduce;

    private Integer state;

    private LocalDateTime updateTime;

    private Integer userNumber;

    private Integer signNumber;

}
