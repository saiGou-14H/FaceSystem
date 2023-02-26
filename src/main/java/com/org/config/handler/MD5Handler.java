package com.org.config.handler;

/**
 * @author HealerJean
 * @ClassName AESTypeHandler
 * @date 2020/4/9  14:27.
 * @Description
 */

import com.org.config.utils.MD5Util;
import org.apache.ibatis.type.BaseTypeHandler;
import org.apache.ibatis.type.JdbcType;
import org.springframework.stereotype.Component;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@Component
public class MD5Handler<T> extends BaseTypeHandler<T> {

    @Override
    public void setNonNullParameter(PreparedStatement ps, int i, Object parameter, JdbcType jdbcType) throws SQLException {
        ps.setString(i, MD5Util.getMD5((String)parameter));
    }
    @Override
    public T getNullableResult(ResultSet rs, String columnName) throws SQLException {
        String columnValue = rs.getString(columnName);
        //有一些可能是空字符
        //return StringUtils.isBlank(columnValue) ? (T)columnValue : (T) MD5Util.decrypt(columnValue);
        return (T) "success";
    }

    @Override
    public T getNullableResult(ResultSet rs, int columnIndex) throws SQLException {
        String columnValue = rs.getString(columnIndex);
        //return StringUtils.isBlank(columnValue) ? (T)columnValue : (T) MD5Util.decrypt(columnValue);
        return (T) "success";
    }

    @Override
    public T getNullableResult(CallableStatement cs, int columnIndex) throws SQLException {
        String columnValue = cs.getString(columnIndex);
        //return StringUtils.isBlank(columnValue) ? (T)columnValue : (T) MD5Util.decrypt(columnValue);
        return (T) "success";
    }
}


