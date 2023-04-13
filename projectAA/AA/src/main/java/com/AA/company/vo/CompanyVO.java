package com.AA.company.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("CompanyVO")
public class CompanyVO {
	private String id;
	private String pwd;
	private String company_Number;
	private String capName;
	private String company_name;
	private String company_zipcode;
	private String company_jibunAdd;
	private String company_roadAdd;
	private String company_namujiAdd;
	private String email;
	private String company_intro;
	private String company_phone;
	private String company_tel;
	private String company_grade;
	private String company_totalprice;
	private String status;
	private Date joinDate;
	private String emailsts_yn;
	private String smssts_yn;
	private String nickname;
	private int totalWork;
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getTotalWork() {
		return totalWork;
	}
	public void setTotalWork(int totalWork) {
		this.totalWork = totalWork;
	}
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
	public String getCompany_Number() {
		return company_Number;
	}
	public void setCompany_Number(String company_Number) {
		this.company_Number = company_Number;
	}
	public String getCapName() {
		return capName;
	}
	public void setCapName(String capName) {
		this.capName = capName;
	}
	public String getCompany_name() {
		return company_name;
	}
	public void setCompany_name(String company_name) {
		this.company_name = company_name;
	}
	public String getCompany_zipcode() {
		return company_zipcode;
	}
	public void setCompany_zipcode(String company_zipcode) {
		this.company_zipcode = company_zipcode;
	}
	public String getCompany_jibunAdd() {
		return company_jibunAdd;
	}
	public void setCompany_jibunAdd(String company_jibunAdd) {
		this.company_jibunAdd = company_jibunAdd;
	}
	public String getCompany_roadAdd() {
		return company_roadAdd;
	}
	public void setCompany_roadAdd(String company_roadAdd) {
		this.company_roadAdd = company_roadAdd;
	}
	public String getCompany_namujiAdd() {
		return company_namujiAdd;
	}
	public void setCompany_namujiAdd(String company_namujiAdd) {
		this.company_namujiAdd = company_namujiAdd;
	}
	public String getemail() {
		return email;
	}
	public void setemail(String email) {
		this.email = email;
	}
	public String getCompany_phone() {
		return company_phone;
	}
	public void setCompany_phone(String company_phone) {
		this.company_phone = company_phone;
	}
	public String getCompany_grade() {
		return company_grade;
	}
	public void setCompany_grade(String company_grade) {
		this.company_grade = company_grade;
	}
	public String getCompany_totalprice() {
		return company_totalprice;
	}
	public void setCompany_totalprice(String company_totalprice) {
		this.company_totalprice = company_totalprice;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Date getJoinDate() {
		return joinDate;
	}
	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}
	public String getEmailsts_yn() {
		return emailsts_yn;
	}
	public void setEmailsts_yn(String emailsts_yn) {
		this.emailsts_yn = emailsts_yn;
	}
	public String getSmssts_yn() {
		return smssts_yn;
	}
	public void setSmssts_yn(String smssts_yn) {
		this.smssts_yn = smssts_yn;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getCompany_tel() {
		return company_tel;
	}
	public void setCompany_tel(String company_tel) {
		this.company_tel = company_tel;
	}
	public String getCompany_intro() {
		return company_intro;
	}
	public void setCompany_intro(String company_intro) {
		this.company_intro = company_intro;
	}
	
	
}
