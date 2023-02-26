package com.org.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.org.mapper.RoomMapper;
import com.org.model.Room;
import com.org.model.dto.RoomDTO;
import com.org.service.IRoomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author B.M
 * @since 2022-06-27
 */
@Service
public class RoomServiceImpl extends ServiceImpl<RoomMapper, Room> implements IRoomService {

    @Autowired
    RoomMapper roomMapper;

    @Override
    public List<Room> searchRoomByWant(Room room) {
        return roomMapper.searchRoomByWant(room);
    }

    @Override
    public List<Room> searchRoom() {
        return roomMapper.searchRoom();
    }

    @Override
    public List<String> searchFreeRoom(RoomDTO roomDTO) {
        return roomMapper.searchFreeRoom(roomDTO);
    }
}
