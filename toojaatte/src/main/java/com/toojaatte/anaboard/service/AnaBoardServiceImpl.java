package com.toojaatte.anaboard.service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.toojaatte.anaboard.dto.AnaBoardDTO;
import com.toojaatte.anaboard.dto.AnaBoard_FileDTO;
import com.toojaatte.anaboard.mapper.AnaBoardMapper;
import com.toojaatte.rorn.dto.RorNDTO;
import com.toojaatte.util.file.FileUtil;
import com.toojaatte.util.page.PageObject;

import kr.co.shineware.nlp.komoran.constant.DEFAULT_MODEL;
import kr.co.shineware.nlp.komoran.core.Komoran;
import kr.co.shineware.nlp.komoran.model.KomoranResult;
import kr.co.shineware.nlp.komoran.model.Token;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@Qualifier("as") 
@AllArgsConstructor //lombok 라이브러리 기능
public class AnaBoardServiceImpl implements AnaBoardService{
	
	// DB 처리를 위한 mapper 변수 선언
	private AnaBoardMapper mapper;
	
	@Override
	public List<AnaBoardDTO> mainList() {
		return mapper.mainList();
	}

	@Override
	public List<AnaBoardDTO> list(PageObject pageObject) {
		// TODO Auto-generated method stub
		// 페이지 정보 계산 메서드 호출
		pageObject.calcuPageInfo();
		//jsp의 페이지네이션을 위한 계산 -> jsp에 전달이 되어야 한다. request에 담는다(Model).
		//검색할 때에 검색 전 페이지 계산이 된 값이 전달되어 리스트와 다르게 나타나므로
		//getTotalRow에 pageObject를 전달하여 검색될 항목에 대해서만 페이지 계산하게 한다.
		pageObject.setTotalRow(mapper.getTotalRow(pageObject));
		return mapper.list(pageObject);
	}
	
	
	@Override
	public Integer write(AnaBoardDTO dto) {
		// TODO Auto-generated method stub
		return mapper.write(dto);
	}
	
	@Override
	public Integer writeFile(AnaBoard_FileDTO fdto) {
		// TODO Auto-generated method stub
		return mapper.writeFile(fdto);
	}

	@Override
//	@Transactional
	public AnaBoardDTO view(int no) {
		// TODO Auto-generated method stub
		// 조회수 1증가 시킨다.
		mapper.increaseHit(no);
		return mapper.view(no);
	}
	
	@Override
	public AnaBoardDTO countRorN(int no) {
		return mapper.countRorN(no);
	}

	@Override
	public Integer increaseR_cnt(int no) {
		return mapper.increaseR_cnt(no);
	}
	
	@Override
	public Integer decreaseR_cnt(int no) {
		return mapper.decreaseR_cnt(no);
	}
	
	@Override
	public Integer increaseN_cnt(int no) {
		return mapper.increaseN_cnt(no);
	}
	
	@Override
	public Integer decreaseN_cnt(int no) {
		return mapper.decreaseN_cnt(no);
	}
	
	@Override
	public Integer checkRorN(RorNDTO dto) {
//		System.out.println(dto.toString());
		Integer result = mapper.checkRorN(dto);
		if(result==null) {
			result = 0;
//			System.out.println("check: "+dto.toString());
		}
		return result;
	}
	
	@Override
	public Integer startRorN(RorNDTO dto) {
		return mapper.startRorN(dto);
	}
	
	@Override
	public Integer changeRorN(RorNDTO dto) {
		return mapper.changeRorN(dto);
	}
	
	@Override
	public Integer endRorN(RorNDTO dto) {
		return mapper.endRorN(dto);
	}

	@Override
	public Integer update(AnaBoardDTO dto) {
		// TODO Auto-generated method stub
		return mapper.update(dto);
	}
	
	@Override
	public Integer updateFile(AnaBoard_FileDTO fdto) {
		// TODO Auto-generated method stub
		return mapper.updateFile(fdto);
	}

	@Override
	public Integer delete(AnaBoardDTO dto, String uploadPath){
		List<AnaBoard_FileDTO> fileNames = mapper.selectFile(dto.getNo());
		String fileName = null;
//		System.out.println("**********getNo : "+dto.getNo());
//		System.out.println("**********fileNames : "+fileNames);
		
		for(int i=0; i<fileNames.size(); i++) {
//			System.out.println("fileName : "+fileNames.get(i).getFileName());
			fileName = fileNames.get(i).getFileName();
			try {
				FileUtil.deleteFile(uploadPath+fileName);
			}catch (Exception e) {
				System.out.println("삭제하려는 파일이 존재하지 않습니다.");
			}
		}
		mapper.deleteFileAll(dto.getNo());
		return mapper.delete(dto);
	}
	
	@Override
	public List<AnaBoard_FileDTO> selectFile(int no) {
		return mapper.selectFile(no);
	}
	
//	@Override
//	public String selectFileOne(int rno) {
//		System.out.println("selectFileOne");
//		return mapper.selectFileOne(rno);
//	}
	
	@Override
	public Integer deleteFileOne(int rno, String uploadPath) {
//		System.out.println("deleteFileOne : rno : " + rno);
		String fileName = mapper.selectFileOne(rno);
//		System.out.println("deleteFileOne : fileName : "+ fileName);
		try {
			FileUtil.deleteFile(uploadPath+fileName);
		}catch (Exception e) {
			System.out.println("삭제하려는 파일이 존재하지 않습니다.");
		}
//		System.out.println("**********");
		return mapper.deleteFileOne(rno);
	}
	
//	@Override
//	public Integer deleteFileAll(int no) {
//		return mapper.deleteFileAll(no);
//	}
	
	@Override
	public List<AnaBoardDTO> tract(PageObject pageObject) {
		// TODO Auto-generated method stub
		// 페이지 정보 계산 메서드 호출
		pageObject.calcuPageInfo();
		//jsp의 페이지네이션을 위한 계산 -> jsp에 전달이 되어야 한다. request에 담는다(Model).
		//검색할 때에 검색 전 페이지 계산이 된 값이 전달되어 리스트와 다르게 나타나므로
		//getTotalRow에 pageObject를 전달하여 검색될 항목에 대해서만 페이지 계산하게 한다.
		pageObject.setTotalRow(mapper.getTotalRow(pageObject));
		List<AnaBoardDTO> list = mapper.tract(pageObject);
		String contents = "";
		for(int i=0; i<list.size(); i++) {
//			System.out.println(list.get(i));
//			System.out.println("###################");
			contents = list.get(i).getContent();
//			System.out.println("befor=>"+contents);
			contents = contents.replace("\n"," ");
			contents = contents.replace("\r","");
//			contents = contents.replace("다.","다.\n");
//			System.out.println("after=>"+contents);
			list.get(i).setContent(contents);
//			System.out.println(list.get(i).getContent());
//			System.out.println("%%%%%%%%%%%%%%%%%%%");	
		}			
		return list;
	}
	
	@Override
//	public JSONObject tractKomoran(String contents){
//	public Map<String, Integer> tractKomoran(String contents){
	public List tractKomoran(String contents, int minValue){
		Komoran komoran = new Komoran(DEFAULT_MODEL.LIGHT);
        //문장 받아와서 형태소 분석
		KomoranResult analyzeResultList = komoran.analyze(contents+"\r\n");

        List<Token> tokenList = analyzeResultList.getTokenList();
        Map<String, Integer> item = new HashMap<>();
        for (Token token : tokenList) {
        	if(token.getPos().equals("NNG")) {
        		if(token.getMorph().length()>1) {
	        		if(item.get(token.getMorph())==null) {
	        			item.put(token.getMorph(), 1);        		        			
	        		}
	        		else {
	        			item.put(token.getMorph(), item.get(token.getMorph())+1);
	        		}
        		}
//        		System.out.println(item.get(token.getMorph()));
        	}
//            System.out.println(token);
//            System.out.println(token.getPos());
//            System.out.println(token.getMorph()+"/"+token.getPos()+"("+token.getBeginIndex()+","+token.getEndIndex()+")");
//            System.out.println();
          }
        //단어 별 빈도수 체크
		return mapToList(valueSort(item), minValue);
//		return valueSort(item);
//		return JsonUtil.mapToJson(item);
	}

	public Map<String, Integer> valueSort(Map<String, Integer> map){
//		Map<String, Integer> item = new HashMap<>();
		// value 내림차순으로 정렬하고, value가 같으면 key 오름차순으로 정렬
        List<Map.Entry<String, Integer>> list = new LinkedList<>(map.entrySet());
        Collections.sort(list, new Comparator<Map.Entry<String, Integer>>() {
            @Override
            public int compare(Map.Entry<String, Integer> o1, Map.Entry<String, Integer> o2) {
                int comparision = (o1.getValue() - o2.getValue()) * -1;
                return comparision == 0 ? o1.getKey().compareTo(o2.getKey()) : comparision;
            }
        });
     // 순서유지를 위해 LinkedHashMap을 사용
        Map<String, Integer> sortedMap = new LinkedHashMap<>(); 
        for(Iterator<Map.Entry<String, Integer>> iter = list.iterator(); iter.hasNext();){
            Map.Entry<String, Integer> entry = iter.next();
            sortedMap.put(entry.getKey(), entry.getValue());
        }
        return sortedMap;
	}

	public List mapToList(Map<String, Integer> map, int minValue) {
		List lists = new ArrayList();
			for(String key : map.keySet() ) {
				List list = new ArrayList();
				list.add('"'+key+'"');
				list.add(map.get(key));
				if(map.get(key)>minValue) {
					lists.add(list);
				}
			}
		return lists;
	}
}
