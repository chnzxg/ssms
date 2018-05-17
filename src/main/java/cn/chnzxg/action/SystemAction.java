package cn.chnzxg.action;

import cn.chnzxg.entity.Admin;
import cn.chnzxg.entity.Employee;
import cn.chnzxg.service.AdminService;
import cn.chnzxg.service.EmployeeService;
import cn.chnzxg.service.impl.EmployeeServiceImpl;
import cn.chnzxg.util.MyUtil;
import com.sun.webkit.dom.MutationEventImpl;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by chnzxg on 2018/4/11.
 */
@Controller
@RequestMapping("/system")
public class SystemAction {

    @Resource
    private AdminService adminService;

    @RequestMapping(value = "/login.do" ,method = RequestMethod.POST)
    @ResponseBody
    public Integer login(HttpSession session, Admin admin){
        List<Admin> admins = adminService.login(MyUtil.beanToMap(admin));
        if(admins.size() != 0){
            Admin user = admins.get(0);
            adminService.updLoginTime(user);
            session.setAttribute("user", user);
            return 1;
        }
        return 0;
    }

    @RequestMapping(value = "/logout.do" ,method = RequestMethod.GET)
    public String logout(HttpSession session){
        session.invalidate();
        return "login";
    }

    @RequestMapping(value = "/password.do")
    @ResponseBody
    public Integer updPassword(HttpSession session, String apassword){
        try{
            Admin admin = (Admin) session.getAttribute("user");
            admin.setApassword(apassword);
            adminService.updAPassword(admin);
        }catch (Exception e){
            e.printStackTrace();
            return 0;
        }
        session.invalidate();
        return 1;
    }

}
