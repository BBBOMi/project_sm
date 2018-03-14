package com.skhu.sm.dto;

import lombok.Data;

import java.io.Serializable;
import java.util.List;

/**
 * Created by ds on 2017-12-02.
 */
@Data
public class MenteeSurvey implements Serializable {
    private static final long serialVersionUID = 1L;

    private int s2_id;
    private String s2_title;
    private List<MenteeSurvey> menteeSurveyList;
}
