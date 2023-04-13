package com.AA.company.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.AA.cart.vo.CartVO;
import com.AA.goods.vo.GoodsVO;
import com.AA.goods.vo.ImageFileVO;
import com.AA.order.vo.OrderVO;

@Repository("companyDAO")
public class CompanyDAOImpl implements CompanyDAO{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int insertNewGoods(Map newGoodsMap) throws DataAccessException {
		int goods_num = selectMaxGoodsNum();
		newGoodsMap.put("goods_num", goods_num);
		sqlSession.insert("mapper.company.insertNewGoods",newGoodsMap);
		return goods_num;
	}
	
	@Override
	public void insertGoodsImageFile(List fileList)  throws DataAccessException {
		for(int i=0; i<fileList.size();i++){
			int image_id = selectMaxImageId();
			ImageFileVO imageFileVO=(ImageFileVO)fileList.get(i);
			imageFileVO.setImage_id(image_id);
			sqlSession.insert("mapper.company.insertGoodsImageFile",imageFileVO);
		}
	}
	
	private int selectMaxGoodsNum() throws DataAccessException{
		int goods_num =sqlSession.selectOne("mapper.company.selectMaxGoodsNum");
		return goods_num;
	}
	
	private int selectMaxImageId() throws DataAccessException{
		int image_id =sqlSession.selectOne("mapper.company.selectMaxImageId");
		return image_id;
	}
}
