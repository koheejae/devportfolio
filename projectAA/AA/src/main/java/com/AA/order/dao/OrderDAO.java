package com.AA.order.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.AA.company.vo.CompanyVO;
import com.AA.goods.vo.GoodsVO;
import com.AA.order.vo.OrderVO;

public interface OrderDAO {
	public List<OrderVO> listMyOrderGoods(OrderVO orderBean) throws DataAccessException;
	public void insertNewOrder(List<OrderVO> myOrderList) throws DataAccessException;
	public OrderVO findMyOrder(String order_id) throws DataAccessException;
	public void removeGoodsFromCart(List<OrderVO> myOrderList)throws DataAccessException;
	public List<GoodsVO> selectGoodsByOrder(List<OrderVO> orderVO)throws DataAccessException;
	public List<CompanyVO> selectCompanyByGoods(String id)throws DataAccessException;
	public GoodsVO selectGoodsByNum(int goods_num)throws DataAccessException;
}
