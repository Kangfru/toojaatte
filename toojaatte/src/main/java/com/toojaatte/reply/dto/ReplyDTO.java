package com.toojaatte.reply.dto;

import java.util.Date;

import lombok.Data;

@Data //setter, getter, 생성자, toString() 자종으로 생성해준다.
public class ReplyDTO {
	private int rno, no;
	private String content, writer;
	private Date writeDate;
}
