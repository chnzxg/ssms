package cn.chnzxg.entity;

/**
 * Created by Administrator on 2018/5/2.
 */
public class Discount {
    private Integer mlevel;
    private Integer percent;

    public Integer getMlevel() {
        return mlevel;
    }

    public void setMlevel(Integer mlevel) {
        this.mlevel = mlevel;
    }

    public Integer getPercent() {
        return percent;
    }

    public void setPercent(Integer percent) {
        this.percent = percent;
    }

    @Override
    public String toString() {
        return "Discount{" +
                "mlevel=" + mlevel +
                ", percent=" + percent +
                '}';
    }

    public Discount(Integer mlevel, Integer percent) {
        this.mlevel = mlevel;
        this.percent = percent;
    }

    public Discount() {
    }
}
