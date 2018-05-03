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
        List<Admin> user = adminService.login(MyUtil.beanToMap(admin));
        if(user.size() != 0){
            session.setAttribute("user", user.get(0));
            return 1;
        }
        return 0;
    }

    @RequestMapping(value = "/logout.do" ,method = RequestMethod.GET)
    public String logout(HttpSession session){
        session.invalidate();
        return "Login";
    }

}
