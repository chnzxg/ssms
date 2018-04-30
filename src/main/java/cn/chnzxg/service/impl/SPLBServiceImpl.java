package cn.chnzxg.service.impl;

import java.util.List;

import javax.annotation.Resource;

import cn.chnzxg.dao.CommodityDao;
import cn.chnzxg.entity.Commodity;
import cn.chnzxg.service.SPLBService;
import org.springframework.stereotype.Service;
@Service("sPLBServiceImpl")
public class SPLBServiceImpl implements SPLBService {
	@Resource
	private CommodityDao commodityDao;
	public List<Commodity> qryAllComm(Commodity comm) {
		return commodityDao.qryAllComm(comm);
	}

	public Integer delComm(Commodity comm) {
		return commodityDao.delComm(comm);
	}

	public Integer updComm(Commodity comm) {
		return commodityDao.updComm(comm);
	}

	public Integer addComm(Commodity comm) {
		return commodityDao.addComm(comm);
	}

	public Commodity qryDetail(Commodity comm) {
		return commodityDao.qryDetail(comm);
	}

	public void removeComm(Commodity commodity) {
		commodityDao.removeComm(commodity);
	}

}
