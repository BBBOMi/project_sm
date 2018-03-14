package com.skhu.sm.dto;

import lombok.Data;

import java.io.Serializable;
import java.util.List;

/**
 * Created by ds on 2017-12-02.
 */
@Data
public class MentoSurvey implements Serializable {
    private static final long serialVersionUID = 1L;

    private int s1_id;
    private String s1_title;
    private List<MentoSurvey> mentoSurveyList;
}
