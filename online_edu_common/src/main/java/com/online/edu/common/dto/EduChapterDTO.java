package com.online.edu.common.dto;

import lombok.Data;

import java.util.ArrayList;
import java.util.List;

//章节
@Data
public class EduChapterDTO {

    private String id;
    private String title;
    //一个章节有很多小节
    private List<EduVideoDTO> children = new ArrayList<>();
}
