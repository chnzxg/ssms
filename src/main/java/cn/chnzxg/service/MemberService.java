package cn.chnzxg.service;

import cn.chnzxg.entity.Member;

import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2018/5/2.1
 */
public interface MemberService {
    List<Member> qryMember(Map<String, Object> paramMap);
    Integer delMember(Map<String, Object> paramMap);
    Integer updMember(Map<String, Object> paramMap);
    Integer addMember(Map<String, Object> paramMap);
    List<Member> qryAllMember();
}
