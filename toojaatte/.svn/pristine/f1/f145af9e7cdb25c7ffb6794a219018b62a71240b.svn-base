package com.toojaatte.util.filter;

import java.io.IOException;
import java.util.HashMap;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

public class ConvertJsonToHashmap {
	public static HashMap<String, Object> convertJsonToObject(String json)
			throws JsonParseException, JsonMappingException, IOException {
		ObjectMapper objectMapper = new ObjectMapper();
		TypeReference<HashMap<String, Object>> typeReference = new TypeReference<HashMap<String, Object>>() {
		};
		HashMap<String, Object> object = objectMapper.readValue(json, typeReference);
		return object;
	}
}
