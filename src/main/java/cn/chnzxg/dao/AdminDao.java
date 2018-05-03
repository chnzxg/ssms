package cn.chnzxg.dao;

import cn.chnzxg.entity.Admin;

import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2018/5/2.
 */
public interface AdminDao {
    List<Admin> qryAdmin(Map<String, Object> paramMap);
    Integer delAdmin(Map<String, Object> paramMap);
    Integer updAdmin(Map<String, Object> paramMap);
    Integer addAdmin(Admin admin);
    List<Admin> login(Map<String, Object> paramMap);
    Integer updLoginTime(Admin admin);
}
