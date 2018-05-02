package cn.chnzxg.entity;

import java.util.Date;

/**
 * Created by Administrator on 2018/5/2.
 */
public class Member {
    private Integer memid;
    private String mname;
    private Long mtel;
    private String mcode;
    private Integer mlevel;
    private Double mrem;
    private Date mdate;
    private Double mcount;

    public Integer getMemid() {
        return memid;
    }

    public void setMemid(Integer memid) {
        this.memid = memid;
    }

    public String getMname() {
        return mname;
    }

    public void setMname(String mname) {
        this.mname = mname;
    }

    public Long getMtel() {
        return mtel;
    }

    public void setMtel(Long mtel) {
        this.mtel = mtel;
    }

    public String getMcode() {
        return mcode;
    }

    public void setMcode(String mcode) {
        this.mcode = mcode;
    }

    public Integer getMlevel() {
        return mlevel;
    }

    public void setMlevel(Integer mlevel) {
        this.mlevel = mlevel;
    }

    public Double getMrem() {
        return mrem;
    }

    public void setMrem(Double mrem) {
        this.mrem = mrem;
    }

    public Date getMdate() {
        return mdate;
    }

    public void setMdate(Date mdate) {
        this.mdate = mdate;
    }

    public Double getMcount() {
        return mcount;
    }

    public void setMcount(Double mcount) {
        this.mcount = mcount;
    }

    @Override
    public String toString() {
        return "Member{" +
                "memid=" + memid +
                ", mname='" + mname + '\'' +
                ", mtel=" + mtel +
                ", mcode='" + mcode + '\'' +
                ", mlevel=" + mlevel +
                ", mrem=" + mrem +
                ", mdate=" + mdate +
                ", mcount=" + mcount +
                '}';
    }

    public Member(Integer memid, String mname, Long mtel, String mcode, Integer mlevel, Double mrem, Date mdate, Double mcount) {
        this.memid = memid;
        this.mname = mname;
        this.mtel = mtel;
        this.mcode = mcode;
        this.mlevel = mlevel;
        this.mrem = mrem;
        this.mdate = mdate;
        this.mcount = mcount;
    }

    public Member() {
    }
}
