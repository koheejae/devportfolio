package com.spring.ex01.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.spring.ex01.member.dao.MemberDAO;
import com.spring.ex01.member.vo.MemberVO;

@Service("memberService")
@Transactional(propagation = Propagation.REQUIRED)
public class MemberServiceImpl implements MemberService{
	@Autowired
	private MemberDAO memberDAO;
	
	public List listMembers() throws DataAccessException{
		List membersList = null;
		membersList = memberDAO.selectAllMemberList();
		return membersList;
	}
	
	public int addMember(MemberVO member) throws DataAccessException{
		return memberDAO.insertMember(member);
	}
	
	public int removeMember(String id) throws DataAccessException{
		return memberDAO.deleteMember(id);
	}
	
	public MemberVO login(MemberVO memberVO) throws Exception{
		return memberDAO.loginById(memberVO);
	}
	public int modMember(MemberVO memberVO) throws Exception{
		return memberDAO.updateMember(memberVO);
	}
	public MemberVO modMemberForm(String id) throws Exception{
		return memberDAO.modMemberForm(id);
	}
	

}
