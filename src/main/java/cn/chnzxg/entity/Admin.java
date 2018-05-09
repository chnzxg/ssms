package cn.chnzxg.entity;

import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2018/5/2.
 */
public class Admin {

    private Integer aid;
    private String aname;
    private String apassword;
    private Date creattime;
    private Date lastlogintime;
    private List<Role> roles;
    private List<Power> powers;

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
                ", roles=" + roles +
                ", powers=" + powers +
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

    public String getRoles() {
        StringBuffer stringBuffer = new StringBuffer();
        for(Role role : roles){
            stringBuffer.append(role.getRname());
            stringBuffer.append(",");
        }
        stringBuffer.deleteCharAt(stringBuffer.length()-1);
        return stringBuffer.toString();
    }

    public void setRoles(List<Role> roles) {
        this.roles = roles;
    }

    public String getPowers() {
        StringBuffer stringBuffer = new StringBuffer();
        for(Power power : powers){
            stringBuffer.append(power.getPname());
            stringBuffer.append(",");
        }
        stringBuffer.deleteCharAt(stringBuffer.length()-1);
        return stringBuffer.toString();
    }

    public List<Power> getPower(){
        return powers;
    }
    public List<Role> getRole(){
        return roles;
    }

    public void setPowers(List<Power> powers) {
        this.powers = powers;
    }
}
