package cn.chnzxg.service;

import java.util.List;

import cn.chnzxg.entity.Employee;

public interface EmployeeService {
	public List<Employee> qryEmp(Employee employee);
	public Integer delEmp(Employee employee);
	public Integer updEmp(Employee employee);
	public Integer addEmp(Employee employee);
	public Employee qryDetail(Employee employee);
}
