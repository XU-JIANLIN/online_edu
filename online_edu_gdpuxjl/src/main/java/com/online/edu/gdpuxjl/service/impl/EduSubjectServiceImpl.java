package com.online.edu.gdpuxjl.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.online.edu.common.VO.SubjectParentVO;
import com.online.edu.common.VO.SubjectVO;
import com.online.edu.common.enums.ResultEnum;
import com.online.edu.common.exception.EduException;
import com.online.edu.gdpuxjl.pojo.EduSubject;
import com.online.edu.gdpuxjl.mapper.EduSubjectMapper;
import com.online.edu.gdpuxjl.service.EduSubjectService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.extern.slf4j.Slf4j;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 * 课程科目 服务实现类
 * </p>
 *
 * @author 许JIAN林
 * @since 2019-12-08
 */
@Service
@Slf4j
public class EduSubjectServiceImpl extends ServiceImpl<EduSubjectMapper, EduSubject> implements EduSubjectService {


    /**
     * 添加一级分类
     * @param eduSubject
     * @return
     */
    @Override
    public boolean saveFirstLevel(EduSubject eduSubject) {
        //判断一级分类是否存在
        EduSubject firstSubject = this.findSubjectByTitleAndParentId(eduSubject.getTitle(), "0");

        if (firstSubject == null) { // 不存在，则添加
            eduSubject.setParentId("0");
            int result = baseMapper.insert(eduSubject);
            return result>0;
        }
        return false;
    }

    @Override
    public boolean saveSecondLevel(EduSubject eduSubject) {
        //判断二级分类是否存在
        EduSubject secondSubject = this.findSubjectByTitleAndParentId(eduSubject.getTitle(), eduSubject.getParentId());

        if (secondSubject == null) {
            int result = baseMapper.insert(eduSubject);
            return  result > 0;
        }
        return false;
    }

    /**
     * 根据 id 删除分类
     * @param id
     * @return
     */
    @Override
    public boolean deleteSubjectById(String id) {
        //判断是否存在二级分类
        QueryWrapper wrapper = new QueryWrapper();
        wrapper.eq("parent_id", id);
        Integer count = baseMapper.selectCount(wrapper);
        if (count > 0) { //存在二级分类

            throw  new EduException(ResultEnum.TOWLEVEL_EXIST);

        }else { //没有二级分类
            //进行删除
            int result = baseMapper.deleteById(id);
            return  result > 0 ;
        }

    }

    // 根据excel批量导入课程类目
    @Override
    public List<String> batchImport(MultipartFile file) {

        //存储提示信息
        List<String> list = new ArrayList<>();
        String id_parent = null;
        try {
            // 1.获取文件输出流
            InputStream in = file.getInputStream();

            // 2.创建excel工作簿
            HSSFWorkbook workbook = new HSSFWorkbook(in);
            // 3.读取工作区间sheet
            HSSFSheet sheet = workbook.getSheetAt(0);

            //得到行数
            int lastRowNum = sheet.getLastRowNum();


            // 4.遍历每一行
            for (int i = 1; i <= lastRowNum; i++){
                // 读取该行的内容
                HSSFRow row = sheet.getRow(i);
                //判断该行是否为空
                if (row == null) {
                    log.info("【批量插入类目分类】 第" + i + "行为空，请记得输入数据");
                    String str = "第" + i + "行为空，请记得输入数据" ;
                    list.add(str);
                    continue;
                }
                // 5.在每一行中，读入第一列
                HSSFCell firstCell = row.getCell(0);
                //判断该列是否为空
                if (firstCell == null) {
                    log.info("【批量插入类目分类】 第" + i + "行的第一列为空，请记得输入数据");
                    String str = "第" + i + "行的第一列为空，请记得输入数据" ;
                    list.add(str);
                    continue;
                }
                //列不为空获取数据,第一列值
                //一级分类值
                String firstCellValue = firstCell.getStringCellValue();
                //查询该课程类目是否已存在于数据库
                EduSubject findFirstSubject = this.findSubjectByTitleAndParentId(firstCellValue, "0");
                // 判断该类目是否存在
                if (findFirstSubject == null ){
                    log.info("【批量插入类目分类】 " + firstCellValue + "不存在,新建类目，插入数据库");
                    //不存在,新建类目，插入数据库
                    EduSubject firstEduSubject = new EduSubject();
                    firstEduSubject.setTitle(firstCellValue);
                    firstEduSubject.setParentId("0");
                    firstEduSubject.setSort(0);
                    //写入数据库
                    baseMapper.insert(firstEduSubject);
                    id_parent = firstEduSubject.getId();

                } else {
                    // 如果存在
                    log.info("【批量插入类目分类】 " + firstCellValue + "已存在,不添加");
                    //把一级分类id赋值id_parent
                    id_parent = findFirstSubject.getId();
                }

                // 5.在每一行中，读入第二列
                HSSFCell secondCell = row.getCell(1);
                //判断该列是否为空
                if (secondCell == null) {
                    log.info("【批量插入类目分类】 第" + i + "行的第二列为空，请记得输入数据");
                    String str = "第" + i + "行的第二列为空，请记得输入数据" ;
                    list.add(str);
                    continue;
                }
                // 6.添加分类
                //列不为空获取数据,第二列值
                //二级分类值
                String secondCellValue = secondCell.getStringCellValue();

                //查询该课程类目是否已存在于数据库
                EduSubject findSecondSubject = this.findSubjectByTitleAndParentId(secondCellValue, id_parent);
                if (findSecondSubject == null) {
                    //如果该二级类目没有存在于数据库
                    log.info("【批量插入类目分类】 " + secondCellValue + "不存在,新建类目，插入数据库");
                    //不存在,新建类目，插入数据库
                    EduSubject secondEduSubject = new EduSubject();
                    secondEduSubject.setTitle(secondCellValue);
                    secondEduSubject.setParentId(id_parent);
                    secondEduSubject.setSort(0);
                    //写入数据库
                    baseMapper.insert(secondEduSubject);
                }

            }
        }catch (Exception e){

            e.printStackTrace();
            throw new EduException(ResultEnum.IMPORT_ERROR);
        }

        return list;
    }

    //获取课程分类列表
    @Override
    public List<SubjectParentVO> getSubjectList() {

        // 1. 查询所有一级分类
        QueryWrapper firstWrapper = new QueryWrapper();
        firstWrapper.eq("parent_id", "0");
        List<EduSubject> allFirstSubject = baseMapper.selectList(firstWrapper);


        // 2. 查询所有二级分类
        QueryWrapper secondWrapper = new QueryWrapper();
        secondWrapper.ne("parent_id", "0");
        List<EduSubject> allSecondSubject = baseMapper.selectList(secondWrapper);

        // 3. 用于存储所有一级分类分类
        List<SubjectParentVO> subjectParentVOS = new ArrayList<>();


        // 4. 遍历所有一级分类分类
        for(EduSubject firstEduSubject : allFirstSubject ) {

            SubjectParentVO parentVO = new SubjectParentVO();
            BeanUtils.copyProperties(firstEduSubject, parentVO);

            // 用于存储所有二级分类列表
            List<SubjectVO> subjectVOS = new ArrayList<>();
            // 5. 遍历所有二级分类列表
            for(EduSubject secondEduSubject : allSecondSubject ){

                // 6. 如果该二级分类的 ParentId 为一级分类的id的话，存进VO
                if (secondEduSubject.getParentId().equals(firstEduSubject.getId())) {
                    SubjectVO subjectVO = new SubjectVO();
                    BeanUtils.copyProperties(secondEduSubject, subjectVO);
                    subjectVOS.add(subjectVO);
                }
            }
            parentVO.setChildren(subjectVOS);
            subjectParentVOS.add(parentVO);
        }

        return subjectParentVOS;
    }


    /**
     * 根据 类目名称 和父类目id 查询该类目
     * @param title
     * @param parentId
     * @return
     */
    private EduSubject findSubjectByTitleAndParentId(String title, String parentId) {
        QueryWrapper wrapper = new QueryWrapper();

        wrapper.eq("title", title);
        wrapper.eq("parent_id", parentId);

        return baseMapper.selectOne(wrapper);

    }
}
