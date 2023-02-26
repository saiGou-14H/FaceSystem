package com.org.model;

import lombok.Data;

import java.io.Serializable;

@Data
public class Result implements Serializable {          //返回给前端的结果集
    private Integer code;
    private String message;
    private Object data;

    /*
     * 成功
     */
    public static Result success() {
        Result result = new Result();
        result.setCode(200);
        result.setMessage("成功响应");
        return result;
    }
    public static Result success(Object data) {
        Result result = new Result();
        result.setCode(200);
        result.setData(data);
        return result;
    }
    public static Result success(Integer code, String message) {
        Result result = new Result();
        result.setCode(code);
        result.setMessage(message);
        return result;
    }
    public static Result success(Integer code, String message, Object data) {
        Result result = new Result();
        result.setCode(code);
        result.setMessage(message);
        result.setData(data);
        return result;
    }

    /*
    * 失败
    */
    public static Result failure() {
        Result result = new Result();
        result.setCode(200);
        result.setMessage("成功响应");
        return result;
    }
    public static Result failure(Integer code, String message) {
        Result result = new Result();
        result.setCode(code);
        result.setMessage(message);
        return result;
    }
    public static Result failure(Integer code, String message, Object data) {
        Result result = new Result();
        result.setCode(code);
        result.setMessage(message);
        result.setData(data);
        return result;
    }

}
