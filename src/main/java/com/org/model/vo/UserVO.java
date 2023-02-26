package com.org.model.vo;

import com.org.model.Menu;
import lombok.Data;

import java.util.List;

@Data
public class UserVO {

    private Integer id;

    private String email;

    private String username;

    private String power;

    private List<Menu> menus;
}
