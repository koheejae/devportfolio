<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    isELIgnored="false"
    %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<script>
	var array_index=0;
	var SERVER_URL="${contextPath}/thumbnails.do";
	function fn_show_next_goods(){
		var img_sticky=document.getElementById("img_sticky");
		var cur_goods_num=document.getElementById("cur_goods_num");
		var _h_goods_num=document.frm_sticky.h_goods_num;
		var _h_goods_fileName=document.frm_sticky.h_goods_fileName;
		if(array_index <_h_goods_num.length-1)
			array_index++;
		 	
		var goods_num=_h_goods_num[array_index].value;
		var fileName=_h_goods_fileName[array_index].value;
		img_sticky.src=SERVER_URL+"?goods_num="+goods_num+"&fileName="+fileName;
		cur_goods_num.innerHTML=array_index+1;
	}


 function fn_show_previous_goods(){
	var img_sticky=document.getElementById("img_sticky");
	var cur_goods_num=document.getElementById("cur_goods_num");
	var _h_goods_num=document.frm_sticky.h_goods_num;
	var _h_goods_fileName=document.frm_sticky.h_goods_fileName;
	
	if(array_index >0)
		array_index--;
	
	var goods_num=_h_goods_num[array_index].value;
	var fileName=_h_goods_fileName[array_index].value;
	img_sticky.src=SERVER_URL+"?goods_num="+goods_num+"&fileName="+fileName;
	cur_goods_num.innerHTML=array_index+1;
}

function goodsDetail(){
	var cur_goods_num=document.getElementById("cur_goods_num");
	arrIdx=cur_goods_num.innerHTML-1;
	
	var img_sticky=document.getElementById("img_sticky");
	var h_goods_num=document.frm_sticky.h_goods_num;
	var len=h_goods_num.length;
	
	if(len>1){
		goods_num=h_goods_num[arrIdx].value;
	}else{
		goods_num=h_goods_num.value;
	}
	
	
	var formObj=document.createElement("form");
	var i_goods_num = document.createElement("input"); 
    
	i_goods_num.name="goods_num";
	i_goods_num.value=goods_num;
	
    formObj.appendChild(i_goods_num);
    document.body.appendChild(formObj); 
    formObj.method="get";
    formObj.action="${contextPath}/goods/goodsDetail.do?goods_num="+goods_num;
    formObj.submit();
	
	
}
</script>  
 
<body>    
    <div id="sticky" >
	<ul>
		<li><a href="#">
		   <img	width="24" height="24" src="${contextPath}/resources/image/facebook_icon.png">
				페이스북
		</a></li>
		<li><a href="#">
		   <img width="24" height="24" src="${contextPath}/resources/image/twitter_icon.png">
			트위터
		</a></li>
		<li><a href="#">
		   <img	width="24" height="24" src="${contextPath}/resources/image/rss_icon.png">
				RSS 피드
		 </a></li>
	</ul>
	<div class="recent">
		<h3>최근 본 상품</h3>
		  <ul>
		<!--   상품이 없습니다. -->
		 <c:choose>
			<c:when test="${ empty quickGoodsList }">
				     <strong>상품이 없습니다.</strong>
			</c:when>
			<c:otherwise>
	       <form name="frm_sticky"  >	        
		      <c:forEach var="item" items="${quickGoodsList }" varStatus="itemNum">
		         <c:choose>
		           <c:when test="${itemNum.count==1 }">
			      <a href="javascript:goodsDetail();">
			  	         <img width="75" height="95" id="img_sticky"  
			                 src="${contextPath}/thumbnails.do?goods_num=${item.goods_num}&fileName=${item.goods_fileName}">
			      </a>
			        <input type="hidden"  name="h_goods_num" value="${item.goods_num}" />
			        <input type="hidden" name="h_goods_fileName" value="${item.goods_fileName}" />
			      <br>
			      </c:when>
			      <c:otherwise>
			        <input type="hidden"  name="h_goods_num" value="${item.goods_num}" />
			        <input type="hidden" name="h_goods_fileName" value="${item.goods_fileName}" />
			      </c:otherwise>
			      </c:choose>
		     </c:forEach>
		   </c:otherwise>
	      </c:choose>
		 </ul>
     </form>		 
	</div>
	 <div>
	 <c:choose>
	    <c:when test="${ empty quickGoodsList }">
		    <h5>  &nbsp; &nbsp; &nbsp; &nbsp;  0/0  &nbsp; </h5>
	    </c:when>
	    <c:otherwise>
           <h5><a  href='javascript:fn_show_previous_goods();'> 이전 </a> &nbsp;  <span id="cur_goods_num">1</span>/${quickGoodsListNum}  &nbsp; <a href='javascript:fn_show_next_goods();'> 다음 </a> </h5>
       </c:otherwise>
       </c:choose>
    </div>
</div>
</body>
</html>
 
