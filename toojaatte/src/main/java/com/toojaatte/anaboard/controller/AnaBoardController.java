package com.toojaatte.anaboard.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.toojaatte.anaboard.dto.AnaBoardDTO;
import com.toojaatte.anaboard.dto.AnaBoard_FileDTO;
import com.toojaatte.anaboard.service.AnaBoardService;
import com.toojaatte.member.dto.LoginDTO;
import com.toojaatte.rorn.dto.RorNDTO;
import com.toojaatte.util.crawler.WebCrawler;
import com.toojaatte.util.file.FileUtil;
import com.toojaatte.util.page.PageObject;

import kr.co.shineware.nlp.komoran.model.Token;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j 
@RequestMapping("/anaboard")
public class AnaBoardController {
	@Autowired
	@Qualifier("as") //BoardService의 @Qualifier("bs")이름과 맞춘다.
	private AnaBoardService service;
	
	private final String MODULE = "anaboard";
	
	//1.게시판 리스트
	@GetMapping("/list.do") //RequestMapping + GetMapping
	public String list(Model model, PageObject pageObject, HttpServletRequest request){
		// 검색에 대한 데이터 셋팅
//		String word = pageObject.getWord();
//		String key = pageObject.getKey();
//		String gradeType = pageObject.getGradeType();
//		String orderType = pageObject.getOrderType();
//		String headerType = pageObject.getHeaderType();
//		System.out.println("*********"+ pageObject.getWord());
//		System.out.println("*********"+ pageObject.getKey());
//		System.out.println("*********"+ pageObject.getGradeType());
//		System.out.println("*********"+ pageObject.getOrderType());
//		System.out.println("*********"+ pageObject.getHeaderType());
		
//		System.out.println(pageObject.toString());
		//DB에서 데이터 가져오기 -> 페이지 계산, JSP에서 표시할 페이지네이션 정보가 계산된다.
		model.addAttribute("list", service.list(pageObject));
		model.addAttribute("pageObject", pageObject);
		return MODULE + "/list";
	}
	
	//2.게시판 글보기
	@GetMapping("/view.do")
	public String view(Model model, int no, HttpSession session, RorNDTO dto) {
		model.addAttribute("dto", service.view(no));
		model.addAttribute("flist", service.selectFile(no));
		model.addAttribute("login", session.getAttribute("login"));
		if (session.getAttribute("login")!=null) {
			dto.setWriter(((LoginDTO)session.getAttribute("login")).getId());
		}
//		dto.setWriter("test");
		dto.setNo(no);
//		System.out.println(dto.toString());
		if(dto.getWriter() != null	&& dto.getWriter() != "") {
			//아이디가 존재할 때 해당 아이디가 체크한 rorn이 있는지 검사->type리턴
//			System.out.println("rorn check if");
//			System.out.println("true:"+dto.toString());
			int result = service.checkRorN(dto);
			//자신이 체크한 값을 넘겨준다.
//			System.out.println("view start : result : rornType : "+result);
			model.addAttribute("rornType", result);
		}else {
//			System.out.println("rorn check else");
			//로그인을 안했을 경우 default 0으로 보낸다.
//			System.out.println("view start : result : rornType : "+0);
			model.addAttribute("rornType", 0);
		}
		return MODULE + "/view";
	}
	
	@PostMapping(value = "/rorn", consumes="application/json",
			produces="application/text; charset=utf8")
	public ResponseEntity<String> clickRorN(@RequestBody RorNDTO dto){
//		System.out.println("Controller:clickRorN");
		//버튼 클릭했을 때 넘어오는 함수
		log.info(dto);
		try {
			//반환 값은 type
			int result = service.checkRorN(dto);
//			System.out.println("result: "+ result);
			String newTypeResult = "0";
			if(result<1) {
				//조회된 기존 값이 없을 경우 생성
				service.startRorN(dto);
				newTypeResult = "1";
				if(dto.getType()==1) {
					service.increaseR_cnt(dto.getNo());
				}else {
					service.increaseN_cnt(dto.getNo());
				}
			}else {
				//조회된 값이 있을 경우 : type이 다를 때 수정
				if(result!=dto.getType()) {
					service.changeRorN(dto);
					newTypeResult = "2";
					if(dto.getType()==1) {
						service.increaseR_cnt(dto.getNo());
						service.decreaseN_cnt(dto.getNo());
					}else {
						service.decreaseR_cnt(dto.getNo());
						service.increaseN_cnt(dto.getNo());
					}
				}else {
				//조회된 값이 있을 경우 : type이 같을 때 삭제
					service.endRorN(dto);
					newTypeResult = "3";
					if(dto.getType()==1) {
						service.decreaseR_cnt(dto.getNo());
					}else {
						service.decreaseN_cnt(dto.getNo());
					}
				}
			}
//			System.out.println(dto.toString());
			AnaBoardDTO adto = service.countRorN(dto.getNo());
//			System.out.println(adto.getR_cnt());
//			System.out.println(adto.getN_cnt());
			newTypeResult += ','+Integer.toString(adto.getR_cnt())+','+Integer.toString(adto.getN_cnt());
//			System.out.println(newTypeResult);
			return new ResponseEntity<>(newTypeResult, HttpStatus.OK);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			return new ResponseEntity<>("실패" + e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	//3-1.게시판 글쓰기폼
	@GetMapping("/write.do")
	public String writeForm(){
		return MODULE + "/write";
	}
	//3-2.게시판 글쓰기 처리
	@PostMapping("/write.do")
	public String write(AnaBoardDTO dto, AnaBoard_FileDTO fdto,
			MultipartFile[] multiFile, HttpSession session,
			HttpServletRequest request)throws Exception {
		if (session.getAttribute("login")!=null) {
			dto.setWriter(((LoginDTO)session.getAttribute("login")).getId());
		}
//		dto.setWriter("test");
//		System.out.println("******* session.getId() : "+dto.getWriter());
		
		File saveFile;
		dto.setMultiFile(multiFile);
//		System.out.println("*******multiFile.length : "+dto.getMultiFile().length);
		String realPath = request.getServletContext().getRealPath("/upload/image/anaboard");
//		System.out.println("realPath : "+ realPath);
		
		service.write(dto);
		
		for(int i=0; i<multiFile.length; i++) {
			//DB에 저장할 파일 이름 셋팅
			saveFile = FileUtil.removeDuplicateFileName(realPath, multiFile[i].getOriginalFilename());
//			System.out.println("***********getNo():"+dto.getNo());
			fdto.setNo(dto.getNo());
			fdto.setFileName("/upload/image/anaboard/" + saveFile.getName());
			fdto.setOri_fileName(multiFile[i].getOriginalFilename());
//			System.out.println("***********setFileName():"+fdto.getFileName());
//			System.out.println("***********setOriFileName():"+fdto.getOri_fileName());
			service.writeFile(fdto);
			multiFile[i].transferTo(saveFile);
		}

		// 자동으로 list로 이동
		return "redirect:list.do";
	}
	//4-1.게시판 글수정폼
	@GetMapping("/update.do")
	public String updateForm(Model model, int no) {
		model.addAttribute("dto", service.view(no));
		model.addAttribute("flist", service.selectFile(no));
		return MODULE + "/update";
	}
	//4-2.게시판 글수정 처리 - 전체 데이터
	@PostMapping("/update.do")
	public String update(AnaBoardDTO dto, AnaBoard_FileDTO fdto, HttpSession session,
			MultipartFile[] multiFile, HttpServletRequest request) throws Exception{
		if (session.getAttribute("login")!=null) {
			dto.setWriter(((LoginDTO)session.getAttribute("login")).getId());
		}
//		dto.setWriter("test");
		//삭제된 첨부파일 지우기
		String[] deleteFileRno = request.getParameter("deleteFileRno").split(",");
		String uploadPath = request.getServletContext().getRealPath("/");
		String realPath = request.getServletContext().getRealPath("/upload/image/anaboard");
//		System.out.println(uploadPath);
//		System.out.println(realPath);
		if(deleteFileRno[0] != null && !deleteFileRno[0].equals("")) {
//			System.out.println("update file if in");
			for(int i=0; i<deleteFileRno.length; i++) {
//				System.out.println("deleteFileRno["+i+"] : ["+deleteFileRno[i]+"]");
//				System.out.println("uploadPath : "+uploadPath);
				//DB에서 지우기
				service.deleteFileOne(Integer.parseInt(deleteFileRno[i]), uploadPath);
//				System.out.println("delete end");
			}
		}
//		System.out.println("update file if out");
		//파일 추가하기
		File saveFile;
		dto.setMultiFile(multiFile);
//		System.out.println("*******multiFile.length : "+dto.getMultiFile().length);
//		System.out.println("realPath : "+ realPath);

		for(int i=0; i<multiFile.length; i++) {
			//DB에 저장할 파일 이름 셋팅
			saveFile = FileUtil.removeDuplicateFileName(realPath, multiFile[i].getOriginalFilename());
//			System.out.println("***********getNo():"+dto.getNo());
			fdto.setNo(dto.getNo());
			fdto.setFileName("/upload/image/anaboard/" + saveFile.getName());
			fdto.setOri_fileName(multiFile[i].getOriginalFilename());
//			System.out.println("***********setFileName():"+fdto.getFileName());
//			System.out.println("***********setOriFileName():"+fdto.getOri_fileName());
			service.updateFile(fdto);
			multiFile[i].transferTo(saveFile);
		}
		int result = service.update(dto);
		if(result > 0)
			// 자동으로 view로 이동
			return "redirect:view.do?no=" + dto.getNo();
		else
			// 오류 보여주는 jsp 페이지로 이동
			return "error/error_pw";
	}
	//5.게시판 글삭제 처리 - 글번호
	@GetMapping("/delete.do")
	public String delete(AnaBoardDTO dto, HttpSession session,
			HttpServletRequest request)throws Exception {
		dto.setNo(Integer.parseInt(request.getParameter("no")));
		if (session.getAttribute("login")!=null) {
			dto.setWriter(((LoginDTO)session.getAttribute("login")).getId());
		}
//		dto.setWriter("test");
//		System.out.println("no : " + dto.getNo());
		String uploadPath = request.getServletContext().getRealPath("/");
//		System.out.println("uploadPath : "+uploadPath);
		service.delete(dto, uploadPath);
//		System.out.println("delete end");
		return "redirect:list.do";
	}
	
	//형태소분석
		@GetMapping("/tract.do") //RequestMapping + GetMapping
		public String tract(Model model, PageObject pageObject, AnaBoardDTO anaBoardDTO){
			// 검색에 대한 데이터 셋팅
			Date startDate = pageObject.getStartDate();
			Date endDate = pageObject.getEndDate();
			Date date = new Date();
			
			if (StringUtils.isEmpty(startDate)) {
				Calendar cal = Calendar.getInstance();
				cal.setTime(date);
				cal.add(cal.DATE, -7);
				pageObject.setStartDate(cal.getTime());
			}
			if(StringUtils.isEmpty(endDate)||(startDate.toString().equals(endDate.toString()))) {
				pageObject.setEndDate(date);
			}
			List<AnaBoardDTO> list = service.tract(pageObject);
//			System.out.println("Komoran start");
			String contents_real_all="";
			String contents_real_master="";
			String contents_fake_all="";
			String contents_fake_master="";
			String contents_etc_all="";
			String contents_etc_master="";
			for(int i=0; i<list.size(); i++) {
//				System.out.println(list.get(i).getTitleType());
				if(list.get(i).getTitleType().contentEquals("1")) {
					contents_real_all += list.get(i).getContent();
					if(list.get(i).getGrade()==8) {
						contents_real_master += list.get(i).getContent();
//						System.out.println(contents_real_master);
					}
				}
				if(list.get(i).getTitleType().contentEquals("2")) {
					contents_fake_all += list.get(i).getContent();
					if(list.get(i).getGrade()==8) {
						contents_fake_master += list.get(i).getContent();
					}
				}
				if(list.get(i).getTitleType().contentEquals("3")) {
					contents_etc_all += list.get(i).getContent();
					if(list.get(i).getGrade()==8) {
						contents_etc_master += list.get(i).getContent();
					}
				}
			}
//			Map<String, Integer> pc_realAll= service.tractKomoran(contents_real_all);
//			Map<String, Integer> pc_realMaster= service.tractKomoran(contents_real_master);
//			Map<String, Integer> pc_fakeAll= service.tractKomoran(contents_fake_all);
//			Map<String, Integer> pc_fakeMaster= service.tractKomoran(contents_fake_master);
//			Map<String, Integer> pc_etcAll= service.tractKomoran(contents_etc_all);
//			Map<String, Integer> pc_etcMaster= service.tractKomoran(contents_etc_master);
			
			List pc_realAll= service.tractKomoran(contents_real_all, 1);
			List pc_realMaster= service.tractKomoran(contents_real_master, 1);
			List pc_fakeAll= service.tractKomoran(contents_fake_all, 1);
			List pc_fakeMaster= service.tractKomoran(contents_fake_master, 1);
			List pc_etcAll= service.tractKomoran(contents_etc_all, 1);
			List pc_etcMaster= service.tractKomoran(contents_etc_master, 1);
//			JSONObject pc_realAll= service.tractKomoran(contents_real_all);
//			JSONObject pc_realMaster= service.tractKomoran(contents_real_master);
//			JSONObject pc_fakeAll= service.tractKomoran(contents_fake_all);
//			JSONObject pc_fakeMaster= service.tractKomoran(contents_fake_master);
//			JSONObject pc_etcAll= service.tractKomoran(contents_etc_all);
//			JSONObject pc_etcMaster= service.tractKomoran(contents_etc_master);
			
//			System.out.println("Komoran end");
			

//			System.out.println(pageObject.toString());
//			//DB에서 데이터 가져오기 -> 페이지 계산, JSP에서 표시할 페이지네이션 정보가 계산된다.
//			model.addAttribute("list", service.tract(pageObject));
//			model.addAttribute("pageObject", pageObject);
			model.addAttribute("ra", pc_realAll);
			model.addAttribute("rm", pc_realMaster);
			model.addAttribute("fa", pc_fakeAll);
			model.addAttribute("fm", pc_fakeMaster);
			model.addAttribute("ea", pc_etcAll);
			model.addAttribute("em", pc_etcMaster);
//			System.out.println(pc_etcAll);
			return MODULE + "/tract";
		}
}
