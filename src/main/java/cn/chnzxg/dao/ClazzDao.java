package cn.chnzxg.dao;

import java.util.List;

import cn.chnzxg.entity.Clazz;
import cn.chnzxg.entity.Commodity;
import cn.chnzxg.entity.Fine;

public interface ClazzDao {
	List<Clazz> qryClazz(Clazz clazz);
	List<Fine> qryFineByClazz(Clazz clazz);
	List<Commodity> qryCommByFine(Fine fine);
}
