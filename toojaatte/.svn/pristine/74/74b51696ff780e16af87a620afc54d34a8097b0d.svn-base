package com.toojaatte.news.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.inject.Inject;
import org.springframework.stereotype.Service;
import com.toojaatte.news.dto.News_repDTO;
import com.toojaatte.news.dto.News_rep_likeDTO;
import com.toojaatte.news.mapper.NewsCommentMapper;
import com.toojaatte.util.page.PageObject;

@Service
public class NewsCommentService {

	@Inject
	private NewsCommentMapper mapper;
	
	public List<News_repDTO> nCommentList(int nno, PageObject pageObject) {
		
		//넘어온 페이지의 첫번쨰글번호, 마지막글번호 만들어서 mapper에 전달
		pageObject.calcuPageInfo();
		
		// 전체 데이터의 갯수 구해서 전체 페이지 구하기.
		pageObject.setTotalRow(mapper.getTotalRow(nno, pageObject));
		
		//mapper에 맵으로 넘기기
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("nno", nno);
		map.put("pageObject", pageObject);
		List<News_repDTO> dto = mapper.nCommentList(map);
		
		return dto;
	}

	//내가 좋아한 댓글들
	public Object myLikeList(int nno, String id) {

		List<News_rep_likeDTO> dto = mapper.myLikeList(nno, id);
		return dto;
	}

	public int commentInsert(News_repDTO dto) {
		return mapper.commentInsert(dto);
	}

	public int commentUpdate(News_repDTO dto) {
		// TODO Auto-generated method stub
		return mapper.commentUpdate(dto);
	}

	public int commentDelete(int rno) {
		// TODO Auto-generated method stub
		return mapper.commentDelete(rno);
	}

		//좋아요,싫어요버튼클릭시:
		private int result = 0; // 이미좋아요시 2, 이미싫어요 3, 좋아요/싫어요 적용 성공1 넘길 예정
		// 넘어오는값: 좋아요버튼 클릭시likedislike=0, 싫어요 버튼 클릭시likedislike=1
		public int ifLike(News_rep_likeDTO dto, int likeDislike) throws Exception{
			// ifAlready: 이미 좋아요 0 이미싫어요 1 기록없음 null---> int로하면 null 처리 못해서 오류발생.★
			int ifAlready = -1; //null로 기본셋팅
			News_rep_likeDTO alreadydto = mapper.ifAlreadyLike(dto);
			if (alreadydto!=null) {
				ifAlready = alreadydto.getLikeDislike(); //0이나 1이 담김
			}
			System.out.println("alreadydto:"+alreadydto);
			System.out.println("ifAlready:"+ifAlready);

			if (likeDislike == 0) {// 좋아요클릭시
				if (ifAlready == 0) {// 이미좋아요
					mapper.cancelLike(dto); // db에서 좋아요 삭제
					mapper.decTotalLike(dto); //좋아요 총개수-1
					result = 2;
				} else if (ifAlready == 1) {// 이미싫어요
					result = 3;
				} else if (ifAlready == -1){// 기록없음
					dto.setLikeDislike(0); // 좋아요추가
					mapper.incTotalLike(dto);//좋아요 총개수 +1
					result = mapper.insertLike(dto); // 좋아요(0) 추가. return 1
				}

			} else {// 싫어요 클릭시
				if (ifAlready == 0) {// 이미좋아요
					result = 2;
				} else if (ifAlready == 1) {// 이미싫어요
					mapper.cancelLike(dto); // db에서 싫어요 삭제
					mapper.decTotalDislike(dto); //싫어요 총개수-1				
					result = 3;
				} else if (ifAlready == -1) {// 기록없음
					dto.setLikeDislike(1); // 싫어요추가
					mapper.incTotalDislike(dto);//싫어요 총개수 +1
					result = mapper.insertLike(dto); // 싫어요 추가(1). return 1
				}
			}
			return result;
		}

}
