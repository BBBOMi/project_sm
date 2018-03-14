package com.skhu.sm.dto;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 * Created by ds on 2017-12-02.
 */
@Data
public class MenteeSurveyResult implements Serializable {
    private static final long serialVersionUID = 1L;

    private int s2_id;
    private int s2_value;
    private String s2_title;
    private Date s2_date;
    private int m_id;
    private int ID;

    //해당 항목 전체 응답수
    private double s2_value_all_count;

    //각 항목 응답수
    private int s2_value_1_count;
    private int s2_value_2_count;
    private int s2_value_3_count;
    private int s2_value_4_count;
    private int s2_value_5_count;

    private List<MenteeSurveyResult> menteeSurveyResultList;
}
