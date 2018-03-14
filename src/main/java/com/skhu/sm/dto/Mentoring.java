package com.skhu.sm.dto;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by ds on 2017-11-08.
 */
@Data
public class Mentoring implements Serializable {
    private static final long serialVersionUID = 1L;

    private int m_id;
    private int ID;
    private int a_id;
    private Date m_date;

}
