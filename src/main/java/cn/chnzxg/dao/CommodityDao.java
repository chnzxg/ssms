package cn.chnzxg.dao;

import java.util.List;

import cn.chnzxg.entity.Commodity;


public interface CommodityDao {
	List<Commodity> checkCName(String cname);
	List<Commodity> qryAllComm(Commodity comm);
	Integer delComm(Commodity comm);
	Integer updComm(Commodity comm);
	Integer addComm(Commodity comm);
	Commodity qryDetail(Commodity comm);
	void removeComm(Commodity commodity);
	void recComm(Integer comid);
}
