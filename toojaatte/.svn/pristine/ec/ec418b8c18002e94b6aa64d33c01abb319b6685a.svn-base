package com.toojaatte.stock.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.JsonArray;
import com.toojaatte.news.dto.NewsDTO;
import com.toojaatte.news.service.JsonRead;
import com.toojaatte.news.service.NewsService;
import com.toojaatte.stock.dto.MarketIndexDTO;

@Controller
@RequestMapping("stockmain")
public class StockMainController {

	@Autowired
	private NewsService newsService;
	
	@GetMapping("/index.do")
	public String index(Model model) throws IOException {
		
		List<MarketIndexDTO> kospi = JsonRead.kospiJsonRead();
		//리스트의 데이터 갯수만큼 for문돌려서 날짜형식을 String타입의 형식으로 보기좋게 변환.
		for (int i=0; i<kospi.size(); i++) {
			Date date = kospi.get(i).getDate();
			String stringdate = new SimpleDateFormat("yyyy-MM-dd").format(date);
			kospi.get(i).setStringDate(stringdate); 
			//System.out.println(usdkrw.get(i).getStringDate());
		}
		System.out.println("StockMainController.index().kospi: "+kospi);
		model.addAttribute("kospi", kospi);
		
		
		List<MarketIndexDTO> kospi200 = JsonRead.kospi200JsonRead();
		//리스트의 데이터 갯수만큼 for문돌려서 날짜형식을 String타입의 형식으로 보기좋게 변환.
		for (int i=0; i<kospi200.size(); i++) {
			Date date = kospi200.get(i).getDate();
			String stringdate = new SimpleDateFormat("yyyy-MM-dd").format(date);
			kospi.get(i).setStringDate(stringdate); 
			//System.out.println(usdkrw.get(i).getStringDate());
		}
		System.out.println("StockMainController.index(): "+kospi200);
		model.addAttribute("kospi200", kospi200);

		
		List<MarketIndexDTO> kosdaq = JsonRead.kosdaqJsonRead();
		//리스트의 데이터 갯수만큼 for문돌려서 날짜형식을 String타입의 형식으로 보기좋게 변환.
		for (int i=0; i<kosdaq.size(); i++) {
			Date date = kosdaq.get(i).getDate();
			String stringdate = new SimpleDateFormat("yyyy-MM-dd").format(date);
			kospi.get(i).setStringDate(stringdate); 
			//System.out.println(usdkrw.get(i).getStringDate());
		}
		System.out.println("StockMainController.index()kosdaq: "+kosdaq);
		model.addAttribute("kosdaq", kosdaq);
		
		
		//많이본뉴스
		List<NewsDTO> mostViewed = newsService.mostViewed();
		//System.out.println(mostViewed);
		model.addAttribute("mostViewed", mostViewed);
		
		
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
		
		
		//주가지수
		JsonArray stockmainarray = JsonRead.stockMainJsonRead();
		model.addAttribute("stockmain", stockmainarray);
	
		return "/stock/main";
		
		
	}
	
	
}
