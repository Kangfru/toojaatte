package com.toojaatte.news.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import com.toojaatte.news.dto.News_repDTO;
import com.toojaatte.news.dto.News_rep_likeDTO;
import com.toojaatte.util.page.PageObject;

public interface NewsCommentMapper {

	public List<News_repDTO> nCommentList(Map<String, Object> map);

	public int getTotalRow(@Param("nno") int nno, PageObject pageObject);

	//★파라메터 여러개 넘길때는 @Param("이름") 지정해줘야 인식.(아니면 ibatis.binding.BindingException 오류)
	public List<News_rep_likeDTO> myLikeList(@Param("nno") int nno, @Param("id") String id);

	public int commentInsert(News_repDTO dto);

	public int commentUpdate(News_repDTO dto);

	public int commentDelete(int rno);
	public int decreaseTotalRep(int rno);
	
	//좋아요한적있는지 확인
	public News_rep_likeDTO ifAlreadyLike(News_rep_likeDTO dto);
	
	//db에서 좋아요/싫어요 삭제
	public int cancelLike(News_rep_likeDTO dto);
	//db에 좋아요0,싫어요1 추가
	public int insertLike(News_rep_likeDTO dto);

	//좋아요, 싫어요 총개수 1 증가, 감소
	public int incTotalLike(News_rep_likeDTO dto); 
	public int incTotalDislike(News_rep_likeDTO dto);
	public int decTotalLike(News_rep_likeDTO dto);
	public int decTotalDislike(News_rep_likeDTO dto);
	

}
