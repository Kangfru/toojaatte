package com.toojaatte.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.toojaatte.member.dto.LoginDTO;
import com.toojaatte.member.dto.MemberDTO;
import com.toojaatte.member.service.MemberService;
import com.toojaatte.util.mail.SendEmail;

@Controller
@RequestMapping(value = "/member")
public class MemberController {

	@Autowired
	@Qualifier("ms")
	private MemberService service;
	
	@GetMapping("/login.do")
	public String loginForm() {
		return "member/loginForm";
	}
	
	@PostMapping("/login.do")
	public String login(LoginDTO dto, HttpSession session) {
		session.setAttribute("login", service.login(dto));
		String uri = (String) session.getAttribute("uri");
		session.removeAttribute("uri");
		return (uri == null)? "redirect:/main/index.do": 
			"redirect:"+uri;
	}
	
	@GetMapping("/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/main/index.do";
	}
	
	@GetMapping("/signIn.do")
	public String signInForm() {
		return "member/signInForm";
	}
	
	@PostMapping("/signIn.do")
	public String signIn(MemberDTO dto) {
		service.signIn(dto);
		return "redirect:/main/index.do";
		
	}
	
	@GetMapping("/findIdPw.do")
	public String findIdPw() {
		return "member/findIdPw";
	}
	
	@PostMapping("/findPw.do")
	public String findPw(String id, Model model) {
		System.out.println(id);
		model.addAttribute("dto", service.getQuestionAndAnswer(id));
		return "member/findPw";
	}

	@PostMapping("/sendPwEmail.do")
	public String sendPwEmail(MemberDTO dto) {
		SendEmail.gmailSend("투자어때 패스워드 발송 이메일 입니다.", "고객님의 비밀번호는 " + service.findPw(dto) + "입니다. 보안을 위해 확인후 삭제해주세요.", dto.getEmail());
		return "redirect:/";
	}
	
}
