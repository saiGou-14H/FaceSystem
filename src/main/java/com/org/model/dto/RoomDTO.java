package com.org.model.dto;

import lombok.Data;

import java.io.Serializable;

/**
 * <p>
 *
 * </p>
 *
 * @author B.M
 * @since 2022-06-27
 */
@Data
public class RoomDTO implements Serializable {

    private Integer id;
    private Integer facilityid;

    private String roomName;
    private String oldMeetingTime;
    private String meetingTime;

    private String roomAddr;

    private Integer peoples;

    private Integer meetroomState;
}
