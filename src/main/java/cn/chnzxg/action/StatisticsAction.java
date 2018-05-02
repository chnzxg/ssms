package cn.chnzxg.action;

import cn.chnzxg.entity.Commodity;
import cn.chnzxg.entity.Statistics;
import cn.chnzxg.service.StatisticsService;
import com.fasterxml.jackson.databind.util.JSONPObject;
import com.google.gson.Gson;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by Administrator on 2018/5/1.
 */
@Controller
@RequestMapping("/stat")
public class StatisticsAction {

    @Resource
    private StatisticsService statisticsService;
    Gson gson = new Gson();

    @RequestMapping(value = "/comm.do", method = RequestMethod.GET)
    public String getCommodityStat(HttpServletRequest request){
        List<Statistics> commodityInfo = statisticsService.getCommodityInfo();
        setAttibute(request, commodityInfo, Commodity.class);
        return "statistics/commstat";
    }

    //处理数据，生成json格式的name和value字符串
    private void setAttibute(HttpServletRequest request, List<Statistics> list, Class clazz){
        String[] names = new String[list.size()];
        Integer[] values = new Integer[list.size()];
        for(int i = 0 ; i < list.size() ; i++){
            names[i] = list.get(i).getName();
            values[i] = list.get(i).getValue();
        }
        request.setAttribute(clazz.getSimpleName()+"Info", gson.toJson(list).toString());
        request.setAttribute(clazz.getSimpleName()+"InfoNames", gson.toJson(names).toString());
        request.setAttribute(clazz.getSimpleName()+"InfoValues", gson.toJson(values).toString());
    }
}
