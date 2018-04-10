package cn.chnzxg.dao;

import java.util.List;

import cn.chnzxg.entity.Commodity;


public interface CommodityDao {
	public List<Commodity> qryAllComm(Commodity comm);
	public Integer delComm(Commodity comm);
	public Integer updComm(Commodity comm);
	public Integer addComm(Commodity comm);
	public Commodity qryDetail(Commodity comm);
}
