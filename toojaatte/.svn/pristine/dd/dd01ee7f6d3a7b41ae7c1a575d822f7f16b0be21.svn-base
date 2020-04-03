package com.toojaatte.news.controller;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.toojaatte.news.dto.News_repDTO;
import com.toojaatte.news.dto.News_rep_likeDTO;
import com.toojaatte.news.service.NewsCommentService;
import com.toojaatte.util.filter.ConvertJsonToHashmap;
import com.toojaatte.util.page.PageObject;

@Controller
@RequestMapping("/ncomment")
public class NewsCommentController {

	@Inject
	NewsCommentService ncService;
	
	@RequestMapping("/list.do")
	@ResponseBody
	public Map<String, Object> nCommentList (int nno, String id, Model model, PageObject pageObject) throws Exception{
		System.out.println("NewsCommentController.nCommentList().id: " + id);
		System.out.println("NewsCommentController.nCommentList().nno: " + nno);
		Map<String, Object> map = new HashMap<String, Object>();
		
		//댓글리스트
		map.put("nclist", ncService.nCommentList(nno, pageObject));
		
		//로그인시에만 내가 댓글에 좋아요/싫어요한 여부 가져오기
		if (id!=null) {
			map.put("nclikelist", ncService.myLikeList(nno, id));
		}
		System.out.println("NewsCommentController.nCommentList().map: " + map);
		return map;
	}

	@RequestMapping("/insert.do")
	@ResponseBody
	public int nCommentInsert(News_repDTO dto) throws Exception {
		System.out.println("newsCommentController.insertAComment().넘어오는값:" + dto);
		return ncService.commentInsert(dto);
	}

	@RequestMapping("/update.do") // 댓글 수정
	@ResponseBody
	public int bCommentUpdate(News_repDTO dto) throws Exception {
		return ncService.commentUpdate(dto);
	}

	@RequestMapping("/delete/{rno}.do") // 댓글 삭제
	@ResponseBody
	// @pathvariable: bcoment/delete/댓글번호.do 주소에 있는 변수(댓글번호) 받는것. 이름 같으면 맵핑된다.
	public int bCommentDelete(@PathVariable int rno) throws Exception {
		return ncService.commentDelete(rno);
	}
	
	// 좋아요싫어요버튼클릭시
	// 넘어오는값: 좋아요버튼 클릭시likedislike=0, 싫어요 버튼 클릭시likedislike=1
	// 리턴값: 좋아요나싫어요 추가 성공시 1, 이미좋아요 2, 이미싫어요 3리턴
	@RequestMapping(value = "/increaselike.do", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	//json으로 받는거 맵핑시키려면 콘트롤러에서는 @requestyBody써줘야하고 뷰에서는 contenttype:application/json으로 하고 data는 JSON.stringify()로 문자열화해야 한다.
	public int like(@RequestBody String json) throws Exception {

		//json을 hashmap으로 변환
        Map<String, Object> map = ConvertJsonToHashmap.convertJsonToObject(json);
        
        System.out.println("NewsCommentController.like().map: "+map);
        
        News_rep_likeDTO dto = new News_rep_likeDTO();
		dto.setId(map.get("id").toString());
		dto.setNno(Integer.parseInt(map.get("nno").toString()));
		dto.setRno(Integer.parseInt(map.get("rno").toString()));
		
		//좋아요버튼 클릭시likedislike=0, 싫어요 버튼 클릭시likedislike=1
		//-> service에서 이미 좋아요/싫어요 한 적 있는지 판단한 뒤에 dto에 담는다.
		int likeDislike = Integer.parseInt(map.get("likeDislike").toString());
	
		System.out.println("NewsCommentController.like().dto: "+dto);
		System.out.println("NewsCommentController.like().likeDislike: "+likeDislike);
		return ncService.ifLike(dto, likeDislike); //좋아요나싫어요 추가 성공시 1, 이미좋아요 2, 이미싫어요 3리턴
	}
}
