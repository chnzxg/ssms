package cn.chnzxg.dao;

import java.util.List;

import cn.chnzxg.entity.Employee;

public interface EmployeeDao {
	List<Employee> qryEmp(Employee employee);
	List<Employee> login(Employee employee);
	Integer delEmp(Employee employee);
	Integer updEmp(Employee employee);
	Integer addEmp(Employee employee);
	Employee qryDetail(Employee employee);
}
