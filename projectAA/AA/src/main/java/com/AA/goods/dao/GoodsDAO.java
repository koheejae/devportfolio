package com.AA.goods.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.AA.company.vo.CompanyVO;
import com.AA.goods.vo.GoodsVO;
import com.AA.goods.vo.ImageFileVO;
import com.AA.goods.vo.ReviewVO;

public interface GoodsDAO {
	public List<GoodsVO> selectGoodsList() throws DataAccessException;
	public List<String> selectKeywordSearch(String keyword) throws DataAccessException;
	public GoodsVO selectGoodsDetail(int goods_num) throws DataAccessException;
	public List<ImageFileVO> selectGoodsDetailImage(int goods_num) throws DataAccessException;
	public List<GoodsVO> selectGoodsBySearchWord(Map paramMap) throws DataAccessException;
	public ArrayList selectGoodsListByCategory(Map paramMap) throws DataAccessException;
	public int getGoodsCountByCategory(Map paramMap)throws DataAccessException;
	public List selectReviewList(int goods_num) throws DataAccessException;
	public void addReview(ReviewVO reviewVO) throws DataAccessException;
	public CompanyVO goodsCompanyInfo(String id) throws DataAccessException;
}
