package com.toojaatte.main;

import static com.toojaatte.vm.api.VmApi.VmAPI;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.toojaatte.anaboard.service.AnaBoardService;
import com.toojaatte.anaboard.service.AnaBoardServiceImpl;
import com.toojaatte.news.dto.NewsDTO;
import com.toojaatte.news.service.JsonRead;
import com.toojaatte.news.service.NewsService;
import com.toojaatte.stock.dto.MarketIndexDTO;
import com.toojaatte.stock.service.StockService;
import com.toojaatte.util.page.PageObject;
import com.toojaatte.vm.dto.VmDTO;
import com.toojaatte.vm.service.VmService;
import com.toojaatte.vm.service.VmServiceImpl;

import lombok.AllArgsConstructor;

/**
 * Handles requests for the application home page.
 */
@Controller
@AllArgsConstructor
public class HomeController {
	
	
	private VmServiceImpl service;
	
	 public static String[] coinName = {"BTC", "IPX"};
	
	
	private NewsService newsService;
	
	private AnaBoardServiceImpl anaBoardService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String main() {
		return "redirect:/main/index.do";
	}
	
	/**
	 * Simply selects the home view to render by returning its name.
	 * @throws IOException 
	 */
	@RequestMapping(value = "/main/index.do", method = RequestMethod.GET)
	public String home(Locale locale, Model model) throws IOException {
		//logger.info("Welcome home! The client locale is {}.", locale);
		// mostViewed List
		List<NewsDTO> mostViewed = newsService.mostViewed();
		model.addAttribute("mostViewed", mostViewed);
		
		List<MarketIndexDTO> kospi = JsonRead.kospiJsonRead();
		//리스트의 데이터 갯수만큼 for문돌려서 날짜형식을 String타입의 형식으로 보기좋게 변환.
		for (int i=0; i<kospi.size(); i++) {
			Date date = kospi.get(i).getDate();
			String stringdate = new SimpleDateFormat("yyyy-MM-dd").format(date);
			kospi.get(i).setStringDate(stringdate); 
		}
		model.addAttribute("kospi", kospi);
		
		List<MarketIndexDTO> kosdaq = JsonRead.kosdaqJsonRead();
		//리스트의 데이터 갯수만큼 for문돌려서 날짜형식을 String타입의 형식으로 보기좋게 변환.
		for (int i=0; i<kosdaq.size(); i++) {
			Date date = kosdaq.get(i).getDate();
			String stringdate = new SimpleDateFormat("yyyy-MM-dd").format(date);
			kospi.get(i).setStringDate(stringdate); 
			//System.out.println(usdkrw.get(i).getStringDate());
		}
		model.addAttribute("kosdaq", kosdaq);
		
		List<MarketIndexDTO> usdkrw = JsonRead.usdkrwJsonRead();
		//리스트의 데이터 갯수만큼 for문돌려서 날짜형식을 String타입의 형식으로 보기좋게 변환.
		for (int i=0; i<usdkrw.size(); i++) {
			Date date = usdkrw.get(i).getDate();
			String stringdate = new SimpleDateFormat("yyyy-MM-dd").format(date);
			usdkrw.get(i).setStringDate(stringdate); 
		}
		model.addAttribute("usdkrw", usdkrw);
		
		List<MarketIndexDTO> jpykrw = JsonRead.jpykrwJsonRead();
		for (int i=0; i<jpykrw.size(); i++) {
			Date date = jpykrw.get(i).getDate();
			String stringdate = new SimpleDateFormat("yyyy-MM-dd").format(date);
			jpykrw.get(i).setStringDate(stringdate); 
		}
		model.addAttribute("jpykrw", jpykrw);
		PageObject pageObject = new PageObject();
		String gradeType = pageObject.getGradeType();
		String orderType = pageObject.getOrderType();
		String headerType = pageObject.getHeaderType();
		model.addAttribute("anaBoardList", anaBoardService.mainList());
		model.addAttribute("pageObject", pageObject);
		
		model.addAttribute("cm",coinName);
		
		
		List<VmDTO> list = service.list();
		Map<String, String> jsMap = new HashMap<String, String>();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		for(VmDTO dto : list) {
			String key = dto.getCName();
			String str = "";
			if(jsMap.get(key) == null) {
				str = "['날짜', '시가', '종가'],";
			}else {
				str = jsMap.get(key);
			}
			str += "['" + sdf.format(dto.getCTime())+"',"+dto.getOpening_p()+","+dto.getClosing_p()+"],";
			jsMap.put(key, str);
		}
		
		// 마지막 콤마 제거
		Iterator<String> keys = jsMap.keySet().iterator();
		
		List<String> keylist = new ArrayList<String>();
		
		
		while(keys.hasNext()) {
			String key = keys.next();
			String str = jsMap.get(key);
			str = str.substring(0, str.length()-1);
			jsMap.put(key, "["+ str + "]");
			keylist.add(key);
		}
//		System.out.println("%%%%%%%"+keylist);
		model.addAttribute("jsMap",jsMap);
		model.addAttribute("keylist",keylist);
		
		
		return "main/index";
	}
	
}
