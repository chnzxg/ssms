package cn.chnzxg.entity;

public class Clazz {
    private Integer claid;
    private String cname;
    private String ccode;

    public Clazz() {
        super();
    }

    public Clazz(Integer claid, String cname, String ccode) {
        super();
        this.claid = claid;
        this.cname = cname;
        this.ccode = ccode;
    }

    public Integer getClaid() {
        return claid;
    }

    public void setClaid(Integer claid) {
        this.claid = claid;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    public String getCcode() {
        return ccode;
    }

    public void setCcode(String ccode) {
        this.ccode = ccode;
    }

    @Override
    public String toString() {
        return "Clazz [claid=" + claid + ", cname=" + cname + ", ccode=" + ccode + "]";
    }

}
