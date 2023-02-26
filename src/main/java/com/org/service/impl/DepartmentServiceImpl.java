package com.org.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.org.mapper.DepartmentMapper;
import com.org.model.Department;
import com.org.service.IDepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author B.M
 * @since 2022-07-02
 */
@Service
public class DepartmentServiceImpl extends ServiceImpl<DepartmentMapper, Department> implements IDepartmentService {

    @Autowired
    DepartmentMapper departmentMapper;

    @Override
    public List<Department> searchDeptAndUser() {
        return departmentMapper.searchDeptAndUser();
    }

    @Override
    public List<Department> searchDeptAndUserByWant(Department department) {
        return departmentMapper.searchDeptAndUserByWant(department);
    }
}
