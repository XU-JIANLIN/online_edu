package com.online.edu.common.exception;

import com.online.edu.common.enums.ResultEnum;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;


/**
 * @描述:
 * @作者: XUJIANLIN
 */
@Data
public class EduException extends RuntimeException{

    @ApiModelProperty(value = "状态码")
    private Integer code;
        /**
         * 接受状态码和消息
         * @param code
         * @param message
         */

    public EduException(Integer code, String message) {

        super(message);
        this.code=code;
    }

        /**
         * 接收枚举类型
         * @param resultCodeEnum
         */
    public EduException(ResultEnum resultCodeEnum) {
        super(resultCodeEnum.getMessage());
        this.code = resultCodeEnum.getCode();
    }

}
