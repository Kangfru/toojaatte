package com.toojaatte.news.mapper;

import java.util.List;

import com.toojaatte.news.dto.NewsDTO;
import com.toojaatte.news.dto.News_searchDTO;
import com.toojaatte.util.page.PageObject;

public interface NewsMapper {

	public int insert(NewsDTO dto);

	
	public List<NewsDTO> list(PageObject pageObject);
	public int getTotalRow(PageObject pageObject);

	public NewsDTO view(int nno);
	public void increaseHit(int nno);
	
	//인기검색어
	public List<News_searchDTO> mostSearched();
	//많이본뉴스
	public List<NewsDTO> mostViewed();

	//검색시 검색어 저장
	public int saveWord(String word);
	//검색시 검색수 1증가
	public int increaseSearch_cnt(String word);

	



}
