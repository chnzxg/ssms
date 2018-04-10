package cn.chnzxg.service.impl;

import cn.chnzxg.dao.EmployeeDao;
import cn.chnzxg.entity.Employee;
import cn.chnzxg.service.EmployeeService;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import java.util.List;
@Service("employeeServiceImpl")
public class EmployeeServiceImpl implements EmployeeService{
	@Resource
	private EmployeeDao employeeDao;
	public List<Employee> qryEmp(Employee employee) {
		return employeeDao.qryEmp(employee);
	}

	public Integer delEmp(Employee employee) {
		return employeeDao.delEmp(employee);
	}

	public Integer updEmp(Employee employee) {
		return employeeDao.updEmp(employee);
	}

	public Integer addEmp(Employee employee) {
		return employeeDao.addEmp(employee);
	}

	public Employee qryDetail(Employee employee) {
		return employeeDao.qryDetail(employee);
	}

}
