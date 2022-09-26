package com.online.edu.gdpuxjl.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.online.edu.common.VO.CourseInfoVO;
import com.online.edu.common.VO.CourseWebVO;
import com.online.edu.common.dto.CourseInfoDTO;
import com.online.edu.common.dto.CourseQuery;
import com.online.edu.common.enums.ResultEnum;
import com.online.edu.common.exception.EduException;
import com.online.edu.gdpuxjl.client.MemberCilent;
import com.online.edu.gdpuxjl.client.MemberCourseCilent;
import com.online.edu.gdpuxjl.pojo.EduChapter;
import com.online.edu.gdpuxjl.pojo.EduCourse;
import com.online.edu.gdpuxjl.mapper.EduCourseMapper;
import com.online.edu.gdpuxjl.pojo.EduCourseDescription;
import com.online.edu.gdpuxjl.pojo.EduTeacher;
import com.online.edu.gdpuxjl.service.EduChapterService;
import com.online.edu.gdpuxjl.service.EduCourseDescriptionService;
import com.online.edu.gdpuxjl.service.EduCourseService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.online.edu.gdpuxjl.service.EduVideoService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * 课程 服务实现类
 * </p>
 *
 * @author 许JIAN林
 * @since 2019-12-13
 */
@Service
@Slf4j
public class EduCourseServiceImpl extends ServiceImpl<EduCourseMapper, EduCourse> implements EduCourseService {

    @Autowired
    private EduCourseDescriptionService eduCourseDescriptionService;

    @Autowired
    private EduChapterService eduChapterService;

    @Autowired
    private EduVideoService eduVideoService;

    @Autowired
    private MemberCourseCilent memberCourseCilent;

    @Autowired
    private MemberCilent memberCilent;

    @Override
    public void saveMemberCourse(String Authorization, String courseid) {

        //根据会员登录凭证取得会员id

        String memberid = memberCilent.getMemberID(Authorization);

//        System.out.println("根据会员登录凭证取得会员id" +memberid);
        //如果id不为空
        if (!StringUtils.isEmpty(memberid)){
            boolean flag = memberCourseCilent.getMemberCourse(memberid, courseid);
            //判断会员课程观看记录中是否存在
            if (!flag){
                //若不存在，插入新的观看记录
                memberCourseCilent.saveMemberCourse(memberid,courseid);
            }
        }
    }

    @Override
    public List<EduCourse> getMemberCourseByAuth(String Authorization) {

        //根据会员登录凭证取得会员id
        String memberid = memberCilent.getMemberID(Authorization);


        List list = memberCourseCilent.getMemberCourseIdList(memberid);

        QueryWrapper<EduCourse> wrapper = new QueryWrapper<>();

        log.info("【查询用户课程信息】");
        System.out.println("查询到的信息==" + list);

        if (!list.isEmpty()){
            wrapper.in("id",list);
            List<EduCourse> courseList = baseMapper.selectList(wrapper);
            return courseList;
        }else {
            return null;
        }

    }

    @Override
    public boolean isMemberHaveCourse(String Authorization, String courseid) {

        //根据会员登录凭证取得会员id
        String memberid = memberCilent.getMemberID(Authorization);

        return memberCourseCilent.getMemberCourse(memberid, courseid);

    }

    /**
     * 查询课程是否免费
     * @param courseid
     * @return
     */
    @Override
    public boolean isFreeByCourseid(String courseid) {



        EduCourse eduCourse = baseMapper.selectById(courseid);
        if (eduCourse!=null && (eduCourse.getPrice()).compareTo(BigDecimal.ZERO) == 0){
            //课程免费
            return true;
        }

        return false;
    }

    @Transactional
    @Override
    public List<EduCourse> selectNewCourse(){
        QueryWrapper<EduCourse> wrapper = new QueryWrapper<>();
        wrapper.orderByDesc("gmt_create");

        Page<EduCourse> pageParam = new Page<EduCourse>(0,8);

        baseMapper.selectPage(pageParam, wrapper);

        return pageParam.getRecords();
    }


    /**
     * 查询课程详细信息
     * @param id
     * @return
     */
    @Transactional
    @Override
    public CourseWebVO selectInfoWebById(String id) {
        //更新观看人数
        this.updatePageViewCount(id);
        //自定义sql查询
        return baseMapper.selectInfoWebById(id);
    }

    /**
     * 更新课程浏览数
     * @param id
     */
    @Override
    public void updatePageViewCount(String id) {
        EduCourse course = baseMapper.selectById(id);
        course.setViewCount(course.getViewCount() + 1);
        baseMapper.updateById(course);
    }

    /**
     * 根据二级课程id分页查询课程列表
     * @param twosubjectid
     * @param pageParam
     * @return
     */
    @Override
    public Map<String, Object> pageListWeb(String twosubjectid, Page<EduCourse> pageParam) {


        QueryWrapper<EduCourse> queryWrapper = new QueryWrapper<EduCourse>();
        //当twosubjectid等于0时，表示查询全部课程，不用加条件，否则添加
        if (!"0".equals(twosubjectid)){
            queryWrapper.eq("subject_id", twosubjectid);
        }
        queryWrapper.orderByDesc("gmt_modified");

        baseMapper.selectPage(pageParam, queryWrapper);

        List<EduCourse> records = pageParam.getRecords();
        long current = pageParam.getCurrent();
        long pages = pageParam.getPages();
        long size = pageParam.getSize();
        long total = pageParam.getTotal();
        boolean hasNext = pageParam.hasNext();
        boolean hasPrevious = pageParam.hasPrevious();

        Map<String, Object> map = new HashMap<String, Object>();
        map.put("items", records);
        map.put("current", current);
        map.put("pages", pages);
        map.put("size", size);
        map.put("total", total);
        map.put("hasNext", hasNext);
        map.put("hasPrevious", hasPrevious);

        return map;

    }

    /**
     * 根据讲师id查询当前讲师的课程列表
     * @param teacherId
     * @return
     */
    @Override
    public List<EduCourse> selectByTeacherId(String teacherId) {


        QueryWrapper<EduCourse> queryWrapper = new QueryWrapper<EduCourse>();

        queryWrapper.eq("teacher_id", teacherId);
        //按照最后更新时间倒序排列
        queryWrapper.orderByDesc("gmt_modified");

        List<EduCourse> courses = baseMapper.selectList(queryWrapper);

        return courses;

    }



    /********************************以下为后台管理接口*************************************************/



    /**
     * 1 根据条件查询课程信息
     * @param pageParam
     * @param courseQuery
     * @return
     */
    @Override
    public IPage<EduCourse> pageQuery(Page<EduCourse> pageParam, CourseQuery courseQuery) {

        // 1 当查询条件为空时
        if (courseQuery == null){
            return baseMapper.selectPage(pageParam,null);
        }
        // 2 不为空时
        // 3. 取出各个条件，进行拼接
        String title = courseQuery.getTitle();
        String subjectParentId = courseQuery.getSubjectParentId();
        String subjectId = courseQuery.getSubjectId();
        String teacherId = courseQuery.getTeacherId();

        QueryWrapper<EduCourse> wrapper = new QueryWrapper<>();
        if ( !StringUtils.isEmpty(title)) {
            wrapper.like("title", title);
        }
        // 根据以后需求可加可不加
//        if (!StringUtils.isEmpty(subjectParentId)) {
//            wrapper.eq("subjectParentId", subjectParentId);
//        }
        if (!StringUtils.isEmpty(subjectId)) {
            wrapper.eq("subject_id", subjectId);
        }
        if ( !StringUtils.isEmpty(teacherId)) {
            wrapper.eq("teacher_id", teacherId);
        }
        return baseMapper.selectPage(pageParam, wrapper);
    }

    /**
     * 保存课程信息
     * @param courseInfoDTO
     * @return 课程id
     */
    @Override
    public String saveCourseInfo(CourseInfoDTO courseInfoDTO) {

        // 1.新建course对象
        EduCourse eduCourse = new EduCourse();
        // 2.将传输对象的内容复制给新建对象
        BeanUtils.copyProperties(courseInfoDTO, eduCourse);
        // 3.保存课程
        int result = baseMapper.insert(eduCourse);
        if (result == 0){
            throw new EduException(ResultEnum.SAVE_COURSE_FALSE);
        }
        // 4.新建课程描述对象,并设置参数
        EduCourseDescription eduCourseDescription = new EduCourseDescription();
        eduCourseDescription.setId(eduCourse.getId());
        eduCourseDescription.setDescription(courseInfoDTO.getDescription());
        System.out.println(eduCourseDescription);

        // 5.保存课程描述到数据库
        boolean save = eduCourseDescriptionService.save(eduCourseDescription);

        if (save){
            return eduCourse.getId();
        }else {
            return null;
        }

    }

    /**
     *根据课程id查询课程信息
     * @param id
     * @return
     */
    @Override
    public CourseInfoDTO findCourseById(String id) {
        //新建一个课程信息传输对象
        CourseInfoDTO courseInfoDTO = new CourseInfoDTO();
        //查询课程基本信息
        EduCourse eduCourse = baseMapper.selectById(id);

        if (eduCourse == null){
            throw new EduException(ResultEnum.COURSE_NOT_EXIST);
        }
        //将查询到的信息复制到传输对象中
        BeanUtils.copyProperties(eduCourse, courseInfoDTO);

        //查询课程描述
        EduCourseDescription eduCourseDescription = eduCourseDescriptionService.getById(id);

        //将查询到的信息复制到传输对象中
       courseInfoDTO.setDescription(eduCourseDescription.getDescription());

        return courseInfoDTO;
    }

    @Override
    public Boolean updateCourse(CourseInfoDTO courseInfoDTO) {
        //1 修改课程基本信息表
        EduCourse eduCourse = new EduCourse();
        BeanUtils.copyProperties(courseInfoDTO,eduCourse);
        int result = baseMapper.updateById(eduCourse);
        if(result == 0) {
            throw new EduException(ResultEnum.UPDATE_COURSE_FALSE);
        }

        //2 修改描述表
        EduCourseDescription eduCourseDescription = new EduCourseDescription();
        String id = courseInfoDTO.getId();
        String description = courseInfoDTO.getDescription();
        eduCourseDescription.setId(id);
        eduCourseDescription.setDescription(description);
        boolean b = eduCourseDescriptionService.updateById(eduCourseDescription);
        return b;
    }

    //根据课程id查询课程详情
    @Override
    public CourseInfoVO getCourseInfoAll(String courseId) {
        CourseInfoVO courseInfoAll = baseMapper.getCourseInfoById(courseId);
        return courseInfoAll;
    }

    @Override
    public boolean removeCourseId(String id) {
        //1 根据课程id删除章节
        eduChapterService.deleteChapterByCourseId(id);

        //2 根据课程id删除小节
        eduVideoService.deleteVideoByCourseId(id);

        //3 根据课程id删除课程描述
        eduCourseDescriptionService.deleteDescriptionByCourseId(id);

        //4 删除课程本身
        int result = baseMapper.deleteById(id);
        return result>0;
    }
}
