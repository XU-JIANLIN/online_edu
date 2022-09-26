package com.online.edu.payservice.controller;

import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.internal.util.AlipaySignature;
import com.alipay.api.request.AlipayTradePagePayRequest;
import com.google.gson.Gson;
import com.online.edu.common.dto.CourseInfoDTO;
import com.online.edu.common.dto.CourseWebDTO;
import com.online.edu.payservice.VO.AlipayVO;
import com.online.edu.payservice.client.CourseCilent;
import com.online.edu.payservice.client.MemberCilent;
import com.online.edu.payservice.config.AlipayConfig;
import com.online.edu.payservice.service.EduOrdersService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.UUID;

@RequestMapping("/payservice/alipay")
@Controller
@Slf4j
public class AlipayController {


    @Autowired
    AlipayConfig alipayConfig;

    @Autowired
    MemberCilent memberCilent;

    @Autowired
    CourseCilent courseCilent;

    @Autowired
    EduOrdersService eduOrdersService;




    /**
     * 支付网站扫码支付接口-统一下单支付接口
     * @return
     * @throws AlipayApiException
     */
    @GetMapping("/pay/{auth}/{courseID}")
    @ResponseBody
    private String alipayPay(@PathVariable String auth,
                             @PathVariable String courseID,
                             HttpServletRequest request) throws AlipayApiException {
        //根据auth获取用户id
        System.out.println("auth=="+auth);
        String memberID = memberCilent.getMemberID(auth);
        log.info("【用户支付】 用户id为：" + memberID);

        //根据courseID获取课程信息 --courseDTO
        System.out.println("courseID=="+courseID);
        CourseInfoDTO courseByID = courseCilent.getCourseByID(courseID);
        log.info("【用户支付】 购买课程信息为：" + courseByID.toString());

        //设置订单信息
        AlipayVO vo = eduOrdersService.setOrderInfo(memberID,courseByID);
        vo.setProduct_code("FAST_INSTANT_TRADE_PAY"); //这个是固定的
        String json = new Gson().toJson(vo);
        AlipayClient alipayClient = new DefaultAlipayClient(alipayConfig.getGatewayUrl(),
                alipayConfig.getAppId(), alipayConfig.getMerchantPrivateKey(), alipayConfig.getFormat(),
                alipayConfig.getCharset(), alipayConfig.getAlipayPublicKey(), alipayConfig.getSignType());
        // 设置请求参数
        AlipayTradePagePayRequest alipayRequest = new AlipayTradePagePayRequest();

        alipayRequest.setReturnUrl(alipayConfig.getReturnUrl());
        alipayRequest.setNotifyUrl(alipayConfig.getNotifyUrl());
        alipayRequest.setBizContent(json);
        String result = alipayClient.pageExecute(alipayRequest).getBody();
        return result; //这里生成一个表单，会自动提交
    }

    /**
     * 支付宝服务器异步通知页面
     * @param request
     * @param out_trade_no 商户订单号
     * @param trade_no 支付宝交易凭证号
     * @param trade_status 交易状态
     * @return
     * @throws AlipayApiException
     */
    @RequestMapping("/notify")
    @ResponseBody
    public String alipayNotify(HttpServletRequest request, String out_trade_no, String trade_no, String trade_status) throws AlipayApiException {
        Map<String, String> params = getParamsMap(request);
        System.out.println("notify out_trade_no:" + out_trade_no);
        System.out.println("notify trade_no:" + trade_no);
        System.out.println("notify trade_status:" + trade_status);
        System.out.println("notify subject" + params.get("subject"));
        // 验证签名

        boolean signVerified = AlipaySignature.rsaCheckV1(params, alipayConfig.getAlipayPublicKey(), alipayConfig.getCharset(), alipayConfig.getSignType());

        System.out.println("notify signVerified:" + signVerified);
        if (signVerified) {
            // 处理业务逻辑，更细订单状态等
            // 支付成功
            if("TRADE_SUCCESS".equals(trade_status)){

                log.info("【用户支付】支付成功");
                //更新订单状态，新增支付宝交易凭证号
                boolean bool = eduOrdersService.updateOrderInfo(out_trade_no, trade_no);
                if (bool){
                    // return success可阻止支付宝继续回调
                    return "success";
                }else {
                    return "fail";
                }
            }
            return "fail";
        } else {
            return "fail";
        }
    }

    /**
     * 支付宝服务器同步通知页面
     * @param request
     * @param out_trade_no 商户订单号
     * @param trade_no 支付宝交易凭证号
     * @param total_amount 交易状态
     * @return
     * @throws AlipayApiException
     */
    @RequestMapping("/return")
    public String alipayReturn(HttpServletRequest request, String out_trade_no, String trade_no, String total_amount) throws AlipayApiException {

        Map<String, String> params = getParamsMap(request);
        System.out.println("return out_trade_no:" + out_trade_no);
        System.out.println("return trade_no:" + trade_no);
        System.out.println("return total_amount:" + total_amount);
//        // 验证签名
//        boolean signVerified = AlipaySignature.rsaCheckV1(params, alipayConfig.getAlipayPublicKey(), alipayConfig.getCharset(), alipayConfig.getSignType());
//
//        System.out.println("return signVerified:"+signVerified);
//        if(signVerified) {
//        } else {
//
//        }

        //得到课程id
        String courseID = eduOrdersService.getCourseId(out_trade_no);

        return "redirect:http://localhost:3000/course/" + courseID ;
    }
    private Map<String, String> getParamsMap(HttpServletRequest request) {
        Map<String,String> params = new HashMap<>();
        Map requestParams = request.getParameterMap();
        for (Iterator iter = requestParams.keySet().iterator(); iter.hasNext();) {
            String name = (String) iter.next();
            String[] values = (String[]) requestParams.get(name);
            String valueStr = "";
            for (int i = 0; i < values.length; i++) {
                valueStr = (i == values.length - 1) ? valueStr + values[i]
                        : valueStr + values[i] + ",";
            }
            //乱码解决，这段代码在参数出现乱码时使用
//            try {
//                valueStr = new String(valueStr.getBytes("ISO-8859-1"), "UTF-8");
            params.put(name, valueStr);
//            } catch (UnsupportedEncodingException e) {
//                e.printStackTrace();
//            }
        }

        return params;
    }
}
