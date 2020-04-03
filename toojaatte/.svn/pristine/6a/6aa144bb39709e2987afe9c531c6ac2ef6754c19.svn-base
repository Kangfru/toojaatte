package com.toojaatte.vm.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.toojaatte.vm.api.CandleStickApi2;
import com.toojaatte.vm.dto.VmDTO;
import com.toojaatte.vm.service.VmService;

@Controller
@RequestMapping("/vm2")
public class Vm2Controller {
	
	@Autowired
	@Qualifier("vc")
	private VmService service;
	
	public static String[] coinName = {"XEM","BZNT","CTXC","WTC",
										"FZZ","XVG","IPX","FLETA",
										"STEEM","NPXS","AION","ZRX",
										"BCD","AE","BSV","IOST","BCH",
										"OMG","BTC",};

	// @RequestParam String code, 
	@GetMapping("/load.do")
	public String load(Model model) {
//		System.out.println("Vm2Controller.view()");
//		model.addAttribute("vmdata",VmAPI());
//		model.addAttribute("cm",coinName);
//		CandleStickApi2.candleAPI(null);
		List<VmDTO> list = CandleStickApi2.candleAPI(null);		
		service.write(list);
		return "vm/view";
	}
	
	@GetMapping("/graph.do")
	public String graph(Model model) {
//		System.out.println("Vm2Controller.graph()");
		List<VmDTO> list = service.list();
		Map<String, String> jsMap = new HashMap<String, String>();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//		System.out.println(list);
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
			jsMap.put(key, "["+str + "]");
			keylist.add(key);
		}
		
//		System.out.println(jsMap);
		model.addAttribute("jsMap",jsMap);
		model.addAttribute("keylist",keylist);
		return "vm/vmgraph";
	}
	
	
	
}