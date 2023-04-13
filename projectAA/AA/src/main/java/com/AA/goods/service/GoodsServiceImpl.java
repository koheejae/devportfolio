package com.AA.goods.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.AA.company.vo.CompanyVO;
import com.AA.goods.dao.GoodsDAO;
import com.AA.goods.vo.GoodsVO;
import com.AA.goods.vo.ImageFileVO;
import com.AA.goods.vo.ReviewVO;

@Service("goodsService")
@Transactional(propagation=Propagation.REQUIRED)
public class GoodsServiceImpl implements GoodsService{
	@Autowired
	private GoodsDAO goodsDAO;
	
	public List<GoodsVO> listGoods() throws Exception {
		List<GoodsVO> goodsList=goodsDAO.selectGoodsList();
		goodsList=goodsDAO.selectGoodsList();
		
		return goodsList;
	}
	
	public Map goodsDetail(int _goods_num) throws Exception {
		Map goodsMap=new HashMap();
		GoodsVO goodsVO = goodsDAO.selectGoodsDetail(_goods_num);
		goodsMap.put("goodsVO", goodsVO);
		List<ImageFileVO> imageList =goodsDAO.selectGoodsDetailImage(_goods_num);
		goodsMap.put("imageList", imageList);
		return goodsMap;
	}
	
	public List<String> keywordSearch(String keyword) throws Exception {
		List<String> list=goodsDAO.selectKeywordSearch(keyword);
		return list;
	}
	
	public List<GoodsVO> searchGoods(Map paramMap) throws Exception{
		List goodsList=goodsDAO.selectGoodsBySearchWord(paramMap);
		return goodsList;
	}
	public List<GoodsVO> getGoodsListByCategory(Map paramMap) throws Exception{
		List goodsList=goodsDAO.selectGoodsListByCategory(paramMap);
		return goodsList;
	}
	public int getTotalCountByCategory(Map paramMap)throws Exception{
		int totalCount=goodsDAO.getGoodsCountByCategory(paramMap);
		return totalCount;
	}
	@Override
	public List<ReviewVO> reviewList(int goods_num) throws Exception {
		List reviewList = goodsDAO.selectReviewList(goods_num);
		return reviewList;
	}

	@Override
	public void addReview(ReviewVO reviewVO) throws Exception {
		goodsDAO.addReview(reviewVO);
		
	}

	@Override
	public CompanyVO goodsCompanyInfo(String id) throws Exception {
		CompanyVO companyVO = goodsDAO.goodsCompanyInfo(id);
		return companyVO;
	}
	
	
	
}
