package com.java4.popcorn;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
public class PageController {
    @Autowired
    MyServices myServices;
    @Autowired
    SharePropertiesStore store;

    @RequestMapping("/")
    public String goHome(Model model){

        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
        model.addAttribute("date", sdf.format(date));
        model.addAttribute("longDate", date.toString());

        return "CloseTheater";
    }

    @RequestMapping("/res")
    public String goRes(){
        return "res";
    }

    @RequestMapping("/movieDetail")
    public String goMovieDetail(HttpServletRequest request,
                                Model model,
                                @RequestParam String movieCd){
        model.addAttribute("movieCd", movieCd);
        return "movie/movieDetail";
    }

    @RequestMapping("/theaterDetail")
    public String goTheaterDetail(HttpServletRequest request,
                                Model model,
                                @RequestParam String theaterId){
        String[] theaterIdArr = theaterId.split("_");
        model.addAttribute("theaterId", theaterIdArr[0]);
        model.addAttribute("theaterCompany", theaterIdArr[1]);
        return "theater/theaterDetail";
    }

    @RequestMapping("/CloseTheater")
    public String goCloseTheater(){
        return "CloseTheater";
    }

}
