package com.org.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.org.mapper.UserMeetingMapper;
import com.org.model.UserMeeting;
import com.org.service.IUserMeetingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author B.M
 * @since 2022-05-31
 */
@Service
public class UserMeetingServiceImpl extends ServiceImpl<UserMeetingMapper, UserMeeting> implements IUserMeetingService {

    @Autowired
    private UserMeetingMapper userMeetingMapper;

    public boolean sign(Integer userid, Integer meetingid) {
        UserMeeting userMeeting =new UserMeeting();
        userMeeting.setMeetingId(meetingid);
        userMeeting.setUserId(userid);

        return userMeetingMapper.sign(userMeeting);
    }

    @Override
    public boolean deleteOld(Integer meetingid) {
        return userMeetingMapper.deleteOld(meetingid);
    }

    @Override
    public List<UserMeeting> searchUserMessage(Integer meetingid) {
        return userMeetingMapper.searchUserMessage(meetingid);
    }

    @Override
    public boolean deleteOld2(Integer userid) {
        return userMeetingMapper.deleteOld2(userid);
    }

    @Override
    public boolean deleteOld3(Integer userid) {
        return userMeetingMapper.deleteOld3(userid);
    }

    @Override
    public boolean signByAdmin(Integer userid, Integer meetingid) {
        UserMeeting userMeeting =new UserMeeting();
        userMeeting.setMeetingId(meetingid);
        userMeeting.setUserId(userid);

        return userMeetingMapper.signByAdmin(userMeeting);
    }

    @Override
    public boolean deleteSignByAdmin(Integer userid, Integer meetingid) {
        UserMeeting userMeeting =new UserMeeting();
        userMeeting.setMeetingId(meetingid);
        userMeeting.setUserId(userid);
        return userMeetingMapper.deleteSignByAdmin(userMeeting);
    }


}
