package cn.chnzxg.dao;

import cn.chnzxg.entity.Admin;

import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2018/5/2.
 */
public interface AdminDao {
    List<Admin> qryAdmin(Map<String, Object> paramMap);
    Integer delAdmin(Admin admin);
    Integer updAdmin(Admin admin);
    Integer addAdmin(Admin admin);
    List<Admin> login(Map<String, Object> paramMap);
    Integer updLoginTime(Admin admin);
    Integer updAPassword(Admin admin);
    Admin qryDetail(Admin admin);
    List<Admin> checkAName(String aname);
}
