package com.skhu.sm.dto;

import java.io.Serializable;
import java.util.Date;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

@Data
public class Board implements Serializable{
	private  static final long serialVersionUID = 1L;

	private int b_id;
	private String b_title;
	private int b_writer;
	private String b_writerName;
	private String b_contents;
	private String b_fileUrl;
	private Date b_date;
	private int m_id;
	private MultipartFile b_file;

}
