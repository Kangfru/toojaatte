package com.toojaatte.stock.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.toojaatte.stock.service.StockService;

import static com.toojaatte.stock.api.GetStockData.getKrxData;
import static com.toojaatte.stock.api.GetFinancialData.getFinancialData;

@Controller
@RequestMapping("/stock")
public class StockController {

	@Autowired
	@Qualifier("ss")
	private StockService service;
	
	// @RequestParam String code, 
	@GetMapping("/market/data.do")
	public String view(Model model, @RequestParam String code) {
//		Map<String, Object> map = getKrxData(code);
//		String[] stockInfoData = (String[]) map.get("stockInfoData");
//		System.out.println(stockInfoData[0]);
		model.addAttribute("krxData", getKrxData(code));
		model.addAttribute("financialData", getFinancialData(code));
		return "stock/view";
	}
	
	@GetMapping("/index.do")
	public String index() {
		return "stock/index";
		
	}

	@GetMapping("/market/search.do")
	public String search(Model model, @RequestParam String searchData) {
		
		model.addAttribute("result", service.search(searchData));
		
		return "stock/search";
		
	}
	
}
