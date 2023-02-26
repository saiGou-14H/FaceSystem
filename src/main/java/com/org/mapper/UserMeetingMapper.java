package com.org.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.org.model.UserMeeting;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author B.M
 * @since 2022-05-31
 */
@Mapper
public interface UserMeetingMapper extends BaseMapper<UserMeeting> {

    public boolean sign(UserMeeting userMeeting);

    public List<UserMeeting> searchUserMessage(Integer meetingid);

    public boolean deleteOld(Integer meetingid);

    public boolean deleteOld2(Integer userid);

    public boolean deleteOld3(Integer userid);

    public boolean signByAdmin(UserMeeting userMeeting);

    public boolean deleteSignByAdmin(UserMeeting userMeeting);
}
