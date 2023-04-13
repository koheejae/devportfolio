package com.AA.company.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.AA.cart.vo.CartVO;
import com.AA.company.dao.CompanyDAO;
import com.AA.goods.vo.GoodsVO;
import com.AA.goods.vo.ImageFileVO;
import com.AA.order.vo.OrderVO;

@Service("companyService")
@Transactional(propagation=Propagation.REQUIRED)
public class CompanyServiceImpl implements CompanyService{
	@Autowired CompanyDAO companyDAO;
	
	@Override
	public int addNewGoods(Map newGoodsMap) throws Exception{
		int goods_num = companyDAO.insertNewGoods(newGoodsMap);
		ArrayList<ImageFileVO> imageFileList = (ArrayList)newGoodsMap.get("imageFileList");
		for(ImageFileVO imageFileVO : imageFileList) {
			imageFileVO.setGoods_num(goods_num);
		}
		companyDAO.insertGoodsImageFile(imageFileList);
		return goods_num;
	}

	@Override
	public void addNewGoodsImage(List imageFileList) throws Exception {
		companyDAO.insertGoodsImageFile(imageFileList);
		
	}
	
	
}
