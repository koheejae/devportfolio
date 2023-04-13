package com.AA.company.service;

import java.util.List;
import java.util.Map;

import com.AA.cart.vo.CartVO;
import com.AA.order.vo.OrderVO;

public interface CompanyService {
	public int  addNewGoods(Map newGoodsMap) throws Exception;
	public void addNewGoodsImage(List imageFileList) throws Exception;
}
