package cn.chnzxg.service;

import cn.chnzxg.entity.Admin;

import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2018/5/2.1
 */
public interface AdminService {
    List<Admin> qryAdmin(Map<String, Object> paramMap);
    Integer delAdmin(Map<String, Object> paramMap);
    Integer updAdmin(Map<String, Object> paramMap);
    Integer addAdmin(Map<String, Object> paramMap);
}
