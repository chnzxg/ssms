package cn.chnzxg.action;

import cn.chnzxg.entity.Commodity;
import cn.chnzxg.service.CommodityService;
import cn.chnzxg.util.PageUtil;
import cn.chnzxg.util.SSMSKey;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/sphsz")
public class SPHSZAction {

    @Resource
    private CommodityService commodityService;

    @RequestMapping(value = "/qrysphsz", method = RequestMethod.GET)
    public String qryAllRecoveryCommodity(HttpServletRequest request, String page, String pageSize){
        if (!"".equals(page) && !"".equals(pageSize)) {
            Commodity comm = pageMethod(page, pageSize, new Commodity());
            comm.setCstatus(SSMSKey.COMM_STATUS_REMOVE);
            request.setAttribute("list", getCommList(comm));
            request.setAttribute("pageCount", PageUtil.getPageCount(getRowCount(comm), pageSize));
            request.setAttribute("page", page);
        }
        return "sphsz";
    }

    @RequestMapping(value = "/reccomm.do",method = RequestMethod.GET)
    public String updStatus(HttpServletRequest request, String page, Integer comid){
        commodityService.recComm(comid);
        Commodity comm = pageMethod(page, "15", new Commodity());
        comm.setCstatus(SSMSKey.COMM_STATUS_REMOVE);
        request.setAttribute("list", getCommList(comm));
        request.setAttribute("pageCount", PageUtil.getPageCount(getRowCount(comm), "15"));
        request.setAttribute("page", page);
        return "sphsz";
    }


    //获取商品集合
    public List<Commodity> getCommList(Commodity comm){
        return commodityService.qryAllComm(comm);
    }
    //计算分页数据
    public Commodity pageMethod(String page,String pageSize,Commodity comm){
        comm.setFirstRow(Integer.parseInt(pageSize)*Integer.parseInt(page)-Integer.parseInt(pageSize));
        comm.setPageSize(Integer.parseInt(pageSize));
        return comm;
    }
    //获取总条数
    public Integer getRowCount(Commodity commodity){
        commodity.setCstatus(SSMSKey.COMM_STATUS_REMOVE);
        return commodityService.qryAllComm(commodity).size();
    }
}
