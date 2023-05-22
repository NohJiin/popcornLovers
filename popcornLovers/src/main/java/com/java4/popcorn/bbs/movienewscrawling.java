package com.java4.popcorn.bbs;

import java.util.ArrayList;

import java.util.List;
import java.util.NoSuchElementException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.springframework.stereotype.Service;

@Service
public class movienewscrawling {
	
	
	private NewslistVO vo7(String url, String img, String headline, String content, String date, String company) {
	    NewslistVO vo = new NewslistVO();
	    vo.setNews_url(url);
	    vo.setNews_img(img);
	    vo.setNews_headline(headline);
	    vo.setNews_content(content);
	    vo.setNews_date(date);
	    vo.setNews_company(company);
	    return vo;
	}
	
	public static final String WEB_DRIVER_ID = "webdriver.chrome.driver"; // 드라이버 ID
	public static final String WEB_DRIVER_PATH = "C:\\Users\\ryk36\\Downloads\\chromedriver_win32\\chromedriver.exe"; // 드라이버 경로
	
	public List<NewslistVO> getnewscrawling(){
		
			List<NewslistVO> nl = new ArrayList<NewslistVO>();
			
		    System.setProperty(WEB_DRIVER_ID, WEB_DRIVER_PATH);
	        // 크롬 브라우저 열기
	        WebDriver driver = new ChromeDriver();

	        // 다음 뉴스 페이지 열기
	        driver.get("https://movie.daum.net/contents/news");
	        
	        try {
	            // item_movienews 리스트 생성
	            List<WebElement> movienewsList = driver.findElements(By.className("item_movienews"));

	            // item_movienews 요소 출력
	            for (WebElement movienews : movienewsList) {
	            	
	            	// url 출력
	                WebElement anchorTag = movienews.findElement(By.tagName("a"));
	                String url = anchorTag.getAttribute("href");
	                System.out.println(url);
	                
	                // img 출력
	                String styleValue = movienews.findElement(By.className("bg_img")).getAttribute("style");
	                Pattern pattern = Pattern.compile("url\\((.*?)\\)");
	                Matcher matcher = pattern.matcher(styleValue);
	                String imageUrl = "";
	                if (matcher.find()) {
	                    imageUrl = matcher.group(1);
	                    imageUrl = imageUrl.replaceAll("\"", "");
	                    System.out.println(imageUrl);
	                }
	                
	                // title 출력
	                WebElement newsTitleSelector = movienews.findElement(By.cssSelector("div.thumb_cont strong.tit_thumb a"));
	                String newsheadline = newsTitleSelector.getText();
	                System.out.println(newsheadline);
	                
	                // content 출력
	                WebElement newsContentSelector = movienews.findElement(By.cssSelector(".thumb_cont > .desc_thumb > a"));
	                String newsContent = newsContentSelector.getText();
	                System.out.println(newsContent);
	                
	                // newsdate 출력
	                WebElement infoThumb = movienews.findElement(By.className("info_thumb"));
	                WebElement span1 = infoThumb.findElement(By.tagName("span"));
	                String newsdate = span1.getText();
	                System.out.println(newsdate);

	                // newscompany 출력
	                WebElement span2 = infoThumb.findElements(By.tagName("span")).get(1);
	                String newscompany = span2.getText();
	                System.out.println(newscompany);
	                
	                
	                NewslistVO vo = vo7(url, imageUrl, newsheadline, newsContent, newsdate, newscompany);
	                nl.add(vo);
	                
					}
		        	
	                
	        } catch (NoSuchElementException e) {
	            System.out.println("요소를 찾을 수 없습니다. " + e.getMessage());
	        } finally {
	            // 크롬 브라우저 닫기
	            driver.quit();
	        }
	        return nl;
	    }
}
