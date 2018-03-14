package com.skhu.sm.dto;

import java.io.Serializable;

import lombok.Data;

@Data
public class Mentolist implements Serializable{
    private static final long serialVersionUID = 1L;

    private int ID;
    private int u_id; //학번
    private String u_name; //이름
    private String u_tel; //전화번호
    private int u_grade; //학년
    private String d_id1; // 소속학과
    private String u_email; // 이메일 주소
    private int a_id;
    private String a_title;
    private String a_sub;
    private String a_name;
    private String a_aim;
    private String a_contents;
    private String a_method;
    private String a_hours;
    private String a_rank;
    private String a_fileUrl;
    private int a_num;
    private int a_type;
    private String a_photoUrl;
}