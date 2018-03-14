package com.skhu.sm.dto;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

import java.io.Serializable;
import java.util.List;

/**
 * Created by ds on 2017-10-16.
 */
@Data
public class Intro implements Serializable{
    private static final long serialVersionUID = 1L;

    private int i_id;
    private String i_title;
    private String i_contents;
    private MultipartFile i_images;
    private String i_imagesUrl;
    private List<Intro> introList;
}
