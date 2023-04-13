package com.AA.mypage.service;

import java.util.List;
import java.util.Map;

import com.AA.company.vo.CompanyVO;
import com.AA.member.vo.MemberVO;
import com.AA.order.vo.OrderVO;

public interface MyPageService{
	public List<OrderVO> listMyOrderGoods(String member_id) throws Exception;
	public List findMyOrderInfo(String order_id) throws Exception;
	public List<OrderVO> listMyOrderHistory(Map dateMap) throws Exception;
	public MemberVO  modifyMyInfo(Map memberMap) throws Exception;
	public CompanyVO  modifyComInfo(Map memberMap) throws Exception;
	public void cancelOrder(String order_id) throws Exception;
	public int deleteMember(String login_id) throws Exception;
	public MemberVO myDetailInfo(String id) throws Exception;
	public CompanyVO comDetailInfo(String id) throws Exception;
	public Map<String,List> myOrderCheck(OrderVO orderVO) throws Exception;

}
