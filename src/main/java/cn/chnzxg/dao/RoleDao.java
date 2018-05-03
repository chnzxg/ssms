package cn.chnzxg.dao;

import cn.chnzxg.entity.Power;
import cn.chnzxg.entity.Role;

import java.util.List;
import java.util.Map;

/**
 * Created by Roleistrator on 2018/5/2.
 */
public interface RoleDao {
    List<Role> qryRole(Map<String, Object> paramMap);
    List<Power> qryPowerByRole(Map<String, Object> paramMap);
    Integer delRole(Map<String, Object> paramMap);
    Integer updRole(Map<String, Object> paramMap);
    Integer addRole(Role role);
    Integer delAdminRole(Map<String, Object> paramMap);
    Integer addAdminRole(Map<String, Object> paramMap);
}