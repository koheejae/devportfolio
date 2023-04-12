package com.spring.ex01.member.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.spring.ex01.member.vo.MemberVO;

@Repository("memberDAO")
public class MemberDAOImpl implements MemberDAO{
	@Autowired
	private SqlSession sqlSession;
	
	public List selectAllMemberList() throws DataAccessException{
		List<MemberVO> membersList = null;
		membersList = sqlSession.selectList("mapper.member.selectAllMemberList");
		return membersList;
	}
	
	public int insertMember(MemberVO memberVO) throws DataAccessException{
		int result = sqlSession.insert("mapper.member.insertMember", memberVO);
		return result;
	}
	
	public int deleteMember(String id) throws DataAccessException{
		int result = sqlSession.delete("mapper.member.deleteMember",id);
		return result;
	}
	
	public MemberVO loginById(MemberVO memberVO) throws DataAccessException{
		MemberVO vo = sqlSession.selectOne("mapper.member.loginById",memberVO);
		return vo;
	}
	public int updateMember(MemberVO memberVO) throws DataAccessException{
		int result = sqlSession.update("mapper.member.updateMember", memberVO);
		return result;
	}
	
	public MemberVO modMemberForm(String id) throws DataAccessException{
		MemberVO vo = (MemberVO) sqlSession.selectOne("mapper.member.selectMemberById",id);
		return vo;
	}

}
