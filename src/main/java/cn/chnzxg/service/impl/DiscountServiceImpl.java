package cn.chnzxg.service.impl;

import cn.chnzxg.dao.DiscountDao;
import cn.chnzxg.entity.Discount;
import cn.chnzxg.service.DiscountService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Administrator on 2018/5/3.
 */
@Service("discountServiceImpl")
public class DiscountServiceImpl implements DiscountService {

    @Resource
    private DiscountDao discountDao;

    @Override
    public List<Discount> qryDiscount() {
        return discountDao.qryDiscount();
    }

    @Override
    public Integer updDiscount(Discount discount) {
        return discountDao.updDiscount(discount);
    }
}
