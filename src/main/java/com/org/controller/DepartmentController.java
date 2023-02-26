package com.org.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.org.config.utils.JwtUtil;
import com.org.model.Department;
import com.org.model.Result;
import com.org.model.UserDepartment;
import com.org.model.dto.UserDTO;
import com.org.service.IDepartmentService;
import com.org.service.IUserDepartmentService;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.Iterator;
import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author B.M
 * @since 2022-07-02
 */
@RestController
@RequestMapping("/department")
public class DepartmentController {

    @Autowired
    private IDepartmentService departmentService;
    @Autowired
    private IUserDepartmentService userDepartmentService;

    /*
     * add
     * */
    @ApiOperation(value = "管理员-创建部门")
    @PostMapping("/addDeptByAdmin")
    public Result addDeptByAdmin(@RequestBody Department department) {
        if(!departmentService.save(department)) {
            return Result.failure(500, "请检查参数信息");
        }
        return Result.success(200, "成功创建部门 id："+department);
    }
    @ApiOperation(value = "用户-添加部门")
    @GetMapping("/addDept")
    public Result addDept(HttpServletRequest request, Integer departmentid) {
        UserDepartment userDepartment = new UserDepartment();
        userDepartment.setUserid(JwtUtil.getUserId(request));
        userDepartment.setDepartmentid(departmentid);
        /*先查找用户有没有加入过这个部门*/
        QueryWrapper qw = new QueryWrapper<>();
        qw.eq("userid", userDepartment.getUserid());
        if(userDepartmentService.getOne(qw) != null) {
            return Result.failure(500, "该用户已加入此部门");
        }
        if(!userDepartmentService.save(userDepartment)) {
            return Result.failure(500, "请检查参数信息");
        }
        return Result.success(200, "成功加入部门");
    }

    /*
     * delete
     * */
    @ApiOperation(value = "管理员-删除部门")
    @GetMapping("/deleteDeptByAdmin")
    public Result deleteDeptByAdmin(Integer departmentid) {
        UpdateWrapper uw1 = new UpdateWrapper();
        uw1.eq("departmentid", departmentid);
        UpdateWrapper uw2 = new UpdateWrapper();
        uw2.eq("id", departmentid);
        userDepartmentService.remove(uw1);
        if(!departmentService.remove(uw2)) {
            return Result.success(500, "删除部门失败，请检查");
        }
        return Result.success(200, "成功删除部门");
    }
    @ApiOperation(value = "管理员-将用户从部门移除")
    @GetMapping("/quitUserFromDept")
    public Result quitUserFromDept(Integer userid, Integer departmentid) {
        UpdateWrapper uw = new UpdateWrapper();
        uw.eq("userid", userid);
        uw.eq("departmentid", departmentid);

        if(!userDepartmentService.remove(uw)) {
            return Result.success(500, "移除失败，请检查");
        }
        return Result.success(200, "成功移除部门");
    }
    @ApiOperation(value = "管理员-将用户批量从部门移除")
    @PostMapping("/quitUsersFromDept")
    public Result quitUsersFromDept(@RequestBody UserDTO userDTO, Integer departmentid) {
        Iterator<Integer> iterator = userDTO.getIdList().iterator();
        while (iterator.hasNext()) {                             //使用迭代器遍历集合
            UpdateWrapper uw = new UpdateWrapper();
            uw.eq("userid", iterator.next());       //设置用户id
            uw.eq("departmentid", departmentid);    //设置会议id
            userDepartmentService.remove(uw);
        }
        return Result.success(200, "成功退出部门");
    }
    @ApiOperation(value = "用户-退出部门")
    @GetMapping("/quitDept")
    public Result quitDept(HttpServletRequest request, Integer departmentid) {
        UpdateWrapper uw = new UpdateWrapper();
        uw.eq("userid", JwtUtil.getUserId(request));
        uw.eq("departmentid", departmentid);

        if(!userDepartmentService.remove(uw)) {
            return Result.success(500, "退出部门失败，请检查");
        }
        return Result.success(200, "成功退出部门");
    }

    /*
     * update
     * */
    @ApiOperation(value = "管理员-修改部门信息")
    @PostMapping("/updateDept")
    public Result updateDept(@RequestBody Department department) {

        UpdateWrapper<Department> uw = new UpdateWrapper<>();
        uw.eq("id", department.getId());
        if(!departmentService.update(department, uw)) {return Result.failure(500, "修改失败");}

        return Result.success("修改成功");
    }

    /*
     * search
     * */
    @ApiOperation(value = "管理员-查找全部部门并查找部门人员")
    @GetMapping("/searchDeptAndUser")
    public Result searchDeptAndUser() {
        List<Department> departmentList = departmentService.searchDeptAndUser();
        return Result.success(departmentList);
    }
    @ApiOperation(value = "管理员-模糊查找部门并查找部门人员")      //针对学校
    @PostMapping("/searchDeptAndUserByWant")
    public Result searchDeptAndUserByWant(@RequestBody Department department) {
        List<Department> departmentList = departmentService.searchDeptAndUserByWant(department);
        return Result.success(departmentList);
    }

}
