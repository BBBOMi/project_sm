package com.skhu.sm.dto;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 * Created by ds on 2017-12-02.
 */
@Data
public class MentoSurveyResult implements Serializable {
    private static final long serialVersionUID = 1L;

    private int s1_id;
    private int s1_value;
    private String s1_title;
    private Date s1_date;
    private int m_id;
    private int ID;

    //해당 항목 전체 응답수
    private double s1_value_all_count;

    //각 항목 응답수
    private int s1_value_1_count;
    private int s1_value_2_count;
    private int s1_value_3_count;
    private int s1_value_4_count;
    private int s1_value_5_count;

    private List<MentoSurveyResult> mentoSurveyResultList;
}
