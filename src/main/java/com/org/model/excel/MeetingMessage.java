package com.org.model.excel;

import com.alibaba.excel.annotation.ExcelProperty;
import com.alibaba.excel.annotation.write.style.*;
import com.org.config.converter.PowerConverter;
import com.org.config.converter.StateConverter;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalDateTime;
import java.util.concurrent.TimeUnit;

@Data
@Getter
@Setter
@ContentRowHeight(20)       //设置行高
@HeadRowHeight(25)          //设置头行高
@HeadFontStyle(fontHeightInPoints = 17) // 头字体设置成20
@ContentFontStyle(fontHeightInPoints = 14)// 内容字体设置成20
public class MeetingMessage {

    @ExcelProperty(value = "用户名")
    @ColumnWidth(17)
    private String username;

    @ExcelProperty(value = "备注名")
    @ColumnWidth(17)
    private String nickname;

    @ExcelProperty(value = "性别")
    private String sex;

    @ExcelProperty(value = "身份", converter = PowerConverter.class)
    @ColumnWidth(14)
    private Integer umPower;

    @ExcelProperty(value = "签到状态", converter = StateConverter.class)
    @ColumnWidth(18)
    private Integer state;

    @ExcelProperty(value = "入会时间")
    @ColumnWidth(25)            //设置列宽
    private LocalDateTime startTime;

    @ExcelProperty(value = "退会时间")
    @ColumnWidth(25)
    private LocalDateTime endTime;

    @ExcelProperty(value = "累计参会时长")
    @ColumnWidth(25)
    private String allTime;

    public void setAllTime(String allTime) {

        final long milliseconds = Long.valueOf(allTime)*1000;        //转为毫秒
        System.out.println(Long.valueOf(allTime)*1000);

        final long day = TimeUnit.MILLISECONDS.toDays(milliseconds);

        final long hours = TimeUnit.MILLISECONDS.toHours(milliseconds)
                - TimeUnit.DAYS.toHours(TimeUnit.MILLISECONDS.toDays(milliseconds));

        final long minutes = TimeUnit.MILLISECONDS.toMinutes(milliseconds)
                - TimeUnit.HOURS.toMinutes(TimeUnit.MILLISECONDS.toHours(milliseconds));

        final long seconds = TimeUnit.MILLISECONDS.toSeconds(milliseconds)
                - TimeUnit.MINUTES.toSeconds(TimeUnit.MILLISECONDS.toMinutes(milliseconds));
//        final long ms = TimeUnit.MILLISECONDS.toMillis(milliseconds)
//                - TimeUnit.SECONDS.toMillis(TimeUnit.MILLISECONDS.toSeconds(milliseconds));
        this.allTime = String.format("%d天 %d时 %d分 %d秒", day, hours, minutes, seconds);
    }
}
