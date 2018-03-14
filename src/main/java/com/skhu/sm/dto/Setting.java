package com.skhu.sm.dto;

import lombok.Data;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by ds on 2017-12-04.
 */
@Data
public class Setting implements Serializable {
    private static final long serialVersionUID = 1L;

    private Date mento_start;
    private String mento_start_string;
    private Date mento_end;
    private String mento_end_string;
    private int mento_type;

    private Date mentee_start;
    private String mentee_start_string;
    private Date mentee_end;
    private String mentee_end_string;
    private int mentee_type;

    private Date survey_start;
    private String survey_start_string;
    private Date survey_end;
    private String survey_end_string;
    private int survey_type;
}
