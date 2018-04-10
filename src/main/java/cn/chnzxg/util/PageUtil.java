package cn.chnzxg.util;

public class PageUtil {
	public static Integer getPageCount(Integer count,String pageSize){
		Integer pageCount = count/Integer.parseInt(pageSize);
		if(count%Integer.parseInt(pageSize)!=0)
			pageCount++;
		return pageCount;
		
	}
}
