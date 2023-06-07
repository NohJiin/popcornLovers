package com.java4.popcorn;


import com.fasterxml.jackson.core.JsonProcessingException;
import com.java4.popcorn.componet.DistanceCalculator;
import com.java4.popcorn.controllers.page.JsonClass_MovieDetail;
import com.java4.popcorn.controllers.page.JsonClass_ScreenPercentage;
import com.java4.popcorn.database.movie.mapping.MovieMappingDAO;
import com.java4.popcorn.database.movie.mapping.MovieMappingVO;
import com.java4.popcorn.database.screen.ScreenDAO;
import com.java4.popcorn.database.screen.ScreenVO;
import com.java4.popcorn.database.theater.TheaterDAO;
import com.java4.popcorn.database.theater.TheaterVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class MyServices {
    @Autowired
    TheaterDAO theaterDAO;
    @Autowired
    ScreenDAO screenDAO;
    @Autowired
    MovieMappingDAO movieMappingDAO;
    @Autowired
    DistanceCalculator distanceCalculator;
    @Autowired
    SharePropertiesStore store;

    //DB에 저장된 모든 극장들에 대해서 거리를 구하고 오름차순으로 정렬하여 String, VO의 맵으로 돌려준다
    // key : distance
    public Map<String, Double> calcDistance(Double latitude, Double longitude){
        Map<String, TheaterVO> voMap = theaterDAO.selectAllTheaterCode(); //Key -> CODE_COMPANY
        Map<String, Double> map = new TreeMap<>(); // 거리를 계산해서 넣는다

        //거리를 계산한다
        for (String key : voMap.keySet()) {
            map.put(voMap.get(key).getTheater_id()+"_"+voMap.get(key).getTheater_company(), distanceCalculator.calculateDistance(latitude, longitude, voMap.get(key).getCoord_y(), voMap.get(key).getCoord_x()));
        }
        System.out.println("map : " + map);

        //정렬한다
        List<Map.Entry<String, Double>> list = new ArrayList<>(map.entrySet());
        list.sort(Comparator.comparingDouble(Map.Entry::getValue)); // 큰 순서로 정렬

        //리턴할 새 맵을 만든다
        Map<String, Double> resultMap = new LinkedHashMap<>();
        list.forEach(e->{
            //key : theater_id, value : distance로 집어넣는다
            resultMap.put(e.getKey(), map.get(e.getKey()));
        });

        return resultMap;
    }

    public List<ScreenVO> getScreenList(String theater_Id){
        List<ScreenVO> list = new ArrayList<>();
        for(String date : store.betweenTwoDate(store.dateStringToday, store.dateStringPlus3Days)){
            list.addAll(getScreenListOneDate(theater_Id, date));
        }
        return list;
    }

    public List<ScreenVO> getScreenListOneDate(String theater_Id, String date){
        return screenDAO.selectByTheaterAndDate(theater_Id, date);
    }

    //개별극장, 개별영화, 개별날짜
    public Double getScreenPercentage(String theater_Id, String movieCd, String date) {
        List<ScreenVO> bigList = screenDAO.selectByTheaterAndDate(theater_Id, date);
        //System.out.println(bigList);
        List<ScreenVO> smallList = new ArrayList<>();
        bigList.stream().filter(e->e.getMovieCd().equals(movieCd)).forEach(e->smallList.add(e));
        //System.out.println(smallList);
        return (double)smallList.size()/(double)bigList.size();
    }

    //모든극장, 개별영화, 개별날짜
    public Double getScreenPercentage(String movieCd, String date) {
        List<ScreenVO> bigList = screenDAO.selectByDate(date);
        //System.out.println(bigList);
        List<ScreenVO> smallList = screenDAO.selectByMovieIdAndDate(movieCd, date);
        //System.out.println(smallList);
        return (double)smallList.size()/(double)bigList.size();
    }

    public List<Double> getScreenPercentageFromUntil(String movieCd, String date1, String date2) {
        List<Double> resultList = new ArrayList<>();
        store.betweenTwoDate(date1, date2).forEach(e->{
            //TODO
            resultList.add(getScreenPercentage(movieCd, e));
        });
        return resultList;
    }

    //theater_id, theater_company를 받아서 screen_status를 계산해서 돌려준다
    //screen_status는 상영관 수가 늘었는지, 줄었는지, 새로 생겼는지 없어졌는지
    public Map<String, Integer> calcScreenStatus(String theater_Id, String date1, String date2){
        Map<String, List<ScreenVO>> map1 = screenDAO.toMapByMovieId(screenDAO.selectByTheaterAndDate(theater_Id, date1));
        Map<String, List<ScreenVO>> map2 = screenDAO.toMapByMovieId(screenDAO.selectByTheaterAndDate(theater_Id, date2));

        return getStringIntegerMap(map1, map2);
    }

    private Map<String, Integer> getStringIntegerMap(Map<String, List<ScreenVO>> map1, Map<String, List<ScreenVO>> map2) {
        Set<String> idList = new HashSet<>();
        idList.addAll(map1.keySet());
        idList.addAll(map2.keySet());

        Map<String, Integer> resultMap = new HashMap<>();
        for(String id : idList) {
            if (map1.containsKey(id) && map2.containsKey(id)) {
                resultMap.put(id, map1.get(id).size() - map2.get(id).size());
            }
        }

        return resultMap;
    }

    public TheaterVO getTheater(String theaterId) {
        return theaterDAO.selectByTheaterId(theaterId);
    }

    public JsonClass_ScreenPercentage calcScreenPercentages(String theater_Id, String targetDate) throws JsonProcessingException {
        JsonClass_ScreenPercentage jsScreenPercentage = new JsonClass_ScreenPercentage();

        jsScreenPercentage.setTheater(getTheater(theater_Id));
        jsScreenPercentage.setMovieTitleMap(new HashMap<>());
        jsScreenPercentage.setScreensPercentageMap(new HashMap<>());

        Map<String, String> map = getOnScreenMap(theater_Id, targetDate);
        for(String cd : map.keySet()){
            jsScreenPercentage.getMovieTitleMap().put(cd, map.get(cd));
            jsScreenPercentage.getScreensPercentageMap().put(cd, getScreenPercentage(theater_Id, cd, targetDate));
        }
        return jsScreenPercentage;
    }

    public Map<String, String> getOnScreenMap(String theaterId, String targetDate) { // movieCd : movieTitle
        Map<String, String> map = new HashMap<>();
        screenDAO.selectByTheaterAndDate(theaterId, targetDate).forEach(x->{
            map.put(x.getMovieCd(), x.getTitle());
        });
        return map;
    }

    Map<String, TheaterVO> theaterMap = new HashMap<>();

    public Map<String, TheaterVO> getTheaterMap(){
        if(theaterMap.isEmpty()){
            theaterMap = theaterDAO.selectAllTheaterCode();
            return theaterMap;
        }
        return theaterMap;
    }

    public Map<String, String> getMovieCdTitleMap() {
        Map<String, String> map = new HashMap<>();
        movieMappingDAO.selectAll().forEach(x->{
            map.put(x.getKobis_movieCd(), x.getMy_title());
        });
        return map;
    }

    public JsonClass_MovieDetail getInfoByMovieId(String movieId) {
        JsonClass_MovieDetail result = new JsonClass_MovieDetail();
        result.setDetail_urls(new ArrayList<>());
        List<MovieMappingVO> mms = movieMappingDAO.selectByMovieId(movieId);
        System.out.println(mms);
        for(MovieMappingVO mm : mms){
            if(mm.getDetail_url()!=null) result.getDetail_urls().add(mm.getDetail_url());
            if(mm.getKobis_movieCd()!=null) result.setKobis_movieCd(mm.getKobis_movieCd());
            if(mm.getMy_title()!=null) result.setMy_title(mm.getMy_title());
            if(mm.getPosterList()!=null) result.setPosters(mm.getPosterList());
            if(mm.getDocid()!=null) result.setDocid(mm.getDocid());
        }
        return result;
    }

}
