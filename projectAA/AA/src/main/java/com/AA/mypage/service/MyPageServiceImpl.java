package com.AA.mypage.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.AA.company.vo.CompanyVO;
import com.AA.goods.vo.GoodsVO;
import com.AA.member.vo.MemberVO;
import com.AA.mypage.dao.MyPageDAO;
import com.AA.order.vo.OrderVO;

@Service("myPageService")
@Transactional(propagation=Propagation.REQUIRED)
public class MyPageServiceImpl  implements MyPageService{
	@Autowired
	private MyPageDAO myPageDAO;

	public List<OrderVO> listMyOrderGoods(String member_id) throws Exception{
		return myPageDAO.selectMyOrderGoodsList(member_id);
	}
	
	public List findMyOrderInfo(String order_id) throws Exception{
		return myPageDAO.selectMyOrderInfo(order_id);
	}
	@Override
	public int deleteMember(String login_id) throws Exception {
		return myPageDAO.deleteMember(login_id);
	}
	public List<OrderVO> listMyOrderHistory(Map dateMap) throws Exception{
		return myPageDAO.selectMyOrderHistoryList(dateMap);
	}
	
	public MemberVO  modifyMyInfo(Map memberMap) throws Exception{
		 String id=(String)memberMap.get("id");
		 myPageDAO.updateMyInfo(memberMap);
		 return myPageDAO.selectMyDetailInfo(id);
	}
	public CompanyVO modifyComInfo(Map memberMap) throws Exception{
		String id=(String)memberMap.get("id");
		myPageDAO.updateComInfo(memberMap);
		return myPageDAO.selectComDetailInfo(id);
	}
	
	public void cancelOrder(String order_id) throws Exception{
		myPageDAO.updateMyOrderCancel(order_id);
	}
	public MemberVO myDetailInfo(String id) throws Exception{
		return myPageDAO.selectMyDetailInfo(id);
	}
	public CompanyVO comDetailInfo(String id) throws Exception{
		return myPageDAO.selectComDetailInfo(id);
	}
	@Override
	public Map<String,List> myOrderCheck(OrderVO orderVO) throws Exception {
		Map<String,List> orderMap=new HashMap<String,List>();      //��Ʈ�� ����Ʈ ���·θ� ���� HashMap ��ü�� ��Ʈ�� ����Ʈ ���·θ� ���� orderMap ��ü�� ����
		List<OrderVO> myOrderList=myPageDAO.myOrderCheck(orderVO);  
		if(myOrderList.size()==0){ //������ ����� ��ǰ�̾��� ���
			return null;
		}
		List<GoodsVO> myGoodsList=myPageDAO.myGoodsOrderCheck(myOrderList);
		

		orderMap.put("myOrderList", myOrderList);
		orderMap.put("myGoodsList",myGoodsList);
		return orderMap;
	}
}
