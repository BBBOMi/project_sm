package com.skhu.sm.dto;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by ds on 2017-10-16.
 */

@Data
public class Notice implements Serializable{
    private static final long serialVersionUID = 1L;

    private int n_id;
    private String n_title;
    private String n_writer;
    private Date n_date;
    private String n_contents;
    private MultipartFile n_file;
    private int ID;
    private String n_fileUrl;
}
