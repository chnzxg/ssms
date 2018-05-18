package cn.chnzxg.action;

import cn.chnzxg.entity.Commodity;
import cn.chnzxg.service.CommodityService;
import cn.chnzxg.util.MyUtil;
import cn.chnzxg.util.PageUtil;
import cn.chnzxg.util.SSMSKey;
import com.google.gson.Gson;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/splb")
public class SPLBAction {
    @Resource
    private CommodityService commodityService;

    @RequestMapping(value = "/sersplb.do", method = RequestMethod.GET)
    public String searchCommodity(Commodity commodity, String page, HttpServletRequest request) {
        Commodity comm = pageMethod(page, "15", commodity);
        comm.setCstatus(SSMSKey.COMM_STATUS_NORMAL);
        request.setAttribute("list", getCommList(comm));
        request.setAttribute("pageCount", PageUtil.getPageCount(getRowCount(comm), "15"));
        request.setAttribute("page", page);
        request.setAttribute("comm", comm);
        return "splb";
    }

    @RequestMapping(value = "/checkcname.do", method = RequestMethod.POST)
    @ResponseBody
    public String checkCName(String cname) {
        Gson gson = new Gson();
        Map<String, Boolean> map = new HashMap<>();
        map.put("valid", commodityService.checkCName(cname));
        String str = gson.toJson(map).toString();
        return str;
    }

    @RequestMapping(value = "/qrysplb.do", method = RequestMethod.GET)
    public String qrySPBL(HttpServletRequest request, String page, String pageSize) {
        if (!"".equals(page) && !"".equals(pageSize)) {
            Commodity comm = pageMethod(page, pageSize, new Commodity());
            comm.setCstatus(SSMSKey.COMM_STATUS_NORMAL);
            request.setAttribute("list", getCommList(comm));
            request.setAttribute("pageCount", PageUtil.getPageCount(getRowCount(new Commodity(SSMSKey.COMM_STATUS_NORMAL)), pageSize));
            request.setAttribute("page", page);
        }
        return "splb";
    }

    //Commodity放入回收站
    @RequestMapping("/removecomm")
    public String removeComm(Commodity commodity, String page, String pageSize, HttpServletRequest request) {
        if (!(MyUtil.isEmpty(page) || MyUtil.isEmpty(pageSize))) {
            if (!MyUtil.isEmpty(commodity)) {
                commodity = pageMethod(page, pageSize, commodity);
                commodity.setCstatus(SSMSKey.COMM_STATUS_REMOVE);
                commodityService.removeComm(commodity);
                request.setAttribute("pageCount", PageUtil.getPageCount(getRowCount(new Commodity()), pageSize));
                commodity = pageMethod(page, pageSize, commodity);
                commodity.setCstatus(SSMSKey.COMM_STATUS_NORMAL);
                request.setAttribute("list", getCommRmList(commodity));
                request.setAttribute("page", page);
                //request.setAttribute("pageSize", pageSize);
            }
        }
        return "splb";
    }

    //Commodity彻底删除
    @RequestMapping("/delsplb.do")
    public String delSPBL(HttpServletRequest request, String page, String pageSize, String comid) {
        if (!"".equals(page) && !"".equals(pageSize)) {
            if (!"".equals(comid)) {
                Commodity comm = pageMethod(page, pageSize, new Commodity());
                comm.setComid(Integer.parseInt(comid));
                commodityService.delComm(comm);
                comm.setCstatus(SSMSKey.COMM_STATUS_REMOVE);
                request.setAttribute("list", getCommList(comm));
                request.setAttribute("pageCount", PageUtil.getPageCount(getRowCount(comm), pageSize));
                request.setAttribute("page", page);
                request.setAttribute("pageSize", pageSize);
            }
        }
        return "sphsz";
    }

    @RequestMapping("/updsplb.do")
    public String updSPBL(Commodity commodity, HttpServletRequest request, String page, String pageSize) {
        if (!"".equals(page) && !"".equals(pageSize)) {
            commodity.setCstatus(SSMSKey.COMM_STATUS_NORMAL);
            commodity.setFinid(30);
            if (commodity != null)
                commodityService.updComm(commodity);
            Commodity comm = pageMethod(page, pageSize, new Commodity());
            comm.setCstatus(SSMSKey.COMM_STATUS_NORMAL);
            request.setAttribute("list", getCommList(comm));
            request.setAttribute("pageCount", PageUtil.getPageCount(getRowCount(new Commodity(SSMSKey.COMM_STATUS_NORMAL)), pageSize));
            request.setAttribute("page", page);
            request.setAttribute("pageSize", pageSize);
        }
        return "splb";
    }

    @RequestMapping(value = "/addsplb.do")
    @ResponseBody
    public String addSPLB(HttpServletRequest request, Commodity commodity) {
        try {
            if (!MyUtil.isEmpty(commodity)) {
                // commodity.setCprodate(Timestamp.valueOf(cprodatex + " 00:00:00"));
                Commodity commodity1 = commodityService.addComm(commodity);
            }
        } catch (Exception e) {
            e.printStackTrace();
            return "0";
        }
        return "1";
    }

    @RequestMapping("/qryDetail.do")
    @ResponseBody
    public Commodity qryDetail(String comid) {
        Commodity comm = new Commodity();
        if (!"".equals(comid)) {
            comm.setComid(Integer.parseInt(comid));
            comm = commodityService.qryDetail(comm);
        }
        return comm;
    }

    //获取商品集合
    public List<Commodity> getCommList(Commodity comm) {
        return commodityService.qryAllComm(comm);
    }

    //计算分页数据
    public Commodity pageMethod(String page, String pageSize, Commodity comm) {
        comm.setFirstRow(Integer.parseInt(pageSize) * Integer.parseInt(page) - Integer.parseInt(pageSize));
        comm.setPageSize(Integer.parseInt(pageSize));
        return comm;
    }

    //获取总条数
    public Integer getRowCount(Commodity commodity) {
        return commodityService.qryAllComm(commodity).size();
    }

    //获取回收站商品集合
    public List<Commodity> getCommRmList(Commodity commodity) {
        return commodityService.qryAllComm(commodity);
    }
}
