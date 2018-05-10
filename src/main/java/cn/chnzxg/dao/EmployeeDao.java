package cn.chnzxg.dao;

import cn.chnzxg.entity.Employee;

import java.util.List;

public interface EmployeeDao {
	List<Employee> checkEName(String ename);
	List<Employee> qryEmp(Employee employee);
	List<Employee> login(Employee employee);
	Integer delEmp(Employee employee);
	Integer updEmp(Employee employee);
	Integer addEmp(Employee employee);
	Employee qryDetail(Employee employee);
}
