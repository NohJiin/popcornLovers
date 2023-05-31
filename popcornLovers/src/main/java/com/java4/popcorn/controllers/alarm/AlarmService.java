package com.java4.popcorn.controllers.alarm;

import com.java4.popcorn.database.screen.ScreenDAO;
import com.java4.popcorn.database.screen.ScreenVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class AlarmService {
    @Autowired
    ScreenDAO screenDAO;

    public void setPropeties(){

    }

    public List<ScreenVO> getScreenListByDateStringList(List<String> dates){
        List<ScreenVO> screenList = new ArrayList<>();
        for(String date : dates){
            screenList.addAll(screenDAO.selectByDate(date));
        }
        return screenList;
    }
}
