package cn.chnzxg.dao;

import cn.chnzxg.entity.Discount;

import java.util.List;

/**
 * Created by Administrator on 2018/5/3.
 */
public interface DiscountDao {
    List<Discount> qryDiscount();
    Integer updDiscount(Discount discount);
}
