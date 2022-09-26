package com.online.edu.gdpuxjl.controller;


import com.online.edu.common.VO.ResultVO;
import com.online.edu.common.dto.EduChapterDTO;
import com.online.edu.common.enums.ResultEnum;
import com.online.edu.common.utils.ResultVOUtil;
import com.online.edu.gdpuxjl.pojo.EduChapter;
import com.online.edu.gdpuxjl.service.EduChapterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * <p>
 * 课程 前端控制器
 * </p>
 *
 * @author 许JIAN林
 * @since 2019-12-13
 */
@RestController
@CrossOrigin
@RequestMapping("/online/chapter")
public class EduChapterController {

    @Autowired
    private EduChapterService eduChapterService;

    //删除章节的方法
    @DeleteMapping("{chapterId}")
    public ResultVO deleteChapter(@PathVariable String chapterId) {
        boolean result = eduChapterService.removeChapterId(chapterId);
        if(result) {
            return ResultVOUtil.success();
        } else {
            return ResultVOUtil.error(ResultEnum.ERROR);
        }
    }
    //修改章节的方法
    @PostMapping("updateChapter")
    public ResultVO updateChapter(@RequestBody EduChapter eduChapter) {
        boolean result = eduChapterService.updateById(eduChapter);
        if(result) {
            return ResultVOUtil.success();
        } else {
            return ResultVOUtil.error(ResultEnum.ERROR);
        }
    }
    //根据章节id查询
    @GetMapping("getChapterInfo/{chapterId}")
    public ResultVO getChapterInfo(@PathVariable String chapterId) {
        EduChapter eduChapter = eduChapterService.getById(chapterId);
        return ResultVOUtil.success("eduChapter",eduChapter);
    }

    // 添加章节的方法
    @PostMapping("addChapter")
    public ResultVO addChapter(@RequestBody EduChapter eduChapter) {
        boolean save = eduChapterService.save(eduChapter);
        if(save) {
            return ResultVOUtil.success();
        } else {
            return ResultVOUtil.error(ResultEnum.ERROR);
        }
    }

    //根据id查询查询章节和小节
    @GetMapping("getChapterVideoList/{courseId}")
    public ResultVO getChapterVideoListCourseId(@PathVariable String courseId) {
        List<EduChapterDTO> list = eduChapterService.getChapterVideoListByCourseId(courseId);
        return  ResultVOUtil.success("items",list);
    }

}

