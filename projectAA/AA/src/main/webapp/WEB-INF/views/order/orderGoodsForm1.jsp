<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<c:set var="myOrderGoods"  value="${orderMap.myOrderGoods}"  />
<c:set var="orderGoodsCompany"  value="${orderMap.orderGoodsCompany}"  />
<c:set var="orderList"  value="${orderMap.orderList}"  />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>상품 구매하기창</title>
<style>  
body {
font-family: Arial, sans-serif;
background-color: #ffffff;
}
#orderHead {
       font-size: 24px;
    line-height: 1.4;
    margin-left: 215px;
    padding-top: 15px;
} 
.goodsBuyPNG {
  display:inline-block;
    float:right;
        margin-right: 50px;
}  
.goodsBuyForm{     
   width: 1050;
    height: 1000px;
    text-align: left;
    padding: 10px;
    display: inline-block;
    margin-left: 20px;
}  
.goodsBuyForm1{ 
       width: 680px;
    border: 1px solid grey;
    display: inline-block;
    margin-top: 0px;
    margin-left: 20px;
}  
.orderCheck{
	margin:0;
	width:100%;
	border-collapse: collapse;
}
.orderCheck .goods_img{
margin:10px;
	width:80px;
	height:70px;
}
.orderCheck .table_center{
	text-align:center;
}
.orderCheck tr{
	margin-bottom:10px;
	line-height: 2.2;
}
.goodsBuyForm2{ 
   width: 300px;
    height: 350px;
    border: 1px solid grey;
    display: inline-block;
    margin-left: 10px;
    margin-right: 0;
    position: absolute;
}    
.goodsBuyForm3{ 
   width: 680px;
    height: 250px;
    margin-top: 10px;
    line-height: 1.6;
    padding: auto;
    margin-left: 20px;
    flex-direction: row;
    justify-content: center;
}
  .goodsBuyForm3 th {
    width: 400px; 
  }
.goodsBuyForm3 td {
   font-size:1.3em;
   margin-top:5px;
}
.goodsBuyForm4{
   width: 680px;
    height: 150px;
    border: 1px solid grey;
    display: inline-block;
    margin-top: 10px;
    margin-left: 20px;
}
.goodsBuyForm5{
   width: 680px;
    height: 250px;
    border: 1px solid grey;
    display: inline-block;
    margin-top: 10px;
    margin-left: 20px;
}
.upperArrow{
	width:20px;
	height:20px;
	transform: rotate(180deg);
}
.upperArrow:hover{
}
.lowerArrow{
	width:20px;
	height:20px;
	
}
.lowerArrow:hover{
}
</style>
<script>
session.getAttribute("orderer")

function modify_goods_qty(goods_num,index, updown){
	var length = document.getElementsByName('order_goods_option').length;
	var _order_goods_qty=0;
	var input = document.getElementsByName("order_goods_qty")[index];
	
	var value = Number(input.value);
   if(length>1){ //카트에 제품이 한개인 경우와 여러개인 경우 나누어서 처리한다.
	   if(updown == "up"){
		   
	   if(value < 10){
		   value += 1;
	   }
	   }else if(value > 0){
		   value -+ 1;
	   }
   }else if(updown == "up"){
		   
	   if(value < 10){
		   value += 1;
	   }
	   }else if(value > 0){
		   value -= 1;
	   }
   
   
   
   input.value = value;
	  document.getElementById('qty_0').textContent = value;
}

function modify_goods_option(goods_num, index, updown) {
	  var length = document.getElementsByName('order_goods_option').length;
	  var goods_option = "standard";

	  var input = document.getElementsByName("order_goods_option")[index];

	  if (length > 1) {
	    if (input.value == "standard") {
	      if (updown == "up") {
	        goods_option = "deluxe";
	      } else {
	        goods_option = "standard";
	      }
	    } else if (input.value == "deluxe") {
	      if (updown == "up") {
	        goods_option = "premium";
	      } else {
	        goods_option = "standard";
	      }
	    } else if (input.value == "premium") {
	      if (updown == "up") {
	        goods_option = "deluxe";
	      } else {
	        goods_option = "standard";
	      }
	    }
	  } else {
	    if (input.value == "standard") {
	      if (updown == "up") {
	        goods_option = "deluxe";
	      } else {
	        goods_option = "standard";
	      }
	    } else if (input.value == "deluxe") {
	      if (updown == "up") {
	        goods_option = "premium";
	      } else {
	        goods_option = "standard";
	      }
	    } else if (input.value == "premium") {
	      if (updown == "up") {
	        goods_option = "premium";
	      } else {
	        goods_option = "deluxe";
	      }
	    }
	  }

	  input.value = goods_option;
	  document.getElementById('option_0').textContent = input.value;
	}


</script>
</head> 
<body>  
   <img class="goodsBuyPNG" alt="결제창"  src="${contextPath}/resources/image/goodsHead.png">
   <h3 id="orderHead">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;상품 구매하기</h3> 
   
   <form class="goodsBuyForm">
   
   <div class="goodsBuyForm1">
   <table class="orderCheck">
   	<tr style="border-bottom:2px solid lightgray;">
   		<td colspan="2"><h2 style="font-size:20px; margin-left:20px;">주문내역</h2></td>
   		<td>상품 옵션</td>
   		<td>주문 수량</td>
   		<td>결제 금액</td>
   	</tr>
   	<form name="frm_order_all_cart">
   	<c:forEach var="item" items="${orderList }" varStatus="cnt">
   	<c:set var="company_name" value="${orderGoodsCompany[cnt.count-1].company_name}" />
    <c:set var="order_goods_option" value="${orderList[cnt.count-1].order_goods_option}" />
   	<tr>
   		<td><a href="${contextPath}/goods/goodsDetail.do?goods_num=${item.goods_num }">
                     <img width="75" alt="" src="${contextPath}/thumbnails.do?goods_num=${item.goods_num}&fileName=${item.goods_fileName}"  />
                  </a></td>
   		<td><a href="${contextPath}/goods/goodsDetail.do?goods_num=${item.goods_num }">${item.goods_title }</a> <br><a href="${contextPath}/goods/goodsDetail.do?goods_num=${item.goods_num }"><h2>${company_name}</h2></a> </td>
   		<td class="table_center"><img class="upperArrow" src="${contextPath}/resources/image/arrow1.png" onclick="javascript:modify_goods_option('${item.goods_num}','${cnt.count-1}','up');"><br><input name="order_goods_option" type="hidden" value="${item.order_goods_option}" /><span id="option_${cnt.count-1}">${item.order_goods_option }</span><br><img class="lowerArrow" src="${contextPath}/resources/image/arrow1.png" onclick="javascript:modify_goods_option('${item.goods_num}','${cnt.count-1}','down');">
   		</td>
   		<td class="table_center"><img class="upperArrow" src="${contextPath}/resources/image/arrow1.png" onclick="javascript:modify_goods_qty('${item.goods_num}','${cnt.count-1}','up');"><br><input name="order_goods_qty" type="hidden" value="${item.order_goods_qty}" /><span id="qty_${cnt.count-1}">${item.order_goods_qty}</span><br><img class="lowerArrow" src="${contextPath}/resources/image/arrow1.png" onclick="javascript:modify_goods_qty('${item.goods_num}','${cnt.count-1}','down');">
   		</td>
   		<td class="table_center"> ${item.final_resultPrice }원 <input name="final_resultPrice" type="hidden" value="${item.final_resultPrice}" /></td>
   	</tr>
   	</c:forEach>
   </table>
   </div>
   <table class="goodsBuyForm2">  
   </table>
   <table class="goodsBuyForm3" border="1" > 
    <tr align ="center">  
   <th colspan = "2" style="font-size:2em;">구매자 정보</th>
    </tr>
    
    <tr align = "center" >
   <td>회원 이름</td>
   <td>${orderer.name }</td>
    </tr>
    
    <tr align = "center" >
   <td>회원 ID</td>
   <td>${orderer.id }</td>
    </tr>
    
    <tr align = "center" >
   <td>회원 휴대폰 번호</td>
   <td>${orderer.tel }</td>
    </tr>
    
    <tr align = "center" >
   <td>회원 주소</td>
   <td>${orderer.roadAdd } ${orderer.jibunAdd} ${orderer.namujiAdd}</td>
    </tr>
    
    <tr align = "center" >
   <td>회원 e-mail</td>
   <td>${orderer.email }</td>
    </tr>
    
</table>
   <table class="goodsBuyForm4">  <!-- 포인트 사용 -->
   
   </table>
   <table class="goodsBuyForm5">  <!-- 결제 방법 -->
   
   </table>
   </form>
</body>
</html>