package cn.chnzxg.entity;

/**
 * Created by Administrator on 2018/5/2.
 */
public class Statistics {
    private String name;
    private Integer value;

    public Statistics(String name, Integer value) {
        this.name = name;
        this.value = value;
    }

    public Statistics() {
    }

    @Override
    public String toString() {
        return "Statistics{" +
                "name='" + name + '\'' +
                ", value=" + value +
                '}';
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getValue() {
        return value;
    }

    public void setValue(Integer value) {
        this.value = value;
    }
}
