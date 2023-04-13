package com.AA.cart.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

public interface CartController {
	public ModelAndView myCartMain(HttpServletRequest request, HttpServletResponse response)  throws Exception;
	public @ResponseBody String addGoodsInCart(@RequestParam("goods_num") int goods_num,@RequestParam("cart_goods_qty") int cart_goods_qty,@RequestParam("goods_option") String goods_option,HttpServletRequest request, HttpServletResponse response)  throws Exception;
	public  @ResponseBody String modifyCartQty(@RequestParam("goods_num") int goods_num,@RequestParam("cart_goods_qty") int cart_goods_qty,@RequestParam("goods_option") String goods_option,
            HttpServletRequest request, HttpServletResponse response)  throws Exception;
	public ModelAndView removeCartGoods(@RequestParam("cart_num") int cart_num,HttpServletRequest request, HttpServletResponse response)  throws Exception;
	
	

}
