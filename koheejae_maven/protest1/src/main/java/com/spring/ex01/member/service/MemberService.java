package com.spring.ex01.member.service;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.spring.ex01.member.vo.MemberVO;

public interface MemberService {
	public List listMembers() throws DataAccessException;
	public int addMember(MemberVO memberVO) throws DataAccessException;
	public int removeMember(String id) throws DataAccessException;
	public MemberVO login(MemberVO memberVO) throws Exception;
	public int modMember(MemberVO memberVO) throws Exception;
	public MemberVO modMemberForm(String id) throws Exception;
}
