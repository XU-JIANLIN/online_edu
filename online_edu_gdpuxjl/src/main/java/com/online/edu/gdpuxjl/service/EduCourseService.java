package com.online.edu.gdpuxjl.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.online.edu.common.VO.CourseInfoVO;
import com.online.edu.common.VO.CourseWebVO;
import com.online.edu.common.dto.CourseInfoDTO;
import com.online.edu.common.dto.CourseQuery;
import com.online.edu.gdpuxjl.pojo.EduCourse;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;
import java.util.Map;


/**
 * <p>
 * 课程 服务类
 * </p>
 *
 * @author 许JIAN林
 * @since 2019-12-13
 */
public interface EduCourseService extends IService<EduCourse> {


    /**
     * 根据用户凭证，获取课程信息
     * @param id
     * @return
     */
    public List<EduCourse> getMemberCourseByAuth(String  id);

    /**
     * 判断用户是否已购买课程
     * @param Authorization
     * @param courseid
     * @return
     */
    public boolean isMemberHaveCourse(String Authorization, String courseid);

    /**
     * 根据用户凭证添加会员课程观看
     * @param Authorization
     * @param courseid
     */
    public void saveMemberCourse(String Authorization,String courseid);

    /**
     * 根据课程id查询课程是否免费
     * @param courseid
     * @return
     */
    public boolean isFreeByCourseid(String courseid);

    //查询最新的8门课程
    List<EduCourse> selectNewCourse();


    /**
     * 获取课程详细信息
     * @param id
     * @return
     */
    CourseWebVO selectInfoWebById(String id);

    /**
     * 更新课程浏览数
     * @param id
     */
    void updatePageViewCount(String id);


    //分页查询课程列表
    Map<String, Object> pageListWeb(String twosubjectid, Page<EduCourse> pageParam);

    // 根据讲师信息查询其主讲课程
    List<EduCourse> selectByTeacherId(String teacherId);



    /********************************以下为后台管理接口*************************************************/
    //有条件分页查询
    IPage<EduCourse> pageQuery(Page<EduCourse> pageParam, CourseQuery courseQuery);

    //保存课程信息
    String saveCourseInfo(CourseInfoDTO courseInfoDTO);

    //根据id查课程信息
    CourseInfoDTO findCourseById(String id);

    Boolean updateCourse(CourseInfoDTO courseInfoDTO);

    //查询所有的课程信息
    CourseInfoVO getCourseInfoAll(String courseId);

    boolean removeCourseId(String id);


}
