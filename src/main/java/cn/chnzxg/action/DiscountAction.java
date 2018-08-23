package cn.chnzxg.action;

import cn.chnzxg.entity.Discount;
import cn.chnzxg.service.DiscountService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2018/5/3.
 */
@Controller
@RequestMapping("/discount")
public class DiscountAction {

    @Resource
    private DiscountService discountService;

    @RequestMapping(value = "/qrydiscount.do", method = RequestMethod.GET)
    public String qryDiscount(HttpServletRequest request) {
        List<Discount> discounts = discountService.qryDiscount();
        request.setAttribute("discounts", discounts);
        return "zksz";
    }

    @RequestMapping(value = "/upddiscount.do", method = RequestMethod.GET)
    @ResponseBody
    public Integer updDiscount(String str) {

        System.out.println(1);
        return 1;
    }

}
