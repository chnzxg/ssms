package cn.chnzxg.action;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by Administrator on 2018/5/1.
 */
@Controller
@RequestMapping("/stat")
public class StatisticsAction {

    @RequestMapping(value = "/comm.do", method = RequestMethod.GET)
    public String getCommodityStat(){
        return "statistics/commstat";
    }
}
