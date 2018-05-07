package cn.chnzxg.entity;

import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2018/5/2.
 */
public class Role {
    private Integer rid;
    private String rname;
    private Date creattime;
    private List<Power> powers;

    public String getPowers() {
        StringBuffer stringBuffer = new StringBuffer();
        for(Power power : powers){
            stringBuffer.append(power.getPname());
            stringBuffer.append(",");
        }
        stringBuffer.deleteCharAt(stringBuffer.length()-1);
        return stringBuffer.toString();
    }

    public void setPowers(List<Power> powers) {
        this.powers = powers;
    }

    public Integer getRid() {
        return rid;
    }

    public void setRid(Integer rid) {
        this.rid = rid;
    }

    public String getRname() {
        return rname;
    }

    public void setRname(String rname) {
        this.rname = rname;
    }

    public Date getCreattime() {
        return creattime;
    }

    public void setCreattime(Date creattime) {
        this.creattime = creattime;
    }

    @Override
    public String toString() {
        return "Role{" +
                "rid=" + rid +
                ", rname='" + rname + '\'' +
                ", creattime=" + creattime +
                ", powers=" + powers +
                '}';
    }

    public Role(Integer rid, String rname, Date creattime) {
        this.rid = rid;
        this.rname = rname;
        this.creattime = creattime;
    }

    public Role() {

    }
}
