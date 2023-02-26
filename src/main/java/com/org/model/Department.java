package com.org.model;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;
import java.util.List;

/**
 * <p>
 *
 * </p>
 *
 * @author B.M
 * @since 2022-07-02
 */
@Getter
@Setter
@TableName("m_department")
@ApiModel(value = "Department对象", description = "")
public class Department implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty("主键，部门的唯一标识")
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty("部门名字")
    @TableField("partname")
    private String partname;

    @ApiModelProperty("部门地址")
    @TableField("addr")
    private String addr;

    @ApiModelProperty("部门描述")
    @TableField("introduce")
    private String introduce;

    @ApiModelProperty("父部门id")
    @TableField("parentid")
    private Integer parentid;

    @TableField(exist = false)
    private List<Department> departments;        //子部门

    @TableField(exist = false)
    private List<User> users;        //关联生成的字段

}
