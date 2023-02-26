package com.org.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.org.model.Department;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author B.M
 * @since 2022-07-02
 */
@Mapper
public interface DepartmentMapper extends BaseMapper<Department> {

    public List<Department> searchDeptAndUser();

    public List<Department> searchDeptAndUserByWant(Department department);
}
