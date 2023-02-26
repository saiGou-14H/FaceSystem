package com.org.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.org.model.Room;
import com.org.model.dto.RoomDTO;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author B.M
 * @since 2022-06-27
 */
public interface IRoomService extends IService<Room> {

    public List<Room> searchRoomByWant(Room room);

    public List<Room> searchRoom();

    public List<String> searchFreeRoom(RoomDTO roomDTO);
}
