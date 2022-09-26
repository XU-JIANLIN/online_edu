package com.online.edu.common.enums;

import lombok.Getter;

/**
 * @描述: 返回前端状态码
 * @作者: XUJIANLIN
 */
@Getter

public enum ResultEnum implements CodeEnum {

    SUCCESS(20000,"成功"),
    ERROR(20001,"服务器繁忙，请稍候"),
    TEACHER_NOT_EXIST(10,"教师信息不存在"),
    IMPORT_ERROR(11,"导入失败出现异常"),
    TOWLEVEL_EXIST(12,"存在二级标题"),
    SAVE_COURSE_FALSE(13,"保存课程失败"),
    COURSE_NOT_EXIST(14,"课程信息不存在"),
    UPDATE_COURSE_FALSE(15,"修改课程失败"),
    DELETE_CHAPTER_FALSE(16,"删除章节失败"),
    UP_VIDEO_FALSE(17,"上传视频失败"),
    ENCODE_URL_FALSE(18,"URL地址编码失败"),
    GET_ACCESS_TOKEN_FALSE (19, "获取access_token失败"),
    GET_USERINFO_FALSE(20, "获取用户信息失败"),
    MOBILE_EXIST(21, "该手机号已存在"),
    USER_NO_EXIST(22,"用户名或密码错误"),
    JWT_TIME_OVER(23,"JWT令牌过期"),
    ;

    private Integer code;

    private String message;

    ResultEnum(Integer code, String message){
        this.code = code;
        this.message = message;
    }



}
