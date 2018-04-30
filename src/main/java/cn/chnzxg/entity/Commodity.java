package cn.chnzxg.entity;

import java.sql.Timestamp;

public class Commodity {
	//id
	private Integer comid;
	//名称
	private String cname;
	//细类id
	private Integer finid;
	//细类名
	private String fname;
	//规格
	private String cspec;
	//保质期
	private Integer month;
	//重量
	private Integer cweight;
	//单价
	private Double cprice;
	//生产商
	private String cproder;
	//生产日期
	private Timestamp cprodate;
	//编码
	private String ccode;
	//库存
	private Integer cstock;
	//描述
	private String cdesc;
	//状态(1正常0回收站)
	private Integer cstatus;
	private Integer firstRow;
	private Integer pageSize;
	
	public Commodity(Integer comid, String cname, Integer finid, String fname, String cspec, Integer month,
			Integer cweight, Double cprice, String cproder, Timestamp cprodate, String ccode, Integer cstock,
			String cdesc) {
		super();
		this.comid = comid;
		this.cname = cname;
		this.finid = finid;
		this.fname = fname;
		this.cspec = cspec;
		this.month = month;
		this.cweight = cweight;
		this.cprice = cprice;
		this.cproder = cproder;
		this.cprodate = cprodate;
		this.ccode = ccode;
		this.cstock = cstock;
		this.cdesc = cdesc;
	}
	public Commodity() {
		super();
	}
	public Integer getComid() {
		return comid;
	}
	public void setComid(Integer comid) {
		this.comid = comid;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public Integer getFinid() {
		return finid;
	}
	public void setFinid(Integer finid) {
		this.finid = finid;
	}
	public String getCspec() {
		return cspec;
	}
	public void setCspec(String cspec) {
		this.cspec = cspec;
	}
	public Integer getCweight() {
		return cweight;
	}
	public void setCweight(Integer cweight) {
		this.cweight = cweight;
	}
	public Double getCprice() {
		return cprice;
	}
	public void setCprice(Double cprice) {
		this.cprice = cprice;
	}
	public String getCproder() {
		return cproder;
	}
	public void setCproder(String cproder) {
		this.cproder = cproder;
	}
	public Integer getCstock() {
		return cstock;
	}
	public void setCstock(Integer cstock) {
		this.cstock = cstock;
	}
	public String getCdesc() {
		return cdesc;
	}
	public void setCdesc(String cdesc) {
		this.cdesc = cdesc;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getCcode() {
		return ccode;
	}
	public void setCcode(String ccode) {
		this.ccode = ccode;
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
	public Timestamp getCprodate() {
		return cprodate;
	}
	public void setCprodate(Timestamp cprodate) {
		this.cprodate = cprodate;
	}
	public Integer getMonth() {
		return month;
	}
	public void setMonth(Integer month) {
		this.month = month;
	}

	public Integer getCstatus() {
		return cstatus;
	}

	public void setCstatus(Integer cstatus) {
		this.cstatus = cstatus;
	}
}
