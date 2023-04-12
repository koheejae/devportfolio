package com.spring.member.service;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.spring.member.dao.MemberDAO;
import com.spring.member.vo.MemberVO;

public class MemberServiceImpl implements MemberService{
	private MemberDAO memberDAO;
	public void setMemberDAO(MemberDAO memberDAO) {
		this.memberDAO = memberDAO;
	}
	public List listMembers() throws DataAccessException{
		List membersList = null;
		membersList = memberDAO.selectAllMemberList();
		return membersList;
	}
	public int addMember(MemberVO memberVO) throws DataAccessException{
		return memberDAO.insertMember(memberVO);
	}
	public int removeMember(String id) throws DataAccessException{
		return memberDAO.deleteMember(id);
	}
	public int modMember(MemberVO memberVO) throws DataAccessException{
		return memberDAO.updateMember(memberVO);
	}
	public MemberVO modMemberForm(String id) throws DataAccessException{
		return memberDAO.modForm(id);
	}
}
