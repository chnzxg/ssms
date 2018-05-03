package cn.chnzxg.action;

import cn.chnzxg.entity.Discount;
import cn.chnzxg.service.DiscountService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by Administrator on 2018/5/3.
 */
@Controller
@RequestMapping("/discount")
public class DiscountAction {

    @Resource
    private DiscountService discountService;

    @RequestMapping(value = "/qrydiscount", method = RequestMethod.GET)
    public String qryDiscount(HttpServletRequest request){
        List<Discount> discounts = discountService.qryDiscount();
        request.setAttribute("discounts", discounts);
        return "ZKLB";
    }


}
