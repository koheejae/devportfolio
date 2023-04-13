package com.AA.member.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.AA.company.vo.CompanyVO;
import com.AA.member.vo.MemberVO;

public interface MemberController {
	public ModelAndView login(@RequestParam Map<String, String> loginMap,HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ResponseEntity  addMember(@ModelAttribute("member") MemberVO member, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ResponseEntity  addCompany(@ModelAttribute("company") CompanyVO company,HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ResponseEntity   overlapped(@RequestParam("id") String id,HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ResponseEntity   overlappedEmail(@RequestParam("email") String email,HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ResponseEntity   overlappedComEmail(@RequestParam("email") String email,HttpServletRequest request, HttpServletResponse response) throws Exception;
	public String findId(@RequestParam("name") String name, @RequestParam("phone") String phone) throws Exception;
	public void findPwd(@RequestParam("id") String id, @RequestParam("email") String email,HttpServletResponse response) throws Exception;

}
