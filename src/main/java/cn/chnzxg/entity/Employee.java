package cn.chnzxg.entity;

import java.util.Date;

public class Employee {
	//id
	private Integer empid;
	//编号
	private Integer eno;
	//姓名
	private String ename;
	//性别（1男2女）
	private Integer esex;
	//年龄
	private Integer eage;
	//入职时间
	private Date etime;
	//电话
	private String etel;
	//所有权限
	private Integer epro;
	//邮箱
	private String email;
	//薪水
	private Double esal;
	//密码
	private String epwd;
	//账号
	private String eaccount;
	private Integer firstRow;
	private Integer pageSize;
	public Employee(Integer empid, Integer eno, String ename, Integer esex, Integer eage, Date etime, String etel,
			Integer epro, String email, Double esal) {
		super();
		this.empid = empid;
		this.eno = eno;
		this.ename = ename;
		this.esex = esex;
		this.eage = eage;
		this.etime = etime;
		this.etel = etel;
		this.epro = epro;
		this.email = email;
		this.esal = esal;
	}
	public Employee() {
		super();
	}
	public Integer getEmpid() {
		return empid;
	}
	public void setEmpid(Integer empid) {
		this.empid = empid;
	}
	public Integer getEno() {
		return eno;
	}
	public void setEno(Integer eno) {
		this.eno = eno;
	}
	public String getEname() {
		return ename;
	}
	public void setEname(String ename) {
		this.ename = ename;
	}
	public Integer getEsex() {
		return esex;
	}
	public void setEsex(Integer esex) {
		this.esex = esex;
	}
	public Integer getEage() {
		return eage;
	}
	public void setEage(Integer eage) {
		this.eage = eage;
	}
	public String getEtel() {
		return etel;
	}
	public void setEtel(String etel) {
		this.etel = etel;
	}
	public Integer getEpro() {
		return epro;
	}
	public void setEpro(Integer epro) {
		this.epro = epro;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Integer getFirstRow() {
		return firstRow;
	}
	public void setFirstRow(Integer firstRow) {
		this.firstRow = firstRow;
	}
	public Integer getPageSize() {
		return pageSize;
	}
	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}
	public Double getEsal() {
		return esal;
	}
	public void setEsal(Double esal) {
		this.esal = esal;
	}
	@Override
	public String toString() {
		return "Employee [empid=" + empid + ", eno=" + eno + ", ename=" + ename + ", esex=" + esex + ", eage=" + eage
				+ ", etime=" + getEtime() + ", etel=" + etel + ", epro=" + epro + ", email=" + email + ", firstRow="
				+ firstRow + ", pageSize=" + pageSize + ", esal=" + esal + "]";
	}
	public Date getEtime() {
		return etime;
	}
	public void setEtime(Date etime) {
		this.etime = etime;
	}


	public String getEpwd() {
		return epwd;
	}

	public void setEpwd(String epwd) {
		this.epwd = epwd;
	}

	public String getEaccount() {
		return eaccount;
	}

	public void setEaccount(String eaccount) {
		this.eaccount = eaccount;
	}
}
