package com.AA.goods.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("ReviewVO")
public class ReviewVO {
	private String id;
	private int goods_num;
	private String goods_content;
	private String goods_secret;
	private String goods_category;
	private double goods_grade;
	private Date creDate;
	private String nickname;
	private String status;
	
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
	public String getGoods_content() {
		return goods_content;
	}
	public void setGoods_content(String goods_content) {
		this.goods_content = goods_content;
	}
	public String getGoods_secret() {
		return goods_secret;
	}
	public void setGoods_secret(String goods_secret) {
		this.goods_secret = goods_secret;
	}
	public String getGoods_category() {
		return goods_category;
	}
	public void setGoods_category(String goods_category) {
		this.goods_category = goods_category;
	}
	public double getGoods_grade() {
		return goods_grade;
	}
	public void setGoods_grade(double goods_grade) {
		this.goods_grade = goods_grade;
	}
	public Date getCreDate() {
		return creDate;
	}
	public void setCreDate(Date creDate) {
		this.creDate = creDate;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	
}
