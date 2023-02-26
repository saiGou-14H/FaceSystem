package com.org.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.org.model.Department;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author B.M
 * @since 2022-07-02
 */
public interface IDepartmentService extends IService<Department> {

    public List<Department> searchDeptAndUser();

    public List<Department> searchDeptAndUserByWant(Department department);
}
