package com.skhu.sm.dto;

import lombok.Data;

import java.io.Serializable;

/**
 * Created by ds on 2017-11-13.
 */
@Data
public class Keyword implements Serializable{
    private static final long serialVersionUID = 1L;

    private String keyWord;
    private String keyword;
    private String tab_id;
    private int week;
    private String years;
}
