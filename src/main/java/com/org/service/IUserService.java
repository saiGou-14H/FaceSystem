package com.org.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.org.model.Menu;
import com.org.model.User;
import com.org.model.dto.UserDTO;
import com.org.model.vo.MeetingVO;
import com.org.model.vo.User2VO;

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
public interface IUserService extends IService<User> {
    public List<MeetingVO> searchUserMeeting(Integer id);

    public List<Menu> searchUserMenu(Integer id);

    public void updatePassword(UserDTO userDTO);

    public List<User2VO> searchOneUser(Integer userid);

    public List<User2VO> searchAllUserByWant(Map<String, String> map);

    public List<User2VO> addtUserByExcel(List<User2VO> user2VOS);

    public boolean updateUserMes(User user);
}
