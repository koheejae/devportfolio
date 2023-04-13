package com.AA.goods.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.AA.goods.vo.GoodsVO;

public interface GoodsController  {
	public ModelAndView goodsDetail(@RequestParam("goods_num") int goods_num,HttpServletRequest request, HttpServletResponse response) throws Exception;
	public @ResponseBody String keywordSearch(@RequestParam("keyword") String keyword,HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView searchGoods(@RequestParam(value = "searchWord", required = false) String searchWord,
			@RequestParam(value = "sortBy", defaultValue = "credate") String sortBy,
			@RequestParam(value = "priceRange_min", defaultValue = "0") int priceRange_min,
			@RequestParam(value = "priceRange_max", defaultValue = "100000000") int priceRange_max,
			@RequestParam(value = "goods_prime_yn", required = false) String goods_prime_yn,
			@RequestParam(value = "offset", defaultValue = "0") int offset,
			@RequestParam(value = "pageSize", defaultValue = "20") int pageSize,
			                       HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView goodsListByCategory(@RequestParam(value = "goods_main_category", defaultValue = "*") String goods_main_category,
			@RequestParam(value = "goods_middle_category", defaultValue = "*") String goods_middle_category,
			@RequestParam(value = "goods_sub_category", defaultValue = "*") String goods_sub_category,
			@RequestParam(value = "sortBy", defaultValue = "credate") String sortBy,
			@RequestParam(value = "priceRange_min", defaultValue = "0") int priceRange_min,
			@RequestParam(value = "priceRange_max", defaultValue = "100000000") int priceRange_max,
			@RequestParam(value = "goods_prime_yn", required = false) String goods_prime_yn,
			@RequestParam(value = "offset", defaultValue = "0") int offset,
			@RequestParam(value = "pageSize", defaultValue = "20") int pageSize,
			HttpServletRequest request, HttpServletResponse response) throws Exception;
}
