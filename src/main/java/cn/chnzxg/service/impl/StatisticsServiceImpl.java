package cn.chnzxg.service.impl;

import cn.chnzxg.dao.StatisticsDao;
import cn.chnzxg.entity.Statistics;
import cn.chnzxg.service.StatisticsService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

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

    @Override
    public List<Statistics> getEmployeeInfo() {
        return statisticsDao.getEmployeeStatistics();
    }

    @Override
    public List<Statistics> getMemberInfo() {
        return statisticsDao.getMemberStatistics();
    }

    @Override
    public List<Statistics> getFormStatistics() {
        return statisticsDao.getFormStatistics();
    }

    @Override
    public List<Statistics> getFineInfo(Map<String, String> paramMap) {
        return statisticsDao.getFineStatistics(paramMap);
    }
}
