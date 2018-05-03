package cn.chnzxg.dao;

import cn.chnzxg.entity.Power;

import java.util.List;
import java.util.Map;

/**
 * Created by Poweristrator on 2018/5/2.
 */
public interface PowerDao {
    List<Power> qryPower(Map<String, Object> paramMap);
    Integer delRolePower(Map<String, Object> paramMap);
    Integer addRolePower(Map<String, Object> paramMap);
}
