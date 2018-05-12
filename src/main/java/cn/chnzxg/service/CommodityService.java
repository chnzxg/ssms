package cn.chnzxg.service;

import java.util.List;

import javax.annotation.Resource;

import cn.chnzxg.dao.CommodityDao;
import cn.chnzxg.entity.Commodity;
import org.springframework.stereotype.Service;


public interface CommodityService {
	boolean checkCName(String cname);
	List<Commodity> qryAllComm(Commodity comm);
	Integer delComm(Commodity comm);
	Integer updComm(Commodity comm);
	Commodity addComm(Commodity comm);
	Commodity qryDetail(Commodity comm);
	void removeComm(Commodity commodity);
	void recComm(Integer comid);
}
