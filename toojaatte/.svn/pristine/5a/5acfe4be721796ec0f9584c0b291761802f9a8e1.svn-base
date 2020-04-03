package com.toojaatte.marketindex.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.toojaatte.news.service.JsonRead;
import com.toojaatte.stock.dto.MarketIndexDTO;

@Controller
@RequestMapping("marketindex")
public class MarketIndexController {

	@GetMapping("/main.do")
	public String index(Model model) throws IOException {
		
		List<MarketIndexDTO> usdkrw = JsonRead.usdkrwJsonRead();
		//리스트의 데이터 갯수만큼 for문돌려서 날짜형식을 String타입의 형식으로 보기좋게 변환.
		for (int i=0; i<usdkrw.size(); i++) {
			Date date = usdkrw.get(i).getDate();
			String stringdate = new SimpleDateFormat("yyyy-MM-dd").format(date);
			usdkrw.get(i).setStringDate(stringdate); 
			//System.out.println(usdkrw.get(i).getStringDate());
		}
		System.out.println(usdkrw);
		//System.out.println("StockMainController.index().usdkrw: "+usdkrw);
		model.addAttribute("usdkrw", usdkrw);
		
		List<MarketIndexDTO> cnykrw = JsonRead.cnykrwJsonRead();
		System.out.println(cnykrw.size());
		for (int i=0; i<cnykrw.size(); i++) {
			Date date = cnykrw.get(i).getDate();
			String stringdate = new SimpleDateFormat("yyyy-MM-dd").format(date);
			cnykrw.get(i).setStringDate(stringdate); 
			//System.out.println(ncomment.get(i).getStringDate());
		}
		//System.out.println("StockMainController.index().cnykrw: "+cnykrw);
		model.addAttribute("cnykrw", cnykrw);

		List<MarketIndexDTO> jpykrw = JsonRead.jpykrwJsonRead();
		for (int i=0; i<jpykrw.size(); i++) {
			Date date = jpykrw.get(i).getDate();
			String stringdate = new SimpleDateFormat("yyyy-MM-dd").format(date);
			jpykrw.get(i).setStringDate(stringdate); 
			//System.out.println(ncomment.get(i).getStringDate());
		}
		//System.out.println("StockMainController.index().jpykrw: "+jpykrw);
		model.addAttribute("jpykrw", jpykrw);
		
		return "/marketindex/main";
	}
}
