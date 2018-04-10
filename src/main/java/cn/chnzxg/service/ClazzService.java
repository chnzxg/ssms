package cn.chnzxg.service;

import java.util.List;

import cn.chnzxg.entity.Clazz;
import cn.chnzxg.entity.Commodity;
import cn.chnzxg.entity.Fine;

public interface ClazzService {
	public List<Clazz> qryClazz(Clazz clazz);
	public List<Fine> qryFineByClazz(Clazz clazz);
	public List<Commodity> qryCommByFine(Fine fine);
}
