package cn.chnzxg.service;

import cn.chnzxg.entity.Admin;
import cn.chnzxg.entity.Power;
import cn.chnzxg.entity.Role;

import java.util.List;
import java.util.Map;

/**
 * Created by Roleistrator on 2018/5/2.1
 */
public interface RoleService {
    List<Role> qryRole(Map<String, Object> paramMap);
    List<Power> qryPowerByRole(Map<String, Object> paramMap);
    Integer delRole(Map<String, Object> paramMap);
    Integer updRole(Map<String, Object> paramMap);
    Integer addRole(Map<String, Object> paramMap);
}
