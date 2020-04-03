package com.toojaatte.util.scheduler;

import java.io.IOException;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import com.toojaatte.news.dto.NewsDTO;
import com.toojaatte.news.service.JsonRead;
import com.toojaatte.news.service.NewsService;

@Component
public class DBSaveScheduler {
	
	@Autowired
	private NewsService service;
	
	//파이썬에서 네이버뉴스크롤링해서 json으로 저장한 파일을 매일 오후 5시에 불러와서 db에 저장
    @Scheduled(cron = "0 58 17 * * *")
	public void newsInsert() throws IOException {
			System.out.println("this is scheduler");
			System.out.println(new Date());
			List<NewsDTO> dto = JsonRead.newsJsonRead();
			service.insert(dto);	
	}
    
//  @Scheduled(fixedRate = 2000) // 수행 시작 기점, 2초 후 실행 
//  public void fixedRateTest() {
//      System.out.println("fixedRate: 2sec -> " + new Date());
//  }
	
//    @Scheduled(fixedDelay = 7000) // 수행 종료 기점, 7초 후 실행 
//    public void fixedDelayTest() {
//        System.out.println("fixedDelay: 7sec -> " + new Date());
//    }
}
