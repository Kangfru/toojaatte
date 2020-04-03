package com.toojaatte.reply.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.toojaatte.reply.dto.ReplyDTO;
import com.toojaatte.reply.service.ReplyService;
import com.toojaatte.util.page.PageObject;

import lombok.extern.log4j.Log4j;

@Log4j
// @Controller는 jsp로 포워드나 url로 리다이렉트 시키는 기능을 처리하기 위한 객체
// @RestController는 순수한 데이터를 전달하는 기능을 처리하기 위한 객체
@RestController
@RequestMapping("/reply")
public class ReplyController {
	// 밑의 final 변수가 @AllArgsConstructor로 인해
	// 외부에서 불러와 새로 만들어야 한다고 인식하여 오류가 날 경우
	// @AllArgsConstructor를 사용하지 않고 service 변수 위에
	// @Autowired or @Inject 를 선언하여 사용
	@Autowired
	@Qualifier("rs") // ReplyService의 @Qualifier("bs")이름과 맞춘다.
	private ReplyService service;

	private final String MODULE = "reply";

	// 1.댓글 리스트
	@GetMapping("/pages/{no}/{page}") // RequestMapping + GetMapping
	public ResponseEntity<List<ReplyDTO>> list(Model model, @PathVariable int no, @PathVariable int page) {
		PageObject pageObject = new PageObject(page, 10);
		log.info(pageObject);
		// 동기식 데이터 처리 -> 브라우저의 주소가 바뀐다.
		// 지금 처리는 비동기식 데이터 처리
		// DB에서 데이터 가져오기 -> 페이지 계산, JSP에서 표시할 페이지네이션 정보가 계산된다.
//		model.addAttribute("list", service.list(pageObject));
//		model.addAttribute("pageObject", pageObject);
		// (/WEB-INF/views/) + [reply] + "/list" + (.jsp)
		return new ResponseEntity<>(service.list(pageObject, no), HttpStatus.OK);
	}

	// 2.댓글 쓰기 처리
	//consumes : 전달되는 데이터 지정
	//produces : 돌려주는 값에 대한 데이터 설정
	@PostMapping(value = "/new", consumes="application/json",
			produces="application/text; charset=utf8")
	public ResponseEntity<String> write(@RequestBody ReplyDTO dto) {
		System.out.println("postmapping value new");
		log.info(dto);
		try {
			service.write(dto);
			return new ResponseEntity<>("댓글 등록 성공", HttpStatus.OK);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			return new ResponseEntity<>("댓글 등록 실패.\\n"+ e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	// 3.댓글 수정 처리 - 전체 데이터
	//consumes : 전달되는 데이터 지정
	//produces : 돌려주는 값에 대한 데이터 설정
	@RequestMapping(value = "/{rno}", consumes="application/json",
			produces="application/text; charset=utf8", method= RequestMethod.PATCH)
	public ResponseEntity<String> update(@RequestBody ReplyDTO dto, @PathVariable int rno) {
		dto.setRno(rno);
		log.info("#####" + dto);
		int result = service.update(dto);
		if (result > 0)
			//수정이 된 경우의 처리
			return new ResponseEntity<>("댓글 수정 완료", HttpStatus.OK);
		else
			//수정이 실패했을 경우의 처리(비밀번호가 틀림)
			return new ResponseEntity<>("댓글 수정 실패 : 정보 확인", HttpStatus.NOT_ACCEPTABLE);

	}

	// 4.댓글 삭제 처리 - 글번호, 비밀번호
	@PostMapping("/delete.do") // 비밀번호 때문에 post방식 사용
	public String delete(ReplyDTO dto) {
		service.delete(dto);
		// 자동으로 list로 이동
		return "redirect:list.do";
	}
}
