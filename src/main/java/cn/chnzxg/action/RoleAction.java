package cn.chnzxg.action;

import cn.chnzxg.entity.Admin;
import cn.chnzxg.entity.Power;
import cn.chnzxg.entity.Role;
import cn.chnzxg.service.AdminService;
import cn.chnzxg.service.RoleService;
import cn.chnzxg.util.MyUtil;
import cn.chnzxg.util.PageUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;
import javax.management.relation.RoleResult;
import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2018/5/2.
 */
@Controller
@RequestMapping(value = "/role")
public class RoleAction {

    @Resource
    private RoleService roleService;

    @RequestMapping(value = "/qryrole.do", method = RequestMethod.GET)
    public String getRole(HttpServletRequest request, String page, String pageSize, Role role){
        getRoles(role, page, pageSize, request);
        return "JSLB";
    }

    @RequestMapping(value = "/delrole.do", method = RequestMethod.DELETE)
    public String delRole(HttpServletRequest request, String page, String pageSize, Role role){
        roleService.delRole(MyUtil.beanToMap(role));
        getRoles(role, page, pageSize, request);
        return "JSLB";
    }

    private void getRoles(Role role, String page, String pageSize, HttpServletRequest request){
        Map<String, Object> paramMap = PageUtil.getParamMap(role, page, pageSize);
        List<Role> roles = roleService.qryRole(paramMap);
        request.setAttribute("roles", roles);
        request.setAttribute("page", page);
        request.setAttribute("pageSize", pageSize);
    }
}
