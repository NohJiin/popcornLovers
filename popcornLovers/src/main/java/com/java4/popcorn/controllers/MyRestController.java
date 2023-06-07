package com.java4.popcorn.controllers;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.java4.popcorn.MyServices;
import com.java4.popcorn.SharePropertiesStore;
import com.java4.popcorn.controllers.page.JsonClass_MovieDetail;
import com.java4.popcorn.controllers.page.JsonClass_MoviePercentDetail;
import com.java4.popcorn.controllers.page.JsonClass_ScreenPercentage;
import com.java4.popcorn.controllers.page.JsonClass_index;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.text.SimpleDateFormat;
import java.util.*;

//여기 있는 메소드들의 return값은 기본적으로 json 스트링으로 하자
@RestController
public class MyRestController {
    @Autowired
    MyServices myServices;
    @Autowired
    SharePropertiesStore store;

    ObjectMapper om = new ObjectMapper();

    @RequestMapping(value = "/test", produces = "text/html;charset=UTF-8")
    public String test(@RequestParam String date1, @RequestParam String date2,
                       @RequestParam String theater_Id, @RequestParam String movie_Id){
        List<String> list = store.betweenTwoDate(date1, date2);
        StringBuilder sb = new StringBuilder();
        for(String date : list) {
            Double d = myServices.getScreenPercentage(theater_Id, movie_Id, date);
            sb.append(date).append(" : ").append(d).append("<br>");
        }
        return sb.toString();
    }

    @RequestMapping(value = "/index_calcDistance", produces = "text/html;charset=UTF-8")
    public String indexJson(@RequestParam Double latitude,
                            @RequestParam Double longitude){
        try {
            JsonClass_index jsIndex = new JsonClass_index();
            jsIndex.setTheaters(new ArrayList<>());
            jsIndex.setTheatersName(new ArrayList<>());
            jsIndex.setDistances(new ArrayList<>());

            //modelMap은 거리 오름차순으로 정렬됨
            //key : theaterId, value : distance
            Map<String, Double> modelMap = myServices.calcDistance(latitude, longitude);

            //theater 리스트에 첫 3개를 넣는다
            Iterator<Map.Entry<String, Double>> iterator = modelMap.entrySet().iterator();
            for (int i = 0; i < 3 && iterator.hasNext(); i++) {
                Map.Entry<String, Double> entry = iterator.next();
                jsIndex.getTheaters().add(entry.getKey());
                jsIndex.getDistances().add(entry.getValue());
                jsIndex.getTheatersName().add(myServices.getTheaterMap().get(entry.getKey()).getTheater_name());
            }

            return om.writeValueAsString(jsIndex);
        }catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }


    //해당 극장에서
    //상영하는 영화 정보를 모두 불러오고
    //그걸 json으로 만들어서 보내주자
    @RequestMapping(value = "/calcScreenPercentages", produces = "text/html;charset=UTF-8")
    public String calcScreenPercentages(@RequestParam String theater_Id, @RequestParam(required = false) String targetDate) throws JsonProcessingException {
        ObjectMapper om = new ObjectMapper();
        if(theater_Id.length()>4) theater_Id = theater_Id.substring(0,4);
        if(targetDate == null) targetDate = new SimpleDateFormat("yyyyMMdd").format(new Date());
        return om.writeValueAsString(myServices.calcScreenPercentages(theater_Id, targetDate));
    }

    @RequestMapping(value = "/calcOrderedPercentages", produces = "text/html;charset=UTF-8")
    public String calcScreenStatusPercentages(@RequestParam String theater_Id, @RequestParam(required = false) String targetDate) throws JsonProcessingException {
        if(targetDate == null) targetDate = new SimpleDateFormat("yyyyMMdd").format(new Date());
        if(theater_Id.length()>4) theater_Id = theater_Id.substring(0,4);
        JsonClass_ScreenPercentage result = myServices.calcScreenPercentages(theater_Id, targetDate);

        Map<String, Double> map = result.getScreensPercentageMap();
        Map<String, Double> map2 = new LinkedHashMap<>();
        Set<Map.Entry<String, Double>> set = map.entrySet();
        List<Map.Entry<String, Double>> list = new ArrayList<>(set);

        list.sort((o1, o2) -> o2.getValue().compareTo(o1.getValue()));

        result.setOrder(new ArrayList<>());

        for(Map.Entry<String, Double> e : list){
            map2.put(e.getKey(), e.getValue());
            result.getOrder().add(e.getKey());
        }
        result.setScreensPercentageMap(map2);

        ObjectMapper om = new ObjectMapper();
        return om.writeValueAsString(result);
    }

    @RequestMapping(value = "/getMovieInfos", produces = "text/html;charset=UTF-8")
    public String getMovieInfos(@RequestParam String movieId, @RequestParam(required = false) String targetDate) throws JsonProcessingException {
        JsonClass_MovieDetail result = myServices.getInfoByMovieId(movieId);
        ObjectMapper om = new ObjectMapper();
        return om.writeValueAsString(result);
    }

    @RequestMapping(value = "/calcScreenPercentagesWhole", produces = "text/html;charset=UTF-8")
    public String calcScreenPercentagesWhole(@RequestParam(required = false) String movieCd) throws JsonProcessingException {
        JsonClass_MoviePercentDetail result = new JsonClass_MoviePercentDetail();
        result.setStartDate(store.getDateStringMinus3Days());
        result.setEndDate(store.getDateStringPlus3Days());
        result.setMovieCd(movieCd);
        result.setPercentages(myServices.getScreenPercentageFromUntil(movieCd, result.getStartDate(), result.getEndDate()));

        return om.writeValueAsString(result);
    }
}