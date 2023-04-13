package com.AA.goods.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.AA.company.vo.CompanyVO;
import com.AA.goods.vo.GoodsVO;
import com.AA.goods.vo.ReviewVO;

public interface GoodsService {
	
	public List<GoodsVO> listGoods() throws Exception;
	public Map goodsDetail(int _goods_num) throws Exception;
	public List<String> keywordSearch(String keyword) throws Exception;
	public List<GoodsVO> searchGoods(Map paramMap) throws Exception;
	public List<GoodsVO> getGoodsListByCategory(Map paramMap) throws Exception;
	public int getTotalCountByCategory(Map paramMap)throws Exception;
	public void addReview(ReviewVO reviewVO) throws Exception;
	public List<ReviewVO> reviewList(int goods_num) throws Exception;
	public CompanyVO goodsCompanyInfo(String id) throws Exception;
}
