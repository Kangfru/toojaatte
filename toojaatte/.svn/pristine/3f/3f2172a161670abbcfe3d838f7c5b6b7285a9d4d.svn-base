package com.toojaatte.news.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.JsonArray;
import com.toojaatte.news.dto.NewsDTO;
import com.toojaatte.news.dto.News_searchDTO;
import com.toojaatte.news.service.JsonRead;
import com.toojaatte.news.service.NewsService;
import com.toojaatte.stock.dto.MarketIndexDTO;
import com.toojaatte.util.page.PageObject;

//gson라이브러리 다운 필수

@Controller
@RequestMapping("/news")
public class NewsController {

	@Autowired
	private NewsService service;
	
	@GetMapping("/list.do")
	public String list(Model model, PageObject pageObject) throws IOException {

		//검색했다면: 검색어 저장, 검색수 1증가
		String word = pageObject.getWord();
		System.out.println(word+"===========================");
		if(word!=null) {
			service.search(word);
		}
		
		
		List<NewsDTO> mainNewsList = service.list(pageObject);
		model.addAttribute("dto", mainNewsList);
		model.addAttribute("pageObject", pageObject);

		//많이본뉴스
		List<NewsDTO> mostViewed = service.mostViewed();
		//System.out.println(mostViewed);
		model.addAttribute("mostViewed", mostViewed);

		//인기키워드 (삼일동안의 인기키워드 적용)
		List<News_searchDTO> mostSearched = service.mostSearched();
		model.addAttribute("mostSearched", mostSearched);
		
		List<MarketIndexDTO> kospi = JsonRead.kospiJsonRead();
		//리스트의 데이터 갯수만큼 for문돌려서 날짜형식을 String타입의 형식으로 보기좋게 변환.
		for (int i=0; i<kospi.size(); i++) {
			Date date = kospi.get(i).getDate();
			String stringdate = new SimpleDateFormat("yyyy-MM-dd").format(date);
			kospi.get(i).setStringDate(stringdate); 
			//System.out.println(usdkrw.get(i).getStringDate());
		}
		model.addAttribute("kospi", kospi);
		
		//주가지수
		JsonArray stockmainarray = JsonRead.stockMainJsonRead();
		model.addAttribute("stockmain", stockmainarray);
			
		return "news/list";
	}
	
	
	@GetMapping("/view.do")
	public String view(int nno, Model model) {
		NewsDTO dto = service.view(nno);
		dto.setContent(dto.getContent().substring(1, dto.getContent().length()-1));
		model.addAttribute("dto", dto);
		
		List<NewsDTO> mostViewed = service.mostViewed();
		model.addAttribute("mostViewed", mostViewed);
		System.out.println(mostViewed);
		//인기키워드 (삼일동안의 인기키워드 적용)
		List<News_searchDTO> mostSearched = service.mostSearched();
		model.addAttribute("mostSearched", mostSearched);
	
		return "news/view";
	}
}
