package com.org.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.org.model.MeetingRoom;
import org.apache.ibatis.annotations.Mapper;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author B.M
 * @since 2022-06-27
 */
@Mapper
public interface MeetingRoomMapper extends BaseMapper<MeetingRoom> {

    public boolean updateRoom(Integer meetingid, String roomeName);
}
