package cn.chnzxg.service;

import java.util.List;

import javax.annotation.Resource;

import cn.chnzxg.dao.CommodityDao;
import cn.chnzxg.entity.Commodity;
import org.springframework.stereotype.Service;


public interface SPLBService {
	public List<Commodity> qryAllComm(Commodity comm);
	public Integer delComm(Commodity comm);
	public Integer updComm(Commodity comm);
	public Integer addComm(Commodity comm);
	public Commodity qryDetail(Commodity comm);
}
