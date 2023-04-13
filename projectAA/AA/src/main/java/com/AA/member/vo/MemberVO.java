package com.AA.member.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("memberVO")
public class MemberVO {
	private String id;
	private String pwd;
	private String name;
	private String gender;
	private String zipcode;
	private String roadAdd;
	private String jibunAdd;
	private String namujiAdd;
	private String jumin1;
	private String jumin2;
	private String tel;
	private String smssts_yn;
	private String email;
	private String emailsts_yn;
	private int point;
	private String status;
	private String nickname;
	private Date joinDate;
	private String del_yn;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getRoadAdd() {
		return roadAdd;
	}
	public void setRoadAdd(String roadAdd) {
		this.roadAdd = roadAdd;
	}
	public String getJibunAdd() {
		return jibunAdd;
	}
	public void setJibunAdd(String jibunAdd) {
		this.jibunAdd = jibunAdd;
	}
	public String getNamujiAdd() {
		return namujiAdd;
	}
	public void setNamujiAdd(String namujiAdd) {
		this.namujiAdd = namujiAdd;
	}
	public String getJumin1() {
		return jumin1;
	}
	public void setJumin1(String jumin1) {
		this.jumin1 = jumin1;
	}
	public String getJumin2() {
		return jumin2;
	}
	public void setJumin2(String jumin2) {
		this.jumin2 = jumin2;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getSmssts_yn() {
		return smssts_yn;
	}
	public void setSmssts_yn(String smssts_yn) {
		this.smssts_yn = smssts_yn;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getEmailsts_yn() {
		return emailsts_yn;
	}
	public void setEmailsts_yn(String emailsts_yn) {
		this.emailsts_yn = emailsts_yn;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public Date getJoinDate() {
		return joinDate;
	}
	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}
	public String getDel_yn() {
		return del_yn;
	}
	public void setDel_yn(String del_yn) {
		this.del_yn = del_yn;
	}
	
}
	
	