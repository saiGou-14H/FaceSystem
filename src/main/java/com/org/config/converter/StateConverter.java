package com.org.config.converter;

import com.alibaba.excel.converters.Converter;
import com.alibaba.excel.enums.CellDataTypeEnum;
import com.alibaba.excel.metadata.CellData;
import com.alibaba.excel.metadata.GlobalConfiguration;
import com.alibaba.excel.metadata.property.ExcelContentProperty;

public class StateConverter implements Converter<Integer> {

    @Override
    public Class<Integer> supportJavaTypeKey() {
        return Integer.class;
    }

    @Override
    public CellDataTypeEnum supportExcelTypeKey() {
        return CellDataTypeEnum.STRING;
    }

    @Override
    public Integer convertToJavaData(CellData cellData, ExcelContentProperty excelContentProperty, GlobalConfiguration globalConfiguration) throws Exception {

        String state = cellData.getStringValue();
        switch (state) {
            case "未签到":
                return 0;
            case "刷脸签到":
                return 1;
            case "管理员代签":
                return 2;
        }
        return 0;               //返回0报错
    }

    @Override
    public CellData<String> convertToExcelData(Integer integer, ExcelContentProperty excelContentProperty, GlobalConfiguration globalConfiguration) throws Exception {

        String state = null;
        switch (integer) {
            case 0:
                state = "未签到";
                break;
            case 1:
                state = "刷脸签到";
                break;
            case 2:
                state = "管理员代签";
                break;
        }

        return new CellData<>(state);
    }
}

