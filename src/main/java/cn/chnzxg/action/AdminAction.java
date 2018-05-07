package cn.chnzxg.action;

import cn.chnzxg.entity.Admin;
import cn.chnzxg.service.AdminService;
import cn.chnzxg.util.MyUtil;
import cn.chnzxg.util.PageUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
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

    @RequestMapping(value = "/qryadmin.do", method = RequestMethod.GET)
    public String qryAdmin(HttpServletRequest request, String page, String pageSize, Admin admin){
        getAdmins(admin, page, pageSize, request);
        return "glylb";
    }

    @RequestMapping(value = "/deladmin.do", method = RequestMethod.DELETE)
    public String delAdmin(HttpServletRequest request, String page, String pageSize, Admin admin){
        adminService.delAdmin(MyUtil.beanToMap(admin));
        getAdmins(admin, page, pageSize, request);
        return "glylb";
    }

    @RequestMapping(value = "/addadmin.do", method = RequestMethod.POST)
    public String addAdmin(HttpServletRequest request, String page, String pageSize, Admin admin, int[] rid){
        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("admin", admin);
        paramMap.put("rids", rid);
        adminService.addAdmin(paramMap);
        getAdmins(admin, page, pageSize, request);
        return "glylb";
    }

    @RequestMapping(value = "/updadmin.do", method = RequestMethod.POST)
    public String updAdmin(HttpServletRequest request, String page, String pageSize, Admin admin, int[] rid){
        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("admin", admin);
        paramMap.put("rids", rid);
        adminService.updAdmin(paramMap);
        getAdmins(admin, page, pageSize, request);
        return "JSLB";
    }

    private void getAdmins(Admin admin, String page, String pageSize, HttpServletRequest request){
        Map<String, Object> paramMap = PageUtil.getParamMap(admin, page, pageSize);
        List<Admin> admins = adminService.qryAdmin(paramMap);
        request.setAttribute("admins", admins);
        request.setAttribute("page", page);
        request.setAttribute("pageSize", pageSize);
        request.setAttribute("pageCount", getPageCount(admin, pageSize));
    }

    private Integer getPageCount(Admin admin, String pageSize){
        List<Admin> admins = adminService.qryAdmin(MyUtil.beanToMap(admin));
        return PageUtil.getPageCount(admins.size(), pageSize);
    }

}
