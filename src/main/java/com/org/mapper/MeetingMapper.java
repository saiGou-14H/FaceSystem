package com.org.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.org.model.Meeting;
import com.org.model.dto.Meeting1DTO;
import com.org.model.excel.MeetingMessage;
import com.org.model.vo.Meeting2VO;
import com.org.model.vo.MeetingVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author B.M
 * @since 2022-05-31
 */
@Mapper
public interface MeetingMapper extends BaseMapper<Meeting> {

    public List<Meeting> searchMeetingByPage(Integer id, Integer start, Integer end);

    boolean updateMeeting(Meeting meeting);

    public List<MeetingMessage> meetingMessage(Integer meetingid);

    public String searchHost(Integer meetingid);

    public List<MeetingVO> searchAllMeeting();

    public  List<Meeting> searchMeeting(Meeting1DTO meeting1DTO);

    public List<Meeting2VO> searchUserSateOK(Integer meetingid);

    public List<Meeting2VO> searchUserSateNO(Integer meetingid);

    List<MeetingVO> searchSingleMeeting(Integer meetingid);

    List<Meeting2VO> searchUserSateNOByWant(Map<String, Object> map);

    List<Meeting2VO> searchUserSateOKByWant(Map<String, Object> map);

    List<MeetingVO> searchUserMeetingByWant(Meeting1DTO meeting1DTO);
}
