package com.toojaatte.vm.controller;

import static com.toojaatte.vm.api.VmApi.VmAPI;

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
@RequestMapping("/vm")
public class VmController {
	
	@Autowired
	@Qualifier("vc")
	private VmService service;
	
	 public static String[] coinName = {"BTC", "IPX", "BZNT", "XEM", 
						  "FLETA", "CTXC", "FZZ", "WTC", 
						  "OMG", "XVG"};

	@GetMapping("/view.do")
	public String view(Model model) {
		model.addAttribute("cm",coinName);
		model.addAttribute("vmdata",VmAPI());
		
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
		return "vm/view";
	}
	
	@GetMapping("/load.do")
	public String load(Model model) {
		System.out.println("load.do 실행 주ㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜ ㅇ실행됨");
		List<VmDTO> list = CandleStickApi2.candleAPI(null);		
		service.write(list);
		return "vm/view";
	}

}