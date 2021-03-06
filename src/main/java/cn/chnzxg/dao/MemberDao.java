package cn.chnzxg.dao;

import cn.chnzxg.entity.Member;

import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2018/5/2.
 */
public interface MemberDao {
    List<Member> qryMember(Map<String, Object> paramMap);
    Integer delMember(Map<String, Object> paramMap);
    Integer updMember(Map<String, Object> paramMap);
    Integer addMember(Map<String, Object> paramMap);
    List<Member> qryAllMember();
    List<Member> checkMName(String mname);
}
