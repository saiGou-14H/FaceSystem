package com.org.model;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.org.model.vo.MetaVO;
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
 * @since 2022-06-21
 */
@Getter
@Setter
@TableName("m_menu")
@ApiModel(value = "Menu对象", description = "")
public class Menu implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty("菜单编号标识")
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty("菜单名")
    @TableField("name")
    private String name;

    @TableField("path")
    private String path;

    @TableField("parent_id")
    private Integer parentId;

    @TableField("icon")
    private String icon;

    @ApiModelProperty("菜单描述")
    @TableField("introduce")
    private String introduce;

    @TableField(exist = false)
    private List<Menu> children;        //关联生成的字段

    @TableField(exist = false)
    private MetaVO meta;        //关联生成的字段

}
