<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8"
   isELIgnored="false" %>

   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<c:set var="myCartList"  value="${cartMap.myCartList}"  />
<c:set var="myGoodsList"  value="${cartMap.myGoodsList}"  />

<c:set  var="totalGoodsNum" value="0" />  <!--주문 개수 -->
<c:set  var="totalDeliveryPrice" value="0" /> <!-- 총 배송비 --> 
<c:set  var="totalDiscountedPrice" value="0" /> <!-- 총 할인금액 -->
<head>
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



function calcGoodsPrice(goodsPrice,obj){
   var totalPrice,final_total_price,totalNum;
   var checked_goods=document.querySelectorAll('input[name="checked_goods"]:checked');
   var goods_qty = checked_goods.length;
   //alert("총 상품금액"+goods_qty.value);
   var p_totalNum=document.getElementById("p_totalGoodsNum");
   var p_totalPrice=document.getElementById("p_totalGoodsPrice");
   var p_final_total_price=document.getElementById("p_final_total_price");
   var h_final_total_price=document.getElementById("h_final_total_price");
   var h_totalNum=document.getElementById("h_totalGoodsNum");
   var h_totalPrice=document.getElementById("h_totalGoodsPrice");
   if(obj.checked==true){
   //   alert("체크 했음")
      
      totalNum = goods_qty;
      //alert("totalNum:"+totalNum);
      totalPrice=Number(h_totalGoodsPrice.value) + goodsPrice;
      //alert("totalPrice:"+totalPrice);
      final_total_price=Number(h_totalGoodsPrice.value) + goodsPrice;
      //alert("final_total_price:"+final_total_price);

   }else{
   //   alert("h_totalNum.value:"+h_totalNum.value);
      totalNum= goods_qty;
   //   alert("totalNum:"+ totalNum);
      
      
      totalPrice= Number(h_totalGoodsPrice.value) - goodsPrice;
   //   alert("totalPrice="+totalPrice);
      final_total_price= Number(h_totalGoodsPrice.value) - goodsPrice;
   }
   
   h_totalNum.value=totalNum;
   
   h_totalPrice.value=totalPrice;
   h_finaltotal_price=final_total_price;
   totalPrice = totalPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
   final_total_price = totalPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
   
   p_totalNum.innerHTML=totalNum + "개";
   p_totalPrice.innerHTML=totalPrice + "원";
   p_final_total_price.innerHTML=final_total_price +"원";
}
function modify_cart_qty(goods_num,index){
   var length=document.frm_order_all_cart.cart_goods_qty.length;
   var _cart_goods_qty=0;
   var goods_option="standardPrice";
   if(length>1){ //카트에 제품이 한개인 경우와 여러개인 경우 나누어서 처리한다.
      goods_option = document.getElementsByName("goods_option")[index].value;
      _cart_goods_qty = document.getElementsByName("cart_goods_qty")[index].value;
   }else{
      goods_option = document.getElementsByName("goods_option").value;
      _cart_goods_qty = document.getElementsByName("cart_goods_qty").value;
   }
   var cart_goods_qty=Number(_cart_goods_qty);
   //alert("cart_goods_qty:"+cart_goods_qty);
   //console.log(cart_goods_qty);
   $.ajax({
      type : "post",
      async : false, //false인 경우 동기식으로 처리한다.
      url : "${contextPath}/cart/modifyCartQty.do",
      data : {
         goods_num:goods_num,
         cart_goods_qty:cart_goods_qty,
         goods_option:goods_option
      },
      
      success : function(data, textStatus) {
         //alert(data);
         if(data.trim()=='modify_success'){
            alert("수량을 변경했습니다!!");   
            location.reload();
         }else{
            alert("다시 시도해 주세요!!");   
         }
         
      },
      error : function(data, textStatus) {
         alert("에러가 발생했습니다."+data);
      },
      complete : function(data, textStatus) {
         //alert("작업을완료 했습니다");
         
      }
   }); //end ajax   
}

function delete_cart_goods(cart_num){
   var cart_num=Number(cart_num);
   var formObj1=document.createElement("form");
   var i_cart = document.createElement("input");
   i_cart.name="cart_num";
   i_cart.value=cart_num;
   
   formObj1.appendChild(i_cart);
    document.body.appendChild(formObj1); 
    formObj1.method="post";
    formObj1.action="${contextPath}/cart/removeCartGoods.do";
    formObj1.submit();
}

function fn_order_each_goods(goods_num,goods_title,goods_resultPrice,fileName){
	var cart_goods_qty=document.getElementById("cart_goods_qty");
	var cart_goods_option=document.getElementById("goods_option");
	_order_goods_qty=cart_goods_qty.value; //장바구니에 담긴 개수 만큼 주문한다.
	_order_goods_option=cart_goods_option.value;
	
   var formObj=document.createElement("form");
   var i_goods_num = document.createElement("input"); 
    var i_goods_title = document.createElement("input");
    var i_goods_resultPrice=document.createElement("input");
    var i_fileName=document.createElement("input");
    var i_order_goods_qty=document.createElement("input");
    var i_order_goods_option=document.createElement("input");
    
    i_goods_num.name="goods_num";
    i_goods_title.name="goods_title";
    i_goods_resultPrice.name="goods_resultPrice";
    i_fileName.name="goods_fileName";
    i_order_goods_qty.name="order_goods_qty";
    i_order_goods_option.name="order_goods_option";
    
    i_goods_num.value=goods_num;
    i_order_goods_qty.value=_order_goods_qty;
    i_order_goods_option.value=_order_goods_option.replace("Price", "");
    i_goods_title.value=goods_title;
    i_goods_resultPrice.value=goods_resultPrice;
    i_fileName.value=fileName;
    
    formObj.appendChild(i_goods_num);
    formObj.appendChild(i_goods_title);
    formObj.appendChild(i_goods_resultPrice);
    formObj.appendChild(i_fileName);
    
    formObj.appendChild(i_order_goods_qty);
    formObj.appendChild(i_order_goods_option);

    document.body.appendChild(formObj); 
    formObj.method="post";
    formObj.action="${contextPath}/order/orderEachGoods.do";
    formObj.submit();
}

function fn_order_all_cart_goods(){
//   alert("모두 주문하기");
   var order_goods_qty;
   var order_goods_num;
   var objForm=document.frm_order_all_cart;
   var cart_goods_qty=objForm.cart_goods_qty;
   var h_order_each_goods_qty=objForm.h_order_each_goods_qty;
   var checked_goods=objForm.checked_goods;
   var length=checked_goods.length;
   
   //alert(length);
   if(length>1){
      for(var i=0; i<length;i++){
         if(checked_goods[i].checked==true){
            order_goods_num=checked_goods[i].value;
            order_goods_qty=cart_goods_qty[i].value;
            cart_goods_qty[i].value="";
            cart_goods_qty[i].value=order_goods_num+":"+order_goods_qty;
            //alert(select_goods_qty[i].value);
            console.log(cart_goods_qty[i].value);
         }
      }   
   }else{
      order_goods_num=checked_goods.value;
      order_goods_qty=cart_goods_qty.value;
      cart_goods_qty.value=order_goods_num+":"+order_goods_qty;
      //alert(select_goods_qty.value);
   }
      
    objForm.method="post";
    objForm.action="${contextPath}/order/orderAllCartGoods.do";
   objForm.submit();
}


</script>
<style>
	.list_view{
		width: 900px;
    margin-left: auto;
    margin-right: auto;
    padding-top: 10px;
    border-top: 5px solid rgb(255, 215, 0);
	}
</style>
</head>
<body>
   <h3 style="font-size:2em;width:900px; height:60px; margin-left:300px;margin-right:auto;">장바구니</h3>
   <table class="list_view">
      <tbody align=center >
         <tr>
            <td>선택</td>
            <td>상품 이미지</td>
            <td>업체명</td>
            <td>상품명</td>
            <td>옵션 및 수량</td>
            <td>금액</td>
            <td></td>
         </tr>
         <c:choose>
             <c:when test="${ empty myCartList }">
             <tr>
                <td colspan=8 class="fixed" height="300px;">
                  <strong>장바구니에 상품이 없습니다.</strong>
                </td>
              </tr>
             </c:when>
         <c:otherwise>
          <tr>       
               <form name="frm_order_all_cart">
                  <c:forEach var="item" items="${myGoodsList }" varStatus="cnt">
                <c:set var="cart_goods_qty" value="${myCartList[cnt.count-1].cart_goods_qty}" />
                <c:set var="goods_option" value="${myCartList[cnt.count-1].goods_option}" />
                <c:set var="cart_num" value="${myCartList[cnt.count-1].cart_num}" />
                <c:set var="goods_resultPrice" value="${myCartList[cnt.count-1].goods_resultPrice}" />
               <td><input type="checkbox" name="checked_goods"  checked  value="${item.goods_num }"  onClick="calcGoodsPrice(${goods_resultPrice*cart_goods_qty},this)"></td>
               <td class="goods_image">
                  <a href="${contextPath}/goods/goodsDetail.do?goods_num=${item.goods_num }">
                     <img width="75" alt="" src="${contextPath}/thumbnails.do?goods_num=${item.goods_num}&fileName=${item.goods_fileName}"  />
                  </a>
               </td>
               <td>
                 
                  <h2><a href="${contextPath}/goods/goodsDetail.do?goods_num=${item.goods_num }">${item.id }</a></h2>
               </td>
               <td>
                 
                  <h2><a href="${contextPath}/goods/goodsDetail.do?goods_num=${item.goods_num }">${item.goods_title }</a></h2>
               </td>
               <td>
                  
                  <select id="goods_option" name="goods_option">
    <option value="standardPrice" ${goods_option == 'standardPrice' ? 'selected' : ''}>STANDARD</option>
    <option value="deluxePrice" ${goods_option == 'deluxePrice' ? 'selected' : ''}>DELUXE</option>
    <option value="premiumPrice" ${goods_option == 'premiumPrice' ? 'selected' : ''}>PREMIUM</option>
</select><br>
                  <select id="cart_goods_qty" name="cart_goods_qty" style="width:60px;">
  <option value="1" ${cart_goods_qty == 1 ? 'selected' : ''}>1</option>
  <option value="2" ${cart_goods_qty == 2 ? 'selected' : ''}>2</option>
  <option value="3" ${cart_goods_qty == 3 ? 'selected' : ''}>3</option>
  <option value="4" ${cart_goods_qty == 4 ? 'selected' : ''}>4</option>
  <option value="5" ${cart_goods_qty == 5 ? 'selected' : ''}>5</option>
  <option value="6" ${cart_goods_qty == 6 ? 'selected' : ''}>6</option>
  <option value="7" ${cart_goods_qty == 7 ? 'selected' : ''}>7</option>
  <option value="8" ${cart_goods_qty == 8 ? 'selected' : ''}>8</option>
  <option value="9" ${cart_goods_qty == 9 ? 'selected' : ''}>9</option>
  <option value="10" ${cart_goods_qty == 10 ? 'selected' : ''}>10</option>
</select>

                  <a href="javascript:modify_cart_qty(${item.goods_num },${cnt.count-1});" >
                      <img width="30px" alt=""  src="${contextPath}/resources/image/btn_modify_qty.jpg">
                  </a>
               </td>
               <td class="price"><span>${goods_resultPrice*cart_goods_qty }원</span></td>
               
               <td>
                     <a href="#" onclick="fn_order_each_goods('${item.goods_num}', '${item.goods_title}', '${goods_resultPrice}', '${item.goods_fileName}'); return false;">
  <button class="bt1">주문하기</button>
</a><br>
                  
                  <a href="#" onclick="delete_cart_goods('${cart_num}'); return false;">
  <button class="bt2">삭제</button>
</a>

               </td>
         </tr>
            <c:set  var="totalGoodsPrice" value="${totalGoodsPrice+goods_resultPrice*cart_goods_qty }" />
            <c:set  var="totalGoodsQty" value="${totalGoodsQty + cart_goods_qty}" />
            <c:set  var="totalGoodsNum" value="${totalGoodsNum+1 }" />
            </c:forEach>
          
      </tbody>
   </table>
        
    </c:otherwise>
   </c:choose> 
   <br>
   <br>
   
   <table  width=900px;   class="list_view" style="margin-bottom:30px;">
   <tbody>
        <tr  align=center  class="fixed" >
          <td class="fixed">총 상품수 </td>
          <td>총 상품금액</td>
          <td>  </td>
          <td>  </td>
          <td>총 할인 금액 </td>
          <td>  </td>
          <td>최종 결제금액</td>
        </tr>
      <tr cellpadding=40  align=center >
         <td id="">
           <p id="p_totalGoodsNum">${totalGoodsNum}개 </p>
           <input id="h_totalGoodsNum"type="hidden" value="${totalGoodsNum}"  />
         </td>
          <td>
             <p id="p_totalGoodsPrice">
             <fmt:formatNumber  value="${totalGoodsPrice}" type="number" var="total_goods_price" />
                     ${total_goods_price}원
             </p>
             <input id="h_totalGoodsPrice"type="hidden" value="${totalGoodsPrice}" />
          </td>
          <td> 
          </td>
          <td> 
          </td>
          <td>  
            <p id="p_totalSalesPrice"> 
                     원
            </p>
            <input id="h_totalSalesPrice"type="hidden" value="${totalSalesPrice}" />
          </td>
          <td>  
          </td>
          <td>
             <p id="p_final_total_price">
             <fmt:formatNumber  value="${totalGoodsPrice-totalDiscountedPrice}" type="number" var="final_total_price" />
               ${final_total_price}원
             </p>
             <input id="h_final_total_price" type="hidden" value="${final_total_price}" />
          </td>
      </tr>
      </tbody>
   </table>
   <center>
    <br><br>   
       <a href="javascript:fn_order_all_cart_goods()">
          <button class="bt1">주문하기</button>
       </a>
       <a href="${contextPath}/goods/goodsListByCategory.do">
		<button class="bt2" style="width:100px;">쇼핑계속하기</button>
       </a>
   <center>
</form>   