package cn.chnzxg.dao;

import cn.chnzxg.entity.Statistics;

import java.util.List;

/**
 * Created by Administrator on 2018/5/2.
 */
public interface StatisticsDao {
    List<Statistics> getCommodityStatistics();
}
