package com.org.model.vo;

import com.alibaba.excel.annotation.ExcelIgnore;
import com.alibaba.excel.annotation.ExcelProperty;
import com.alibaba.excel.annotation.write.style.*;
import com.org.config.converter.PowerConverter;
import lombok.Data;

import java.io.File;
import java.util.List;

@Data
@ContentRowHeight(15)       //设置行高
@HeadRowHeight(20)          //设置头行高
@HeadFontStyle(fontHeightInPoints = 17) // 头字体设置成20
@ContentFontStyle(fontHeightInPoints = 14)// 内容字体设置成20
public class User2VO {

    @ExcelProperty(value = "ID")
    @ColumnWidth(14)
    @ExcelIgnore  //导出excel表时忽略
    private Integer id;

    @ExcelProperty(value = "邮箱")
    @ColumnWidth(30)
    private String email;

    @ExcelProperty(value = "密码")
    @ColumnWidth(17)
    private String password;

    @ExcelProperty(value = "用户名")
    @ColumnWidth(17)
    private String username;

    @ExcelProperty(value = "身份", converter = PowerConverter.class)
    @ColumnWidth(14)
    @ExcelIgnore  //导出excel表时忽略
    private String power;

    @ExcelProperty(value = "备注名")
    @ColumnWidth(17)
    @ExcelIgnore  //导出excel表时忽略
    private String nickname;

    @ExcelProperty(value = "性别")
    private String sex;

    @ExcelProperty(value = "年龄")
    private Integer age;

    @ExcelProperty(value = "电话")
    @ColumnWidth(30)
    private String phone;

    @ExcelProperty(value = "人脸图片")
    @ColumnWidth(25)
    private File facePic;

    private String faceUrl;

    private String headUrl;

    @ExcelIgnore  //导出excel表时忽略
    private String introduce;

    @ExcelIgnore  //导出excel表时忽略
    private String ip;

    @ExcelIgnore  //导出excel表时忽略
    private List<String> partnames;

}
