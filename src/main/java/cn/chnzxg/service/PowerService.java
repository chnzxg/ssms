package cn.chnzxg.service;

import cn.chnzxg.entity.Power;

import java.util.List;
import java.util.Map;

/**
 * Created by Poweristrator on 2018/5/2.1
 */
public interface PowerService {
    List<Power> qryPower(Map<String, Object> paramMap);
}
