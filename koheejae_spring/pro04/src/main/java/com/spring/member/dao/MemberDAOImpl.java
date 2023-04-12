package com.spring.member.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.dao.DataAccessException;

import com.spring.member.vo.MemberVO;

public class MemberDAOImpl implements MemberDAO{
	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	public List selectAllMemberList() throws DataAccessException{
		List<MemberVO> membersList = null;
		membersList = sqlSession.selectList("mapper.member.selectAllMemberList");
		return membersList;
	}
	public int insertMember(MemberVO memberVO) throws DataAccessException{
		int result = sqlSession.insert("mapper.member.insertMember",memberVO);
		return result;
	}
	public int deleteMember(String id) throws DataAccessException{
		int result = sqlSession.delete("mapper.member.deleteMember",id);
		return result;
	}
	public int updateMember(MemberVO memberVO) throws DataAccessException{
		int result = sqlSession.update("mapper.member.updateMember",memberVO);
		return result;
	}
	public MemberVO modForm(String id) throws DataAccessException{
		MemberVO result = (MemberVO) sqlSession.selectOne("mapper.member.selectMemberById",id);
		return result;
	}
}
