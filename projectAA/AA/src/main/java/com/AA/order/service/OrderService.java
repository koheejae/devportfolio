package com.AA.order.service;

import java.util.List;
import java.util.Map;

import com.AA.cart.vo.CartVO;
import com.AA.goods.vo.GoodsVO;
import com.AA.order.vo.OrderVO;

public interface OrderService {
	public List<OrderVO> listMyOrderGoods(OrderVO orderVO) throws Exception;
	public void addNewOrder(List<OrderVO> myOrderList) throws Exception;
	public OrderVO findMyOrder(String order_id) throws Exception;
	public Map<String ,List> myBuyInfo(OrderVO orderVO) throws Exception;
	public GoodsVO findGoodsByNum(int goods_num) throws Exception;
}
