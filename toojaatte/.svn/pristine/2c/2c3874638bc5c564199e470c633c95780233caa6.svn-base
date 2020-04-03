package com.toojaatte.util.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import com.toojaatte.member.dto.LoginDTO;



//★로그인후 원래 있던 페이지로 이동하게끔.
//servlet-xml에 등록, membercontroller수정해야 함.
public class AuthInterceptor extends HandlerInterceptorAdapter {

	private final String[] needLoginList = {
		"/ncomment/insert.do",
		"/ncomment/update.do",
		"/ncomment/delete/{rno}.do"
	};
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		LoginDTO login = (LoginDTO) session.getAttribute("login");
		
		String uri = request.getServletPath();
		String query = request.getQueryString();
		
		if(login == null) {
			// 로그인이 필요한 uri인지 검사하는 메서드 처리
			if(checkLoginList(uri)) {
				
				// 로그인 처리가 끝나면 session에 uri를 꺼내서 요청한 페이지로 이동 시킨다.
				session.setAttribute("uri", uri+"?"+query);
				response.sendRedirect("/member/login.do");
				// 요구한 uri를 처리하지 않는다.
				return false;
			}
		}
		return super.preHandle(request, response, handler);
	}
	
	private boolean checkLoginList(String uri) {
		for(String s : needLoginList) {
			if(s.equals(uri)) return true;
		}
		return false;
	}
	
}
