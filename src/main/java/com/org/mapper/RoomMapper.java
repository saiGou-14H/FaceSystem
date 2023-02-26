package com.org.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.org.model.Room;
import com.org.model.dto.RoomDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author B.M
 * @since 2022-06-27
 */
@Mapper
public interface RoomMapper extends BaseMapper<Room> {

    public List<Room> searchRoomByWant(Room room);

    public List<Room> searchRoom();

    public List<String> searchFreeRoom(RoomDTO roomDTO);
}
