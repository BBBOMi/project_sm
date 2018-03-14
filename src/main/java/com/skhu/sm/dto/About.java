package com.skhu.sm.dto;

import java.io.Serializable;
import java.util.List;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

@Data
public class About implements Serializable {
    private  static final long serialVersionUID = 1L;

    private int a_id;
    private String a_title;
    private String a_contents;
    private MultipartFile a_images;
    private String a_imagesUrl;
    private List<About> aboutList;
}
