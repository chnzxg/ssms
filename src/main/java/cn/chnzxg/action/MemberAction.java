package cn.chnzxg.action;

import cn.chnzxg.entity.Member;
import cn.chnzxg.service.MemberService;
import cn.chnzxg.util.MyUtil;
import cn.chnzxg.util.PageUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2018/5/2.
 */
@Controller
@RequestMapping(value = "/member")
public class MemberAction {

    @Resource
    MemberService memberService;

    @RequestMapping(value = "/qrymember.do", method = RequestMethod.GET)
    public String getMembers(HttpServletRequest request, String page, String pageSize, Member member){
        getMembers(member, page, pageSize, request);
        return "HYLB";
    }

    @RequestMapping(value = "/delmember.do", method = RequestMethod.DELETE)
    public String delMembers(HttpServletRequest request, String page, String pageSize, Member member){
        Map<String, Object> delParamMap = new HashMap<>();
        delParamMap.put("member", member);
        memberService.delMember(delParamMap);
        getMembers(member, page, pageSize, request);
        return "HYLB";
    }

    private void getMembers(Member member, String page, String pageSize,HttpServletRequest request){
        Map<String, Object> paramMap = PageUtil.getParamMap(member, page, pageSize);
        List<Member> members = memberService.qryMember(paramMap);
        request.setAttribute("members", members);
        request.setAttribute("page", page);
        request.setAttribute("pageSize", pageSize);
    }

}
