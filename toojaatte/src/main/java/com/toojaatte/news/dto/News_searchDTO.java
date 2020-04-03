package com.toojaatte.news.dto;


import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class News_searchDTO {
	private int sno, search_cnt;
	private String word;
	@DateTimeFormat
	private Date search_date;
	
}
