package com.org.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.org.model.Meeting;
import com.org.model.dto.Meeting1DTO;
import com.org.model.excel.MeetingMessage;
import com.org.model.vo.Meeting2VO;
import com.org.model.vo.MeetingVO;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Map;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author B.M
 * @since 2022-05-31
 */
public interface IMeetingService extends IService<Meeting> {
    public List<Meeting> searchMeetingByPage(Integer id, Integer start, Integer end);

    boolean updateMeeting(Meeting meeting);

//    public Result download(HttpServletResponse response, String meetingid);

    public List<MeetingMessage> download(HttpServletResponse response, Integer meetingid) throws IOException;

    public String searchHost(Integer meetingid);

    public List<MeetingVO> searchAllMeeting();

    public List<Meeting> searchMeeting(Meeting1DTO meeting1DTO);      //高级查询

    public List<Meeting2VO> searchUserSateOK(Integer meetingid);

    public List<Meeting2VO> searchUserSateNO(Integer meetingid);

    public List<MeetingVO> searchSingleMeeting(Integer meetingid);

    public List<Meeting2VO> searchUserSateNOByWant(Map<String, Object> map);

    public List<Meeting2VO> searchUserSateOKByWant(Map<String, Object> map);

    public List<MeetingVO> searchUserMeetingByWant(Meeting1DTO meeting1DTO);
}
