package com.java4.popcorn;

import lombok.Data;
import org.springframework.stereotype.Component;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

//공유되는 값
//그러니까 날짜나 커다란 맵이나 메소드 같은걸 여기다가 한번에 넣어두고 불러다가 쓴다

@Component
@Data
public class SharePropertiesStore {

    //today
    String dateStringToday;
    //-3 days
    String dateStringMinus3Days ;
    //+3 dats
    String dateStringPlus3Days;


    Map<String, String> movieIdTitleMap;

    public SharePropertiesStore() {
        setDates();
    }

    public void setDates(){
        dateStringToday = new SimpleDateFormat("yyyyMMdd").format(new Date());
        dateStringMinus3Days = new SimpleDateFormat("yyyyMMdd").format(new Date(new Date().getTime() - (1000 * 60 * 60 * 24 * 3)));
        dateStringPlus3Days = new SimpleDateFormat("yyyyMMdd").format(new Date(new Date().getTime() + (1000 * 60 * 60 * 24 * 3)));
    }

    public List<String> betweenTwoDate(String date1, String date2){
        List<String> list = new ArrayList<>();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
        Date date;
        try {
            date = sdf.parse(date1);
            while (!sdf.format(date).equals(date2)){
                list.add(sdf.format(date));
                date = new Date(date.getTime() + (1000 * 60 * 60 * 24));
            }
            list.add(sdf.format(date));
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return list;
    }

}
