package com.skhu.sm.dto;

import lombok.Data;

import java.io.Serializable;

/**
 * Created by ds on 2017-10-16.
 */

@Data
public class Department implements Serializable{
    private static final long serialVersionUID = 1L;

    private int d_id;
    private String d_name;
    private String d_tel;
}
