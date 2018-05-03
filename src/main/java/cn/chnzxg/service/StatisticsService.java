package cn.chnzxg.service;

import cn.chnzxg.entity.Statistics;

import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2018/5/2.
 */
public interface StatisticsService {
    List<Statistics> getCommodityInfo();
    List<Statistics> getEmployeeInfo();
    List<Statistics> getMemberInfo();
    List<Statistics> getFineInfo(Map<String, String> paramMap);
}
