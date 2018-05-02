package cn.chnzxg.entity;

/**
 * Created by Administrator on 2018/5/2.
 */
public class Power {
    private Integer pid;
    private String pname;
    private String purl;

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname;
    }

    public String getPurl() {
        return purl;
    }

    public void setPurl(String purl) {
        this.purl = purl;
    }

    @Override
    public String toString() {
        return "Power{" +
                "pid=" + pid +
                ", pname='" + pname + '\'' +
                ", purl='" + purl + '\'' +
                '}';
    }

    public Power(Integer pid, String pname, String purl) {
        this.pid = pid;
        this.pname = pname;
        this.purl = purl;
    }

    public Power() {

    }
}
