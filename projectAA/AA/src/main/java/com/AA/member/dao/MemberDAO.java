package com.AA.member.dao;

import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.AA.company.vo.CompanyVO;
import com.AA.member.vo.MemberVO;

public interface MemberDAO {
	public MemberVO memberLogin(Map loginMap) throws DataAccessException;
	public CompanyVO companyLogin(Map loginMap) throws DataAccessException;
	public void insertNewMember(MemberVO memberVO) throws DataAccessException;
	public void insertNewCompany(CompanyVO companyVO) throws DataAccessException;
	public String selectOverlappedID(String id) throws DataAccessException;
	public String findId(Map paramMap) throws DataAccessException;
	public String findPwd(Map paramMap) throws DataAccessException;
	public String selectOverlappedEmail(String email) throws DataAccessException;
	public String selectOverlappedComEmail(String email) throws DataAccessException;
}
