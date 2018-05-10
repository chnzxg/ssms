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

	@Override
	public boolean checkEName(String ename) {
		List<Employee> commoditys = employeeDao.checkEName(ename);
		if(commoditys.size() == 0)
			return true;
		return false;
	}

	public List<Employee> qryEmp(Employee employee) {
		return employeeDao.qryEmp(employee);
	}

	@Override
	public List<Employee> login(Employee employee) {
		return employeeDao.login(employee);
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
