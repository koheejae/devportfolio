<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
	isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html >
<html>
<head>
<meta charset="utf-8">
<script type="text/javascript">
window.onload = function fn_detail_search_continue(){
	var frm_admin_goods_lists = document.frm_admin_goods_lists;
	i_command = frm_admin_goods_lists.command.value;
	if(i_command=='detail'){
		frm_admin_goods_lists.search_condition.disabled = false;
		frm_admin_goods_lists.search_word.disabled = false;
		frm_admin_goods_lists.btn_search.disabled = false;
		frm_admin_goods_lists.check1.checked = false;
		frm_admin_goods_lists.check2.checked = true;
	}
}
</script>
<script>
function search_goods_list(fixedSearchPeriod){
	var formObj=document.createElement("form");
	var i_fixedSearch_period = document.createElement("input");
	i_fixedSearch_period.name="fixedSearchPeriod";
	i_fixedSearch_period.value=fixedSearchPeriod;
    formObj.appendChild(i_fixedSearch_period);
    document.body.appendChild(formObj); 
    formObj.method="get";
    formObj.action="${contextPath}/admin/goods/adminGoodsMain.do";
    formObj.submit();
}
function fn_enable_search(search){
	var frm_admin_goods_lists = document.frm_admin_goods_lists;
	t_search_condition = frm_admin_goods_lists.search_condition;
	t_search_word = frm_admin_goods_lists.search_word;
	t_btn_search = frm_admin_goods_lists.btn_search;
	if(search.value=='detail'){
		t_search_condition.disabled = false;
		t_search_word.disabled = false;
		t_btn_search.disabled = false;
	}else{
		t_search_condition.disabled = true;
		t_search_word.disabled = true;
		t_btn_search.disabled = true;
	};
}
function fn_detail_search(){
	var frm_admin_goods_lists = document.frm_admin_goods_lists;
	
	beginYear=frm_admin_goods_lists.beginYear.value;
	beginMonth=frm_admin_goods_lists.beginMonth.value;
	beginDay=frm_admin_goods_lists.beginDay.value;
	endYear=frm_admin_goods_lists.endYear.value;
	endMonth=frm_admin_goods_lists.endMonth.value;
	endDay=frm_admin_goods_lists.endDay.value;
	
	command=frm_admin_goods_lists.r_search.value;
	search_condition=frm_admin_goods_lists.search_condition.value;
	search_word=frm_admin_goods_lists.search_word.value;

	var formObj=document.createElement("form");
	var i_command = document.createElement("input");
	var i_beginDate = document.createElement("input"); 
	var i_endDate = document.createElement("input");
	var i_search_condition = document.createElement("input");
	var i_search_word = document.createElement("input");
    
    i_command.name="command";
    i_beginDate.name="beginDate";
    i_endDate.name="endDate";
    i_search_condition.name="search_condition";
    i_search_word.name="search_word";
    
    i_command.value=command;
	i_beginDate.value=beginYear+"-"+beginMonth+"-"+beginDay;
    i_endDate.value=endYear+"-"+endMonth+"-"+endDay;
    i_search_condition.value=search_condition;
    i_search_word.value=search_word;
	
    formObj.appendChild(i_command);
    formObj.appendChild(i_beginDate);
    formObj.appendChild(i_endDate);
    formObj.appendChild(i_search_condition);
    formObj.appendChild(i_search_word);
    document.body.appendChild(formObj); 
    formObj.method="post";
    formObj.action="${contextPath}/admin/goods/adminGoodsMain.do";
    formObj.submit();
	
}

function  calcPeriod(search_period){
	var dt = new Date();
	var beginYear,endYear;
	var beginMonth,endMonth;
	var beginDay,endDay;
	var beginDate,endDate;
	
	endYear = dt.getFullYear();
	endMonth = dt.getMonth()+1;
	endDay = dt.getDate();
	if(search_period=='today'){
		beginYear=endYear;
		beginMonth=endMonth;
		beginDay=endDay;
	}else if(search_period=='one_week'){
		beginYear=dt.getFullYear();
		beginMonth=dt.getMonth()+1;
		dt.setDate(endDay-7);
		beginDay=dt.getDate();
		
	}else if(search_period=='two_week'){
		beginYear = dt.getFullYear();
		beginMonth = dt.getMonth()+1;
		dt.setDate(endDay-14);
		beginDay=dt.getDate();
	}else if(search_period=='one_month'){
		beginYear = dt.getFullYear();
		dt.setMonth(endMonth-1);
		beginMonth = dt.getMonth();
		beginDay = dt.getDate();
	}else if(search_period=='two_month'){
		beginYear = dt.getFullYear();
		dt.setMonth(endMonth-2);
		beginMonth = dt.getMonth();
		beginDay = dt.getDate();
	}else if(search_period=='three_month'){
		beginYear = dt.getFullYear();
		dt.setMonth(endMonth-3);
		beginMonth = dt.getMonth();
		beginDay = dt.getDate();
	}else if(search_period=='four_month'){
		beginYear = dt.getFullYear();
		dt.setMonth(endMonth-4);
		beginMonth = dt.getMonth();
		beginDay = dt.getDate();
	}
	
	if(beginMonth <10){
		beginMonth='0'+beginMonth;
		if(beginDay<10){
			beginDay='0'+beginDay;
		}
	}
	if(endMonth <10){
		endMonth='0'+endMonth;
		if(endDay<10){
			endDay='0'+endDay;
		}
	}
	endDate=endYear+'-'+endMonth +'-'+endDay;
	beginDate=beginYear+'-'+beginMonth +'-'+beginDay;
	//alert(beginDate+","+endDate);
	return beginDate+","+endDate;
}
</script>
</head>
<body>
	<H3>상품 조회</H3>
	<form name="frm_admin_goods_lists" method="post">	
		<TABLE cellpadding="10" cellspacing="10"  >
			<TBODY>
				<TR >
					<TD>
						<input type="radio" id="check1" name="r_search" value="creDate" checked onClick="fn_enable_search(this)"/> 등록일로조회 &nbsp;&nbsp;&nbsp;
						<input type="radio" id="check2" name="r_search" value="detail" onClick="fn_enable_search(this)"/>상세조회 &nbsp;&nbsp;&nbsp;
						
						<input type="hidden" name="command" value="${command }"> 
					</TD>
				</TR>
				<TR >
					<TD>
					  <select name="curYear">
					    <c:forEach   var="i" begin="0" end="5">
					      <c:choose>
					        <c:when test="${endYear==endYear-i}">
					          <option value="${endYear}" selected>${endYear}</option>
					        </c:when>
					        <c:otherwise>
					          <option value="${endYear-i }">${endYear-i }</option>
					        </c:otherwise>
					      </c:choose>
					    </c:forEach>
					</select>년 <select name="curMonth" >
						 <c:forEach   var="i" begin="1" end="12">
					      <c:choose>
					        <c:when test="${endMonth==i }">
					          <option value="${i }"  selected>${i }</option>
					        </c:when>
					        <c:otherwise>
					          <option value="${i }">${i }</option>
					        </c:otherwise>
					      </c:choose>
					    </c:forEach>					
					</select>월
					
					 <select name="curDay">
					  <c:forEach   var="i" begin="1" end="31">
					      <c:choose>
					        <c:when test="${endDay==i}">
					          <option value="${i }"  selected>${i }</option>
					        </c:when>
					        <c:otherwise>
					          <option value="${i }">${i }</option>
					        </c:otherwise>
					      </c:choose>
					    </c:forEach>	
					</select>일  &nbsp;이전&nbsp;&nbsp;&nbsp;&nbsp; 
					<a href="javascript:search_goods_list('today')">
					   <img   src="${contextPath}/resources/image/btn_search_one_day.jpg">
					</a>
					<a href="javascript:search_goods_list('one_week')">
					   <img   src="${contextPath}/resources/image/btn_search_1_week.jpg">
					</a>
					<a href="javascript:search_goods_list('two_week')">
					   <img   src="${contextPath}/resources/image/btn_search_2_week.jpg">
					</a>
					<a href="javascript:search_goods_list('one_month')">
					   <img   src="${contextPath}/resources/image/btn_search_1_month.jpg">
					</a>
					<a href="javascript:search_goods_list('two_month')">
					   <img   src="${contextPath}/resources/image/btn_search_2_month.jpg">
					</a>
					<a href="javascript:search_goods_list('three_month')">
					   <img   src="${contextPath}/resources/image/btn_search_3_month.jpg">
					</a>
					<a href="javascript:search_goods_list('four_month')">
					   <img   src="${contextPath}/resources/image/btn_search_4_month.jpg">
					</a>
					&nbsp;까지 조회
					</TD>
				</TR>
				<tr>
				  <td>
				    <select name="search_condition" disabled >
						<option value="전체" checked>전체</option>
						<option value="제품번호">상품번호</option>
						<option value="제품이름">상품이름</option>
						<option value="제조사">제조사</option>
					</select>
					<input  type="text" name="search_word" size="30"  disabled/>  
					<input   type="button" name="btn_search" value="조회" onClick="fn_detail_search(this.form)" disabled/>
				  </td>
				</tr>
				<tr>
				  <td>
					조회한 기간:<input  type="text" name="beginYear" size="4" value="${beginYear}" />년
							<input  type="text" name="beginMonth" size="4" value="${beginMonth}"/>월	
							 <input  type="text" name="beginDay" size="4" value="${beginDay}"/>일	
							 &nbsp; ~
							<input  type="text" name="endYear" size="4" value="${endYear }" />년 
							<input  type="text" name="endMonth" size="4" value="${endMonth }"/>월	
							 <input  type="text" name="endDay" size="4" value="${endDay }"/>일							 
				  </td>
				</tr>
			</TBODY>
		</TABLE>
		<DIV class="clear">
	</DIV>
</form>	
<DIV class="clear"></DIV>
<TABLE class="list_view">
		<TBODY align=center >
			<tr style="background:#33ff00" >
				<td>상품번호</td>
				<td>상품이름</td>
				<td>저자</td>
				<td>출판사</td>
				<td>상품가격</td>
				<td>입고일자</td>
				<td>출판일</td>
			</tr>
   <c:choose>
     <c:when test="${empty newGoodsList }">			
			<TR>
		       <TD colspan=8 class="fixed">
				  <strong>조회된 상품이 없습니다.</strong>
			   </TD>
		     </TR>
	 </c:when>
	 <c:otherwise>
     <c:forEach var="item" items="${newGoodsList }">
			 <TR>       
				<TD>
				  <strong>${item.goods_id }</strong>
				</TD>
				<TD >
				 <a href="${pageContext.request.contextPath}/admin/goods/modifyGoodsForm.do?goods_id=${item.goods_id}">
				    <strong>${item.goods_title } </strong>
				 </a> 
				</TD>
				<TD>
				<strong>${item.goods_writer }</strong> 
				</TD>
				<TD >
				   <strong>${item.goods_publisher }</strong> 
				</TD>
				<td>
				  <strong>${item.goods_sales_price }</strong>
				</td>
				<td>
				 <strong>${item.goods_credate }</strong> 
				</td>
				<td>
				    <c:set var="pub_date" value="${item.goods_published_date}" />
					   <c:set var="arr" value="${fn:split(pub_date,' ')}" />
					<strong>
					   <c:out value="${arr[0]}" />
					</strong>
				</td>
				
			</TR>
	</c:forEach>
	</c:otherwise>
  </c:choose>
           <tr>
             <td colspan=8 class="fixed">
                 <c:forEach   var="page" begin="1" end="10" step="1" >
		         <c:if test="${section >1 && page==1 }">
		          <a href="${contextPath}/admin/goods/adminGoodsMain.do?chapter=${section-1}&pageNum=${(section-1)*10 +1 }&command=${command}&beginDate=${beginDate}&endDate=${endDate}">&nbsp; &nbsp;</a>
		         </c:if>
		          <a href="${contextPath}/admin/goods/adminGoodsMain.do?chapter=${section}&pageNum=${page}&command=${command}&beginDate=${beginDate}&endDate=${endDate}">${(section-1)*10 +page } </a>
		         <c:if test="${page ==10 }">
		          <a href="${contextPath}/admin/goods/adminGooodsMain.do?chapter=${section+1}&pageNum=${section*10+1}&command=${command}&beginDate=${beginDate}&endDate=${endDate}">&nbsp; next</a>
		         </c:if> 
	      		</c:forEach> 
     
		</TBODY>
		
	</TABLE>
	<DIV class="clear"></DIV>
	<br><br><br>
<H3>상품등록하기</H3>
<DIV id="search">
	<form action="${contextPath}/admin/goods/addNewGoodsForm.do">
		<input   type="submit" value="상품 등록하기">
	</form>
</DIV>
</body>
</html>