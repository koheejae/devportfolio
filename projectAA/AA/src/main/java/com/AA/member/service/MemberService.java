package com.AA.member.service;

import java.util.Map;

import com.AA.company.vo.CompanyVO;
import com.AA.member.vo.MemberVO;

public interface MemberService {
	public MemberVO memberLogin(Map  loginMap) throws Exception;
	public CompanyVO companyLogin(Map  loginMap) throws Exception;
	public void addMember(MemberVO memberVO) throws Exception;
	public void addCompany(CompanyVO companyVO) throws Exception;
	public String overlapped(String id) throws Exception;
	public String findId(Map paramMap) throws Exception;
	public String findPwd(Map paramMap) throws Exception;
	public String overlappedEmail(String email) throws Exception;
	public String overlappedComEmail(String email) throws Exception;

}
