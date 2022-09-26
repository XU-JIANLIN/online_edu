package com.online.edu.gdpuxjl.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.online.edu.common.dto.TeacherQuery;
import com.online.edu.common.enums.ResultEnum;
import com.online.edu.common.exception.EduException;
import com.online.edu.gdpuxjl.pojo.EduTeacher;
import com.online.edu.gdpuxjl.mapper.EduTeacherMapper;
import com.online.edu.gdpuxjl.service.EduTeacherService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * 讲师 服务实现类
 * </p>
 *
 * @author 许JIAN林
 * @since 2019-12-03
 */
@Service
public class EduTeacherServiceImpl extends ServiceImpl<EduTeacherMapper, EduTeacher> implements EduTeacherService {


    /** 前台查询权重较高的num位老师 **/
    @Override
    public List<EduTeacher> getTeacherBySort(Integer num) {

        QueryWrapper<EduTeacher> wrapper = new QueryWrapper<>();
        wrapper.orderByDesc("sort");
        Page<EduTeacher> page = new Page<>(0,num);
        baseMapper.selectPage(page, wrapper);
        return page.getRecords();
    }
    @Override
    public Map<String, Object> pageQueryWeb(Page<EduTeacher> pageParam) {
        //分页查询后的结果
        baseMapper.selectPage(pageParam, null);

        //教师列表
        List<EduTeacher> records = pageParam.getRecords();
        //总记录数
        long total = pageParam.getTotal();
        //页面记录数大小
        long size = pageParam.getSize();
        //当前页
        long current = pageParam.getCurrent();
        //总页数
        long pages = pageParam.getPages();
        //是否有下一页
        boolean hasNext = pageParam.hasNext();
        //是否有上一页
        boolean hasPrevious = pageParam.hasPrevious();

        Map<String, Object> map = new HashMap<String, Object>();
        map.put("items", records);
        map.put("total", total);
        map.put("size", size);
        map.put("current", current);
        map.put("pages",pages);
        map.put("hasNext", hasNext);
        map.put("hasPrevious",hasPrevious);

        return map;
    }

    /***************************以下为后台管理接口实现类************************************************/



    /** 根据条件进行查询，并分页显示 */
    @Override
    public IPage<EduTeacher> pageQuery(Page page, TeacherQuery queryTeacher) {

        if (queryTeacher == null) {
            //当教师查询条件为空时
            return baseMapper.selectPage(page,null);
        }
        //新建条件查询对象
        QueryWrapper queryWrapper = new QueryWrapper();
        String name = queryTeacher.getName();
        Integer level = queryTeacher.getLevel();
        String begin = queryTeacher.getBegin();
        String end = queryTeacher.getEnd();
        if ( !StringUtils.isEmpty(name)) {
            queryWrapper.like("name", name);
        }
        if (!StringUtils.isEmpty(level)) {
            queryWrapper.eq("level", level);
        }
        if (!StringUtils.isEmpty(begin)) {
            queryWrapper.ge("gmt_create", begin);
        }
        if (!StringUtils.isEmpty(end)) {
            queryWrapper.le("gmt_create", end);
        }
        return baseMapper.selectPage(page,queryWrapper);
    }

    @Override
    public int updateTeacher(String id, EduTeacher eduTeacher) {

        // 1.先查询索要修改的教师是否存在
        EduTeacher result = baseMapper.selectById(id);


        // 2.存在则进行修改，否则抛出异常
        if (result !=null) {
            eduTeacher.setId(id);
            return baseMapper.updateById(eduTeacher);
        }else {
            throw new EduException( ResultEnum.TEACHER_NOT_EXIST);
        }

    }
}
