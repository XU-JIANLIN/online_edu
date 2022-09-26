package com.online.edu.gdpuxjl.service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.online.edu.common.dto.TeacherQuery;
import com.online.edu.gdpuxjl.pojo.EduTeacher;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 讲师 服务类
 * </p>
 *
 * @author 许JIAN林
 * @since 2019-12-03
 */
public interface EduTeacherService extends IService<EduTeacher> {

    /** 前台查询权重较高的num位老师 **/
    List<EduTeacher> getTeacherBySort(Integer num);

    /** 前台查询教师分页 **/
    public Map<String, Object> pageQueryWeb(Page<EduTeacher>  page);

   /********************************以下为后台管理接口*************************************************/

    /** 根据条件进行查询，并分页显示 */
   public IPage<EduTeacher> pageQuery(Page page, TeacherQuery queryTeacher) ;

   /** 修改教师信息 */
   public int updateTeacher(String id, EduTeacher eduTeacher) ;



}
