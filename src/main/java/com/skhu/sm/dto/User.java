package com.skhu.sm.dto;

import java.io.Serializable;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

@Data
public class User implements Serializable {
    private  static final long serialVersionUID = 1L;

    private int ID;
    private int u_id; //학번
    private String u_password;
    private String u_password1;
    private String u_password2;
    private String u_name; //이름
    private String u_tel; //전화번호
    private String u_email;
    private int d_id1;
    private int d_id2;
    private int d_id3;
    private int u_type;
    private int u_grade; //학년
    private MultipartFile u_photo;
    private int m_id;
    private String d_name; //학과 이름
    private String u_photoUrl; //사진 url
}
