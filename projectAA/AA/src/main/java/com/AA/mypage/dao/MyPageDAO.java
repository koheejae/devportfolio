package com.AA.mypage.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.AA.company.vo.CompanyVO;
import com.AA.goods.vo.GoodsVO;
import com.AA.member.vo.MemberVO;
import com.AA.order.vo.OrderVO;

public interface MyPageDAO {
	public List<OrderVO> selectMyOrderGoodsList(String member_id) throws DataAccessException;
	public List selectMyOrderInfo(String order_id) throws DataAccessException;
	public List<OrderVO> selectMyOrderHistoryList(Map dateMap) throws DataAccessException;
	public void updateMyInfo(Map memberMap) throws DataAccessException;
	public void updateComInfo(Map memberMap) throws DataAccessException;
	public void updateMyOrderCancel(String order_id) throws DataAccessException;
	public int deleteMember(String login_id) throws DataAccessException;
	public MemberVO selectMyDetailInfo(String id) throws DataAccessException;
	public CompanyVO selectComDetailInfo(String id) throws DataAccessException;
	public List<OrderVO> myOrderCheck(OrderVO orderVO) throws Exception;
	public List<GoodsVO> myGoodsOrderCheck(List<OrderVO> myPageList) throws Exception;

}
