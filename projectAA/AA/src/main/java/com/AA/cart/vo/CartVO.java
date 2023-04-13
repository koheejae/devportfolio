package com.AA.cart.vo;

import org.springframework.stereotype.Component;

import com.AA.goods.vo.GoodsVO;

@Component("cartVO")
public class CartVO {
	private int cart_num;
	private String id;
	private int goods_num;
	private String goods_option;
	private int cart_goods_qty;
	private String creDate;
	private int goods_resultPrice;
	
	public void setGoods_resultPrice(String goods_option,GoodsVO goodsVO) {
		
		if(goods_option.equals("standardPrice")) {
			this.goods_resultPrice = goodsVO.getGoods_standardPrice();
		}
		if(goods_option.equals("deluxePrice")) {
			this.goods_resultPrice = goodsVO.getGoods_deluxePrice();
		}
		if(goods_option.equals("premiumPrice")) {
			this.goods_resultPrice = goodsVO.getGoods_premiumPrice();
		}
	}
	
	public int getGoods_resultPrice() {
		return goods_resultPrice;
	}
	
	
	
	public int getCart_num() {
		return cart_num;
	}
	public void setCart_num(int cart_num) {
		this.cart_num = cart_num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getGoods_num() {
		return goods_num;
	}
	public void setGoods_num(int goods_num) {
		this.goods_num = goods_num;
	}
	public String getGoods_option() {
		return goods_option;
	}
	public void setGoods_option(String goods_option) {
		this.goods_option = goods_option;
	}
	public int getCart_goods_qty() {
		return cart_goods_qty;
	}
	public void setCart_goods_qty(int cart_goods_qty) {
		this.cart_goods_qty = cart_goods_qty;
	}
	public String getCreDate() {
		return creDate;
	}
	public void setCreDate(String creDate) {
		this.creDate = creDate;
	}

}
