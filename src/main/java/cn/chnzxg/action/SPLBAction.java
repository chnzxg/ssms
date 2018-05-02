package cn.chnzxg.action;

import cn.chnzxg.entity.Commodity;
import cn.chnzxg.service.CommodityService;
import cn.chnzxg.util.MyUtil;
import cn.chnzxg.util.PageUtil;
import cn.chnzxg.util.SSMSKey;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.sql.Timestamp;
import java.util.List;

@Controller
@RequestMapping("/splb")
public class SPLBAction {
	@Resource
	private CommodityService commodityService;

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

	@RequestMapping(value = "/sphsz", method = RequestMethod.GET)
	public String getSPHSZ(HttpServletRequest request, String page, String pageSize, Commodity commodity) {
		if (!(MyUtil.isEmpty(page) || MyUtil.isEmpty(pageSize))) {
			commodity = pageMethod(page, pageSize, commodity);
			request.setAttribute("list", getCommRmList(commodity));
			request.setAttribute("pageCount", PageUtil.getPageCount(getRowCount(new Commodity()), pageSize));
			request.setAttribute("page", page);
		}
		return "sphsz";
	}
	//Commodity放入回收站
	@RequestMapping("/removecomm")
	public String removeComm(Commodity commodity, String page, String pageSize ,HttpServletRequest request) {
		if (!(MyUtil.isEmpty(page) || MyUtil.isEmpty(pageSize))) {
			if (!MyUtil.isEmpty(commodity)) {
				commodity = pageMethod(page, pageSize, commodity);
				commodity.setCstatus(SSMSKey.COMM_STATUS_REMOVE);
				commodityService.removeComm(commodity);
				request.setAttribute("pageCount", PageUtil.getPageCount(getRowCount(new Commodity()),pageSize));
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
	public String delSPBL(HttpServletRequest request,String page,String pageSize,String comid){
		if(!"".equals(page)&&!"".equals(pageSize)){
			if(!"".equals(comid)){
				Commodity comm = pageMethod(page, pageSize, new Commodity());
				comm.setComid(Integer.parseInt(comid));
				commodityService.delComm(comm);
				comm.setCstatus(SSMSKey.COMM_STATUS_REMOVE);
				request.setAttribute("list", getCommList(comm));
				request.setAttribute("pageCount", PageUtil.getPageCount(getRowCount(comm),pageSize));
				request.setAttribute("page", page);
				request.setAttribute("pageSize", pageSize);
			}
		}
		return "sphsz";
	}
	@RequestMapping("/updsplb.do")
	@ResponseBody
	public String updSPBL(Integer comid,Integer finid,Integer cweight,Integer cstock,String cname,String fname,String cspec,Integer month,Double cprice,String cproder,String ccode,String cdesc,String date,HttpServletRequest request,String page,String pageSize){
		try{
			if(!"".equals(page)&&!"".equals(pageSize)){
				Commodity comm = pageMethod(page, pageSize, new Commodity(comid, cname, finid, fname, cspec, month, cweight, cprice, cproder, Timestamp.valueOf(date+" 00:00:00"), ccode, cstock, cdesc));
				if(comm!=null)
					commodityService.updComm(comm);
				request.setAttribute("list", getCommList(comm));
				request.setAttribute("pageCount", PageUtil.getPageCount(getRowCount(new Commodity(SSMSKey.COMM_STATUS_NORMAL)),pageSize));
				request.setAttribute("page", page);
				request.setAttribute("pageSize", pageSize);
			}
		}catch (Exception e){
			return "0";
		}
		return "1";
	}
	@RequestMapping("/addsplb.do")
	@ResponseBody
	public String addSPLB(String cprodatex, Commodity commodity){
		try{
		    if(!MyUtil.isEmpty(cprodatex) && !MyUtil.isEmpty(commodity)) {
                commodity.setCprodate(Timestamp.valueOf(cprodatex + " 00:00:00"));
                commodityService.addComm(commodity);
            }
		}catch (Exception e){
		    e.printStackTrace();
			return "0";
		}
		return "1";
	}
	@RequestMapping("/qryDetail.do")
	@ResponseBody
	public Commodity qryDetail(String comid){
		Commodity comm = new Commodity();
		if(!"".equals(comid)){
			comm.setComid(Integer.parseInt(comid));
			comm = commodityService.qryDetail(comm);
		}
		return comm;
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
		return commodityService.qryAllComm(commodity).size();
	}

	//获取回收站商品集合
	public List<Commodity> getCommRmList(Commodity commodity){
		return commodityService.qryAllComm(commodity);
	}
}
