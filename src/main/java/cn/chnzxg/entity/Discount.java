package cn.chnzxg.entity;

/**
 * Created by Administrator on 2018/5/2.
 */
public class Discount {
    private Integer mlevel;
    private double percent;
    private double money;

    public Integer getMlevel() {
        return mlevel;
    }

    public void setMlevel(Integer mlevel) {
        this.mlevel = mlevel;
    }

    public double getPercent() {
        return percent;
    }

    public void setPercent(double percent) {
        this.percent = percent;
    }

    public double getMoney() {
        return money;
    }

    public void setMoney(double money) {
        this.money = money;
    }

    public Discount(Integer mlevel, double percent, double money) {

        this.mlevel = mlevel;
        this.percent = percent;
        this.money = money;
    }

    @Override
    public String toString() {
        return "Discount{" +
                "mlevel=" + mlevel +
                ", percent=" + percent +
                ", money=" + money +
                '}';
    }

    public Discount() {
    }
}
