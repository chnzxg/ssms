package cn.chnzxg.service.impl;

import cn.chnzxg.dao.AdminDao;
import cn.chnzxg.entity.Admin;
import cn.chnzxg.service.AdminService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2018/5/2.
 */
@Service("adminServiceImpl")
public class AdminServiceImpl implements AdminService{

    @Resource
    private AdminDao AdminDao;

    @Override
    public List<Admin> qryAdmin(Map<String, Object> paramMap) {
        return AdminDao.qryAdmin(paramMap);
    }

    @Override
    public Integer delAdmin(Map<String, Object> paramMap) {
        return AdminDao.delAdmin(paramMap);
    }

    @Override
    public Integer updAdmin(Map<String, Object> paramMap) {
        return AdminDao.updAdmin(paramMap);
    }

    @Override
    public Integer addAdmin(Map<String, Object> paramMap) {
        return AdminDao.addAdmin(paramMap);
    }
}
