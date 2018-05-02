package cn.chnzxg.entity;

import java.util.Date;

/**
 * Created by Administrator on 2018/5/2.
 */
public class Admin {
    private Integer aid;
    private String aname;
    private String apassword;
    private Date creattime;
    private Date lastlogintime;

    public Admin() {
    }

    public Admin(Integer aid, String aname, String apassword, Date creattime, Date lastlogintime) {
        this.aid = aid;
        this.aname = aname;
        this.apassword = apassword;
        this.creattime = creattime;
        this.lastlogintime = lastlogintime;
    }

    public Integer getAid() {
        return aid;
    }

    @Override
    public String toString() {
        return "Admin{" +
                "aid=" + aid +
                ", aname='" + aname + '\'' +
                ", apassword='" + apassword + '\'' +
                ", creattime=" + creattime +
                ", lastlogintime=" + lastlogintime +
                '}';
    }

    public void setAid(Integer aid) {
        this.aid = aid;
    }

    public String getAname() {
        return aname;
    }

    public void setAname(String aname) {
        this.aname = aname;
    }

    public String getApassword() {
        return apassword;
    }

    public void setApassword(String apassword) {
        this.apassword = apassword;
    }

    public Date getCreattime() {
        return creattime;
    }

    public void setCreattime(Date creattime) {
        this.creattime = creattime;
    }

    public Date getLastlogintime() {
        return lastlogintime;
    }

    public void setLastlogintime(Date lastlogintime) {
        this.lastlogintime = lastlogintime;
    }
}
