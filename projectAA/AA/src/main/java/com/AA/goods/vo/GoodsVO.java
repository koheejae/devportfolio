package com.AA.goods.vo;

import java.sql.Date;
import java.util.ArrayList;

import org.springframework.stereotype.Component;

@Component("GoodsVO")
public class GoodsVO {
	private int goods_num;
	private String id;
	private String goods_title;
	private String goods_content;
	private int    goods_point;
	private String goods_image;
	private String goods_status;
	private int    goods_standardPrice;
	private int    goods_deluxePrice;
	private int    goods_premiumPrice;
	private Date   goods_credate;
	private int goods_grade;
	private String goods_modify;
	private String goods_fileName;
	private String goods_intro;
	private String goods_main_category;
	private String goods_middle_category;
	private String goods_sub_category;
	private String goods_standardContent;
	private String goods_deluxeContent;
	private String goods_premiumContent;
	private int totalSell;
	private String goods_prime_yn;
	
	public String getGoods_prime_yn() {
		return goods_prime_yn;
	}

	public void setGoods_prime_yn(String goods_prime_yn) {
		this.goods_prime_yn = goods_prime_yn;
	}

	public String getGoods_main_category() {
		return goods_main_category;
	}

	public void setGoods_main_category(String goods_main_category) {
		this.goods_main_category = goods_main_category;
	}

	public String getGoods_middle_category() {
		return goods_middle_category;
	}

	public void setGoods_middle_category(String goods_middle_category) {
		this.goods_middle_category = goods_middle_category;
	}

	public String getGoods_sub_category() {
		return goods_sub_category;
	}

	public void setGoods_sub_category(String goods_sub_category) {
		this.goods_sub_category = goods_sub_category;
	}

	public GoodsVO() {
	}

	public int getGoods_num() {
		return goods_num;
	}

	public void setGoods_num(int goods_num) {
		this.goods_num = goods_num;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getGoods_title() {
		return goods_title;
	}

	public void setGoods_title(String goods_title) {
		this.goods_title = goods_title;
	}

	public String getGoods_content() {
		return goods_content;
	}

	public void setGoods_content(String goods_content) {
		this.goods_content = goods_content;
	}

	public int getGoods_point() {
		return goods_point;
	}

	public void setGoods_point(int goods_point) {
		this.goods_point = goods_point;
	}

	public String getGoods_image() {
		return goods_image;
	}

	public void setGoods_image(String goods_image) {
		this.goods_image = goods_image;
	}

	public String getGoods_status() {
		return goods_status;
	}

	public void setGoods_status(String goods_status) {
		this.goods_status = goods_status;
	}

	public int getGoods_standardPrice() {
		return goods_standardPrice;
	}

	public void setGoods_standardPrice(int goods_standardPrice) {
		this.goods_standardPrice = goods_standardPrice;
	}

	public int getGoods_deluxePrice() {
		return goods_deluxePrice;
	}

	public void setGoods_deluxePrice(int goods_deluxePrice) {
		this.goods_deluxePrice = goods_deluxePrice;
	}

	public int getGoods_premiumPrice() {
		return goods_premiumPrice;
	}

	public void setGoods_premiumPrice(int goods_premiumPrice) {
		this.goods_premiumPrice = goods_premiumPrice;
	}

	public Date getGoods_credate() {
		return goods_credate;
	}

	public void setGoods_credate(Date goods_credate) {
		this.goods_credate = goods_credate;
	}

	public int getGoods_grade() {
		return goods_grade;
	}

	public void setGoods_grade(int goods_grade) {
		this.goods_grade = goods_grade;
	}

	public String getGoods_modify() {
		return goods_modify;
	}

	public void setGoods_modify(String goods_modify) {
		this.goods_modify = goods_modify;
	}

	public String getGoods_fileName() {
		return goods_fileName;
	}

	public void setGoods_fileName(String goods_fileName) {
		this.goods_fileName = goods_fileName;
	}

	

	public String getGoods_standardContent() {
		return goods_standardContent;
	}

	public void setGoods_standardContent(String goods_standardContent) {
		this.goods_standardContent = goods_standardContent;
	}

	public String getGoods_deluxeContent() {
		return goods_deluxeContent;
	}

	public void setGoods_deluxeContent(String goods_deluxeContent) {
		this.goods_deluxeContent = goods_deluxeContent;
	}

	public String getGoods_premiumContent() {
		return goods_premiumContent;
	}

	public void setGoods_primiumContent(String goods_premiumContent) {
		this.goods_premiumContent = goods_premiumContent;
	}

	public int getTotalSell() {
		return totalSell;
	}

	public void setTotalSell(int totalSell) {
		this.totalSell = totalSell;
	}

	public String getGoods_intro() {
		return goods_intro;
	}

	public void setGoods_intro(String goods_intro) {
		this.goods_intro = goods_intro;
	}

	public void setGoods_premiumContent(String goods_premiumContent) {
		this.goods_premiumContent = goods_premiumContent;
	}


}