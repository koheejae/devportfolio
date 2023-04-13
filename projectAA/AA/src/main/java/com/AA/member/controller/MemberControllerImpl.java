package com.AA.member.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.AA.common.base.BaseController;
import com.AA.company.vo.CompanyVO;
import com.AA.member.service.MemberService;
import com.AA.member.vo.MemberVO;

@Controller("memberController")
@RequestMapping(value="/member")
public class MemberControllerImpl extends BaseController implements MemberController{
	@Autowired
	private MemberService memberService;
	@Autowired
	private MemberVO memberVO;
	@Autowired
	private CompanyVO companyVO;
	
	@Override
	@RequestMapping(value="/login.do" ,method = RequestMethod.POST)
	public ModelAndView login(@RequestParam Map<String, String> loginMap,
			                  HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		memberVO = (MemberVO) memberService.memberLogin(loginMap);  //id pwd member테이블에서 조회
		if(memberVO == null){ //id pwd가 member테이블에 없으면 내려감
			companyVO = (CompanyVO) memberService.companyLogin(loginMap); //company 테이블 조회
			if(companyVO!= null && companyVO.getId()!=null){ //company 테이블에 있으면 출력 
				HttpSession session=request.getSession(); 
				session=request.getSession();
				session.setAttribute("isLogOn", true);
				
				/* 탈퇴하기 관련 (세션에 로그인 정보 저장) 미구현*/
				String login_id = companyVO.getId();
				session.setAttribute("login_id", login_id);
				System.out.println("\t 로그인 아이디 : "+login_id);
				
				session.setAttribute("companyInfo",companyVO);
				session.setAttribute("side_menu", "empty");
				String action=(String)session.getAttribute("action");
				if(action!=null && action.equals("/order/orderEachGoods.do")){
					mav.setViewName("forward:"+action);
				}else{
					mav.setViewName("redirect:/main/main.do");	
				}
			} else { //company 테이블에도 없으면 출력
				String message="아이디나  비밀번호가 틀립니다. 다시 로그인해주세요";
				mav.addObject("message", message);
				mav.setViewName("/member/loginForm");
			}
			return mav;
		}else if(memberVO!= null && memberVO.getId()!=null){ //id pwd가 member테이블에 있으면
			HttpSession session=request.getSession();
			session=request.getSession();
			session.setAttribute("isLogOn", true);
			
			/* 탈퇴하기 관련 (세션에 로그인 정보 저장)  미구현 */ 
			String login_id = memberVO.getId();
			session.setAttribute("login_id", login_id);
			System.out.println("\t 로그인 아이디 : "+login_id);
			
			session.setAttribute("memberInfo",memberVO);
			session.setAttribute("side_menu", "empty");
			String action=(String)session.getAttribute("action");
			if(action!=null && action.equals("/order/orderEachGoods.do")){
				mav.setViewName("forward:"+action);
			}else{
				mav.setViewName("redirect:/main/main.do");
			}
		} else{
			String message="아이디나  비밀번호가 틀립니다. 다시 로그인해주세요";
			mav.addObject("message", message);
			mav.setViewName("/member/loginForm");
		}
		return mav;
	}
	@Override
	@RequestMapping(value="/logout.do" ,method = RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		HttpSession session=request.getSession();
		session.setAttribute("isLogOn", false);
		session.removeAttribute("memberInfo");
		mav.setViewName("redirect:/main/main.do");
		return mav;
	}
	
	@Override
	@RequestMapping(value="/addMember.do" ,method = RequestMethod.POST)
	public ResponseEntity addMember(@ModelAttribute("memberVO") MemberVO _memberVO,
			                HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		try {
			String emailsts_yn = request.getParameter("emailsts_yn");
			
			if (emailsts_yn == null) {
				emailsts_yn = "false";
			}
			_memberVO.setEmailsts_yn(emailsts_yn);
            String smssts_yn = request.getParameter("smssts_yn");
			
		if(smssts_yn == null) {
				smssts_yn = "false";
			}
			_memberVO.setSmssts_yn(smssts_yn);
			
			
			String jumin2 = request.getParameter("jumin2");
			String gender = Integer.parseInt(jumin2.substring(0, 1)) % 2 == 1 ? "M" : "F";
	        _memberVO.setGender(gender);
		    memberService.addMember(_memberVO);
		    message  = "<script>";
		    message +=" alert('회원 가입을 마쳤습니다.로그인창으로 이동합니다.');";
		    message += " location.href='"+request.getContextPath()+"/member/loginForm.do';";
		    message += " </script>";
		    
		}catch(Exception e) {
			message  = "<script>";
		    message +=" alert('작업 중 오류가 발생했습니다. 다시 시도해 주세요');";
		    message += " location.href='"+request.getContextPath()+"/member/memberForm.do';";
		    message += " </script>";
			e.printStackTrace();
		}
		resEntity =new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}
	
	@Override
	@RequestMapping(value="/addCompany.do" ,method = RequestMethod.POST)
	public ResponseEntity addCompany (@ModelAttribute("companyVO") CompanyVO _companyVO,
			                HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
         String emailsts_yn = request.getParameter("emailsts_yn");
			
			if (emailsts_yn == null) {
				emailsts_yn = "false";
			}
			_companyVO.setEmailsts_yn(emailsts_yn);
			 String smssts_yn = request.getParameter("smssts_yn");
				
				if (smssts_yn == null) {
					smssts_yn = "false";
				}
				_companyVO.setSmssts_yn(smssts_yn);
			
		    memberService.addCompany(_companyVO);
		    message  = "<script>";
		    message +=" alert('회원 가입을 마쳤습니다.로그인창으로 이동합니다.');";
		    message += " location.href='"+request.getContextPath()+"/member/loginForm.do';";
		    message += " </script>";
		    
		}catch(Exception e) {
			message  = "<script>";
		    message +=" alert('작업 중 오류가 발생했습니다. 다시 시도해 주세요');";
		    message += " location.href='"+request.getContextPath()+"/member/memberForm.do';";
		    message += " </script>";
			e.printStackTrace();
		}
		resEntity =new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}
	
	@Override
	@RequestMapping(value="/overlapped.do" ,method = RequestMethod.POST)
	public ResponseEntity overlapped(@RequestParam("id") String id,HttpServletRequest request, HttpServletResponse response) throws Exception{
		ResponseEntity resEntity = null;
		String result = memberService.overlapped(id);
		resEntity =new ResponseEntity(result, HttpStatus.OK);
		return resEntity;
	}
	
	@Override
	@RequestMapping(value="/overlappedEmail.do", method = RequestMethod.POST)
	public ResponseEntity overlappedEmail(@RequestParam("email") String email, HttpServletRequest request, HttpServletResponse response) throws Exception {
		ResponseEntity resEntity = null;
		String result = memberService.overlappedEmail(email);
		resEntity =new ResponseEntity(result, HttpStatus.OK);
		return resEntity;
	}
	@Override
	@RequestMapping(value="/overlappedComEmail.do", method = RequestMethod.POST)
	public ResponseEntity overlappedComEmail(@RequestParam("email") String email, HttpServletRequest request, HttpServletResponse response) throws Exception {
		ResponseEntity resEntity = null;
		String result = memberService.overlappedComEmail(email);
		resEntity =new ResponseEntity(result, HttpStatus.OK);
		return resEntity;
	}
	
	@RequestMapping(value="/findId.do", method=RequestMethod.POST)
	   @ResponseBody
	   public String findId(@RequestParam("name") String name, @RequestParam("phone") String phone) throws Exception {
	       Map<String, String> paramMap = new HashMap<String, String>();
	       paramMap.put("name", name);
	       paramMap.put("phone", phone);
	       
	       String id = memberService.findId(paramMap);
	       
	       String resultJson = id; //반환 값이 JSON 혁싱이므로, json 형식 String으로 변환해줌 
	       return resultJson;
	   }
	
		@RequestMapping(value="/findPwd.do", method=RequestMethod.POST)
	   public void findPwd(@RequestParam("id") String id, @RequestParam("email") String email,HttpServletResponse response) throws Exception {
	       Map<String, String> paramMap = new HashMap<String, String>();
	       paramMap.put("id", id);
	       paramMap.put("email", email);
	       
	       String pwd = memberService.findPwd(paramMap);
	       if(pwd == null) {
	    	   pwd = "";
	       }
	       String result = pwd;
	       response.getWriter().write(result);
	   }

	@Autowired
	private JavaMailSender mailSender;
	// mailSending 코드
	@RequestMapping(value ="mailSender.do", method = RequestMethod.GET)
	@ResponseBody
	public String mailSending(@RequestParam("email") String email) throws Exception{

		//뷰에서 넘어왔는지 확인
	     System.out.println("이메일 전송");
		
		//난수 생성(인증번호)
		Random r = new Random();
		int num = r.nextInt(888888) + 111111;  //111111 ~ 999999
		System.out.println("인증번호:" + num);
		
		/* 이메일 보내기 */
        String setFrom = "teamAA@naver.com";
        String toMail = email;
        String title = "회원가입 인증 이메일 입니다.";
        String content = 
                "AA 홈페이지를 방문해주셔서 감사합니다." +
                "<br><br>" + 
                "인증 번호는 " + num + "입니다." + 
                "<br>" + 
                "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
        
        try {
            
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
            helper.setFrom(setFrom);
            helper.setTo(toMail);
            helper.setSubject(title);
            helper.setText(content,true);
            mailSender.send(message);
              
        }catch(Exception e) {
            e.printStackTrace();
        }
        // 위 try catch 문은 이메일 전송 프로세스 중에 발생하는 예외 포착 
        String rnum = Integer.toString(num);  //view로 다시 반환할 때 String만 가능
        
        return rnum;
 
		
	}
	
	
	
}
