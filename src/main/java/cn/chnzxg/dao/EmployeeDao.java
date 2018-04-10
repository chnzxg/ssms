package cn.chnzxg.dao;

import java.util.List;

import cn.chnzxg.entity.Employee;

public interface EmployeeDao {
	public List<Employee> qryEmp(Employee employee);
	public Integer delEmp(Employee employee);
	public Integer updEmp(Employee employee);
	public Integer addEmp(Employee employee);
	public Employee qryDetail(Employee employee);
}
