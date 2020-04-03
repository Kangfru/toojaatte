package com.toojaatte.stock.service;

import java.util.List;

import com.toojaatte.stock.dto.PredictionDTO;
import com.toojaatte.stock.dto.StockKRXDTO;

public interface StockService {

	public List<StockKRXDTO> search(String searchData);
	public List<PredictionDTO> prediction();

	
}
