package com.toojaatte.anaboard.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
// getter, setter, 생성자, toString() 자동생성
public class AnaBoardDTO {

	private int no, grade;
	private String title, titleType, content, writer;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date writeDate;
	private int hit, reply_cnt, r_cnt, n_cnt;
	private MultipartFile[] multiFile; //form에서 넘어오는 데이터 받기
		// TODO Auto-generated method stub
}
