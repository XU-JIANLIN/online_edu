package com.online.edu.common.VO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.ArrayList;
import java.util.List;

/**
 * @描述：
 * @作者： 许JIAN林
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class SubjectParentVO {

    private String id;

    private String title;

    private List<SubjectVO> children = new ArrayList<>();
}
