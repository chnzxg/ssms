package cn.chnzxg.action;

import cn.chnzxg.entity.Admin;
import cn.chnzxg.service.AdminService;
import cn.chnzxg.util.PageUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
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
    public String getAdmin(HttpServletRequest request, String page, String pageSize, Admin admin){
        getAdmins(admin, page, pageSize, request);
        return "GLYLB";
    }

    private void getAdmins(Admin admin, String page, String pageSize, HttpServletRequest request){
        Map<String, Object> paramMap = PageUtil.getParamMap(admin, page, pageSize);
        List<Admin> admins = adminService.qryAdmin(paramMap);
        request.setAttribute("admins", admins);
        request.setAttribute("page", page);
        request.setAttribute("pageSize", pageSize);
    }
}
