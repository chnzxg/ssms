package cn.chnzxg.service.impl;

import cn.chnzxg.dao.MemberDao;
import cn.chnzxg.entity.Member;
import cn.chnzxg.service.MemberService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2018/5/2.
 */
@Service("memberServiceImpl")
public class MemberServiceImpl implements MemberService{

    @Resource
    private MemberDao memberDao;

    @Override
    public List<Member> qryMember(Map<String, Object> paramMap) {
        return memberDao.qryMember(paramMap);
    }

    @Override
    public Integer delMember(Map<String, Object> paramMap) {
        return memberDao.delMember(paramMap);
    }

    @Override
    public Integer updMember(Map<String, Object> paramMap) {
        return memberDao.updMember(paramMap);
    }

    @Override
    public Integer addMember(Map<String, Object> paramMap) {
        return memberDao.addMember(paramMap);
    }
}
