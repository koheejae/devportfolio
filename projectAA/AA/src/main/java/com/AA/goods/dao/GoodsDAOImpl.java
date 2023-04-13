package com.AA.goods.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.AA.company.vo.CompanyVO;
import com.AA.goods.vo.GoodsVO;
import com.AA.goods.vo.ImageFileVO;
import com.AA.goods.vo.ReviewVO;

@Repository("goodsDAO")
public class GoodsDAOImpl  implements GoodsDAO{
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<GoodsVO> selectGoodsList() throws DataAccessException {
		List<GoodsVO> goodsList=(ArrayList)sqlSession.selectList("mapper.goods.selectGoodsList","*");
	   return goodsList;	
     
	}
	@Override
	public List<String> selectKeywordSearch(String keyword) throws DataAccessException {

	   List<String> list=(ArrayList)sqlSession.selectList("mapper.goods.selectKeywordSearch",keyword);
	   return list;
	}

	@Override
	public ArrayList selectGoodsBySearchWord(Map paramMap) throws DataAccessException{
		ArrayList list=(ArrayList)sqlSession.selectList("mapper.goods.selectGoodsBySearchWord",paramMap);
		 return list;
	}
	@Override
	public ArrayList selectGoodsListByCategory(Map paramMap) throws DataAccessException{
		ArrayList list=(ArrayList)sqlSession.selectList("mapper.goods.selectGoodsListByCategory",paramMap);
		return list;
	}
	
	@Override
	public GoodsVO selectGoodsDetail(int goods_num) throws DataAccessException{
		GoodsVO goodsVO=(GoodsVO)sqlSession.selectOne("mapper.goods.selectGoodsDetail",goods_num);
		return goodsVO;
	}
	
	@Override
	public List<ImageFileVO> selectGoodsDetailImage(int goods_num) throws DataAccessException{
		List<ImageFileVO> imageList=(ArrayList)sqlSession.selectList("mapper.goods.selectGoodsDetailImage",goods_num);
		return imageList;
	}
	public int getGoodsCountByCategory(Map paramMap)throws DataAccessException{
		int totalCount = sqlSession.selectOne("mapper.goods.getGoodsCountByCategory",paramMap);
		return totalCount;
	}
	@Override
	public List selectReviewList(int goods_num) throws DataAccessException {
		List<ReviewVO> reviewList = sqlSession.selectList("mapper.goods.selectReviewList", goods_num);
		return reviewList;
	}
	@Override
	public void addReview(ReviewVO reviewVO) throws DataAccessException {
		sqlSession.selectOne("mapper.goods.insertReview", reviewVO);
		
	}
	@Override
	public CompanyVO goodsCompanyInfo(String id) throws DataAccessException {
		CompanyVO companyVO = sqlSession.selectOne("mapper.member.goodsCompanyInfo", id);
		return companyVO;
	}
}
