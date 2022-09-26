package com.online.edu.common.utils;

import com.online.edu.common.VO.ResultVO;
import com.online.edu.common.enums.ResultEnum;

import java.util.HashMap;

/**
 * 对返回对象进行封装的工具类
 */
public class ResultVOUtil {

    public static ResultVO success(Object object){
        ResultVO resultVO = new ResultVO();
        resultVO.setData(object);
        resultVO.setSuccess(true);
        resultVO.setCode(ResultEnum.SUCCESS.getCode());
        resultVO.setMsg(ResultEnum.SUCCESS.getMessage());

        return resultVO;
    }
    public static ResultVO success(){
        return success(null);
    }

    public static ResultVO success(Object obj1, Object obj2){

        HashMap<Object, Object> map = new HashMap<>();
        map.put(obj1,obj2);
        ResultVO resultVO = new ResultVO();
        resultVO.setData(map);
        resultVO.setSuccess(true);
        resultVO.setCode(ResultEnum.SUCCESS.getCode());
        resultVO.setMsg(ResultEnum.SUCCESS.getMessage());
        return resultVO;

    }

    public static ResultVO error(ResultEnum resultEnum){
        ResultVO resultVO = new ResultVO();
        /** 设置响应失败。 */
        resultVO.setSuccess(false);

        resultVO.setCode(resultEnum.getCode());

        resultVO.setMsg(resultEnum.getMessage());


        return resultVO;
    }

    public static ResultVO error(Integer code, String msg){
        ResultVO resultVO = new ResultVO();
        /** 设置响应失败。 */
        resultVO.setSuccess(false);

        resultVO.setCode(code);

        resultVO.setMsg(msg);


        return resultVO;
    }


}
