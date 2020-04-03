package com.toojaatte.vm.api;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import com.toojaatte.vm.dto.VmDTO;


public class CandleStickApi2 {
	
	public static String[] coinName = {"XEM","BZNT","CTXC","WTC",
			"FZZ","XVG","IPX","FLETA",
//			"STEEM","NPXS","AION","ZRX",
//			"BCD","AE","BSV","IOST","BCH",
			"OMG","BTC"};
	
	public static String[] conStrs = new String[coinName.length];
	

	public static List<VmDTO> candleAPI(String cname) {
		List<VmDTO> list = new ArrayList<VmDTO>();

		
		
		
		BufferedReader br = null;
		String result = "";
		int index = 0;
		
		try {
			for (String s: coinName) {
				result ="";
				result += s + "##";
				String urlstr = "https://api.bithumb.com/public/candlestick/"+s+"_KRW/24h";
				URL url = new URL(urlstr);
				HttpURLConnection urlconnection = (HttpURLConnection)url.openConnection();
				urlconnection.setRequestMethod("GET");
				br = new BufferedReader(new InputStreamReader(urlconnection.getInputStream(),"UTF-8"));
				String line;
				
				while((line = br.readLine())!=null) {
					result = result + line;
				}
				conStrs[index++] = result;
			}
			
			for(String s : conStrs){
				String cName = s.substring(0, s.indexOf("##"));
				// 앞부분 제거 
				s = s.substring(s.indexOf("[[")+1);
				s = s.replace("]]", "]");
				s = s.replace("[", "");
				String[] datas = s.split("],");
				for (String d : datas) {
					d = d.replace("\"", "");

					VmDTO dto = new VmDTO();
					//코인 이름
					dto.setCName(cName);
					
					String[] items = d.split(",");
					dto.setCTime(new Date(Long.parseLong(items[0])));
					dto.setOpening_p(Double.parseDouble(items[1]));
					dto.setClosing_p(Double.parseDouble(items[2]));
					
					
					list.add(dto);
					
					
				}

			}
			System.out.println("처리처리");
			return list;

		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return null;
		
	
	}
	 
}
