<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8"
   isELIgnored="false"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
</head>
<style>
.list_view{
  border-spacing: 20px;
  width:860px;
  border-collapse: separate;
  margin-left:20px; 
}
.detail_table{
 border:8px groove #adb5bd;
 height:160px;
 width:900px;
 border-right:none;
 border-left:none;
}  
.div_2{ 
 border:5px inset #adb5bd;
 height:160px; 
 width:900px;
  border-right:none;
 border-left:none;
}
.form_order h1 {
 font-size:1.3em;
}
.div_2 h2 {
 font-size:1.3em;
}
.detail_table td{
  font-size:1.3em;
}
.table_1 {
  border-spacing: 20px;
  border-collapse: separate;
}
.table_2 {
  border-spacing: 20px;
  border-collapse: separate;
}
.dot_line input[type=text] {
  height:28px; 
  width:250px;
  border-radius: 5px;
}
.bottom_btnz {
  margin-left:600px;
  margin-top:0px;
}
.orderResult{
	margin-left:280px;
}
</style>

<BODY> 
<div class="orderResult">
   <H1>1.최종 주문 내역서</H1> 
   <div class="top_view_1" style="border:5px inset #adb5bd; width:900px; height:160px; border-right:none; border-left:none;">
   <TABLE class="list_view">
      <TBODY align=center>
         <tr style="background: #f5d700; border-collapse: separate; border-spacing: 10px; height:30px; font-size:0.8em; margin-left:50px;">
            <td><h3>주문번호</h3></td> 
            <td colspan=2 class="fixed"><h3>주문상품명</h3></td>
            <td><h3>수량</h3></td>
            <td><h3>상품옵션</h3></td> 
            <td><h3>주문금액</h3></td>
            <td><h3>예상적립금</h3></td>
            <td><h3>주문금액합계</h3></td>
         </tr>
         <TR>
            <c:forEach var="item" items="${myOrderList }">
                <td> ${item.order_num }</td>
               <TD class="goods_image">
                 <a href="${contextPath}/goods/goodsDetail.do?goods_num=${item.goods_num }">
                   <IMG width="75" alt=""  src="${contextPath}/thumbnails.do?goods_num=${item.goods_num}&fileName=${item.goods_fileName}">
                 </a>
               </TD>
               <TD>
                 <h2>
                    <A href="${contextPath}/goods/goodsDetail.do?goods_num=${item.goods_num }">${item.goods_title } <br> ${item.company_name }</A> 
                 </h2>
               </TD>
               <td>
                 <h2>${item.order_goods_qty }개<h2>
               </td>
               <td>${item.order_goods_option}</td>
               <td><h2>${item.order_price}원</h2></td>
               <td><h2>${item.order_price / 10 }원</h2></td>
               <td>
                 <h2>${item.order_price}원</h2>
               </td>
         </TR>
         </c:forEach>
      </TBODY>
   </TABLE>
   </div>
   <br>
   <br>
   <br>
<form  class="form_order" name="form_order">
<h1>2.주문고객</h1>
   <div class="div_2">
       <table class="table_2">
         <TBODY>
          <tr class="dot_line">
            <td><h2>이름</h2></td>
            <td>
             <input  type="text" value="${orderer.name}" size="15" disabled />
            </td>
           </tr>
           <tr class="dot_line">
            <td ><h2>핸드폰</h2></td>
            <td>
             <input  type="text" value="${orderer.tel}" size="15" disabled />
            </td>
           </tr>
           <tr class="dot_line">
            <td ><h2>이메일</h2></td>
            <td>
               <input  type="text" value="${orderer.email}" size="15" disabled />
            </td>
           </tr>
         </TBODY>
      </table>
   </div>
   <br>
   <br>
   <br>
   <H1>3.결제정보</H1>
   <DIV class="detail_table">
      <table class="table_1">
         <TBODY>
            <TR class="dot_line">
               <TD class="fixed_join">결제방법</TD>
               <TD>
                  ${myOrderInfo.pay_method }
                </TD>
            </TR>
            <TR class="dot_line">
               <TD class="fixed_join">결제카드</TD>
               <TD>
                  ${myOrderInfo.card_com_name}
                </TD>
            </TR>
            <TR class="dot_line">
               <TD class="fixed_join">할부기간</TD>
               <TD>
                  ${myOrderInfo.card_pay_month }
                </TD>
            </TR>
         </TBODY>
      </table>
   </DIV>
</form>
   <br>
   <br>
   <div class="bottom_btnz">

      <a href="${contextPath}/goods/goodsListByCategory.do"> 
         <IMG width="75" alt="" src="${contextPath}/resources/image/btn_shoping_continue.jpg">
      </a>
      </div>
   </div>
         
         
         