package cn.chnzxg.action;

import cn.chnzxg.entity.Admin;
import cn.chnzxg.entity.Role;
import cn.chnzxg.service.AdminService;
import cn.chnzxg.service.RoleService;
import cn.chnzxg.util.PageUtil;
import com.google.gson.Gson;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2018/5/2.
 */
@Controller
@RequestMapping(value = "/admin")
public class AdminAction {

    @Resource
    private AdminService adminService;
    @Resource
    private RoleService roleService;

    @RequestMapping(value = "/checkaname.do", method = RequestMethod.POST)
    @ResponseBody
    public String  checkAName(String aname){
        Gson gson = new Gson();
        Map<String, Boolean> map = new HashMap<>();
        map.put("valid", adminService.checkAName(aname));
        String str = gson.toJson(map).toString();
        return str;
    }

    @RequestMapping(value = "/qryadmin.do", method = RequestMethod.GET)
    public String qryAdmin(HttpServletRequest request, String page, String pageSize, Admin admin) {
        getAdmins(admin, page, pageSize, request);
        return "glylb";
    }

    @RequestMapping(value = "/deladmin.do", method = RequestMethod.GET)
    public String delAdmin(HttpServletRequest request, String page, String pageSize, Admin admin) {
        adminService.delAdmin(admin);
        getAdmins(admin, page, pageSize, request);
        return "glylb";
    }

    @RequestMapping(value = "/addadmin.do", method = RequestMethod.POST)
    @ResponseBody
    public Integer addAdmin(Admin admin, int[] rid) {
        try {
            Map<String, Object> paramMap = new HashMap<>();
            paramMap.put("admin", admin);
            paramMap.put("rids", rid);
            adminService.addAdmin(paramMap);
        } catch (Exception e) {
            return 0;
        }
        return 1;
    }

    @RequestMapping(value = "/updadmin.do", method = RequestMethod.POST)
    @ResponseBody
    public Integer updAdmin(Admin admin, int[] rid) {
        try {
            Map<String, Object> paramMap = new HashMap<>();
            paramMap.put("admin", admin);
            paramMap.put("rids", rid);
            adminService.updAdmin(paramMap);
        }catch (Exception e){
            e.printStackTrace();
            return 0;
        }
        return 1;
    }

    @RequestMapping(value = "/qrydetail.do", method = RequestMethod.GET)
    public String qryDetail(HttpServletRequest request, Admin admin, HttpSession session){
        admin = adminService.qryDetail(admin);
        List<Role> roles = roleService.qryAllRole();
        session.setAttribute("admin", admin);
        session.setAttribute("roles", roles);
        return "modi/modiadmin";
    }


    private void getAdmins(Admin admin, String page, String pageSize, HttpServletRequest request) {
        Map<String, Object> paramMap = PageUtil.getParamMap(admin, page, pageSize);
        List<Admin> admins = adminService.qryAdmin(paramMap);
        request.setAttribute("admins", admins);
        request.setAttribute("page", page);
        request.setAttribute("pageSize", pageSize);
        request.setAttribute("pageCount", getPageCount(admin, pageSize));
    }

    private Integer getPageCount(Admin admin, String pageSize) {
        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("aname", admin.getAname());
        List<Admin> admins = adminService.qryAdmin(paramMap);
        return PageUtil.getPageCount(admins.size(), pageSize);
    }

}
