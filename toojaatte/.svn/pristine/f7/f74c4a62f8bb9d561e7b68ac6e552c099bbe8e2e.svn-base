package com.toojaatte.stock.api;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.util.HashMap;
import java.util.Map;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Element;
import org.w3c.dom.NamedNodeMap;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;
import org.w3c.dom.Document;

public class GetFinancialData {

	public static Map<String, Object> getFinancialData(String code){
		
		Map<String, Object> financialData = new HashMap<String, Object>();
		
		String getUrl = "http://asp1.krx.co.kr/servlet/krx.asp.XMLJemu?code=" + code;
		String getTime = "";
		
		String balanceSheetDate[]= new String [6];
		String incomeStatementDate[]= new String [6];
		String cashFlowDate[]= new String [6];
		
		String balanceSheetData[][]= new String [10][10];
		String incomeStatementData[][]= new String [6][10];
		String cashFlowData[][]= new String [6][7];
		
		int balanceSheetDataLength = 0;
		int incomeStatementDataLength = 0;
		int cashFlowDataLength = 0;
		
		String line = "";
		
		try{
			URL url = new URL(getUrl);
			URLConnection conn = url.openConnection();
			HttpURLConnection httpConnection = (HttpURLConnection) conn;
			InputStream is = null;
			InputStreamReader isr = null;
			
			is =  new URL(getUrl).openStream();
			isr = new InputStreamReader(is, "UTF-8");
			
			
			
			BufferedReader rd = new BufferedReader(isr,400);
			
			StringBuffer strbuf = new StringBuffer();
			
			
			while ((line = rd.readLine()) != null){
				
			  	strbuf.append(line);
			}
			
			//System.out.println("재무정보");
			//System.out.println(strbuf.toString());
			
			DocumentBuilderFactory docFact = DocumentBuilderFactory.newInstance();
			docFact.setNamespaceAware(true);
			DocumentBuilder docBuild = docFact.newDocumentBuilder();

			Document doc = docBuild.parse(new InputSource(new StringReader(strbuf.toString())));
			doc.getDocumentElement().normalize();
				
			Element root = doc.getDocumentElement();
			
			NodeList financialTotal = doc.getElementsByTagName("financialTotal");
			
			NamedNodeMap stockinfo = financialTotal.item(0).getAttributes();
			getTime = stockinfo.getNamedItem("querytime").getNodeValue();
			
			NodeList TBL_BalanceSheet_ym = doc.getElementsByTagName("TBL_DaeCha");
			NamedNodeMap balanceSheetDateNode = TBL_BalanceSheet_ym.item(0).getAttributes();
			
			balanceSheetDate[0] = balanceSheetDateNode.getNamedItem("year0").getNodeValue();
			balanceSheetDate[1] = balanceSheetDateNode.getNamedItem("month0").getNodeValue();
			balanceSheetDate[2] = balanceSheetDateNode.getNamedItem("year1").getNodeValue();
			balanceSheetDate[3] = balanceSheetDateNode.getNamedItem("month1").getNodeValue();
			balanceSheetDate[4] = balanceSheetDateNode.getNamedItem("year2").getNodeValue();
			balanceSheetDate[5] = balanceSheetDateNode.getNamedItem("month2").getNodeValue();
			
			NodeList TBL_BalanceSheet_data = doc.getElementsByTagName("TBL_DaeCha_data");

			balanceSheetDataLength = TBL_BalanceSheet_data.getLength();
			
			for(int i = 0 ; i < balanceSheetDataLength; i++){
				
				NamedNodeMap balanceSheetDataNode = TBL_BalanceSheet_data.item(i).getAttributes();
				
				balanceSheetData[i][0] = balanceSheetDataNode.getNamedItem("hangMok"+i).getNodeValue();
				balanceSheetData[i][1] = balanceSheetDataNode.getNamedItem("year1Money"+i).getNodeValue();
				balanceSheetData[i][2] = balanceSheetDataNode.getNamedItem("year1GuSungRate"+i).getNodeValue();
				balanceSheetData[i][3] = balanceSheetDataNode.getNamedItem("year1JungGamRate"+i).getNodeValue();
				balanceSheetData[i][4] = balanceSheetDataNode.getNamedItem("year2Money"+i).getNodeValue();
				balanceSheetData[i][5] = balanceSheetDataNode.getNamedItem("year2GuSungRate"+i).getNodeValue();
				balanceSheetData[i][6] = balanceSheetDataNode.getNamedItem("year2JungGamRate"+i).getNodeValue();
				balanceSheetData[i][7] = balanceSheetDataNode.getNamedItem("year3Money"+i).getNodeValue();
				balanceSheetData[i][8] = balanceSheetDataNode.getNamedItem("year3GuSungRate"+i).getNodeValue();
				balanceSheetData[i][9] = balanceSheetDataNode.getNamedItem("year3JungGamRate"+i).getNodeValue();
			}
			
			financialData.put("balanceSheetDataLength", balanceSheetDataLength);
			financialData.put("balanceSheetDate", balanceSheetDate);
			financialData.put("balanceSheetData", balanceSheetData);
			
		
			/*손익계산서*/
			
			NodeList TBL_IncomeStatement_ym = doc.getElementsByTagName("TBL_SonIk");
			NamedNodeMap incomeStatementDateNode = TBL_IncomeStatement_ym.item(0).getAttributes();
			
			incomeStatementDate[0] = incomeStatementDateNode.getNamedItem("year0").getNodeValue();
			incomeStatementDate[1] = incomeStatementDateNode.getNamedItem("month0").getNodeValue();
			incomeStatementDate[2] = incomeStatementDateNode.getNamedItem("year1").getNodeValue();
			incomeStatementDate[3] = incomeStatementDateNode.getNamedItem("month1").getNodeValue();
			incomeStatementDate[4] = incomeStatementDateNode.getNamedItem("year2").getNodeValue();
			incomeStatementDate[5] = incomeStatementDateNode.getNamedItem("month2").getNodeValue();
			
			NodeList TBL_IncomeStatement_data = doc.getElementsByTagName("TBL_SonIk_data");
			
			incomeStatementDataLength = TBL_IncomeStatement_data.getLength();
			
			for(int i = 0; i < incomeStatementDataLength; i++){
				
				NamedNodeMap incomeStatementDataNode = TBL_IncomeStatement_data.item(i).getAttributes();
				
				incomeStatementData[i][0] = incomeStatementDataNode.getNamedItem("hangMok"+i).getNodeValue();
				incomeStatementData[i][1] = incomeStatementDataNode.getNamedItem("year1Money"+i).getNodeValue();
				incomeStatementData[i][2] = incomeStatementDataNode.getNamedItem("year1GuSungRate"+i).getNodeValue();
				incomeStatementData[i][3] = incomeStatementDataNode.getNamedItem("year1JungGamRate"+i).getNodeValue();
				incomeStatementData[i][4] = incomeStatementDataNode.getNamedItem("year2Money"+i).getNodeValue();
				incomeStatementData[i][5] = incomeStatementDataNode.getNamedItem("year2GuSungRate"+i).getNodeValue();
				incomeStatementData[i][6] = incomeStatementDataNode.getNamedItem("year2JungGamRate"+i).getNodeValue();
				incomeStatementData[i][7] = incomeStatementDataNode.getNamedItem("year3Money"+i).getNodeValue();
				incomeStatementData[i][8] = incomeStatementDataNode.getNamedItem("year3GuSungRate"+i).getNodeValue();
				incomeStatementData[i][9] = incomeStatementDataNode.getNamedItem("year3JungGamRate"+i).getNodeValue();
				
			}
			
			financialData.put("incomeStatementDataLength", incomeStatementDataLength);
			financialData.put("incomeStatementDate", incomeStatementDate);
			financialData.put("incomeStatementData", incomeStatementData);
			
			/*현금흐름표*/
			
			NodeList TBL_CashFlow = doc.getElementsByTagName("TBL_CashFlow");
			NamedNodeMap cashFlow_ym = TBL_CashFlow.item(0).getAttributes();
			
			cashFlowDate[0] = cashFlow_ym.getNamedItem("year0").getNodeValue();
			cashFlowDate[1] = cashFlow_ym.getNamedItem("month0").getNodeValue();
			cashFlowDate[2] = cashFlow_ym.getNamedItem("year1").getNodeValue();
			cashFlowDate[3] = cashFlow_ym.getNamedItem("month1").getNodeValue();
			cashFlowDate[4] = cashFlow_ym.getNamedItem("year2").getNodeValue();
			cashFlowDate[5] = cashFlow_ym.getNamedItem("month2").getNodeValue();
			
			NodeList TBL_CashFlow_data = doc.getElementsByTagName("TBL_CashFlow_data");
			
			cashFlowDataLength = TBL_CashFlow_data.getLength();
			
			for(int i = 0; i < cashFlowDataLength; i++){
				
				NamedNodeMap cashFlowDataNode = TBL_CashFlow_data.item(i).getAttributes();
				
				cashFlowData[i][0] = cashFlowDataNode.getNamedItem("hangMok"+i).getNodeValue();
				cashFlowData[i][1] = cashFlowDataNode.getNamedItem("year1Money"+i).getNodeValue();
				cashFlowData[i][2] = cashFlowDataNode.getNamedItem("year1JungGamRate"+i).getNodeValue();
				cashFlowData[i][3] = cashFlowDataNode.getNamedItem("year2Money"+i).getNodeValue();
				cashFlowData[i][4] = cashFlowDataNode.getNamedItem("year2JungGamRate"+i).getNodeValue();
				cashFlowData[i][5] = cashFlowDataNode.getNamedItem("year3Money"+i).getNodeValue();
				cashFlowData[i][6] = cashFlowDataNode.getNamedItem("year3JungGamRate"+i).getNodeValue();
				
			}
			financialData.put("cashFlowDataLength", cashFlowDataLength);
			financialData.put("cashFlowDate", cashFlowDate);
			financialData.put("cashFlowData", cashFlowData);
			
		} catch(Exception e){
			
		}
		return financialData;
	}
}
