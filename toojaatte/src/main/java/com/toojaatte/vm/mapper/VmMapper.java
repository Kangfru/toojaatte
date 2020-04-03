package com.toojaatte.vm.mapper;

import java.util.List;

import com.toojaatte.vm.dto.VmDTO;

// VmMapper인터페이스를 만들면 Mybatis에서 DAO를 만들어 준다. 
// SQL은 resources 안에 폴더 패키지에 맞는 폴더를 만들어서 VmMapper.xml 만들고
// 각각의 메서드에 맞는 태그를 작성해준다. 이때 아이디가 메서드 이름과 같아야 한다. 
public interface VmMapper {
	
	//  1.리스트 - list()
	public List<VmDTO> list();

	// 2.데이터 입력
	public Integer write(VmDTO dto);

	// 예전의 가상화폐 데이터를 지우는 처리 메서드
	public Integer deleteAll();

	
}
