package com.AA.member.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.AA.company.vo.CompanyVO;
import com.AA.member.vo.MemberVO;

@Repository("memberDAO")
public class MemberDAOImpl  implements MemberDAO{
	@Autowired
	private SqlSession sqlSession;	
	
	@Override
	public MemberVO memberLogin(Map loginMap) throws DataAccessException{
			MemberVO member=(MemberVO)sqlSession.selectOne("mapper.member.memberLogin",loginMap);
			return member;
	}
	
	@Override
	public CompanyVO companyLogin(Map loginMap) throws DataAccessException{
			CompanyVO member=(CompanyVO)sqlSession.selectOne("mapper.member.companyLogin",loginMap);
			return member;
	}
	
	@Override
	public void insertNewMember(MemberVO memberVO) throws DataAccessException{
		sqlSession.insert("mapper.member.insertNewMember",memberVO);
	}

	@Override
	public void insertNewCompany(CompanyVO companyVO) throws DataAccessException {
		sqlSession.insert("mapper.member.insertNewCompany",companyVO);
		
	}
	
	@Override
	public String selectOverlappedID(String id) throws DataAccessException {
		String result =  sqlSession.selectOne("mapper.member.selectOverlappedID",id);
		System.out.println(result);
		return result;
	}

	 @Override
	   public String findId(Map paramMap) throws DataAccessException {
	      String id = sqlSession.selectOne("mapper.member.findId", paramMap); 
	      return id;
	   }
	 @Override
		public String findPwd(Map paramMap) throws DataAccessException {
			String pwd = sqlSession.selectOne("mapper.member.findPwd", paramMap);
			return pwd;
		}

	@Override
	public String selectOverlappedEmail(String email) throws DataAccessException {
		String result =  sqlSession.selectOne("mapper.member.selectOverlappedEmail",email);
		System.out.println(result);
		return result;
	}
	@Override
	public String selectOverlappedComEmail(String email) throws DataAccessException {
		String result =  sqlSession.selectOne("mapper.member.selectOverlappedComEmail",email);
		System.out.println(result);
		return result;
	}

	
	

	
	
}
