package cn.chnzxg.service.impl;

import java.util.List;

import javax.annotation.Resource;

import cn.chnzxg.dao.ClazzDao;
import cn.chnzxg.entity.Clazz;
import cn.chnzxg.entity.Commodity;
import cn.chnzxg.entity.Fine;
import cn.chnzxg.service.ClazzService;
import org.springframework.stereotype.Service;
@Service("clazzServiceImpl")
public class ClazzServiceImpl implements ClazzService{
	@Resource
	private ClazzDao clazzDao;
	public List<Clazz> qryClazz(Clazz clazz) {
		return clazzDao.qryClazz(clazz);
	}
	public List<Fine> qryFineByClazz(Clazz clazz) {
		return clazzDao.qryFineByClazz(clazz);
	}
	public List<Commodity> qryCommByFine(Fine fine) {
		return clazzDao.qryCommByFine(fine);
	}
}
