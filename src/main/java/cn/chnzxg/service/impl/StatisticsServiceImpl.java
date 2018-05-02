package cn.chnzxg.service.impl;

import cn.chnzxg.dao.StatisticsDao;
import cn.chnzxg.entity.Statistics;
import cn.chnzxg.service.StatisticsService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Administrator on 2018/5/2.
 */
@Service("statisticsServiceImpl")
public class StatisticsServiceImpl implements StatisticsService {

    @Resource
    private StatisticsDao statisticsDao;

    @Override
    public List<Statistics> getCommodityInfo() {
        return statisticsDao.getCommodityStatistics();
    }
}
