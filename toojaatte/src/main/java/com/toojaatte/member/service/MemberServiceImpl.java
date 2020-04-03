package com.toojaatte.member.service;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.toojaatte.member.dto.LoginDTO;
import com.toojaatte.member.dto.MemberDTO;
import com.toojaatte.member.mapper.MemberMapper;

import lombok.AllArgsConstructor;

@Service
@Qualifier("ms")
@AllArgsConstructor
public class MemberServiceImpl implements MemberService {

	private MemberMapper mapper;
	
	@Override
	public Integer signIn(MemberDTO dto) {
		// TODO Auto-generated method stub
		dto.setTel(dto.getTel().replace(',', '-'));
		return mapper.signIn(dto);
	}

	@Override
	public LoginDTO login(LoginDTO dto) {
		// TODO Auto-generated method stub
		return mapper.login(dto);
	}

	@Override
	public Integer signOut(String id) {
		// TODO Auto-generated method stub
		return mapper.signOut(id);
	}

	@Override
	public Integer update(MemberDTO dto) {
		// TODO Auto-generated method stub
		return mapper.update(dto);
	}

	@Override
	public String idCheck(String id) {
		// TODO Auto-generated method stub
		return mapper.idCheck(id);
	}

	@Override
	public String findId(String email) {
		// TODO Auto-generated method stub
		return mapper.findId(email);
	}

	@Override
	public String findPw(MemberDTO dto) {
		// TODO Auto-generated method stub
		return mapper.findPw(dto);
	}

	@Override
	public MemberDTO getQuestionAndAnswer(String id) {
		// TODO Auto-generated method stub
		return mapper.getQuestionAndAnswer(id);
	}

}
