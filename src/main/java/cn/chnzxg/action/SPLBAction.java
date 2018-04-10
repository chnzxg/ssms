package cn.chnzxg.action;

import cn.chnzxg.entity.Commodity;
import cn.chnzxg.service.SPLBService;
import cn.chnzxg.util.PageUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.sql.Timestamp;
import java.util.List;

@Controller
@RequestMapping("/splb")
public class SPLBAction {
	@Resource
	private SPLBService sPLBService;
	@RequestMapping("/qrysplb.do")
	public String qrySPBL(HttpServletRequest request,String page,String pageSize){
		if(!"".equals(page)&&!"".equals(pageSize)){
			Commodity comm = pageMethod(page, pageSize, new Commodity());
			List<Commodity> list = getCommList(comm);
			list.size();
			request.setAttribute("list", getCommList(comm));
			request.setAttribute("pageCount", PageUtil.getPageCount(getRowCount(),pageSize));
			request.setAttribute("page", page);
		}
		return "splb";
	}
	@RequestMapping("/delsplb.do")
	public String delSPBL(HttpServletRequest request,String page,String pageSize,String comid){
		if(!"".equals(page)&&!"".equals(pageSize)){
			if(!"".equals(comid)){
				Commodity comm = pageMethod(page, pageSize, new Commodity());
				comm.setComid(Integer.parseInt(comid));
				sPLBService.delComm(comm);
				request.setAttribute("list", getCommList(comm));
				request.setAttribute("pageCount", PageUtil.getPageCount(getRowCount(),pageSize));
				request.setAttribute("page", page);
				request.setAttribute("pageSize", pageSize);
			}
		}
		return "splb";
	}
	@RequestMapping("/updsplb.do")
	public String updSPBL(Integer comid,Integer finid,Integer cweight,Integer cstock,String cname,String fname,String cspec,Integer month,Double cprice,String cproder,String ccode,String cdesc,String date,HttpServletRequest request,String page,String pageSize){
		if(!"".equals(page)&&!"".equals(pageSize)){
			Commodity comm = pageMethod(page, pageSize, new Commodity(comid, cname, finid, fname, cspec, month, cweight, cprice, cproder, Timestamp.valueOf(date+" 00:00:00"), ccode, cstock, cdesc));
			if(comm!=null)
				sPLBService.updComm(comm);
			request.setAttribute("list", getCommList(comm));
			request.setAttribute("pageCount", PageUtil.getPageCount(getRowCount(),pageSize));
			request.setAttribute("page", page);
			request.setAttribute("pageSize", pageSize);
		}
		return "splb";
	}
	@RequestMapping("/addsplb.do")
	public String addSPLB(HttpServletRequest request,Commodity comm,String pageSize){
		if(comm!=null)
			sPLBService.addComm(comm);
		request.setAttribute("list", getCommList(new Commodity()));
		request.setAttribute("pageCount", PageUtil.getPageCount(getRowCount(),pageSize));
		request.setAttribute("pageSize", pageSize);
		return "splb";
	}
	@RequestMapping("/qryDetail.do")
	@ResponseBody
	public Commodity qryDetail(String comid){
		Commodity comm = new Commodity();
		if(!"".equals(comid)){
			comm.setComid(Integer.parseInt(comid));
			comm = sPLBService.qryDetail(comm);
		}
		return comm;
	}
	//获取商品集合
	public List<Commodity> getCommList(Commodity comm){
		return sPLBService.qryAllComm(comm);
	}
	//计算分页数据
	public Commodity pageMethod(String page,String pageSize,Commodity comm){
		comm.setFirstRow(Integer.parseInt(pageSize)*Integer.parseInt(page)-Integer.parseInt(pageSize));
		comm.setPageSize(Integer.parseInt(pageSize));
		return comm;
	}
	//获取总条数
	public Integer getRowCount(){
		return sPLBService.qryAllComm(new Commodity()).size();
	}
}
