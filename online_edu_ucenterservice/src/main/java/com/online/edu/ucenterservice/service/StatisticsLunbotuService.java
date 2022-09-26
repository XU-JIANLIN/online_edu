package com.online.edu.ucenterservice.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.online.edu.common.VO.LunbotuVO;
import com.online.edu.ucenterservice.pojo.StatisticsLunbotu;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 * 轮播图信息 服务类
 * </p>
 *
 * @author 许JIAN林
 * @since 2020-02-06
 */
public interface StatisticsLunbotuService extends IService<StatisticsLunbotu> {

    public IPage<StatisticsLunbotu> selectAllLunbotu(Page page);

    boolean updateStatus(String id, String status);

    Integer addLunbotuInfo(StatisticsLunbotu lunbotu);

    List<LunbotuVO> getAllLunbotu();
}
