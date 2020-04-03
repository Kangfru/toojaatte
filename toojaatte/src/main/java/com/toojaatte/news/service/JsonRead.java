package com.toojaatte.news.service;

import java.io.FileReader;
import java.io.IOException;
import java.io.Reader;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import org.springframework.core.io.ClassPathResource;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.toojaatte.news.dto.NewsDTO;
import com.toojaatte.stock.dto.MarketIndexDTO;
import com.toojaatte.stock.dto.StockDTO;

//gson라이브러리 다운 or dependency추가 필수
public class JsonRead {
	
	public static List<NewsDTO> newsJsonRead() throws IOException {
		// 객체생성
		Gson gson = new Gson();
		List<NewsDTO> list = null;
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		Calendar c1 = Calendar.getInstance();
		String today = sdf.format(c1.getTime());
		//다른 컴퓨터에서도 사용할수있도록 절대경로를 찾는다.
		ClassPathResource resource = new ClassPathResource("com/toojaatte/stock/crawlingtest/news"+today+".json");
		Path path = Paths.get(resource.getURI());
		System.out.println(path.toString());
		try (Reader reader = new FileReader(path.toString())) {

			NewsDTO[] array = gson.fromJson(reader, NewsDTO[].class);
			list = Arrays.asList(array);
			System.out.println(reader);
			System.out.println("this is test!!!!!!!!!!!!!!!");
			//System.out.println(list);
			
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		return list;

	}

	
	public static List<MarketIndexDTO> kospiJsonRead() throws IOException {
		
		Gson gson = new Gson();
		List<MarketIndexDTO> list = null;
		ClassPathResource resource = new ClassPathResource("com/toojaatte/stock/crawlingtest/kospi.json");
		Path path = Paths.get(resource.getURI());
		try (Reader reader = new FileReader(path.toString())) {
//			try (Reader reader = new FileReader("C:\\Users\\Admin\\Documents\\GitHub\\Java_Spring\\toojaatte\\toojaatte\\src\\main\\webapp\\upload\\crawlingtest\\kospi.json")) {
			//원하는 데이터: jsonobject 안에 data안에 array로 있음.
			//jsonobject로 받아서 jsonarray 꺼내서 dto에 맞는 array로 바꾸고 list로 바꿔줌
			JsonObject object = gson.fromJson(reader, JsonObject.class);
			JsonArray jsonArray = (JsonArray) object.get("data");
			MarketIndexDTO[] dtoArray = gson.fromJson(jsonArray, MarketIndexDTO[].class);
			list = Arrays.asList(dtoArray);
			
			//그냥 가져올시 날짜 오래된순이기 때문에 최신순으로 재정렬해준다.
			Collections.sort(list, new Datedesc());
			for (MarketIndexDTO item : list) {
				//System.out.println(item.toString());
			}
			//System.out.println("JsonRead.kospiJsonRead(): "+list);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return list;
	}


	public static List<MarketIndexDTO> kospi200JsonRead() throws IOException {
		
		Gson gson = new Gson();
		List<MarketIndexDTO> list = null;
		ClassPathResource resource = new ClassPathResource("com/toojaatte/stock/crawlingtest/kospi200.json");
		Path path = Paths.get(resource.getURI());
		try (Reader reader = new FileReader(path.toString())) {
//			try (Reader reader = new FileReader("C:\\Users\\Admin\\Documents\\GitHub\\Java_Spring\\toojaatte\\toojaatte\\src\\main\\webapp\\upload\\crawlingtest\\kospi200.json")) {
			//원하는 데이터: jsonobject 안에 data안에 array로 있음.
			//jsonobject로 받아서 jsonarray 꺼내서 dto에 맞는 array로 바꾸고 list로 바꿔줌
			JsonObject object = gson.fromJson(reader, JsonObject.class);
			JsonArray jsonArray = (JsonArray) object.get("data");
			MarketIndexDTO[] dtoArray = gson.fromJson(jsonArray, MarketIndexDTO[].class);
			list = Arrays.asList(dtoArray);
			
			//그냥 가져올시 날짜 오래된순이기 때문에 최신순으로 재정렬해준다.
			Collections.sort(list, new Datedesc());
			for (MarketIndexDTO item : list) {
				//System.out.println(item.toString());
			}
			//System.out.println("JsonRead.kospi200JsonRead(): "+list);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return list;
	}


	public static List<MarketIndexDTO> kosdaqJsonRead() throws IOException {
		
		Gson gson = new Gson();
		List<MarketIndexDTO> list = null;
		ClassPathResource resource = new ClassPathResource("com/toojaatte/stock/crawlingtest/kosdaq.json");
		Path path = Paths.get(resource.getURI());
		try (Reader reader = new FileReader(path.toString())) {
//			try (Reader reader = new FileReader("C:\\Users\\Admin\\Documents\\GitHub\\Java_Spring\\toojaatte\\toojaatte\\src\\main\\webapp\\upload\\crawlingtest\\kosdaq.json")) {
			//원하는 데이터: jsonobject 안에 data안에 array로 있음.
			//jsonobject로 받아서 jsonarray 꺼내서 dto에 맞는 array로 바꾸고 list로 바꿔줌
			JsonObject object = gson.fromJson(reader, JsonObject.class);
			JsonArray jsonArray = (JsonArray) object.get("data");
			MarketIndexDTO[] dtoArray = gson.fromJson(jsonArray, MarketIndexDTO[].class);
			list = Arrays.asList(dtoArray);
			
			//그냥 가져올시 날짜 오래된순이기 때문에 최신순으로 재정렬해준다.
			Collections.sort(list, new Datedesc());
			for (MarketIndexDTO item : list) {
				//System.out.println(item.toString());
			}
			//System.out.println("JsonRead.kosdaqJsonRead(): "+list);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return list;
	}


	public static List<MarketIndexDTO> usdkrwJsonRead() throws IOException {
		
		Gson gson = new Gson();
		List<MarketIndexDTO> list = null;
		ClassPathResource resource = new ClassPathResource("com/toojaatte/stock/crawlingtest/usdkrw.json");
		Path path = Paths.get(resource.getURI());
		try (Reader reader = new FileReader(path.toString())) {
		//	try (Reader reader = new FileReader("C:\\Users\\Admin\\Documents\\GitHub\\Java_Spring\\toojaatte\\toojaatte\\src\\main\\webapp\\upload\\crawlingtest\\usdkrw.json")) {
			//원하는 데이터: jsonobject 안에 data안에 array로 있음.
			//jsonobject로 받아서 jsonarray 꺼내서 dto에 맞는 array로 바꾸고 list로 바꿔줌
			JsonObject object = gson.fromJson(reader, JsonObject.class);
			JsonArray jsonArray = (JsonArray) object.get("data");
			MarketIndexDTO[] dtoArray = gson.fromJson(jsonArray, MarketIndexDTO[].class);
			list = Arrays.asList(dtoArray);
			
			//그냥 가져올시 날짜 오래된순이기 때문에 최신순으로 재정렬해준다.
			Collections.sort(list, new Datedesc());
			for (MarketIndexDTO item : list) {
				//System.out.println(item.toString());
			}
			//System.out.println("JsonRead.kosdaqJsonRead(): "+list);
			
			//데이터 형 변환
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		return list;
	}


	public static List<MarketIndexDTO> cnykrwJsonRead() throws IOException {
		
		Gson gson = new Gson();
		List<MarketIndexDTO> list = null;
		ClassPathResource resource = new ClassPathResource("com/toojaatte/stock/crawlingtest/cnykrw.json");
		Path path = Paths.get(resource.getURI());
		try (Reader reader = new FileReader(path.toString())) {
//			try (Reader reader = new FileReader("C:\\Users\\Admin\\Documents\\GitHub\\Java_Spring\\toojaatte\\toojaatte\\src\\main\\webapp\\upload\\crawlingtest\\cnykrw.json")) {
			//원하는 데이터: jsonobject 안에 data안에 array로 있음.
			//jsonobject로 받아서 jsonarray 꺼내서 dto에 맞는 array로 바꾸고 list로 바꿔줌
			JsonObject object = gson.fromJson(reader, JsonObject.class);
			JsonArray jsonArray = (JsonArray) object.get("data");
			MarketIndexDTO[] dtoArray = gson.fromJson(jsonArray, MarketIndexDTO[].class);
			list = Arrays.asList(dtoArray);
			
			//그냥 가져올시 날짜 오래된순이기 때문에 최신순으로 재정렬해준다.
			Collections.sort(list, new Datedesc());
			for (MarketIndexDTO item : list) {
				//System.out.println(item.toString());
			}
			//System.out.println("JsonRead.kosdaqJsonRead(): "+list);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return list;
	}



	public static List<MarketIndexDTO> jpykrwJsonRead() throws IOException {
		
		Gson gson = new Gson();
		List<MarketIndexDTO> list = null;
		ClassPathResource resource = new ClassPathResource("com/toojaatte/stock/crawlingtest/jpykrw.json");
		Path path = Paths.get(resource.getURI());
		try (Reader reader = new FileReader(path.toString())) {
//			try (Reader reader = new FileReader("C:\\Users\\Admin\\Documents\\GitHub\\Java_Spring\\toojaatte\\toojaatte\\src\\main\\webapp\\upload\\crawlingtest\\jpykrw.json")) {
			//원하는 데이터: jsonobject 안에 data안에 array로 있음.
			//jsonobject로 받아서 jsonarray 꺼내서 dto에 맞는 array로 바꾸고 list로 바꿔줌
			JsonObject object = gson.fromJson(reader, JsonObject.class);
			JsonArray jsonArray = (JsonArray) object.get("data");
			MarketIndexDTO[] dtoArray = gson.fromJson(jsonArray, MarketIndexDTO[].class);
			list = Arrays.asList(dtoArray);
			
			//그냥 가져올시 날짜 오래된순이기 때문에 최신순으로 재정렬해준다.
			Collections.sort(list, new Datedesc());
			for (MarketIndexDTO item : list) {
				//System.out.println(item.toString());
			}
			//System.out.println("JsonRead.kosdaqJsonRead(): "+list);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public static JsonArray stockMainJsonRead() throws IOException {
		
		Gson gson = new Gson();
		ClassPathResource resource = new ClassPathResource("com/toojaatte/stock/crawlingtest/stockmain.json");
		Path path = Paths.get(resource.getURI());
		try (Reader reader = new FileReader(path.toString())) {
//			try (Reader reader = new FileReader("C:\\Users\\Admin\\Documents\\GitHub\\Java_Spring\\toojaatte\\toojaatte\\src\\main\\webapp\\upload\\crawlingtest\\jpykrw.json")) {
			//원하는 데이터: jsonobject 안에 data안에 array로 있음.
			//jsonobject로 받아서 jsonarray 꺼내서 dto에 맞는 array로 바꾸고 list로 바꿔줌
			JsonArray jsonArray =  gson.fromJson(reader, JsonArray.class);
			
		return jsonArray;
	}

}
}

	//날짜를 비교해서 재정렬(마켓인덱스용)
	class Datedesc implements Comparator<MarketIndexDTO>{

	@Override
	public int compare(MarketIndexDTO o1, MarketIndexDTO o2) {
		// TODO Auto-generated method stub
		//a.compareTo(b) 의 경우 a가 크다면 1을 반환하고 b가 크다면 -1, 같다면 0을 반환한다.
		return o2.getDate().compareTo(o1.getDate());
	}
	
	//날짜를 비교해서 재정렬(뉴스용)
	class Datedesc2 implements Comparator<StockDTO>{

	@Override
	public int compare(StockDTO o1, StockDTO o2) {
		// TODO Auto-generated method stub
		//a.compareTo(b) 의 경우 a가 크다면 1을 반환하고 b가 크다면 -1, 같다면 0을 반환한다.
		return o2.getDate().compareTo(o1.getDate());
	}
}
}



