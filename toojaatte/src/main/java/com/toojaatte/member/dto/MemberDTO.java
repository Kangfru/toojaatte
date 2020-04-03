package com.toojaatte.member.dto;

import java.util.Date;

import lombok.Data;

@Data
public class MemberDTO {

	private String id, pw, addr, tel, email;
	private int state;
	private Date joinDate, conDate;
	private int grade;
	private String question, answer, photo, nickName;
	private String gradeName, stateName;
	
}
