package com.AA.order.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.AA.cart.vo.CartVO;
import com.AA.company.vo.CompanyVO;
import com.AA.goods.vo.GoodsVO;
import com.AA.order.dao.OrderDAO;
import com.AA.order.vo.OrderVO;


@Service("orderService")
@Transactional(propagation=Propagation.REQUIRED)
public class OrderServiceImpl implements OrderService {
	@Autowired
	private OrderDAO orderDAO;
	
	public List<OrderVO> listMyOrderGoods(OrderVO orderVO) throws Exception{
		List<OrderVO> orderGoodsList;
		orderGoodsList=orderDAO.listMyOrderGoods(orderVO);
		return orderGoodsList;
	}
	
	public void addNewOrder(List<OrderVO> myOrderList) throws Exception{
		orderDAO.insertNewOrder(myOrderList);
		//카트에서 주문 상품 제거한다.
		orderDAO.removeGoodsFromCart(myOrderList);
	}	
	
	public OrderVO findMyOrder(String order_id) throws Exception{
		return orderDAO.findMyOrder(order_id);
	}
	public GoodsVO findGoodsByNum(int goods_num) throws Exception{
		return orderDAO.selectGoodsByNum(goods_num);
	}
	
	
	public Map<String ,List> myBuyInfo(OrderVO orderVO) throws Exception{
		Map<String,List> orderMap=new HashMap<String,List>();
		List<OrderVO> orderList = new ArrayList<OrderVO>();
		orderList.add(orderVO);
		List<GoodsVO> myOrderGoods=orderDAO.selectGoodsByOrder(orderList);
		List<CompanyVO> orderGoodsCompany = new ArrayList<CompanyVO>();
		for (int i = 0; i < myOrderGoods.size(); i++) {
			String id = myOrderGoods.get(i).getId();
			orderGoodsCompany = orderDAO.selectCompanyByGoods(id);
	        GoodsVO goods = myOrderGoods.get(i);
	        String goods_option = orderVO.getOrder_goods_option();
	        orderList.get(i).setFinal_resultPrice(goods_option, goods);
	    }
	    
	    
	        
		orderMap.put("myOrderGoods", myOrderGoods);
		orderMap.put("orderGoodsCompany",orderGoodsCompany);
		orderMap.put("orderList",orderList);
		return orderMap;
	}
}
