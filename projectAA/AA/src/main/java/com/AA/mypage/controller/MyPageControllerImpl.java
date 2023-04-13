package com.AA.mypage.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.AA.common.base.BaseController;
import com.AA.company.vo.CompanyVO;
import com.AA.member.vo.MemberVO;
import com.AA.mypage.service.MyPageService;
import com.AA.order.vo.OrderVO;


@Controller("myPageController")
@RequestMapping(value="/mypage")
public class MyPageControllerImpl extends BaseController  implements MyPageController{
	@Autowired
	private MyPageService myPageService;
	
	@Autowired
	private MemberVO memberVO;
	@Autowired
	private CompanyVO companyVO;
	@Autowired
	private OrderVO orderVO;
	
	
	@Override
	@RequestMapping(value="/myPageMain.do" ,method = RequestMethod.GET)
	public ModelAndView myPageMain(@RequestParam(required = false,value="message")  String message,
			   HttpServletRequest request, HttpServletResponse response)  throws Exception {
		HttpSession session=request.getSession();
		session=request.getSession();
		session.setAttribute("side_menu", "my_page"); //마이페이지 사이드 메뉴로 설정한다.
		
		String viewName=(String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		memberVO=(MemberVO)session.getAttribute("memberInfo");
		String id=memberVO.getId();
		
		List<OrderVO> myOrderList=myPageService.listMyOrderGoods(id);
		
		mav.addObject("message", message);
		mav.addObject("myOrderList", myOrderList);

		return mav;
	}
	@Override
	@RequestMapping(value="/deleteMember.do", method = RequestMethod.POST)
	public ModelAndView deleteMember(@RequestParam("login_id") String login_id, HttpServletRequest request, HttpServletResponse response)
	throws Exception {
		HttpSession session=request.getSession();
		session.setAttribute("isLogOn", false);
		myPageService.deleteMember(login_id);
		ModelAndView mav = new ModelAndView("redirect:/main/main.do");
		return mav;
	}
	@Override
	@RequestMapping(value="/myOrderDetail.do" ,method = RequestMethod.GET)
	public ModelAndView myOrderDetail(@RequestParam("order_id")  String order_id,HttpServletRequest request, HttpServletResponse response)  throws Exception {
		
		String viewName=(String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		HttpSession session=request.getSession();
		MemberVO orderer=(MemberVO)session.getAttribute("memberInfo");
		
		List<OrderVO> myOrderList=myPageService.findMyOrderInfo(order_id);
		mav.addObject("orderer", orderer);
		mav.addObject("myOrderList",myOrderList);
		return mav;
	}
	
	@Override
	@RequestMapping(value="/listMyOrderHistory.do" ,method = RequestMethod.GET)
	public ModelAndView listMyOrderHistory(@RequestParam Map<String, String> dateMap,
			                               HttpServletRequest request, HttpServletResponse response)  throws Exception {
		String viewName=(String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		HttpSession session=request.getSession();
		memberVO=(MemberVO)session.getAttribute("memberInfo");
		String  id=memberVO.getId();
		
		String fixedSearchPeriod = dateMap.get("fixedSearchPeriod");
		String beginDate=null,endDate=null;
		
		String [] tempDate=calcSearchPeriod(fixedSearchPeriod).split(",");
		beginDate=tempDate[0];
		endDate=tempDate[1];
		dateMap.put("beginDate", beginDate);
		dateMap.put("endDate", endDate);
		dateMap.put("id", id);
		List<OrderVO> myOrderHistList=myPageService.listMyOrderHistory(dateMap);
		
		String beginDate1[]=beginDate.split("-"); //검색일자를 년,월,일로 분리해서 화면에 전달합니다.
		String endDate1[]=endDate.split("-");
		mav.addObject("beginYear",beginDate1[0]);
		mav.addObject("beginMonth",beginDate1[1]);
		mav.addObject("beginDay",beginDate1[2]);
		mav.addObject("endYear",endDate1[0]);
		mav.addObject("endMonth",endDate1[1]);
		mav.addObject("endDay",endDate1[2]);
		mav.addObject("myOrderHistList", myOrderHistList);
		return mav;
	}	
	
	@Override
	@RequestMapping(value="/cancelMyOrder.do" ,method = RequestMethod.POST)
	public ModelAndView cancelMyOrder(@RequestParam("order_id")  String order_id,
			                         HttpServletRequest request, HttpServletResponse response)  throws Exception {
		ModelAndView mav = new ModelAndView();
		myPageService.cancelOrder(order_id);
		mav.addObject("message", "cancel_order");
		mav.setViewName("redirect:/mypage/myPageMain.do");
		return mav;
	}
	
	@Override
	@RequestMapping(value="/myDetailInfo.do" ,method = RequestMethod.GET)
	public ModelAndView myDetailInfo(HttpServletRequest request, HttpServletResponse response)  throws Exception {
		HttpSession session=request.getSession();
		session=request.getSession();
		session.setAttribute("side_menu", "my_page"); //마이페이지 사이드 메뉴로 설정한다.
		
		String viewName=(String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		return mav;
	}
	@Override
	@RequestMapping(value="/comDetailInfo.do" ,method = RequestMethod.GET)
	public ModelAndView comDetailInfo(HttpServletRequest request, HttpServletResponse response)  throws Exception {
		HttpSession session=request.getSession();
		session=request.getSession();
		session.setAttribute("side_menu", "company_page"); //마이페이지 사이드 메뉴로 설정한다.
		
		String viewName=(String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		return mav;
	}
	
	@Override
	@RequestMapping(value="/modifyMyInfo.do" ,method = RequestMethod.POST)
	public ResponseEntity modifyMyInfo(@RequestParam("attribute")  String attribute,
			                 @RequestParam("value")  String value,
			               HttpServletRequest request, HttpServletResponse response)  throws Exception {
		Map<String,String> memberMap=new HashMap<String,String>();
		String val[]=null;
		HttpSession session=request.getSession();
		memberVO=(MemberVO)session.getAttribute("memberInfo");
		String id=memberVO.getId();
		
		if(attribute.equals("email")){
			val=value.split(",");
			memberMap.put("email",val[0]);
			memberMap.put("emailsts_yn", val[1]);
		}else if(attribute.equals("tel")){
			val=value.split(",");
			memberMap.put("tel",val[0]);
			memberMap.put("smssts_yn", val[1]);
		}else if(attribute.equals("address")){
			val=value.split(",");
			memberMap.put("zipcode",val[0]);
			memberMap.put("roadAdd",val[1]);
			memberMap.put("jibunAdd", val[2]);
			memberMap.put("namujiAdd", val[3]);
		}else {
			memberMap.put(attribute,value);	
		}
		
		memberMap.put("id", id);
		
		//수정된 회원 정보를 다시 세션에 저장한다.
		memberVO=(MemberVO)myPageService.modifyMyInfo(memberMap);
		session.removeAttribute("memberInfo");
		session.setAttribute("memberInfo", memberVO);
		
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		message  = "mod_success";
		resEntity =new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}	

	@Override
	@RequestMapping(value="/modifyComInfo.do" ,method = RequestMethod.POST)
	public ResponseEntity modifyComInfo(@RequestParam("attribute")  String attribute,
			                 @RequestParam("value")  String value,
			               HttpServletRequest request, HttpServletResponse response)  throws Exception {
		Map<String,String> memberMap=new HashMap<String,String>();
		String val[]=null;
		HttpSession session=request.getSession();
		companyVO=(CompanyVO)session.getAttribute("companyInfo");
		String id=companyVO.getId();
		
		if(attribute.equals("email")){
			val=value.split(",");
			memberMap.put("email",val[0]);
			memberMap.put("emailsts_yn", val[1]);
		}else if(attribute.equals("company_phone")){
			val=value.split(",");
			memberMap.put("company_phone",val[0]);
			memberMap.put("smssts_yn", val[1]);
		}else if(attribute.equals("company_address")){
			val=value.split(",");
			memberMap.put("company_zipcode",val[0]);
			memberMap.put("company_roadAdd",val[1]);
			memberMap.put("company_jibunAdd", val[2]);
			memberMap.put("compamy_namujiAdd", val[3]);
		}else {
			memberMap.put(attribute,value);	
		}
		
		memberMap.put("id", id);
		
		//수정된 회원 정보를 다시 세션에 저장한다.
		companyVO=(CompanyVO)myPageService.modifyComInfo(memberMap);
		session.removeAttribute("companyInfo");
		session.setAttribute("companyInfo", companyVO);
		
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		message  = "mod_success";
		resEntity =new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}	
	@RequestMapping(value="/myOrderCheck.do" ,method = RequestMethod.GET)
	public ModelAndView myCartMain(HttpServletRequest request, HttpServletResponse response)  throws Exception {
		  //캐시 관련 설정을 해제
		  response.setHeader("Expires", "Sat, 6 May 1995 12:00:00 GMT");
		  response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");
		  response.addHeader("Cache-Control", "post-check=0, pre-check=0");
		  response.setHeader("Pragma", "no-cache");
		//뷰 이름을 받아옴
		String viewName=(String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		HttpSession session=request.getSession();
		session=request.getSession();
		
		//마이페이지 사이드 메뉴로 설정
		session.setAttribute("side_menu", "my_page"); 
		
		//세션에서 회원 정보를 받아와서 회원 아이디를 구함
		MemberVO memberVO=(MemberVO)session.getAttribute("memberInfo");
		String member_id=memberVO.getId();
		
		//주문 정보를 받아옴
		orderVO.setId(member_id);
		Map<String ,List> orderMap=myPageService.myOrderCheck(orderVO);  
		session.setAttribute("orderMap", orderMap);
		mav.addObject("orderMap", orderMap);
		return mav;
	}
	
}
