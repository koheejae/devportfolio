package com.AA.mypage.dao;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.AA.company.vo.CompanyVO;
import com.AA.goods.vo.GoodsVO;
import com.AA.member.vo.MemberVO;
import com.AA.order.vo.OrderVO;

@Repository("myPageDAO")
public class MyPageDAOImpl implements MyPageDAO{
	@Autowired
	private SqlSession sqlSession;
	
	public List<OrderVO> selectMyOrderGoodsList(String member_id) throws DataAccessException{
		List<OrderVO> orderGoodsList=(List)sqlSession.selectList("mapper.mypage.selectMyOrderGoodsList",member_id);
		return orderGoodsList;
	}
	@Override
	public int deleteMember(String login_id) throws DataAccessException {
		int result = sqlSession.delete("mapper.mypage.deleteMember", login_id);
		return result;
	}
	public List selectMyOrderInfo(String order_id) throws DataAccessException{
		List myOrderList=(List)sqlSession.selectList("mapper.mypage.selectMyOrderInfo",order_id);
		return myOrderList;
	}	

	public List<OrderVO> selectMyOrderHistoryList(Map dateMap) throws DataAccessException{
		List<OrderVO> myOrderHistList=(List)sqlSession.selectList("mapper.mypage.selectMyOrderHistoryList",dateMap);
		return myOrderHistList;
	}
	
	public void updateMyInfo(Map memberMap) throws DataAccessException{
		sqlSession.update("mapper.mypage.updateMyInfo",memberMap);
	}
	public void updateComInfo(Map memberMap) throws DataAccessException{
		sqlSession.update("mapper.mypage.updateComInfo",memberMap);
	}
	
	public MemberVO selectMyDetailInfo(String id) throws DataAccessException{
		MemberVO memberVO=(MemberVO)sqlSession.selectOne("mapper.mypage.selectMyDetailInfo",id);
		return memberVO;
		
	}
	public CompanyVO selectComDetailInfo(String id) throws DataAccessException{
		CompanyVO CompanyVO=(CompanyVO)sqlSession.selectOne("mapper.mypage.selectComDetailInfo",id);
		return CompanyVO;
		
	}
	
	public void updateMyOrderCancel(String order_id) throws DataAccessException{
		sqlSession.update("mapper.mypage.updateMyOrderCancel",order_id);
	}
	@Override
	public List<OrderVO> myOrderCheck(OrderVO orderVO) throws Exception {
		List<OrderVO> orderList =(List)sqlSession.selectList("mapper.mypage.myOrderCheck",orderVO);
		return orderList;
	}
	@Override
	public List<GoodsVO> myGoodsOrderCheck(List<OrderVO> myGoodsOrderList) throws Exception {
		List<GoodsVO> myGoodsList;
		myGoodsList = sqlSession.selectList("mapper.mypage.myGoodsOrderCheck", myGoodsOrderList);
		return myGoodsList;
	}
}
