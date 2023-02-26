package com.org.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.org.mapper.MeetingRoomMapper;
import com.org.model.MeetingRoom;
import com.org.service.IMeetingRoomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author B.M
 * @since 2022-06-27
 */
@Service
public class MeetingRoomServiceImpl extends ServiceImpl<MeetingRoomMapper, MeetingRoom> implements IMeetingRoomService {

    @Autowired
    MeetingRoomMapper meetingRoomMapper;

    @Override
    public boolean updateRoom(Integer meetingid, String roomeName) {
        return meetingRoomMapper.updateRoom(meetingid, roomeName);
    }
}
