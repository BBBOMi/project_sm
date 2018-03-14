package com.skhu.sm.dto;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by ds on 2017-11-27.
 */

@Data
public class Report implements Serializable {
    private static final long serialVersionUID = 1L;
    private int r_id;
    private String r_photoUrl;
    private Date r_date;
    private int r_time;
    private String r_contents;
    private String r_review;
    private int r_rank;
    private String r_reason;
    private int r_type;
    private String r_comment;
    private int r_weeks;
    private int r_writer;
    private String r_writerName;
    private int r_writerUid;
    private int m_id;
    private MultipartFile r_photo;
    private String a_name;
    private int r_writerId;
}
