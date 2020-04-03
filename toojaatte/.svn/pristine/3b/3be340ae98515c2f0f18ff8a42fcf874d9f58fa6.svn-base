package com.toojaatte.stock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.toojaatte.stock.dto.PredictionDTO;
import com.toojaatte.stock.dto.StockKRXDTO;
import com.toojaatte.stock.mapper.StockMapper;


@Service
@Qualifier("ss")
public class StockServiceImpl implements StockService {

	@Autowired
	private StockMapper mapper;
	
	@Override
	public List<StockKRXDTO> search(String searchData) {
		// TODO Auto-generated method stub
		return mapper.search(searchData);
	}

	@Override
	public List<PredictionDTO> prediction() {
		// TODO Auto-generated method stub
		return mapper.prediction();
	}

}
