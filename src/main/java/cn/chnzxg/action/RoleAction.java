package cn.chnzxg.action;

import cn.chnzxg.entity.Role;
import cn.chnzxg.service.RoleService;
import cn.chnzxg.util.MyUtil;
import cn.chnzxg.util.PageUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.condition.ParamsRequestCondition;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
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
        return "jslb";
    }

    @RequestMapping(value = "/delrole.do", method = RequestMethod.DELETE)
    public String delRole(HttpServletRequest request, String page, String pageSize, Role role){
        roleService.delRole(MyUtil.beanToMap(role));
        getRoles(role, page, pageSize, request);
        return "jslb";
    }

    @RequestMapping(value = "/addrole.do", method = RequestMethod.POST)
    public String addRole(HttpServletRequest request, String page, String pageSize, Role role, int[] pid){
        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("role", role);
        paramMap.put("pids", pid);
        roleService.addRole(paramMap);
        getRoles(role, page, pageSize, request);
        return "jslb";
    }

    @RequestMapping(value = "/updrole.do", method = RequestMethod.POST)
    public String updRole(HttpServletRequest request, String page,String pageSize, Role role, int[] pid){
        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("role", role);
        paramMap.put("pids", pid);
        roleService.updRole(paramMap);
        getRoles(role, page, pageSize, request);
        return "jslb";
    }

    private void getRoles(Role role, String page, String pageSize, HttpServletRequest request){
        Map<String, Object> paramMap = PageUtil.getParamMap(role, page, pageSize);
        List<Role> roles = roleService.qryRole(paramMap);
        request.setAttribute("roles", roles);
        request.setAttribute("page", page);
        request.setAttribute("pageSize", pageSize);
    }
}
