package cn.chnzxg.service.impl;

import cn.chnzxg.dao.RoleDao;
import cn.chnzxg.entity.Power;
import cn.chnzxg.entity.Role;
import cn.chnzxg.service.RoleService;
import cn.chnzxg.util.MyUtil;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
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
    private RoleDao RoleDao;

    @Override
    public List<Role> qryRole(Map<String, Object> paramMap) {
        List<Role> roles = RoleDao.qryRole(paramMap);
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
        return RoleDao.delRole(paramMap);
    }

    @Override
    public Integer updRole(Map<String, Object> paramMap) {
        return RoleDao.updRole(paramMap);
    }

    @Override
    public Integer addRole(Map<String, Object> paramMap) {
        return RoleDao.addRole(paramMap);
    }
}
