package cn.chnzxg.dao;

import cn.chnzxg.entity.Statistics;

import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2018/5/2.
 */
public interface StatisticsDao {
    List<Statistics> getCommodityStatistics();
    List<Statistics> getEmployeeStatistics();
    List<Statistics> getMemberStatistics();
    List<Statistics> getFineStatistics(Map<String, String> paramMap);
}
