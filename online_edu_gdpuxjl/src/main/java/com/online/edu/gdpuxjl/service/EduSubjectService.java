package com.online.edu.gdpuxjl.service;

import com.online.edu.common.VO.SubjectParentVO;
import com.online.edu.gdpuxjl.pojo.EduSubject;
import com.baomidou.mybatisplus.extension.service.IService;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

/**
 * <p>
 * 课程科目 服务类
 * </p>
 *
 * @author 许JIAN林
 * @since 2019-12-08
 */
public interface EduSubjectService extends IService<EduSubject> {

    //添加一级分类
    public boolean saveFirstLevel(EduSubject eduSubject);

    //添加二级分类
    public boolean saveSecondLevel(EduSubject eduSubject);


    //删除分类
    public boolean deleteSubjectById(String id);

    // 根据excel批量导入课程类目
    public List<String> batchImport(MultipartFile file);

    //获取课程分类列表
    public List<SubjectParentVO> getSubjectList() ;
}
