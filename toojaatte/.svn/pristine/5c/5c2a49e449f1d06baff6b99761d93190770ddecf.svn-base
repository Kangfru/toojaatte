package com.toojaatte.stock.api;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.net.URL;
import java.text.DecimalFormat;
import java.util.HashMap;
import java.util.Map;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.NamedNodeMap;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;

public class GetStockData {

	public static Map<String, Object> getKrxData(String code){
		
		Map<String, Object> krxData = new HashMap<>();
		
		String getUrl = "http://asp1.krx.co.kr/servlet/krx.asp.XMLSise?code=" + code;
		String getTime="";
		String janggubun = "";
		String DungRakrate_str = "";

		
		int timeconclude_length = 0;
		int dailystock_length = 0;
		int Askprice_length= 0;
		
		int CurJuka = 0;
		int Debi = 0;
		float StandardPrice = 0;
		float DungRakrate = 0;
		
		String line="";
//		String up = "▲";
//		String down = "▼";
//		String bohab = "─";
		
		String stockInfoData[]= new String [17];
		String timeConclude[][] = new String [10][7];
		String dailyStock[][] = new String [10][9];
		String askPrice[][] = new String [5][4];
		String hoga[]= new String [22];
		
		try {
			InputStream is = null;
			InputStreamReader isr = null;
			
			is = new URL(getUrl).openStream();
			isr = new InputStreamReader(is, "UTF-8");
			
			BufferedReader rd = new BufferedReader(isr, 400);
			
			StringBuffer strbuf = new StringBuffer();
			
			while ((line = rd.readLine()) != null){			
			  	strbuf.append(line);
			}
			
			DocumentBuilderFactory docFact = DocumentBuilderFactory.newInstance();
			docFact.setNamespaceAware(true);
			DocumentBuilder docBuild = docFact.newDocumentBuilder();
			
			Document doc = docBuild.parse(new InputSource(new StringReader(strbuf.toString())));
			
			NodeList stockInfoList = doc.getElementsByTagName("stockInfo");
			
			NamedNodeMap stockInfo = stockInfoList.item(0).getAttributes();
			getTime = stockInfo.getNamedItem("myNowTime").getNodeValue();
			janggubun = stockInfo.getNamedItem("myJangGubun").getNodeValue();
			
			krxData.put("getTime", getTime);
			krxData.put("janggubun", janggubun);
			krxData.put("code", code);
			
			NodeList TBL_StockInfo = doc.getElementsByTagName("TBL_StockInfo");
			NamedNodeMap stockInfoTBL = TBL_StockInfo.item(0).getAttributes();
			
			stockInfoData[0] = stockInfoTBL.getNamedItem("JongName").getNodeValue();		//종목명 
			stockInfoData[1] = stockInfoTBL.getNamedItem("CurJuka").getNodeValue();		//현재가 
			stockInfoData[2] = stockInfoTBL.getNamedItem("DungRak").getNodeValue();		//전일대비코드
			stockInfoData[3] = stockInfoTBL.getNamedItem("Debi").getNodeValue();			//전일대비
			stockInfoData[4] = stockInfoTBL.getNamedItem("PrevJuka").getNodeValue();		//전일종가 
			stockInfoData[5] = stockInfoTBL.getNamedItem("Volume").getNodeValue();			//거래량
			stockInfoData[6] = stockInfoTBL.getNamedItem("Money").getNodeValue();			//거래대금  
			stockInfoData[7] = stockInfoTBL.getNamedItem("StartJuka").getNodeValue();		//시가 
			stockInfoData[8] = stockInfoTBL.getNamedItem("HighJuka").getNodeValue();		//고가
			stockInfoData[9] = stockInfoTBL.getNamedItem("LowJuka").getNodeValue();		//저가 		
			stockInfoData[10] = stockInfoTBL.getNamedItem("High52").getNodeValue();		//52주 최고 
			stockInfoData[11] = stockInfoTBL.getNamedItem("Low52").getNodeValue();			//52주 최저  
			stockInfoData[12] = stockInfoTBL.getNamedItem("UpJuka").getNodeValue();		//상한가 
			stockInfoData[13] = stockInfoTBL.getNamedItem("DownJuka").getNodeValue();		//하한가 
			stockInfoData[14] = stockInfoTBL.getNamedItem("Per").getNodeValue();			//PER            
			stockInfoData[15] = stockInfoTBL.getNamedItem("Amount").getNodeValue();		//상장주식수    
			stockInfoData[16] = stockInfoTBL.getNamedItem("FaceJuka").getNodeValue();		//액면가
			
			// 등락율 계산
			CurJuka = Integer.parseInt(stockInfoData[1].replaceAll(",", ""));
			Debi = Integer.parseInt(stockInfoData[3].replaceAll(",", ""));
			
			/*등락구분코드*/
			// 1 - 상한, 2 - 상승, 3 - 보합, 4 - 하한, 5 - 하락
			
			if(stockInfoData[2].equals("1")||stockInfoData[2].equals("2")||stockInfoData[2].equals("3")){
				StandardPrice = CurJuka - Debi;
			} else if(stockInfoData[2].equals("4")||stockInfoData[2].equals("5")){
				StandardPrice = CurJuka + Debi;
			}
			
			// 등락률 = (당일종가 - 기준가) / 기준가 * 100
			// 기준가 = 당일종가(현재가) - 전일대비
			DungRakrate = ((CurJuka - StandardPrice) / StandardPrice) * 100;
			DungRakrate_str = String.format("%.2f", DungRakrate);
			
			krxData.put("stockInfoData", stockInfoData);
			krxData.put("DungRakrate_str", DungRakrate_str);
			
			/*일자별시세*/
			
			NodeList TBL_Dailystock = doc.getElementsByTagName("DailyStock");
			
	 		dailystock_length = TBL_Dailystock.getLength();
			
			for(int j=0;j<dailystock_length;j++){
				
				NamedNodeMap dailyStockTBL = TBL_Dailystock.item(j).getAttributes();
				
				dailyStock[j][0] = dailyStockTBL.getNamedItem("day_Date").getNodeValue();		//일자
				dailyStock[j][1] = dailyStockTBL.getNamedItem("day_EndPrice").getNodeValue();	//종가
				dailyStock[j][2] = dailyStockTBL.getNamedItem("day_getDebi").getNodeValue();	//전일대비
				dailyStock[j][3] = dailyStockTBL.getNamedItem("day_Start").getNodeValue();		//시가
				dailyStock[j][4] = dailyStockTBL.getNamedItem("day_High").getNodeValue();		//고가
				dailyStock[j][5] = dailyStockTBL.getNamedItem("day_Low").getNodeValue();		//저가
				dailyStock[j][6] = dailyStockTBL.getNamedItem("day_Volume").getNodeValue();	//거래량
				dailyStock[j][7] = dailyStockTBL.getNamedItem("day_getAmount").getNodeValue();	//거래대금
				dailyStock[j][8] = dailyStockTBL.getNamedItem("day_Dungrak").getNodeValue();	//전일대비코드
				
			}
			
			krxData.put("dailyStock_length", dailystock_length);
			krxData.put("dailyStock", dailyStock);
			
			/*시간대별 체결가*/
			
			NodeList TBL_TimeConclude = doc.getElementsByTagName("TBL_TimeConclude");
			
			timeconclude_length = TBL_TimeConclude.getLength()-1;
			for(int i=0;i<timeconclude_length;i++){
				
				NamedNodeMap timeConcludeTBL = TBL_TimeConclude.item(i+1).getAttributes();
				
				timeConclude[i][0] = timeConcludeTBL.getNamedItem("time").getNodeValue();		//시간
				timeConclude[i][1] = timeConcludeTBL.getNamedItem("negoprice").getNodeValue();	//체결가
				timeConclude[i][2] = timeConcludeTBL.getNamedItem("Debi").getNodeValue();		//전일대비
				timeConclude[i][3] = timeConcludeTBL.getNamedItem("sellprice").getNodeValue();	//매도호가
				timeConclude[i][4] = timeConcludeTBL.getNamedItem("buyprice").getNodeValue();	//매수호가
				timeConclude[i][5] = timeConcludeTBL.getNamedItem("amount").getNodeValue();	//체결량
				timeConclude[i][6] = timeConcludeTBL.getNamedItem("Dungrak").getNodeValue();	//전일대비코드
			}
			
			krxData.put("timeConclude_length", timeconclude_length);
			krxData.put("timeConclude", timeConclude);
			
			/*증권사별거래*/
			
			NodeList TBL_AskPrice = doc.getElementsByTagName("AskPrice");
			
			Askprice_length = TBL_AskPrice.getLength();
			for(int i=0;i<Askprice_length;i++){
				
				NamedNodeMap askPriceTBL = TBL_AskPrice.item(i).getAttributes();
				
				askPrice[i][0] = askPriceTBL.getNamedItem("member_memdoMem").getNodeValue();	//매도증권사
				askPrice[i][1] = askPriceTBL.getNamedItem("member_memdoVol").getNodeValue();	//매도거래량
				askPrice[i][2] = askPriceTBL.getNamedItem("member_memsoMem").getNodeValue();	//매수증권사
				askPrice[i][3] = askPriceTBL.getNamedItem("member_mesuoVol").getNodeValue();	//매수거래량
			}
			
			krxData.put("askPrice_length", Askprice_length);
			krxData.put("askPrice", askPrice);
			
			/*호가*/
			
			NodeList TBL_Hoga = doc.getElementsByTagName("TBL_Hoga");
			
			NamedNodeMap hogaTBL = TBL_Hoga.item(0).getAttributes();
				
			hoga[0] = hogaTBL.getNamedItem("mesuJan0").getNodeValue();		//매수잔량
			hoga[1] = hogaTBL.getNamedItem("mesuHoka0").getNodeValue();	//매수호가
			hoga[2] = hogaTBL.getNamedItem("mesuJan1").getNodeValue();		//매수잔량
			hoga[3] = hogaTBL.getNamedItem("mesuHoka1").getNodeValue();	//매수호가
			hoga[4] = hogaTBL.getNamedItem("mesuJan2").getNodeValue();		//매수잔량
			hoga[5] = hogaTBL.getNamedItem("mesuHoka2").getNodeValue();	//매수호가
			hoga[6] = hogaTBL.getNamedItem("mesuJan3").getNodeValue();		//매수잔량
			hoga[7] = hogaTBL.getNamedItem("mesuHoka3").getNodeValue();	//매수호가
			hoga[8] = hogaTBL.getNamedItem("mesuJan4").getNodeValue();		//매수잔량
			hoga[9] = hogaTBL.getNamedItem("mesuHoka4").getNodeValue();	//매수호가
			hoga[10] = hogaTBL.getNamedItem("medoHoka0").getNodeValue();	//매도잔량
			hoga[11] = hogaTBL.getNamedItem("medoJan0").getNodeValue();	//매도호가
			hoga[12] = hogaTBL.getNamedItem("medoHoka1").getNodeValue();	//매도잔량
			hoga[13] = hogaTBL.getNamedItem("medoJan1").getNodeValue();	//매도호가
			hoga[14] = hogaTBL.getNamedItem("medoHoka2").getNodeValue();	//매도잔량
			hoga[15] = hogaTBL.getNamedItem("medoJan2").getNodeValue();	//매도호가
			hoga[16] = hogaTBL.getNamedItem("medoHoka3").getNodeValue();	//매도잔량
			hoga[17] = hogaTBL.getNamedItem("medoJan3").getNodeValue();	//매도호가
			hoga[18] = hogaTBL.getNamedItem("medoHoka4").getNodeValue();	//매도잔량
			hoga[19] = hogaTBL.getNamedItem("medoJan4").getNodeValue();	//매도호가	
			
			DecimalFormat formatter = new DecimalFormat("###,###,###");
					
			hoga[20] = formatter.format(
					   Integer.parseInt(hoga[0].replace(",", ""))+
					   Integer.parseInt(hoga[2].replace(",", ""))+
					   Integer.parseInt(hoga[4].replace(",", ""))+
					   Integer.parseInt(hoga[6].replace(",", ""))+
					   Integer.parseInt(hoga[8].replace(",", "")));
			hoga[21] = formatter.format(
					   Integer.parseInt(hoga[11].replace(",", ""))+
					   Integer.parseInt(hoga[13].replace(",", ""))+
					   Integer.parseInt(hoga[15].replace(",", ""))+
					   Integer.parseInt(hoga[17].replace(",", ""))+
					   Integer.parseInt(hoga[19].replace(",", "")));
			
			krxData.put("hoga", hoga);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return krxData;
	
	}
	
}
