package com.org.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.org.model.MeetingRoom;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author B.M
 * @since 2022-06-27
 */
public interface IMeetingRoomService extends IService<MeetingRoom> {

    public boolean updateRoom(Integer meetingid, String roomeName);
}
