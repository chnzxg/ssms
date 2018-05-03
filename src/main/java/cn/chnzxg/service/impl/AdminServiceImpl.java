package cn.chnzxg.service.impl;

import cn.chnzxg.dao.AdminDao;
import cn.chnzxg.dao.RoleDao;
import cn.chnzxg.entity.Admin;
import cn.chnzxg.entity.Role;
import cn.chnzxg.service.AdminService;
import cn.chnzxg.util.MyUtil;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2018/5/2.
 */
@Service("adminServiceImpl")
public class AdminServiceImpl implements AdminService {

    @Resource
    private AdminDao adminDao;
    @Resource
    private RoleDao roleDao;

    @Override
    public List<Admin> qryAdmin(Map<String, Object> paramMap) {
        List<Admin> admins = adminDao.qryAdmin(paramMap);
        for(Admin admin : admins){
            admin.setRoles(roleDao.qryRoleByAdmin(admin));
            admin.setPowers(roleDao.qryPowerByAdmin(admin));
        }
        return admins;
    }

    @Override
    public Integer delAdmin(Map<String, Object> paramMap) {
        try {
            roleDao.delAdminRole(paramMap);
            adminDao.delAdmin(paramMap);
        } catch (Exception e) {
            return 0;
        }
        return 1;
    }

    @Override
    public Integer updAdmin(Map<String, Object> paramMap) {
        try{
            Admin admin = (Admin) paramMap.get("admin");
            Map<String, Object> map = MyUtil.beanToMap(admin);
            adminDao.updAdmin(map);
            roleDao.delAdminRole(map);
            int[] rids = (int[]) paramMap.get("rids");
            setAdminRole(rids, admin.getAid());
        }catch (Exception e){
            return 0;
        }
        return 1;
    }

    @Override
    public Integer addAdmin(Map<String, Object> paramMap) {
        try {
            Admin admin = (Admin) paramMap.get("admin");
            adminDao.addAdmin(admin);
            Integer aid = admin.getAid();
            int[] rids = (int[]) paramMap.get("rids");
            setAdminRole(rids, aid);
        } catch (Exception e) {
            return 0;
        }
        return 1;
    }

    @Override
    public List<Admin> login(Map<String, Object> paramMap) {
        List<Admin> admins = adminDao.qryAdmin(paramMap);
        for(Admin admin : admins){
            admin.setRoles(roleDao.qryRoleByAdmin(admin));
            admin.setPowers(roleDao.qryPowerByAdmin(admin));
        }
        return admins;
    }

    @Override
    public Admin updLoginTime(Admin admin) {
        admin.setLastlogintime(new Date());
        adminDao.updLoginTime(admin);
        return admin;
    }

    private void setAdminRole(int[] rids, Integer aid) {
        for (Integer rid : rids) {
            Map<String, Object> map = new HashMap<>();
            map.put("aid", aid);
            map.put("rid", rid);
            roleDao.addAdminRole(map);
        }
    }
}
