package cn.chnzxg.entity;

import java.util.Date;

/**
 * Created by Administrator on 2018/5/8.
 */
public class Form {
    private Integer forid;
    private Integer comid;
    private Integer memid;
    private Integer finid;
    private String cname;
    private Date cprodate;
    private Integer month;
    private Double cprice;
    private Integer ccount;
    private String mname;
    private Date creattime;
    private Date lastmoditime;
    private Integer fstatus;

    @Override
    public String toString() {
        return "Form{" +
                "forid=" + forid +
                ", comid=" + comid +
                ", memid=" + memid +
                ", finid=" + finid +
                ", cname='" + cname + '\'' +
                ", cprodate=" + cprodate +
                ", month=" + month +
                ", cprice=" + cprice +
                ", ccount=" + ccount +
                ", mname='" + mname + '\'' +
                ", creattime=" + creattime +
                ", lastmoditime=" + lastmoditime +
                ", fstatus=" + fstatus +
                '}';
    }

    public Integer getForid() {
        return forid;
    }

    public void setForid(Integer forid) {
        this.forid = forid;
    }

    public Integer getComid() {
        return comid;
    }

    public void setComid(Integer comid) {
        this.comid = comid;
    }

    public Integer getMemid() {
        return memid;
    }

    public void setMemid(Integer memid) {
        this.memid = memid;
    }

    public Integer getFinid() {
        return finid;
    }

    public void setFinid(Integer finid) {
        this.finid = finid;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    public Date getCprodate() {
        return cprodate;
    }

    public void setCprodate(Date cprodate) {
        this.cprodate = cprodate;
    }

    public Integer getMonth() {
        return month;
    }

    public void setMonth(Integer month) {
        this.month = month;
    }

    public Double getCprice() {
        return cprice;
    }

    public void setCprice(Double cprice) {
        this.cprice = cprice;
    }

    public Integer getCcount() {
        return ccount;
    }

    public void setCcount(Integer ccount) {
        this.ccount = ccount;
    }

    public String getMname() {
        return mname;
    }

    public void setMname(String mname) {
        this.mname = mname;
    }

    public Date getCreattime() {
        return creattime;
    }

    public void setCreattime(Date creattime) {
        this.creattime = creattime;
    }

    public Date getLastmoditime() {
        return lastmoditime;
    }

    public void setLastmoditime(Date lastmoditime) {
        this.lastmoditime = lastmoditime;
    }

    public Integer getFstatus() {
        return fstatus;
    }

    public void setFstatus(Integer fstatus) {
        this.fstatus = fstatus;
    }

    public Form(Integer forid, Integer comid, Integer memid, Integer finid, String cname, Date cprodate, Integer month, Double cprice, Integer ccount, String mname, Date creattime, Date lastmoditime, Integer fstatus) {
        this.forid = forid;
        this.comid = comid;
        this.memid = memid;
        this.finid = finid;
        this.cname = cname;
        this.cprodate = cprodate;
        this.month = month;
        this.cprice = cprice;
        this.ccount = ccount;
        this.mname = mname;
        this.creattime = creattime;
        this.lastmoditime = lastmoditime;
        this.fstatus = fstatus;
    }

    public Form() {

    }
}
