package com.AA.order.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

import com.AA.goods.vo.GoodsVO;

@Component("orderVO")
public class OrderVO {
	private int order_num;
	private String id;
	private String orderer_name;
	private int goods_num;
	private String goods_title;
	private int goods_resultPrice;
	private int total_goods_price;
	private int cart_goods_qty; //장바구니에 담긴 제품 수
	private int order_goods_qty; //최종 주문  제품 수
	private String order_goods_option;
	private String company_name;
	private String goods_fileName;
	private int order_price;
	private Date order_date;

	

	private String orderer_email;
	private String company_email;
	private String company_id;
	
	private String pay_method;
	private String card_com_name;
	private String card_pay_month;
	private String pay_order_time;
	private String order_status;
	
	private int final_resultPrice;
	
	
	
	private int goods_sales_price;
	private int final_total_price;
	
	
	
	
	
	public int getOrder_price() {
		return order_price;
	}
	public void setOrder_price(int order_price) {
		this.order_price = order_price;
	}
	public void setFinal_resultPrice(int final_resultPrice) {
		this.final_resultPrice = final_resultPrice;
	}
	public int getFinal_resultPrice() {
		return final_resultPrice;
	}
public void setFinal_resultPrice(String goods_option,GoodsVO goodsVO) {
		
		if(goods_option.equals("standard")) {
			this.final_resultPrice = goodsVO.getGoods_standardPrice();
		}
		if(goods_option.equals("deluxe")) {
			this.final_resultPrice = goodsVO.getGoods_deluxePrice();
		}
		if(goods_option.equals("premium")) {
			this.final_resultPrice = goodsVO.getGoods_premiumPrice();
		}
	}
	public String getCompany_id() {
		return company_id;
	}
	public void setCompany_id(String company_id) {
		this.company_id = company_id;
	}
	public String getOrderer_name() {
		return orderer_name;
	}
	public void setOrderer_name(String orderer_name) {
		this.orderer_name = orderer_name;
	}
	public String getGoods_fileName() {
		return goods_fileName;
	}
	public void setGoods_fileName(String goods_fileName) {
		this.goods_fileName = goods_fileName;
	}
	
	public int getOrder_num() {
		return order_num;
	}
	public void setOrder_num(int order_num) {
		this.order_num = order_num;
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
	public String getGoods_title() {
		return goods_title;
	}
	public void setGoods_title(String goods_title) {
		this.goods_title = goods_title;
	}
	public int getGoods_resultPrice() {
		return goods_resultPrice;
	}
	public void setGoods_resultPrice(int goods_resultPrice) {
		this.goods_resultPrice = goods_resultPrice;
	}
	public int getTotal_goods_price() {
		return total_goods_price;
	}
	public void setTotal_goods_price(int total_goods_price) {
		this.total_goods_price = total_goods_price;
	}
	public int getCart_goods_qty() {
		return cart_goods_qty;
	}
	public void setCart_goods_qty(int cart_goods_qty) {
		this.cart_goods_qty = cart_goods_qty;
	}
	public int getOrder_goods_qty() {
		return order_goods_qty;
	}
	public void setOrder_goods_qty(int order_goods_qty) {
		this.order_goods_qty = order_goods_qty;
	}
	public String getOrder_goods_option() {
		return order_goods_option;
	}
	public void setOrder_goods_option(String order_goods_option) {
		this.order_goods_option = order_goods_option;
	}
	public String getCompany_name() {
		return company_name;
	}
	public void setCompany_name(String company_name) {
		this.company_name = company_name;
	}
	public String getPay_method() {
		return pay_method;
	}
	public void setPay_method(String pay_method) {
		this.pay_method = pay_method;
	}
	public String getCard_com_name() {
		return card_com_name;
	}
	public void setCard_com_name(String card_com_name) {
		this.card_com_name = card_com_name;
	}
	public String getCard_pay_month() {
		return card_pay_month;
	}
	public void setCard_pay_month(String card_pay_month) {
		this.card_pay_month = card_pay_month;
	}
	public String getPay_order_time() {
		return pay_order_time;
	}
	public void setPay_order_time(String pay_order_time) {
		this.pay_order_time = pay_order_time;
	}
	public String getOrder_status() {
		return order_status;
	}
	public void setOrder_status(String order_status) {
		this.order_status = order_status;
	}
	public int getGoods_sales_price() {
		return goods_sales_price;
	}
	public void setGoods_sales_price(int goods_sales_price) {
		this.goods_sales_price = goods_sales_price;
	}
	public int getFinal_total_price() {
		return final_total_price;
	}
	public void setFinal_total_price(int final_total_price) {
		this.final_total_price = final_total_price;
	}


	public String getOrderer_email() {
		return orderer_email;
	}
	public void setOrderer_email(String orderer_email) {
		this.orderer_email = orderer_email;
	}
	public String getCompany_email() {
		return company_email;
	}
	public void setCompany_email(String company_email) {
		this.company_email = company_email;
	}
	public Date getOrder_date() {
		return order_date;
	}
	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}
	
	
	
	
	
	

}
