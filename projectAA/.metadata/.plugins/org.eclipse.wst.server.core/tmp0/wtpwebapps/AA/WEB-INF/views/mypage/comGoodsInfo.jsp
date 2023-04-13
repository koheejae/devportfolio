<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<meta charset="utf-8">
<head>
<%
    session.removeAttribute("side_menu");
%>
<style>
.list_view{
	width: 900px;
   margin-left: auto;
   margin-right: auto;
   padding-top: 10px;
   border-top: 5px solid rgb(255, 215, 0);
}
input[type=button] {
	width: 100px; height: 40px;
   border: 1px solid rgb(248, 248, 248);
   border-radius: 5px;
   background-color: rgb(245, 215, 0);
   color:#fff;
   font-size: 1.1em;
   font-weight: bold;
   float: right;
}
</style>
<script type="text/javascript">
</script>
</head>
<body>
	<h3 style="font-size:2em;width:900px; height:60px; margin-left:300px;margin-right:auto;">My 상품 조회</h3>
   <table class="list_view">
      <tbody align=center >
         <tr>
            <td>선택</td>
            <td>상품 번호</td>
            <td>상품명</td>
            <td>상품 이미지</td>
            <td>옵션 및 수량</td>
            <td>금액</td>
            <td>등록 날짜</td>
            <td></td>
         </tr>
         <c:choose>
             <c:when test="${ empty myCartList }">
             <tr>
                <td colspan=8 class="fixed" height="300px;">
                  <strong>등록한 상품이 없습니다.</strong>
                </td>
              </tr>
             </c:when>
	         <c:otherwise>
	         	<tr>
	         		<c:forEach var="item" items="${myGoodsList }">
	         		   <td><input type="checkbox" name="checked_goods"  checked  value="${item.goods_num }"  onClick="calcGoodsPrice(${goods_resultPrice*cart_goods_qty},this)"></td>
		               <td>
		                  <h2>${item.goods_num }</h2>
		               </td>
		               <td>
		                  <h2><a href="${contextPath}/goods/goodsDetail.do?goods_num=${item.goods_num }">${item.goods_title }</a></h2>
		               </td>
		               <td class="goods_image">
		                  <a href="${contextPath}/goods/goodsDetail.do?goods_num=${item.goods_num }">
		                     <img width="75" alt="" src="${contextPath}/thumbnails.do?goods_num=${item.goods_num}&fileName=${item.goods_fileName}"  />
		                  </a>
		               </td>
		               <td>
		                  <select id="goods_option" name="goods_option">
						    <option value="standardPrice" ${goods_option == 'standardPrice' ? 'selected' : ''}>STANDARD</option>
						    <option value="deluxePrice" ${goods_option == 'deluxePrice' ? 'selected' : ''}>DELUXE</option>
						    <option value="premiumPrice" ${goods_option == 'premiumPrice' ? 'selected' : ''}>PREMIUM</option>
						  </select><br>
				  	   </td>
				  	   <td>
				  	   	  <c:if test="${goods_option == 'deluxePrice'}">
				  	   	  	<h2>${item.standardPrice}</h2>
				  	   	  </c:if>
				  	   	  <c:if test="${goods_option == 'standardPrice'}">
				  	   	  	<h2>${item.deluxePrice}</h2>
				  	   	  </c:if>
				  	   	  <c:if test="${goods_option == 'premiumPrice'}">
				  	   	  	<h2>${item.premiumPrice}</h2>
				  	   	  </c:if>
				  	   </td>
		               <td>
		                  <h2>${item.goods_credate }</h2>
		               </td>
	         		</c:forEach>
	         	</tr>
	         </c:otherwise>
         </c:choose>
         </tbody>
   </table>
		<a href="${contextPath}/company/addNewGoods.do"><input type="button" value="상품 등록" style="margin-right: 100px;"></a>
  		<input type="button" value="선택 삭제"/>
</body>
</html>