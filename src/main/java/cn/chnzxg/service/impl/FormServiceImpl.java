package cn.chnzxg.service.impl;

import cn.chnzxg.dao.FormDao;
import cn.chnzxg.entity.Form;
import cn.chnzxg.service.FormService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2018/5/8.
 */
@Service(value = "formServiceImpl")
public class FormServiceImpl implements FormService {

    @Resource
    private FormDao formDao;

    @Override
    public List<Form> qryForm(Map<String, Object> paramMap) {
        return formDao.qryForm(paramMap);
    }

    @Override
    public Integer updFrom(Map<String, Object> paramMap) {
        return formDao.updFrom(paramMap);
    }

    @Override
    public Integer addFrom(Map<String, Object> paramMap) {
        return formDao.addFrom(paramMap);
    }
}
