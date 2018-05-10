package cn.chnzxg.action;

import cn.chnzxg.entity.Employee;
import cn.chnzxg.service.EmployeeService;
import cn.chnzxg.util.PageUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;
@Controller
@RequestMapping("/yglb")
public class YGLBAction {
	@Resource
	private EmployeeService employeeService;
	@RequestMapping("/qryyglb.do")
	public String qryYGLB(HttpServletRequest request,String page,String pageSize){
		if(!"".equals(page)&&!"".equals(pageSize)){
			Employee employee = pageMethod(page, pageSize, new Employee());
			request.setAttribute("list", getEmployeeList(employee));
			request.setAttribute("pageCount", PageUtil.getPageCount(getRowCount(),pageSize));
			request.setAttribute("page", page);
			request.setAttribute("pageSize", pageSize);
		}
		return "yglb";
	}

	@RequestMapping(value = "/updyglb.do", method = RequestMethod.POST)
    public String updYGLB(HttpServletRequest request, String page, String pageSize, Employee employee){
        Employee employee1 = pageMethod(page, pageSize, new Employee());
        employeeService.updEmp(employee1);
        request.setAttribute("list", getEmployeeList(employee1));
        request.setAttribute("pageCount", PageUtil.getPageCount(getRowCount(),pageSize));
        request.setAttribute("page", page);
        request.setAttribute("pageSize", pageSize);
	    return "yglb";
    }

	@RequestMapping("/delyglb.do")
	public String delYGLB(HttpServletRequest request,String page,String pageSize,String empid){
		if(!"".equals(page)&&!"".equals(pageSize)){
			if(!"".equals(empid)){
				Employee employee = pageMethod(page, pageSize, new Employee());
				employee.setEmpid(Integer.parseInt(empid));
				employeeService.delEmp(employee);
				request.setAttribute("list", getEmployeeList(employee));
				request.setAttribute("pageCount", PageUtil.getPageCount(getRowCount(),pageSize));
				request.setAttribute("page", page);
				request.setAttribute("pageSize", pageSize);
			}
		}
		return "yglb";
	}

	@RequestMapping(value = "/addyglb.do", method = RequestMethod.GET)
    @ResponseBody
	public Integer addEmployee(Employee employee){
        try{
            employeeService.addEmp(employee);
        }catch (Exception e){
            e.printStackTrace();
            return 0;
        }
	    return 1;
    }

	@RequestMapping("/qryDetail.do")
	@ResponseBody
	public Employee qryDetail(String empid){
		Employee employee = new Employee();
		if(!"".equals(empid)){
			employee.setEmpid(Integer.parseInt(empid));
			employee = employeeService.qryDetail(employee);
		}
		return employee;
	}
	//计算分页数据
	public Employee pageMethod(String page,String pageSize,Employee employee){
		employee.setFirstRow(Integer.parseInt(pageSize)*Integer.parseInt(page)-Integer.parseInt(pageSize));
		employee.setPageSize(Integer.parseInt(pageSize));
		return employee;
	}
	//获取商品集合
	public List<Employee> getEmployeeList(Employee employee){
		return employeeService.qryEmp(employee);
	}
	//获取总条数
	public Integer getRowCount(){
		return employeeService.qryEmp(new Employee()).size();
	}
}


