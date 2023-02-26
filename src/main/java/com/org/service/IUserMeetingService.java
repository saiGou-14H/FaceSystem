package com.org.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.org.model.UserMeeting;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author B.M
 * @since 2022-05-31
 */

public interface IUserMeetingService extends IService<UserMeeting> {
    public boolean sign(Integer userid, Integer meetingid);

    public boolean deleteOld(Integer meetingid);

    public List<UserMeeting> searchUserMessage(Integer meetingid);

    public boolean deleteOld2(Integer userid);

    public boolean deleteOld3(Integer userid);

    public boolean signByAdmin(Integer userid, Integer meetingid);

    public boolean deleteSignByAdmin(Integer userid, Integer meetingid);
}
