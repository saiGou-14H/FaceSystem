package com.org.model.vo;

import lombok.Data;

import java.time.LocalDateTime;

@Data
public class Meeting2VO {

    private Integer id;
    private String username;
    private LocalDateTime startTime;
    private Integer state;
    private String faceUrl;

}
