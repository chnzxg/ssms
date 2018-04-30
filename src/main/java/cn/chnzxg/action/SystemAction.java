package cn.chnzxg.action;

import cn.chnzxg.entity.Employee;
import cn.chnzxg.service.EmployeeService;
import cn.chnzxg.service.impl.EmployeeServiceImpl;
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
    private EmployeeService employeeServiceImpl;
    @RequestMapping(value = "/welcome" ,method = RequestMethod.POST)
    @ResponseBody
    public Integer welcome(Employee employee, HttpSession session){
        List<Employee> employeeList = employeeServiceImpl.login(employee);
        if (employeeList.isEmpty())
            return 0;
        else{
            session.setAttribute("user", employeeList.get(0));
            return 1;
        }
    }

}
