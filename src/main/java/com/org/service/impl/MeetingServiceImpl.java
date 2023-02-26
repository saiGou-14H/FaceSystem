package com.org.service.impl;

import com.alibaba.excel.EasyExcel;
import com.alibaba.excel.support.ExcelTypeEnum;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.org.config.converter.LocalDateTimeConverter;
import com.org.mapper.MeetingMapper;
import com.org.mapper.UserMapper;
import com.org.model.Meeting;
import com.org.model.dto.Meeting1DTO;
import com.org.model.excel.MeetingMessage;
import com.org.model.vo.Meeting2VO;
import com.org.model.vo.MeetingVO;
import com.org.model.vo.User2VO;
import com.org.service.IMeetingService;
import lombok.SneakyThrows;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.*;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author B.M
 * @since 2022-05-31
 */
@Service
public class MeetingServiceImpl extends ServiceImpl<MeetingMapper, Meeting> implements IMeetingService {

    @Autowired
    private MeetingMapper meetingMapper;
    @Autowired
    private UserMapper userMapper;

    /*分页查找用户创建或参加的会议*/
    public List<Meeting> searchMeetingByPage(Integer id, Integer start, Integer end) {
        return meetingMapper.searchMeetingByPage(id, start, end);
    }

    public boolean updateMeeting(Meeting meeting) {
        return meetingMapper.updateMeeting(meeting);
    }

    /**
     * 导出excel
     * @param //response
     * @return
     */
//    @SneakyThrows
//    public Result download(HttpServletResponse response, String meetingid) {
//        Result result = new Result();
//
//        List<MeetingMessage> mesList = new ArrayList<>();
//                meetingMapper.selectList(null);
////        System.out.println(meetingList);
////        response.setContentType("application/vnd.ms-excel");
////        response.setCharacterEncoding("utf-8");
////        // 这里URLEncoder.encode可以防止中文乱码 当然和easyexcel没有关系
////        String fileName = URLEncoder.encode("测试", "UTF-8");
////        response.setHeader("Content-disposition", "attachment;filename=" + fileName + ".xlsx");
////        EasyExcel.write(response.getOutputStream(), Meeting.class)
////                .registerWriteHandler(new LongestMatchColumnWidthStyleStrategy())//自适应表格格式
////                .sheet("模板")
////                .doWrite(meetingList);
//
//        setExcelRespProp(response, "会员列表");
////        List<Meeting> meetingList = LocalJsonUtil.getListFromJson("json/members.json", Meeting.class);
//        EasyExcel.write(response.getOutputStream(), Meeting.class)
//                .head(Meeting.class)
//                .excelType(ExcelTypeEnum.XLSX)
//                .sheet("会员列表")
//                .registerConverter(new LocalDateTimeConverter())    //时间类型转换器
//                .doWrite(meetingList);
//
//        return result;
//    }

    @SneakyThrows
    public List<MeetingMessage> download(HttpServletResponse response, Integer meetingid) {

        if(meetingid > 0 ) {
            List<MeetingMessage> meetingList = meetingMapper.meetingMessage(meetingid);
            if(meetingList.size() == 0) {
                System.out.println("空的");
                return null;
            }

            setExcelRespProp(response, "会议数据");

            EasyExcel.write(response.getOutputStream(), Meeting.class)
                    .head(MeetingMessage.class)                             //列名
                    .excelType(ExcelTypeEnum.XLSX)
                    .sheet("成员参会情况")
                    .registerConverter(new LocalDateTimeConverter())    //时间类型转换器
                    .doWrite(meetingList);

            return meetingList;
//            String fileName = "模板.xlsx";
//            // 这里需要注意 在使用ExcelProperty注解的使用，如果想不空列则需要加入order字段，而不是index,order会忽略空列，然后继续往后，而index，不会忽略空列，在第几列就是第几列。
//
//            // 根据用户传入字段 假设我们要忽略 date
//            Set<String> excludeColumnFiledNames = new HashSet<String>();
//            excludeColumnFiledNames.add("faceUrl");
//            // 这里 需要指定写用哪个class去写，然后写到第一个sheet，名字为模板 然后文件流会自动关闭
//            EasyExcel.write(fileName, User2VO.class).excludeColumnFiledNames(excludeColumnFiledNames).sheet("模板")
//                    .doWrite(new ArrayList<User2VO>());
        }
        else {
            setExcelRespProp(response, "参会人员");
            Set<String> excludeColumnFiledNames = new HashSet<String>();            //增加忽略字段，或者在
            excludeColumnFiledNames.add("faceUrl");
            excludeColumnFiledNames.add("mail");
            excludeColumnFiledNames.add("headUrl");

            EasyExcel.write(response.getOutputStream(), Meeting.class).excludeColumnFiledNames(excludeColumnFiledNames)
                    .head(User2VO.class)                             //列名
                    .excelType(ExcelTypeEnum.XLSX)
                    .sheet("用户信息")
                    .registerConverter(new LocalDateTimeConverter())    //时间类型转换器
                    .doWrite(new ArrayList<User2VO>());
        }

        return null;
    }

    @Override
    public List<Meeting2VO> searchUserSateOK(Integer meetingid) {
        return meetingMapper.searchUserSateOK(meetingid);
    }
    @Override
    public List<Meeting2VO> searchUserSateNO(Integer meetingid) {
        return meetingMapper.searchUserSateNO(meetingid);
    }

    @Override
    public List<Meeting2VO> searchUserSateOKByWant(Map<String, Object> map) {
        return meetingMapper.searchUserSateOKByWant(map);
    }

    @Override
    public List<MeetingVO> searchUserMeetingByWant(Meeting1DTO meeting1DTO) {
        return meetingMapper.searchUserMeetingByWant(meeting1DTO);
    }

    @Override
    public List<Meeting2VO> searchUserSateNOByWant(Map<String, Object> map) {
        return meetingMapper.searchUserSateNOByWant(map);
    }


    @Override
    public List<MeetingVO> searchSingleMeeting(Integer meetingid) {
        return meetingMapper.searchSingleMeeting(meetingid);
    }

    @Override
    public String searchHost(Integer meetingid) {
        return meetingMapper.searchHost(meetingid);
    }

    @Override
    public List<MeetingVO> searchAllMeeting() {
        return meetingMapper.searchAllMeeting();
    }

    @Override
    public List<Meeting> searchMeeting(Meeting1DTO meeting1DTO) {
        return meetingMapper.searchMeeting(meeting1DTO);
    }

    /**
     * 设置excel下载响应头属性
     */
    private void setExcelRespProp(HttpServletResponse response, String rawFileName) throws UnsupportedEncodingException {
        //response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
        response.setContentType("application/vnd.ms-excel");
        response.setCharacterEncoding("utf-8");
        String fileName = URLEncoder.encode(rawFileName, "UTF-8").replaceAll("\\+", "%20");
        response.setHeader("Content-disposition", "attachment;filename*=utf-8''" + fileName + ".xlsx");
    }

//    /**
//     * 导入cxcel
//     * @param file
//     * @return
//     */
//    @SneakyThrows
//    public Result upload(MultipartFile file) {
//        EasyExcel.read(file.getInputStream(), House.class, new DataListener(houseMapper)).sheet().doRead();
//        return Result.success("上传成功");
//    }

}
