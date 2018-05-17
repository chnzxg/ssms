package cn.chnzxg.action;

import cn.chnzxg.entity.Form;
import cn.chnzxg.service.FormService;
import cn.chnzxg.util.MyUtil;
import cn.chnzxg.util.PageUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2018/5/8.
 */
@RequestMapping(value = "/form")
@Controller
public class FormAction {

    @Resource
    private FormService formService;

    @RequestMapping(value = "/qryform.do", method = RequestMethod.GET)
    public String qryForm(HttpServletRequest request, Form form, String page, String pageSize){
        getForms(form, page, pageSize, request);
        request.setAttribute("form", form);
        return "ddlb";
    }

    @RequestMapping(value = "/updform.do", method = RequestMethod.GET)
    public String updFrom(HttpServletRequest request, Form form, String page, String pageSize){
        formService.updFrom(MyUtil.beanToMap(form));
        form.setFstatus(null);
        getForms(form, page, pageSize, request);
        return "ddlb";
    }

    @RequestMapping(value = "/addform.do", method = RequestMethod.POST)
    public String addFrom(){
        return null;
    }

    private void getForms(Form form, String page, String pageSize, HttpServletRequest request){
        Map<String, Object> paramMap = PageUtil.getParamMap(form, page, pageSize);
        paramMap.put("cname", form.getCname());
        paramMap.put("mname", form.getMname());
        paramMap.put("fstatus", form.getFstatus());
        List<Form> forms = formService.qryForm(paramMap);
        request.setAttribute("forms", forms);
        request.setAttribute("page", page);
        request.setAttribute("pageSize", pageSize);
        request.setAttribute("pageCount", getPageCount(form, pageSize));
    }

    private Integer getPageCount(Form form, String pageSize){
        Map<String, Object> paramMap = MyUtil.beanToMap(form);
        List<Form> forms = formService.qryForm(paramMap);
        return PageUtil.getPageCount(forms.size(), pageSize);
    }
}
