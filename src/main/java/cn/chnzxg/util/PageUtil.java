package cn.chnzxg.util;

import java.util.HashMap;
import java.util.Map;

public class PageUtil {
	public static Integer getPageCount(Integer count,String pageSize){
		Integer pageCount = count/Integer.parseInt(pageSize);
		if(count%Integer.parseInt(pageSize)!=0)
			pageCount++;
		return pageCount;
		
	}

	public static Map<String, Object> getParamMap(Object type, String page ,String pageSize){
		if(MyUtil.isEmpty(type) || MyUtil.isEmpty(page) || MyUtil.isEmpty(pageSize))
			throw new RuntimeException("分页数据出错，请稍后重试！");
		Map<String, Object> paramMap = new HashMap<>();
		Integer firstRow = Integer.parseInt(pageSize)*Integer.parseInt(page)-Integer.parseInt(pageSize);
		Integer pageSizeInt = Integer.parseInt(pageSize);
		paramMap.put("firstRow", firstRow);
		paramMap.put("pageSize", pageSizeInt);
		paramMap.put(type.getClass().getSimpleName(), type);
		return paramMap;
	}
}
