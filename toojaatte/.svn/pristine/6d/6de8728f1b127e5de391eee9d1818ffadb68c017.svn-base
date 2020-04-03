package com.toojaatte.reply.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.toojaatte.reply.dto.ReplyDTO;
import com.toojaatte.reply.mapper.ReplyMapper;
import com.toojaatte.util.page.PageObject;

import lombok.AllArgsConstructor;

//ReplyController - ReplyServerImpl - ReplyMapper

// 자동생성 - @Controller, @Service, @Repository, @Component, 
//      @RestController, @ControllerAdvice, @RestControllerAdvice
@Service
//동일타입의 빈(1.동일한 클래스를 이용하여 설정파일에 여러개의 빈을 설정한 경우,
//2.동일 클래스나 인터페이스를 상속한 경우에 그 부모형으로 빈을 검색하는 경우)
//이 다수개인경우에는 @Qualifier 속성을 이용해서 빈을 검색해야 한다.(https://micropilot.tistory.com/2620)
@Qualifier("rs") 
// 생성자를 이용해서 private 멤버 변수에 DI 적용 -> mapper가 적용
@AllArgsConstructor //lombok 라이브러리 기능
// interface를 상속받은 클래스라는 뜻의 Impl
public class ReplyServiceImpl implements ReplyService{
	
	// DB 처리를 위한 mapper 변수 선언
	private ReplyMapper mapper;

	@Override
	public List<ReplyDTO> list(PageObject pageObject, int no) {
		// TODO Auto-generated method stub
		// 페이지 정보 계산 메서드 호출
		pageObject.calcuPageInfo();
		//jsp의 페이지네이션을 위한 계산 -> jsp에 전달이 되어야 한다. request에 담는다(Model).
		//검색할 때에 검색 전 페이지 계산이 된 값이 전달되어 리스트와 다르게 나타나므로
		//getTotalRow에 pageObject를 전달하여 검색될 항목에 대해서만 페이지 계산하게 한다.
		pageObject.setTotalRow(mapper.getTotalRow());
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pageObject", pageObject);
		map.put("no", no);
		return mapper.list(map);
	}

	@Override
	public Integer write(ReplyDTO dto) {
		// TODO Auto-generated method stub
		return mapper.write(dto);
	}

	@Override
	public Integer update(ReplyDTO dto) {
		// TODO Auto-generated method stub
		return mapper.update(dto);
	}

	@Override
	public Integer delete(ReplyDTO dto) {
		// TODO Auto-generated method stub
		return mapper.delete(dto);
	}

}
