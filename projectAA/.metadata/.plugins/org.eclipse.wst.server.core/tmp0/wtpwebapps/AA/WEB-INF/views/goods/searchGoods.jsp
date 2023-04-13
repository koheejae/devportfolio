<%@page import="java.util.Map"%>
<%@page import="com.AA.goods.dao.GoodsDAO"%>
<%@page import="org.springframework.web.servlet.ModelAndView"%>
<%@page import="java.util.List"%>
<%@page import="com.AA.goods.vo.GoodsVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
//치환 변수 선언합니다.
pageContext.setAttribute("crcn", "\r\n"); //Space, Enter
pageContext.setAttribute("br", "<br/>"); //br 태그
request.setCharacterEncoding("UTF-8");
List<GoodsVO> goodsList = (List<GoodsVO>)request.getAttribute("goodsList");
int pageSize = 20;
Map<String,String> setting = (Map<String,String>)request.getAttribute("setting");
%>

<style>
#abc{
    padding:8px;
}
#ab{
 position:absolute;
 top:30px;
 right:20px;
}
#category_route{
	margin-bottom:50px;
}
#category_route a{
	color:rgb(255, 215, 0);
}
#category_route a:hover{
	color:rgb(255, 102, 0);
}

</style>
<head>
<title>검색 도서 목록 페이지</title>
</head>
<body>
      <div id="searchgoodsbody">
   <%
   String main = null;
   String middle = null;
   String sub = null;
   if(setting != null){
   	main = setting.get("goods_main_category");
   	middle = setting.get("goods_middle_category");
   	sub = setting.get("goods_sub_category");
   }
   String priceRange = request.getParameter("goodsPriceRange"); // 이전 페이지에서 선택된 금액 범위
   String sortBy = request.getParameter("sortBy"); // 이전 페이지에서 선택된 분류
   String primeYn = request.getParameter("goods_prime_yn"); // 이전 페이지에서 선택된 Prime 체크 여부
%>
<form id="ab" action="goodsListByCategory.do?" method="get" class="zzzzzzz">
   <%if(main != null){ %>
   <input type="hidden" name="goods_main_category" class="zzzzzzzz" value="<%= main %>">
   <%if(middle != null){ %>
   <input type="hidden" name="goods_middle_category" class="zzzzzzzzz" value="<%= middle %>">
   <%if(sub != null){ %>
   <input type="hidden" name="goods_sub_category" class="zzzzzzzzz" value="<%= sub %>">
   <%}}} %>
   <select name="goodsPriceRange">
      <option value="" <%= priceRange == null ? "selected" : "" %>>금액</option>
      <option value="1to5" <%= priceRange != null && priceRange.equals("1to5") ? "selected" : "" %>>1 ~ 5만원</option>
      <option value="5to10" <%= priceRange != null && priceRange.equals("5to10") ? "selected" : "" %>>5 ~ 10만원</option>
      <option value="over10" <%= priceRange != null && priceRange.equals("over10") ? "selected" : "" %>>10만원 초과</option>
   </select>
   <select name="sortBy">
      <option value="" <%= sortBy == null ? "selected" : "" %>>분류</option>
      <option value="credate" <%= sortBy != null && sortBy.equals("credate") ? "selected" : "" %>>최신순</option>
      <option value="totalSell" <%= sortBy != null && sortBy.equals("totalSell") ? "selected" : "" %>>인기순</option>
      <option value="grade" <%= sortBy != null && sortBy.equals("grade") ? "selected" : "" %>>평점순</option>
      
   </select>
   <input type="checkbox" name="goods_prime_yn" value="y" <%= primeYn != null && primeYn.equals("y") ? "checked" : "" %>>
   <span style="font-size:15px; font-weight:bold;">Prime</span>
   <input type="submit" value="검색">
</form>
         <div class="sort_goods">
       <% if(goodsList.isEmpty()) {%>
        <h1 style="margin-top:100px; font-size:3em;">등록된 상품이 없습니다.</h1>
		<%} else {%>
  
   <c:set var="goods_count" value="0" />
  <div id="category_route">
  <%
    
    String contextPath2 = request.getContextPath();
    String categoryPath = "";
    if(main != null) {
        categoryPath += "<a href='"+ contextPath2 + "/goods/goodsListByCategory.do?goods_main_category=" + main + "&offset=0'>" + main + "</a>";
        if(middle != null) {
            categoryPath += " > <a href='"+ contextPath2 + "/goods/goodsListByCategory.do?goods_main_category=" + main + "&goods_middle_category=" + middle + "&offset=0'>" + middle + "</a>";
            if(sub != null) {
                categoryPath += " > <a href='"+ contextPath2 + "/goods/goodsListByCategory.do?goods_main_category=" + main + "&goods_middle_category=" + middle + "&goods_sub_category=" + sub + "&offset=0'>" + sub + "</a>";
            }
        }
    } else {
        categoryPath = "<a href='" + contextPath2 + "/goods/goodsListByCategory.do'>" +"전체카테고리" + "</a>";
    }
  %>
  <h3><%= categoryPath %></h3>
  <h2 style="color:gray; font-size:1em;display:relative;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;총 ${totalCount}개 상품 검색됨</h2>
</div>


   <c:forEach var="item" items="${goodsList }">
      <c:set var="goods_count" value="${goods_count+1 }" />
      <div class="goods">
         <a
         href="${contextPath}/goods/goodsDetail.do?goods_num=${item.goods_num}">
            <img width="121" height="154" alt=""
         src="${contextPath}/thumbnails.do?goods_num=${item.goods_num}&fileName=${item.goods_fileName}">
         </a>

         <div class="title">${item.goods_title } (${item.goods_grade }) </div>
         <div class="price">
            <fmt:formatNumber value="${item.goods_standardPrice}" type="number"
               var="goods_standardPrice" />
            ${goods_standardPrice}원
         </div>
        
         <div class="credate">
         	<fmt:formatDate value="${item.goods_credate}" pattern="yyyy-MM-dd"/><c:if test="${item.goods_prime_yn eq 'y' }"><h4>Prime</h4></c:if>
         </div>
      </div>
   </c:forEach>
</div>
   <br>
   <%} %>


<div id="page_wrap">
<c:choose>
<c:when test="${blockEnd > 0}">
<%
String str2 = request.getQueryString();
String str3 = "imsi";

if(str2 != null){
str3 = str2.substring(0,str2.indexOf("="));
String result = str2.substring(str2.lastIndexOf("&")+1);

if(result.contains("offset")){
	str2 = str2.replace("&"+result,"");
	
}
}
String contextPath3 = "/AA/goods/goodsListByCategory.do?" + str2 + "&offset=";
String contextPath4 = "/AA/goods/searchGoods.do?" + str2 + "&offset=";
%>

<%if(str3.equals("searchWord")){ %>

  <ul id="page_control">
    <%-- 이전 블록 링크 --%>
    <c:if test="${currentPage > 0}">
  <li><a href="">이전</a></li>
</c:if>


    <%-- 페이지 번호 링크 --%>
    <c:forEach begin="${blockStart}" end="${blockEnd}" var="i">
      <%-- 현재 페이지면 다른 색상으로 표시 --%>
      <c:if test="${i == currentPage}">
        <li class="current"><a href="#">${i + 1}</a></li>
      </c:if>
      <c:if test="${i != currentPage}">
        <li><a href="<%= contextPath4 %>${i*20}">${i + 1}</a></li>
      </c:if>
    </c:forEach>

    <%-- 다음 블록 링크 --%>
    <c:if test="${currentPage < pageCount - 1}">
  <li><a href="">다음</a></li>
</c:if>
  </ul>
  
  <%}else{ %>
   <ul id="page_control">
    <%-- 이전 블록 링크 --%>
    <c:if test="${currentPage > 0}">
  <li><a href="">이전</a></li>
</c:if>


    <%-- 페이지 번호 링크 --%>
    <c:forEach begin="${blockStart}" end="${blockEnd}" var="i">
      <%-- 현재 페이지면 다른 색상으로 표시 --%>
      <c:if test="${i == currentPage}">
        <li class="current"><a href="#">${i + 1}</a></li>
      </c:if>
      <c:if test="${i != currentPage}">
        <li><a href="<%= contextPath3 %>${i*20}">${i + 1}</a></li>
      </c:if>
    </c:forEach>

    <%-- 다음 블록 링크 --%>
    <c:if test="${currentPage < pageCount - 1}">
  <li><a href="">다음</a></li>
</c:if>
  </ul>
  <%} %>
  </c:when>
  </c:choose>
</div>


   

</div>
   
   </body>