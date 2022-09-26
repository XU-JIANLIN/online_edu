package com.online.edu.common.handler;

import com.online.edu.common.VO.ResultVO;
import com.online.edu.common.exception.EduException;
import com.online.edu.common.utils.ResultVOUtil;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @描述： 统一异常处理类
 * @作者： 许JIAN林
 */

@ControllerAdvice
public class GlobalExceptionHandler {


    @ExceptionHandler(EduException.class)
    @ResponseBody
    public ResultVO error(EduException e){
        e.printStackTrace();
       return ResultVOUtil.error(e.getCode(), e.getMessage());

    }

}