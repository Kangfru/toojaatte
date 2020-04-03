package com.toojaatte.vm.api;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;


public class VmApi {
	
	public static Map<String, Map> VmAPI() {
		
		Map<String, Map> coinMap = new HashMap<>();
		String opening_p;
		String closing_p;
		String max_p; 
		String min_p;
      
		
		BufferedReader br = null;
		String result = "";
		
		try {
			
			String urlstr = "https://api.bithumb.com/public/ticker/ALL_KRW";
			
			URL url = new URL(urlstr);
			
			HttpURLConnection urlconnection = (HttpURLConnection)url.openConnection();
			urlconnection.setRequestMethod("GET");
			br = new BufferedReader(new InputStreamReader(urlconnection.getInputStream(),"UTF-8"));
			String line;
			
			while((line = br.readLine())!=null) {
				result = result + line;	
			}
            
			JSONParser jsonParser = new JSONParser();
            
            //JSON데이터를 넣어 JSON Object 로 만들어 준다.
            JSONObject jsonObject = (JSONObject) jsonParser.parse(result);
            	  
           
            
            JSONObject data = (JSONObject) jsonObject.get("data");
            Iterator<String> a = data.keySet().iterator();
            
            
          
            
            String[] content = {"opening_price","closing_price",
            					"max_price","min_price"};
         
         
            
            while (a.hasNext()) {
            	Map<String, String> itemMap = new HashMap<>();
            	String coinName = a.next();
	            JSONObject coins = (JSONObject) data.get(coinName);
	            	
	            		opening_p = (String) coins.get("opening_price");
	            		closing_p = (String) coins.get("closing_price");
	            		max_p = (String) coins.get("max_price");
	            		min_p = (String) coins.get("min_price");
	            		
	            		itemMap.put("opening_p", opening_p);
	            		itemMap.put("closing_p", closing_p);
	            		itemMap.put("max_p", max_p);
	            		itemMap.put("min_p", min_p);
	            		coinMap.put(coinName, itemMap);
	            		

            		}
            		
			
					}catch(Exception e) {
						System.out.println(e.getMessage());
					}
				
					return coinMap;
				}
				 
			}
