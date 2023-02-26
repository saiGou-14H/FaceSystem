package com.org.controller;

import com.alibaba.fastjson2.JSON;
import com.alibaba.fastjson2.JSONObject;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.org.model.FacilityRoom;
import com.org.model.MeetingRoom;
import com.org.model.Result;
import com.org.model.Room;
import com.org.model.dto.RoomDTO;
import com.org.service.IFacilityRoomService;
import com.org.service.IMeetingRoomService;
import com.org.service.IRoomService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Iterator;
import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author B.M
 * @since 2022-06-27
 */
@Api(value = "会议室接口")
@RestController
@RequestMapping("/room")
public class RoomController {

    @Autowired
    IRoomService roomService;
    @Autowired
    IMeetingRoomService meetingRoomService;
    @Autowired
    IFacilityRoomService facilityRoomService;

    /**
     * add
     */
    @ApiOperation(value = "管理员-创建会议室")
    @PostMapping("/addMeetingRoom")
    public Result addMeetingRoom(@RequestBody RoomDTO room) {

        Room newRoom = new Room();
        newRoom.setRoomName(room.getRoomName());
        newRoom.setRoomAddr(room.getRoomAddr());
        newRoom.setPeoples(room.getPeoples());
        newRoom.setMeetroomState(room.getMeetroomState());

        if(!roomService.save(newRoom)) {return Result.failure(500,"创建会议室失败");}

        if(room.getFacilityid() != null) {                  //如果设备id不为空
            FacilityRoom facilityRoom = new FacilityRoom();
            facilityRoom.setRoomid(newRoom.getId());
            facilityRoom.setFacilityid(room.getFacilityid());
            facilityRoomService.save(facilityRoom);
        }

        return Result.success("创建会议室成功"+room.getId());
    }
    @ApiOperation(value = "插入会议室与会议的关联")
    @PostMapping("/insertRoomMeeting")
    public Result insertRoomMeeting(@RequestBody String data) {

        JSONObject jsonObject =  JSON.parseObject(data);
        System.out.println(jsonObject);
        String room_name = String.valueOf(jsonObject.get("room_name"));
        Integer meetingid = Integer.parseInt(String.valueOf(jsonObject.get("meetingid")));

        QueryWrapper<Room> qw = new QueryWrapper<>();
        qw.eq("room_name", room_name);
        Room room = roomService.getOne(qw);             //通过会议室名查会议室id

        MeetingRoom meetingRoom = new MeetingRoom();
        meetingRoom.setMeetingid(meetingid);
        meetingRoom.setRoomid(room.getId());
        meetingRoomService.save(meetingRoom);           //插入关联

        return Result.success(200, "添加成功");
    }
    @ApiOperation(value = "管理员-修改会议室与会议的关联")
    @GetMapping("/updateRoomMeeting")
    public Result updateRoomMeeting(String room_name, Integer meetingid) {
        /*先根据会议室名称查*/
        QueryWrapper<Room> qw1 = new QueryWrapper<>();
        qw1.eq("room_name", room_name);
        Room room = roomService.getOne(qw1);
        /*先取消关联*/
        QueryWrapper<MeetingRoom> qw2 = new QueryWrapper<>();
        qw2.eq("meetingid", meetingid);
        meetingRoomService.remove(qw2);
        /*新建关联*/
        MeetingRoom meetingRoom = new MeetingRoom();
        meetingRoom.setMeetingid(meetingid);
        meetingRoom.setRoomid(room.getId());
        meetingRoomService.save(meetingRoom);           //插入关联

        return Result.success(200, "添加成功");
    }

    /*
     * update
     * */
    @ApiOperation(value = "管理员-修改会议室信息")
    @PostMapping("/updateRoom")
    public Result updateRoom(@RequestBody RoomDTO room) {

        UpdateWrapper uw1 = new UpdateWrapper();
        uw1.eq("id", room.getId());

        /*先修改本身的基本信息*/
        Room newRoom = new Room();
        newRoom.setRoomName(room.getRoomName());
        newRoom.setRoomAddr(room.getRoomAddr());
        newRoom.setPeoples(room.getPeoples());
        newRoom.setMeetroomState(room.getMeetroomState());
        roomService.update(newRoom, uw1);
        /*再修改关联*/
        UpdateWrapper uw2 = null;
        if(room.getFacilityid() == null) {
            uw2 = new UpdateWrapper();
            uw2.eq("roomid", room.getId());
            facilityRoomService.remove(uw2);
        } else {
            uw2 = new UpdateWrapper();
            uw2.eq("roomid", room.getId());
            FacilityRoom facilityRoom = new FacilityRoom();
            facilityRoom.setRoomid(room.getId());
            facilityRoom.setFacilityid(room.getFacilityid());
            facilityRoomService.update(facilityRoom, uw2);
        }

        return Result.success(200, "修改成功:"+room);
    }

    /*
     * delete
     * */
    @ApiOperation(value = "管理员-删除会议室")
    @GetMapping("/deleteRoom")
    public Result deleteRoom(Integer roomid) {

        QueryWrapper qw1 = new QueryWrapper();
        qw1.eq("roomid", roomid);
        QueryWrapper qw2 = new QueryWrapper();
        qw2.eq("id", roomid);
        /*先删除关联*/
        facilityRoomService.remove(qw1);
        meetingRoomService.remove(qw1);

        if(!roomService.remove(qw2)) {Result.failure(500, "删除失败");}

        return Result.success(200, "删除会议室成功");
    }

    /**
     * search
     */
    @ApiOperation(value = "管理员-查找全部会议室")
    @GetMapping("/searchRoom")
    public Result searchRoom() {
        return Result.success(roomService.searchRoom());
    }

    @ApiOperation(value = "管理员-模糊查询会议室")
    @PostMapping("/searchRoomByWant")
    public Result searchRoomByWant(@RequestBody Room room) {
        return Result.success(roomService.searchRoomByWant(room));
    }

    @ApiOperation(value = "管理员-查询会议室是否空闲")
    @PostMapping("/searchFreeRoom")
    public Result searchFreeRoom(@RequestBody RoomDTO roomDTO) throws ParseException {
        if(roomDTO.getRoomName().equals("云会议室")) {
            return Result.success(200, "云会议室，不进行判断");
        }
        boolean flag = true;
        /*正则分割会议开始和结束时间*/
        String[] roomTime1 = roomDTO.getMeetingTime().split(" ");
        String[] roomTime2 = roomTime1[1].split("-");
        /*将字符串日期转为毫秒*/
        long start = 0;
        long end = 0;
        try {
        start = new SimpleDateFormat("yyyy-MM-dd HH:mm").parse(roomTime1[0]+" "+roomTime2[0]).getTime();
        end = new SimpleDateFormat("yyyy-MM-dd HH:mm").parse(roomTime1[0]+" "+roomTime2[1]).getTime();
        } catch (Exception e) {e.printStackTrace();}

        List<String> list = roomService.searchFreeRoom(roomDTO);
        /*如果有旧时间段证明是修改会议方法，需要过滤掉再查*/
        if(roomDTO.getOldMeetingTime() != null) {
            list.remove(roomDTO.getOldMeetingTime());
        }
        Iterator iterator = list.iterator();
        while (iterator.hasNext()) {
            String freeTime = (String) iterator.next();
            String[] freeTime1 = null;
            String[] freeTime2 = null;
            long mStartMS = 0;
            long mEndMS = 0;
            try {
                /*正则分割会议开始和结束时间*/
                freeTime1 = freeTime.split(" ");
                freeTime2 = freeTime1[1].split("-");
                /*将字符串日期转为毫秒*/
                mStartMS = new SimpleDateFormat("yyyy-MM-dd HH:mm").parse(freeTime1[0]+" "+freeTime2[0]).getTime();
                mEndMS = new SimpleDateFormat("yyyy-MM-dd HH:mm").parse(freeTime1[0]+" "+freeTime2[1]).getTime();
            } catch (Exception e) {e.printStackTrace();}
            if(start<=mStartMS && (end>mStartMS && end<=mEndMS)) {flag = false;break;
            } else if(start>=mStartMS && end<=mEndMS) {flag = false;break;
            } else if(start<mStartMS && end>mEndMS) {flag = false;break;
            } else if((start>=mStartMS && start<mEndMS) && end>=mEndMS) {flag = false;break;}
        }
        if(!flag) {return Result.failure(500, "此时间段已被占用，被占用时间段有", list);}
        return Result.success(200, "此时间段可用，被占用时间段有", list);
    }

}
