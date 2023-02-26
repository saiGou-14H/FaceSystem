package com.org.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.org.model.Menu;
import com.org.model.User;
import com.org.model.dto.UserDTO;
import com.org.model.vo.MeetingVO;
import com.org.model.vo.User2VO;
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
public interface UserMapper extends BaseMapper<User> {

    public List<MeetingVO> searchUserMeeting(Integer id);

    public List<Menu> searchUserMenu(Integer id);

    public void updatePassword(UserDTO userDTO);

    public List<User2VO> searchOneUser(Integer userid);

    public List<User2VO> searchAllUser();

    public List<User2VO> searchAllUserByWant(Map<String, String> map);

    public boolean updateUserMes(User user);
}
