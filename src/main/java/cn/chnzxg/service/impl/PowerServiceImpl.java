package cn.chnzxg.service.impl;

import cn.chnzxg.dao.PowerDao;
import cn.chnzxg.entity.Power;
import cn.chnzxg.service.PowerService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * Created by Poweristrator on 2018/5/2.
 */
@Service("powerServiceImpl")
public class PowerServiceImpl implements PowerService{

    @Resource
    private PowerDao PowerDao;

    @Override
    public List<Power> qryPower(Map<String, Object> paramMap) {
        return PowerDao.qryPower(paramMap);
    }
}
