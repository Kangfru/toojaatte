package com.toojaatte.news.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.toojaatte.news.dto.NewsDTO;
import com.toojaatte.news.dto.News_searchDTO;
import com.toojaatte.news.mapper.NewsMapper;
import com.toojaatte.util.page.PageObject;

@Service
public class NewsService {

	@Inject
	private NewsMapper mapper;

	public int insert(List<NewsDTO> list) {
		for(int i=0; i<list.size(); i++) {
			mapper.insert(list.get(i));	
			System.out.println("NewsService.insert().list.get(i)"+list.get(i));
		}return 1;
	}

	public List<NewsDTO> list(PageObject pageObject) {
		
		//넘어온 페이지의 첫번쨰글번호, 마지막글번호 만들어서 mapper에 전달
		pageObject.calcuPageInfo();
		//데이터개수셋팅
		pageObject.setTotalRow(mapper.getTotalRow(pageObject));
		
		List<NewsDTO> dto = mapper.list(pageObject);
		return dto;
	}

	//사이드바-많이본 뉴스
	public List<NewsDTO> mostViewed(){
		return mapper.mostViewed();
	}

	public NewsDTO view(int nno) {
		mapper.increaseHit(nno);
		return mapper.view(nno);
	}

	//검색어저장, 검색횟수증가
	public void search(String word) {
		int ifSaved = mapper.saveWord(word);
		int ifIncreased = mapper.increaseSearch_cnt(word);
		System.out.println("NewsServices.search().검색어저장여부: "+ifSaved);
		System.out.println("NewsServices.search().검색횟수1증가여부: "+ifIncreased);				
	}

	//인기검색어
	public List<News_searchDTO> mostSearched() {
		List<News_searchDTO> mostSearched = mapper.mostSearched();
		System.out.println("NewsServices.mostSearched().인기검색어리스트: "+mostSearched);						
		return mostSearched;
	}
	


}
