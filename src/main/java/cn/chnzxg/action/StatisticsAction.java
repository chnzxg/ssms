package cn.chnzxg.action;

import cn.chnzxg.entity.*;
import cn.chnzxg.service.StatisticsService;
import com.fasterxml.jackson.databind.util.JSONPObject;
import com.google.gson.Gson;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

    @RequestMapping(value = "/fine.do", method = RequestMethod.GET)
    public String getFineStat(HttpServletRequest request, String cname){
        Map<String, String> paramMap = new HashMap<>();
        paramMap.put("cname", cname);
        List<Statistics> fineInfo = statisticsService.getFineInfo(paramMap);
        setAttibute(request, fineInfo, Fine.class);
        return "statistics/finestat";
    }

    @RequestMapping(value = "/emp.do", method = RequestMethod.GET)
    public String getEmployeeStat(HttpServletRequest request){
        List<Statistics> employeeInfo = statisticsService.getEmployeeInfo();
        for(Statistics s : employeeInfo){
            int name = Integer.parseInt(s.getName());
            switch (name){
                case 1: s.setName("店长"); break;
                case 2: s.setName("经理"); break;
                case 3: s.setName("促销员"); break;
                case 4: s.setName("收银员"); break;
                case 5: s.setName("收货员"); break;
                case 6: s.setName("理货员"); break;
                case 7: s.setName("保洁"); break;
            }
        }
        setAttibute(request, employeeInfo, Employee.class);
        return "statistics/empstat";
    }

    @RequestMapping(value = "/mem.do", method = RequestMethod.GET)
    public String getMemberStat(HttpServletRequest request){
        List<Statistics> memberInfo = statisticsService.getMemberInfo();
        setAttibute(request, memberInfo, Member.class);
        return "statistics/memstat";
    }

    @RequestMapping(value = "/form.do", method = RequestMethod.GET)
    public String getFormStat(HttpServletRequest request){
        List<Statistics> formInfo = statisticsService.getFormStatistics();
        for(Statistics s : formInfo){
            int name = Integer.parseInt(s.getName());
            switch (name){
                case 1: s.setName("已下单"); break;
                case 2: s.setName("已发货"); break;
                case 3: s.setName("已收货"); break;
                case 4: s.setName("已关闭"); break;
            }
        }
        setAttibute(request, formInfo, Form.class);
        return "statistics/formstat";
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
