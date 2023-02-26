package com.org.config.converter;

import com.alibaba.excel.converters.Converter;
import com.alibaba.excel.enums.CellDataTypeEnum;
import com.alibaba.excel.metadata.CellData;
import com.alibaba.excel.metadata.GlobalConfiguration;
import com.alibaba.excel.metadata.property.ExcelContentProperty;

public class PowerConverter implements Converter<Integer> {

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

        String power = cellData.getStringValue();
        switch (power) {
            case "参会者":
                return 1;
            case "管理员":
                return 2;
            case "主持人":
                return 3;
        }
        return 0;               //返回0报错
    }

    @Override
    public CellData<String> convertToExcelData(Integer integer, ExcelContentProperty excelContentProperty, GlobalConfiguration globalConfiguration) throws Exception {

        String power = null;
        switch (integer) {
            case 1:
                power = "参会者";
                break;
            case 2:
                power = "管理员";
                break;
            case 3:
                power = "主持人";
                break;
        }

        return new CellData<>(power);
    }

}

