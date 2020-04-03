package com.toojaatte.util.json;

import java.util.Map;

import org.json.simple.JSONObject;

public class JsonUtil {
  public static JSONObject mapToJson(Map<String, Integer> map) {
	  JSONObject jsonObject = new JSONObject();
	  for(Map.Entry<String, Integer> entry : map.entrySet()) {
		  String key = entry.getKey();
		  Object value = entry.getValue();
		  jsonObject.put(key, value);
	  }
	  return jsonObject;
  }
    
}
