<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8"
   isELIgnored="false" %>

   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<c:set var="myGoodsList"  value="${cartMap.myGoodsList}"  />
<c:set var="myOrderList" value="${orderMap.myOrderList}"/>
<head>
<%
    session.removeAttribute("side_menu");
%>
<style>
 .bt1{
 width: 70px;
    height: 30px;
    border-radius: 5px;
    margin:3px;
    border: 0px;
 text-align: center;
 background-color:rgb(255, 215, 0);
 }
 .bt2{
  width: 70px;
    height: 30px;
    border-radius: 5px;
    border: 0px;
 text-align: center;
 background-color:lightgray;
 }
</style>
<script type="text/javascript">
window.onpageshow = function(event) {
    if ( event.persisted || (window.performance && window.performance.navigation.type == 2)) {
   // Back Forward Cache로 브라우저가 로딩될 경우 혹은 브라우저 뒤로가기 했을 경우
    }

}




</script>
<style>
   .list_view{
      width: 900px;
    margin-left: auto;
    margin-right: auto;
    padding-top: 25px;
    border-top: 5px solid rgb(255, 215, 0);
   }
   #orderCheckBar{
   width: 500px;

   border-top: 5px solid rgb(255, 215, 0);
   }
 
   .OrderChecktopName td {
   font-size:1em;
   font-weight:bold;
   }
</style>
</head>
<body>
   <h3 style="font-size:2em;width:900px; height:60px; margin-left:300px;margin-right:auto;">주문조회</h3>
   <table class="list_view">
   <!-- 주문 조회 폼 -->
      <tbody align=center>
         <tr class="OrderChecktopName">
            <td>주문번호</td>
            <td>상품 이미지</td>
            <td>업체명</td>
            <td>상품명</td>
            <td>옵션 및 수량</td>
            <td>금액</td>
            <td>주문상태</td>
            <td>주문 날짜</td>
         </tr>
         
         <c:choose>
             <c:when test="${ empty myOrderList }">
             <tr>
                <td colspan=8 class="fixed" height="300px;">
                  <strong>주문하신 상품이 없습니다.</strong>
                </td>
              </tr>
             </c:when>
         <c:otherwise > 
                  <c:forEach var="item" items="${myOrderList }">
                 <tr> 
                  <td><h2>${item.order_seq_num}</h2></td>
              <td>
                  <a href="${contextPath}/goods/goodsDetail.do?goods_num=${item.goods_num }">
                     <img width="75" alt="" src="${contextPath}/thumbnails.do?goods_num=${item.goods_num}&fileName=${item.goods_fileName}"  />
                  </a>
              </td>
              <td>   
                  <h2><a href="${contextPath}/goods/goodsDetail.do?goods_num=${item.goods_num }">${item.orderer_name }</a></h2>
              </td>
              <td>
                  <h2><a href="${contextPath}/goods/goodsDetail.do?goods_num=${item.goods_num }">${item.goods_title }</a></h2>
              </td>
              <td ><span>${item.order_goods_option}</span><br><span>${item.order_goods_qty}</span></td>

              <td><span>${item.goods_resultPrice}원</span></td>
              <td><h2>${item.order_status}</h2></td>
              <td><h2>${item.order_credate}</h2></td>

         </tr> 
         
 
         </c:forEach>    

        </c:otherwise>

       </c:choose> 
      
      </tbody> 

     </table>
   <br>

   
   <table  width=900px;   class="list_view" style="margin-bottom:30px; margin-left:300px;">
</table>
</body>