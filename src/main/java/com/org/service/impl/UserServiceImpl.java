package com.org.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.org.mapper.UserMapper;
import com.org.model.Menu;
import com.org.model.User;
import com.org.model.dto.UserDTO;
import com.org.model.vo.MeetingVO;
import com.org.model.vo.User2VO;
import com.org.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author B.M
 * @since 2022-05-31
 */
@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements IUserService {

    @Autowired
    private UserMapper userMapper;


    /*查找用户创建或参加的会议*/
    public List<MeetingVO> searchUserMeeting(Integer id) {
        return userMapper.searchUserMeeting(id);
    }

    @Override
    public List<Menu> searchUserMenu(Integer id) {
        return userMapper.searchUserMenu(id);
    }

    @Override
    public void updatePassword(UserDTO userDTO) {
        userMapper.updatePassword(userDTO);
    }

    @Override
    public List<User2VO> searchOneUser(Integer userid) {
        return userMapper.searchOneUser(userid);
    }

    @Override
    public List<User2VO> searchAllUserByWant(Map<String, String> map) {
        return userMapper.searchAllUserByWant(map);
    }

    @Override
    public List<User2VO> addtUserByExcel(List<User2VO> user2VOS) {
        List<User2VO> list = new ArrayList<>();
        for(User2VO user :  user2VOS){

            if(userMapper.selectOne(new QueryWrapper<User>().eq("email", user.getEmail())) != null) {
                list.add(user);
            }
            else {
                User newuser = new User();
                newuser.setEmail(user.getEmail());
                newuser.setUsername(user.getUsername());
                newuser.setPassword(user.getPassword());
                newuser.setSex(user.getSex());
                newuser.setPhone(user.getPhone());
                userMapper.insert(newuser);                     //插入数据库
            }

        }
        return list;
    }

    @Override
    public boolean updateUserMes(User user) {
        return userMapper.updateUserMes(user);
    }

}
