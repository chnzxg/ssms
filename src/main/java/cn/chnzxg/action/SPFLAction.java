package cn.chnzxg.action;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import cn.chnzxg.entity.Clazz;
import cn.chnzxg.entity.Commodity;
import cn.chnzxg.entity.Fine;
import cn.chnzxg.service.ClazzService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
@Controller
@RequestMapping("/spfl")
public class SPFLAction {
	@Resource
	private ClazzService clazzService;
	@RequestMapping("/qryspfl.do")
	public String qrySPFL(HttpServletRequest request){
		request.setAttribute("listclazz", clazzService.qryClazz(new Clazz()));
		return "spfl";
	}
	@RequestMapping("/qryfine.do")
	@ResponseBody
	public List<Fine> qryFine(Integer claid){
		Clazz clazz = new Clazz();
		clazz.setClaid(claid);
		List<Fine> list = clazzService.qryFineByClazz(clazz);
		return list;
	}
	@RequestMapping("/qrycomm.do")
	@ResponseBody
	public List<Commodity> qryComm(Integer finid){
		Fine fine = new Fine();
		fine.setFinid(finid);
		List<Commodity> list = clazzService.qryCommByFine(fine);
		return list;
	}
}
