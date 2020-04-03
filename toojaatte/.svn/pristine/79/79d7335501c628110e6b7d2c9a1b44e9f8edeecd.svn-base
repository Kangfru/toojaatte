package com.toojaatte.anaboard.mapper;

import java.util.List;

import com.toojaatte.anaboard.dto.AnaBoardDTO;
import com.toojaatte.anaboard.dto.AnaBoard_FileDTO;
import com.toojaatte.rorn.dto.RorNDTO;
import com.toojaatte.util.page.PageObject;

// 같은 서비스여도 DB에서 처리해야하는 서비스들이 있으니 서로 구분지어 생성(AnaBoardMapper.java / AnaBoardService.java) 
// SQL은 resources 안에 패키지에 맞는 폴더를 만들어서 AnaBoardMapper.xml만들고
// 각각의 메서드에 맞는 태그를 작성해준다. 이때 아이디가 메서드이름과 같아야한다.
public interface AnaBoardMapper {

	// 1.리스트 - list()
	public List<AnaBoardDTO> mainList();
	public List<AnaBoardDTO> list(PageObject pageObject);
	public List<AnaBoardDTO> tract(PageObject pageObject);
	public Integer getTotalRow(PageObject pageObject);
	// 2.글쓰기 처리 - write(dto)
	public Integer write(AnaBoardDTO dto);
	//파일 추가
	public Integer writeFile(AnaBoard_FileDTO fdto);
	// 3.글보기 - view(no) / increaseHit(no)
	public AnaBoardDTO view(int no);
	public Integer increaseHit(int no);
	//추천비추천
	public Integer checkRorN(RorNDTO dto);
	public Integer startRorN(RorNDTO dto);
	public Integer changeRorN(RorNDTO dt);
	public Integer endRorN(RorNDTO dt);
	public AnaBoardDTO countRorN(int no);
	public Integer increaseR_cnt(int no);
	public Integer decreaseR_cnt(int no);
	public Integer increaseN_cnt(int no);
	public Integer decreaseN_cnt(int no);
	
	// 4.글수정 처리 - update(dto)
	public Integer update(AnaBoardDTO dto);
	public Integer updateFile(AnaBoard_FileDTO fdto);
	// 5.글삭제 - delete(dto) ==> no와 pw:post 방식
	public Integer delete(AnaBoardDTO dto);
	//파일 삭제
	public List<AnaBoard_FileDTO> selectFile(int no);
	public String selectFileOne(int rno);
	public Integer deleteFileOne(int rno);
	public Integer deleteFileAll(int no);
	
	
}
