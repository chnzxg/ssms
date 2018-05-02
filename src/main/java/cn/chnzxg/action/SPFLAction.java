package cn.chnzxg.action;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import cn.chnzxg.entity.Clazz;
import cn.chnzxg.entity.Commodity;
import cn.chnzxg.entity.Fine;
import cn.chnzxg.service.ClazzService;
import cn.chnzxg.util.MyUtil;
import cn.chnzxg.util.PageUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
@Controller
@RequestMapping("/spfl")
public class SPFLAction {
	@Resource
	private ClazzService clazzService;
	@RequestMapping("/qryspfl.do")
	public String qrySPFL(HttpServletRequest request, String page){
		List<Clazz> list = clazzService.qryClazz(new Clazz());
        request.setAttribute("listclazz", getList(list, page));
        return "spfl";
	}
	@RequestMapping("/qryfine.do")
	@ResponseBody
	public List<?> qryFine(Integer claid, String page){
		Clazz clazz = new Clazz();
		clazz.setClaid(claid);
		List<Fine> list = clazzService.qryFineByClazz(clazz);
		return getList(list, page);
	}
	@RequestMapping("/qrycomm.do")
	@ResponseBody
	public List<?> qryComm(Integer finid, String page){
		Fine fine = new Fine();
		fine.setFinid(finid);
		List<Commodity> list = clazzService.qryCommByFine(fine);
		return getList(list, page);
	}

	private List<?> getList(List<?> list, String page){
		if(!MyUtil.isEmpty(page) && !MyUtil.isEmpty(list)){
			int index = Integer.parseInt(page) - 1;
			if(list.size() <= 15)
			    list = list.subList(index, list.size());
			else
			    list = list.subList(index, index + 15);
		}
		return list;
	}
}
