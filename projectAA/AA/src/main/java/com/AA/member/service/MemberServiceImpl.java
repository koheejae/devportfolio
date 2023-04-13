package com.AA.member.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.AA.company.vo.CompanyVO;
import com.AA.member.dao.MemberDAO;
import com.AA.member.vo.MemberVO;

@Service("memberService")
@Transactional(propagation=Propagation.REQUIRED)
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDAO memberDAO;
	
	@Override
	public MemberVO memberLogin(Map  loginMap) throws Exception{
		return memberDAO.memberLogin(loginMap);
	}
	
	@Override
	public CompanyVO companyLogin(Map  loginMap) throws Exception{
		return memberDAO.companyLogin(loginMap);
	}
	
	@Override
	public void addMember(MemberVO memberVO) throws Exception{
		memberDAO.insertNewMember(memberVO);
	}
	
	@Override
	public void addCompany(CompanyVO companyVO) throws Exception {
		memberDAO.insertNewCompany(companyVO);
		
	}
	
	@Override
	public String overlapped(String id) throws Exception{
		return memberDAO.selectOverlappedID(id);
	}

	@Override
	   public String findId(Map paramMap) throws Exception {
	      return memberDAO.findId(paramMap);
	   }
	
	@Override
	public String findPwd(Map paramMap) throws Exception {
		return memberDAO.findPwd(paramMap);
	}

	@Override
	public String overlappedEmail(String email) throws Exception {
		return memberDAO.selectOverlappedEmail(email);
	}
	@Override
	public String overlappedComEmail(String email) throws Exception {
		return memberDAO.selectOverlappedComEmail(email);
	}

	

}
