package com.org.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.org.model.Menu;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author B.M
 * @since 2022-06-21
 */
@Mapper
public interface MenuMapper extends BaseMapper<Menu> {

    public List<Menu> searchUserMenu(Integer userid);
}
