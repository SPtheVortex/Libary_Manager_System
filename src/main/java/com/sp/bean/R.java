package com.sp.bean;

public class R {
    public static final Integer ERROR_CODE = 500;
    public static final Integer SUCCESS_CODE = 200;
    private Integer code;
    private String msg;
    private Object data;

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Object getData() {
        return data;
    }

    public R setData(Object data) {
        this.data = data;
        return this;
    }

    public static R ok() {
        R r = new R();
        r.setCode(SUCCESS_CODE);
        r.setMsg("操作成功");
        return r;
    }


    public static R failure(String msg) {
        R r = new R();
        r.setCode(ERROR_CODE);
        r.setMsg(msg);
        return r;
    }

    public static R failure(Integer code, String msg) {
        R r = new R();
        r.setCode(code);
        r.setMsg(msg);
        return r;
    }
}