package com.toojaatte.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.toojaatte.member.dto.LoginDTO;
import com.toojaatte.member.dto.MemberDTO;
import com.toojaatte.member.service.MemberService;
import com.toojaatte.util.mail.SendEmail;

import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping(value = "/member/ajax")
public class MemberRestController {

	@Autowired
	@Qualifier("ms")
	private MemberService service;
	
	@PostMapping(value = "/loginCheck", consumes = "application/json", produces = "application/text; charset=utf8")
	public ResponseEntity<String> login(@RequestBody LoginDTO dto) {
		System.out.println("MemberRestController.login().dto : " + dto);
		LoginDTO result = service.login(dto);
		System.out.println(result);
		if(result != null) {
			return new ResponseEntity<>("로그인 성공", HttpStatus.OK);
		}
		else {
			return new ResponseEntity<>("로그인 실패", HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	@GetMapping(value = "/idCheck")
	public ResponseEntity<String> idCheck(@RequestParam String id) {
		System.out.println(id);
		String result = service.idCheck(id);
		if(result == null) {
			return new ResponseEntity<>("아이디 중복되지 않습니다", HttpStatus.OK);
		}
		else {
			return new ResponseEntity<>("아이디가 중복", HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	@PostMapping(value = "/findId", consumes = "application/json", produces = "application/text; charset=utf8")
	public ResponseEntity<String> findId(@RequestBody String email) {
		String result = service.findId(email);
		if(result == null) {
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		else {
			SendEmail.gmailSend("투자어때 아이디 발송 이메일 입니다.", "고객님의 아이디는 " + result + "입니다. 보안을 위해 확인후 삭제해주세요.", email);
			return new ResponseEntity<>(HttpStatus.OK);
		}
	}

	@PostMapping(value = "/findPw", consumes = "application/json", produces = "application/text; charset=utf8")
	public ResponseEntity<String> findPw(@RequestBody MemberDTO dto) {
		System.out.println(dto);
		String result = service.findPw(dto);
		if(result == null) {
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		else {
//			SendEmail.gmailSend("투자어때 아이디 발송 이메일 입니다.", "고객님의 비밀번호는" + result + "입니다. 보안을 위해 확인후 삭제해주세요.", dto.getEmail());
			return new ResponseEntity<>(HttpStatus.OK);
		}
	}
	
	
}
