package com.online.edu.common.VO;

import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.Data;

/**
 * @描述： 结果返回显示的对象
 * @作者： 许JIAN林
 */
@Data
@JsonInclude(JsonInclude.Include.NON_EMPTY)
public class ResultVO<T> {

    /** 响应信息.  */
    private  boolean success;

    /**错误码.*/
    private Integer code;

    /**提示信息.*/
    private String msg;

    /**具体内容.*/
    private T data;

}
