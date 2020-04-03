package com.toojaatte.vm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.toojaatte.util.page.PageObject;
import com.toojaatte.vm.dto.VmDTO;
import com.toojaatte.vm.mapper.VmMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;


//로그를 출력하기 위해서 - 사용 법 log.info()
@Log4j
// 자동생성하기 위해서 - @Controller, @Service, @Repository, @Component,
//				@RestController, @ControllerAdvice, @RestControllerAdvice(예외처리)
@Service
@Qualifier("vc")
// 생성자를 이용해서 private 맴버변수에 DI적용 -> mapper가 적용 
@AllArgsConstructor //->lombok lib, 모든 변수의  생성자를 생성하겠다. 안되면 직접 생성자 생성
//interface를 상속받은 클래스라는 뜻의 Impl. 
public class VmServiceImpl implements VmService{

	// DB처리를 위한 mapper 변수 선언
	private VmMapper mapper;
	
	@Override
	public List<VmDTO> list() {
		
		return mapper.list();
	}

	// 받아온 가상화페를  오라클에 저장하는 처리 메서드 
	@Override
	public Integer write(List<VmDTO> list) {
		// TODO Auto-generated method stub
		// 전체 데이터 지우기
		mapper.deleteAll();
		// 블러온 데이터 입력
		for(VmDTO dto : list)
			mapper.write(dto);
		return 1;
	}


}
