package cn.chnzxg.service.impl;

import cn.chnzxg.dao.PowerDao;
import cn.chnzxg.dao.RoleDao;
import cn.chnzxg.entity.Admin;
import cn.chnzxg.entity.Power;
import cn.chnzxg.entity.Role;
import cn.chnzxg.service.RoleService;
import cn.chnzxg.util.MyUtil;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Roleistrator on 2018/5/2.
 */
@Service("roleServiceImpl")
public class RoleServiceImpl implements RoleService{

    @Resource
    private RoleDao roleDao;

    @Resource
    private PowerDao powerDao;

    @Override
    public List<Role> qryRole(Map<String, Object> paramMap) {
        List<Role> roles = roleDao.qryRole(paramMap);
        for(Role role : roles){
            List<Power> powers = roleDao.qryPowerByRole(MyUtil.beanToMap(role));
            role.setPowers(powers);
        }
        return roles;
    }

    @Override
    public List<Power> qryPowerByRole(Map<String, Object> paramMap) {
        return roleDao.qryPowerByRole(paramMap);
    }

    @Override
    public Integer delRole(Map<String, Object> paramMap) {
        try{
            roleDao.delRole(paramMap);
            powerDao.delRolePower(paramMap);
        }catch (Exception e){
            return 0;
        }
        return 1;
    }

    @Override
    public Integer updRole(Map<String, Object> paramMap) {
        try{
            Role role = (Role) paramMap.get("role");
            Map<String, Object> map = MyUtil.beanToMap(role);
            roleDao.updRole(map);
            powerDao.delRolePower(map);
            int[] pids = (int[]) paramMap.get("pids");
            setRolePower(pids, role.getRid());
        }catch (Exception e){
            return 0;
        }
        return 1;
    }

    @Override
    public Integer addRole(Map<String, Object> paramMap) {
        try{
            Role role = (Role) paramMap.get("role");
            roleDao.addRole(role);
            Integer rid = role.getRid();
            int[] pids = (int[]) paramMap.get("pids");
            setRolePower(pids, rid);
        }catch (Exception e){
            return 0;
        }
        return 1;
    }

    @Override
    public List<Role> qryAllRole() {
        return roleDao.qryAllRole();
    }

    @Override
    public Role qryDetail(Role role) {
        return roleDao.qryDetail(role);
    }

    private void setRolePower(int[] pids, Integer rid){
        for(Integer pid : pids){
            Map<String ,Object> map = new HashMap<>();
            map.put("pid", pid);
            map.put("rid", rid);
            powerDao.addRolePower(map);
        }
    }
}
