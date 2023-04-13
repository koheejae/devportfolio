package com.AA.order.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.AA.company.vo.CompanyVO;
import com.AA.goods.vo.GoodsVO;
import com.AA.order.vo.OrderVO;

@Repository("orderDAO")
public class OrderDAOImpl implements OrderDAO {
	@Autowired
	private SqlSession sqlSession;
	
	public List<OrderVO> listMyOrderGoods(OrderVO orderVO) throws DataAccessException{
		List<OrderVO> orderGoodsList=new ArrayList<OrderVO>();
		orderGoodsList=(ArrayList)sqlSession.selectList("mapper.order.selectMyOrderList",orderVO);
		return orderGoodsList;
	}
	
	public void insertNewOrder(List<OrderVO> myOrderList) throws DataAccessException{
		int order_num=selectOrderNum();
		for(int i=0; i<myOrderList.size();i++){
			OrderVO orderVO =(OrderVO)myOrderList.get(i);
			orderVO.setOrder_num(order_num);
			sqlSession.insert("mapper.order.insertNewOrder",orderVO);
		}
		
	}	
	
	public OrderVO findMyOrder(String order_id) throws DataAccessException{
		OrderVO orderVO=(OrderVO)sqlSession.selectOne("mapper.order.selectMyOrder",order_id);		
		return orderVO;
	}
	
	public void removeGoodsFromCart(OrderVO orderVO)throws DataAccessException{
		sqlSession.delete("mapper.order.deleteGoodsFromCart",orderVO);
	}
	
	public void removeGoodsFromCart(List<OrderVO> myOrderList)throws DataAccessException{
		for(int i=0; i<myOrderList.size();i++){
			OrderVO orderVO =(OrderVO)myOrderList.get(i);
			sqlSession.delete("mapper.order.deleteGoodsFromCart",orderVO);		
		}
	}	
	private int selectOrderNum() throws DataAccessException{
		return sqlSession.selectOne("mapper.order.selectOrderNum");
		
	}
	
	public List<GoodsVO> selectGoodsByOrder(List<OrderVO> orderVO)throws DataAccessException{
		List<GoodsVO> goodsByOrder;
		goodsByOrder = sqlSession.selectList("mapper.order.selectGoodsByOrder", orderVO);
		return goodsByOrder;
	}
	public List<CompanyVO> selectCompanyByGoods(String id)throws DataAccessException{
		List<CompanyVO> companyByGoods;
		companyByGoods = sqlSession.selectList("mapper.order.selectCompanyByGoods", id);
		return companyByGoods;
	}
	
	public GoodsVO selectGoodsByNum(int goods_num)throws DataAccessException{
		return sqlSession.selectOne("mapper.order.selectGoodsByNum", goods_num);
		
	}
	
	
}

