package com.toojaatte.member.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.toojaatte.member.dto.LoginDTO;
import com.toojaatte.member.dto.MemberDTO;

@Mapper
public interface MemberMapper {

	public Integer signIn(MemberDTO dto);
	public LoginDTO login(LoginDTO dto);
	public String idCheck(String id);
	public Integer signOut(String id);
	public Integer update(MemberDTO dto);
	public String findId(String email);
	public String findPw(MemberDTO dto);
	public MemberDTO getQuestionAndAnswer(String id);
	
}
