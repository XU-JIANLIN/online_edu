package com.online.edu.ucenterservice.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.online.edu.common.VO.LunbotuVO;
import com.online.edu.ucenterservice.pojo.StatisticsLunbotu;
import com.online.edu.ucenterservice.mapper.StatisticsLunbotuMapper;
import com.online.edu.ucenterservice.service.StatisticsLunbotuService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 * 轮播图信息 服务实现类
 * </p>
 *
 * @author 许JIAN林
 * @since 2020-02-06
 */
@Service
public class StatisticsLunbotuServiceImpl extends ServiceImpl<StatisticsLunbotuMapper, StatisticsLunbotu> implements StatisticsLunbotuService {


    /**
     * 获取分页显示所有轮播图,
     * @return
     */
    @Override
    public IPage<StatisticsLunbotu> selectAllLunbotu(Page page) {

        QueryWrapper wrapper = new QueryWrapper();
        wrapper.orderByDesc("sort");


        return baseMapper.selectPage(page, wrapper);
    }

    @Override
    public boolean updateStatus(String id, String status) {
        StatisticsLunbotu lunbotu = new StatisticsLunbotu();
        lunbotu.setId(id);
        lunbotu.setStatus(status);
        int result = baseMapper.updateById(lunbotu);
        return result > 0;
    }

    @Override
    public Integer addLunbotuInfo(StatisticsLunbotu lunbotu) {
        return  baseMapper.insert(lunbotu);
    }


    /**
     * 前端获取轮播图列表
     * @return
     */
    @Override
    public List<LunbotuVO> getAllLunbotu() {

        //构造查询条件
        QueryWrapper wrapper = new QueryWrapper();
        wrapper.orderByDesc("sort");
        wrapper.eq("status", "Normal");

        List<StatisticsLunbotu> list = baseMapper.selectList(wrapper);

        List<LunbotuVO> lunbotuVOS = new ArrayList<LunbotuVO>();

        for(StatisticsLunbotu statisticsLunbotu : list){
            System.out.println(statisticsLunbotu);
            LunbotuVO lunbotuVO = new LunbotuVO();
            BeanUtils.copyProperties(statisticsLunbotu, lunbotuVO);
            System.out.println(lunbotuVO);
            lunbotuVOS.add(lunbotuVO);

        }
        return lunbotuVOS;
    }


}
