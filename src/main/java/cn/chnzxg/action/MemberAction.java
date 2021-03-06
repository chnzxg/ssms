package cn.chnzxg.action;

import cn.chnzxg.entity.Member;
import cn.chnzxg.service.MemberService;
import cn.chnzxg.util.MyUtil;
import cn.chnzxg.util.PageUtil;
import com.google.gson.Gson;
import org.apache.ibatis.annotations.ResultMap;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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

    @RequestMapping(value = "/checkmname.do", method = RequestMethod.POST)
    @ResponseBody
    public String checkMName(String mname) {
        Gson gson = new Gson();
        Map<String, Boolean> map = new HashMap<>();
        map.put("valid", memberService.checkMName(mname));
        String str = gson.toJson(map).toString();
        return str;
    }

    @RequestMapping(value = "/qrymember.do", method = RequestMethod.GET)
    public String getMembers(HttpServletRequest request, String page, String pageSize, Member member) {
        if (member != null || member.getMlevel() == -1)
            member.setMlevel(null);
        getMembers(member, page, pageSize, request);
        return "hylb";
    }

    @RequestMapping(value = "/delmember.do", method = RequestMethod.GET)
    public String delMembers(HttpServletRequest request, String page, String pageSize, Member member) {
        Map<String, Object> delParamMap = new HashMap<>();
        delParamMap.put("member", member);
        Integer i = memberService.delMember(delParamMap);
        getMembers(member, page, pageSize, request);
        return "hylb";
    }

    @RequestMapping(value = "/updmember.do", method = RequestMethod.GET)
    public String updMembers(HttpServletRequest request, String page, String pageSize, Member member) {
        if (!MyUtil.isEmpty(member)) {
            memberService.updMember(MyUtil.beanToMap(member));
        }
        getMembers(member, page, pageSize, request);
        return "hylb";
    }

    @RequestMapping(value = "/addmember.do", method = RequestMethod.POST)
    @ResponseBody
    public Integer addMembers(Member member) {
        try {
            if (!MyUtil.isEmpty(member)) {
                memberService.addMember(MyUtil.beanToMap(member));
            }
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
        return 1;
    }

    private void getMembers(Member member, String page, String pageSize, HttpServletRequest request) {
        Map<String, Object> paramMap = PageUtil.getParamMap(member, page, pageSize);
        paramMap.put("mname", member.getMname());
        paramMap.put("mtel", member.getMtel());
        paramMap.put("mlevel", member.getMlevel());
        List<Member> members = memberService.qryMember(paramMap);
        request.setAttribute("members", members);
        request.setAttribute("page", page);
        request.setAttribute("pageSize", pageSize);
        request.setAttribute("pageCount", getPageCount(member, pageSize));
    }

    private Integer getPageCount(Member member, String pageSize) {
        List<Member> members = memberService.qryAllMember();
        return PageUtil.getPageCount(members.size(), pageSize);
    }

}
