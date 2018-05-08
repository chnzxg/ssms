package cn.chnzxg.service;

import cn.chnzxg.entity.Form;

import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2018/5/8.
 */
public interface FormService {
    List<Form> qryForm(Map<String, Object> paramMap);
    Integer updFrom(Map<String, Object> paramMap);
    Integer addFrom(Map<String, Object> paramMap);
}
