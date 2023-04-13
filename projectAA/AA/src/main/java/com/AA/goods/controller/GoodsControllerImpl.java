package com.AA.goods.controller;

import java.util.ArrayList;
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
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.AA.common.base.BaseController;
import com.AA.company.vo.CompanyVO;
import com.AA.goods.service.GoodsService;
import com.AA.goods.vo.GoodsVO;
import com.AA.goods.vo.ReviewVO;
import com.AA.member.vo.MemberVO;

import net.sf.json.JSONObject;

@Controller("goodsController")
@RequestMapping(value="/goods")
public class GoodsControllerImpl extends BaseController   implements GoodsController {
	@Autowired
	private GoodsService goodsService;
	@Autowired
	private MemberVO memberVO;
	@Autowired
	private CompanyVO companyVO;
	@Autowired
	private ReviewVO reviewVO;
	
	@RequestMapping(value="/goodsDetail.do" ,method = RequestMethod.GET)
	public ModelAndView goodsDetail(@RequestParam("goods_num") int goods_num,
			                       HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName=(String)request.getAttribute("viewName");
		HttpSession session=request.getSession();
		Map goodsMap=goodsService.goodsDetail(goods_num);
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("goodsMap", goodsMap);
		GoodsVO goodsVO=(GoodsVO)goodsMap.get("goodsVO");
		addGoodsInQuick(goods_num,goodsVO,session);
		//사업자 정보 가져오기
		String id = goodsVO.getId();
		System.out.println(id);
		companyVO = goodsService.goodsCompanyInfo(id);
		mav.addObject("goodsCompanyInfo", companyVO);
		//리뷰 목록 가져오기
		List<ReviewVO> review = goodsService.reviewList(goods_num);
		mav.addObject("review", review);
		return mav;
	}
	
	@RequestMapping(value="/keywordSearch.do",method = RequestMethod.GET,produces = "application/text; charset=utf8")
	public @ResponseBody String  keywordSearch(@RequestParam("keyword") String keyword,
			                                  HttpServletRequest request, HttpServletResponse response) throws Exception{
		response.setContentType("text/html;charset=utf-8");
		response.setCharacterEncoding("utf-8"); //  
		//System.out.println(keyword);
		if(keyword == null || keyword.equals(""))
		   return null ;  // null 값이면 기본
	
		keyword = keyword.toUpperCase();
	    List<String> keywordList =goodsService.keywordSearch(keyword);
	    
	 // 최종 완성될 JSONObject 선언(전체)
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("keyword", keywordList);
		 		
	    String jsonInfo = jsonObject.toString();
	   // System.out.println(jsonInfo);
	    return jsonInfo;
	}
	
	@RequestMapping(value="/searchGoods.do" ,method = RequestMethod.GET)
	public ModelAndView searchGoods(@RequestParam(value = "searchWord", required = false) String searchWord, 
			@RequestParam(value = "sortBy", defaultValue = "credate") String sortBy,
			@RequestParam(value = "priceRange_min", defaultValue = "0") int priceRange_min,
			@RequestParam(value = "priceRange_max", defaultValue = "100000000") int priceRange_max,
			@RequestParam(value = "goods_prime_yn", required = false) String goods_prime_yn,
			@RequestParam(value = "offset", defaultValue = "0") int offset,
			@RequestParam(value = "pageSize", defaultValue = "20") int pageSize,
			                       HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		if(request.getParameter("sortBy") !=null) {
			sortBy = request.getParameter("sortBy");
		}
		Map<String, Object> paramMap = new HashMap();
		Map<String, Integer> map = new HashMap();
		map.put("1to5", 1);
		map.put("5to10", 2);
		map.put("over10", 3);
		String str = request.getParameter("goodsPriceRange");
		
		paramMap.put("priceRange_min", priceRange_min);
	    paramMap.put("priceRange_max", priceRange_max);
	    paramMap.put("sortBy", sortBy);
	    paramMap.put("goods_prime_yn", goods_prime_yn);
	    paramMap.put("offset", offset);
	    paramMap.put("pageSize", pageSize);
	    paramMap.put("searchWord", searchWord);
		
	    if (map.get(str)!=null) {
		    Integer value = map.get(str);
		    if (value == null) {
		        paramMap.put("priceRange_min", 0);
		        paramMap.put("priceRange_max", 100000000);
		    } else {
		        switch (value) {
		            case 1:
		                paramMap.put("priceRange_min", 10000);
		                paramMap.put("priceRange_max", 50000);
		                break;
		            case 2:
		                paramMap.put("priceRange_min", 50000);
		                paramMap.put("priceRange_max", 100000);
		                break;
		            case 3:
		                paramMap.put("priceRange_min", 100000);
		                paramMap.put("priceRange_max", 100000000);
		                break;
		        }
		    }
		}
	    int totalCount = goodsService.getTotalCountByCategory(paramMap);
	    
	    int pageCount = (totalCount + pageSize - 1) / pageSize;
	    int blockStart = (offset / pageSize / 10) * 10 * pageSize;
	    int blockEnd = Math.min(blockStart + pageSize - 1, pageCount - 1);
	    int prevOffset = Math.max(blockStart - (pageSize * 10), 0);
	    int nextOffset = Math.min(blockStart + (pageSize * 10), pageCount - 1);
	    
		String viewName=(String)request.getAttribute("viewName");
		List<GoodsVO> goodsList=goodsService.searchGoods(paramMap);
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("pageCount", pageCount);
	    mav.addObject("blockStart", blockStart);
	    mav.addObject("blockEnd", blockEnd);
	    mav.addObject("prevOffset", prevOffset);
	    mav.addObject("nextOffset", nextOffset);
	    mav.addObject("offset", offset);
	    
	    mav.addObject("goodsList", goodsList);
	    mav.addObject("totalCount", totalCount);
		return mav;	
	}
	@RequestMapping(value="/goodsListByCategory.do" ,method = RequestMethod.GET)
	public ModelAndView goodsListByCategory(@RequestParam(value = "goods_main_category", required = false) String goods_main_category,
			@RequestParam(value = "goods_middle_category", required = false) String goods_middle_category,
			@RequestParam(value = "goods_sub_category", required = false) String goods_sub_category,
			@RequestParam(value = "sortBy", defaultValue = "credate") String sortBy,
			@RequestParam(value = "priceRange_min", defaultValue = "0") int priceRange_min,
			@RequestParam(value = "priceRange_max", defaultValue = "100000000") int priceRange_max,
			@RequestParam(value = "goods_prime_yn", required = false) String goods_prime_yn,
			@RequestParam(value = "offset", defaultValue = "0") int offset,
			@RequestParam(value = "pageSize", defaultValue = "20") int pageSize,
			HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		if(request.getParameter("sortBy") !=null) {
			sortBy = request.getParameter("sortBy");
		}
		
		
		Map<String, Object> paramMap = new HashMap();
		Map<String, Integer> map = new HashMap();
		map.put("1to5", 1);
		map.put("5to10", 2);
		map.put("over10", 3);
		String str = request.getParameter("goodsPriceRange");
		
		
	    paramMap.put("goods_main_category", goods_main_category);
	    paramMap.put("goods_middle_category", goods_middle_category);
	    paramMap.put("goods_sub_category", goods_sub_category);
	    paramMap.put("priceRange_min", priceRange_min);
	    paramMap.put("priceRange_max", priceRange_max);
	    paramMap.put("sortBy", sortBy);
	    paramMap.put("goods_prime_yn", goods_prime_yn);
	    paramMap.put("offset", offset);
	    paramMap.put("pageSize", pageSize);
	    
	    if (goods_main_category != null && goods_main_category.equals("")) {
	        paramMap.put("goods_main_category", null);
	        paramMap.put("goods_middle_category", null);
	        paramMap.put("goods_sub_category", null);
	    }
	    if (map.get(str)!=null) {
		    Integer value = map.get(str);
		    if (value == null) {
		        paramMap.put("priceRange_min", 0);
		        paramMap.put("priceRange_max", 100000000);
		    } else {
		        switch (value) {
		            case 1:
		                paramMap.put("priceRange_min", 10000);
		                paramMap.put("priceRange_max", 50000);
		                break;
		            case 2:
		                paramMap.put("priceRange_min", 50000);
		                paramMap.put("priceRange_max", 100000);
		                break;
		            case 3:
		                paramMap.put("priceRange_min", 100000);
		                paramMap.put("priceRange_max", 100000000);
		                break;
		        }
		    }
		}
	    Map<String,String> setting = new HashMap();
	    setting.put("goods_main_category", goods_main_category);
	    setting.put("goods_middle_category", goods_middle_category);
	    setting.put("goods_sub_category", goods_sub_category);
	    
		String viewName=(String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
	    List<GoodsVO> goodsList = goodsService.getGoodsListByCategory(paramMap);
	    int totalCount = goodsService.getTotalCountByCategory(paramMap);
	    
	    int pageCount = (totalCount + pageSize - 1) / pageSize;
	    int blockStart = (offset / pageSize / 10) * 10 * pageSize;
	    int blockEnd = Math.min(blockStart + pageSize - 1, pageCount - 1);
	    int prevOffset = Math.max(blockStart - (pageSize * 10), 0);
	    int nextOffset = Math.min(blockStart + (pageSize * 10), pageCount - 1);

	    
	    mav.addObject("pageCount", pageCount);
	    mav.addObject("blockStart", blockStart);
	    mav.addObject("blockEnd", blockEnd);
	    mav.addObject("prevOffset", prevOffset);
	    mav.addObject("nextOffset", nextOffset);
	    mav.addObject("offset", offset);
	    mav.addObject("setting",setting);
	    
	    mav.addObject("goodsList", goodsList);
	    mav.addObject("totalCount", totalCount);
	    return mav;
	}
		


	private void addGoodsInQuick(int goods_num,GoodsVO goodsVO,HttpSession session){
		boolean already_existed=false;
		List<GoodsVO> quickGoodsList; //최근 본 상품 저장 ArrayList
		quickGoodsList=(ArrayList<GoodsVO>)session.getAttribute("quickGoodsList");
		
		if(quickGoodsList!=null){
			if(quickGoodsList.size() < 4){ //미리본 상품 리스트에 상품개수가 세개 이하인 경우
				for(int i=0; i<quickGoodsList.size();i++){
					GoodsVO _goodsBean=(GoodsVO)quickGoodsList.get(i);
					if(goods_num == _goodsBean.getGoods_num()){
						already_existed=true;
						break;
					}
				}
				if(already_existed==false){
					quickGoodsList.add(goodsVO);
				}
			}
			
		}else{
			quickGoodsList =new ArrayList<GoodsVO>();
			quickGoodsList.add(goodsVO);
			
		}
		session.setAttribute("quickGoodsList",quickGoodsList);
		session.setAttribute("quickGoodsListNum", quickGoodsList.size());
	}
	
	@ResponseBody
    @RequestMapping(value = "/addReview.do", method = RequestMethod.POST)
   public ResponseEntity addReview(ReviewVO reviewVO, HttpSession session, HttpServletRequest request, HttpServletResponse response ) throws Exception {
      response.setContentType("text/html; charset=UTF-8");
      request.setCharacterEncoding("utf-8");
      String message = null;
      ResponseEntity resEntity = null;
      HttpHeaders responseHeaders = new HttpHeaders();
      responseHeaders.add("Content-Type", "text/html; charset=utf-8");
      memberVO = (MemberVO)session.getAttribute("memberInfo");
      if(memberVO != null) {
         String member_id = memberVO.getId();
         String member_nickName = memberVO.getNickname();
         String member_status = "일반회원";
         reviewVO.setId(member_id);
         reviewVO.setNickname(member_nickName);
         reviewVO.setStatus(member_status);
      } else {
         companyVO = (CompanyVO)session.getAttribute("companyInfo");
         String company_id = companyVO.getId();
         String company_nickName = companyVO.getNickname();
         String company_status = "사업자회원";
         reviewVO.setId(company_id);
         reviewVO.setNickname(company_nickName);
         reviewVO.setStatus(company_status);
      }
      goodsService.addReview(reviewVO);
      message  = "<script>";
       message +=" alert('리뷰 등록이 완료되었습니다');";
       message += " location.href='"+request.getContextPath()+"/goods/goodsDetail.do?goods_num=" + reviewVO.getGoods_num() + "';";
       message += " </script>";
      resEntity =new ResponseEntity(message, responseHeaders, HttpStatus.OK);
      return resEntity;
   }
	
}
