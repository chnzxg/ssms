package cn.chnzxg.entity;

public class Fine {
	private Integer finid;
	private Integer claid;
	private String fname;
	private String fcode;
	public Fine() {
		super();
	}
	public Fine(Integer finid, Integer claid, String fname, String fcode) {
		super();
		this.finid = finid;
		this.claid = claid;
		this.fname = fname;
		this.fcode = fcode;
	}
	public Integer getFinid() {
		return finid;
	}
	public void setFinid(Integer finid) {
		this.finid = finid;
	}
	public Integer getClaid() {
		return claid;
	}
	public void setClaid(Integer claid) {
		this.claid = claid;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getFcode() {
		return fcode;
	}
	public void setFcode(String fcode) {
		this.fcode = fcode;
	}
	
}
