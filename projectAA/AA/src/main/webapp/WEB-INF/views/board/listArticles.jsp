<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%
  request.setCharacterEncoding("UTF-8");
%>  
<!DOCTYPE html>
<html>
<head>
 <style>
 	.list_view{
		width: 900px;
    margin-left: auto; 
    margin-right: auto;  
    padding-top: 5px;
    padding-bottom:40px;
    border-top: 5px solid rgb(255, 215, 0);  
    border-left:none; border-right:none; 
    border-bottom:5px solid rgb(255, 215, 0);  

	}  
	.list_view td {
	font-size:1.2em; 
	}
   .write_btn1 { 
   font-size:1.5em; 
   text-align:center; 
   text-decoration:none;  
   width:120px;  
   height:50px; 
   position:relative; 
   left:870px;  
   top:20px;
   border:none;
   background-color: rgb(255, 215, 0); 
   border-radius: 5px;
   font-weight: bold;
   }
   #topz {
   padding-bottom:12px;
   font-weight:bolder;
   }
   table td {   
   background:white;  
   border-left:none; border-right:none; border-top:none; border:bottom:grey;
   heigth:100px;

   } 
   table tr { 
   heigth:100px;
   } 
  </style> 
  <meta charset="UTF-8">
  <title>글목록창</title> 
</head>
<script>
	function fn_articleForm(isLogOn,articleForm,loginForm){
	  if(isLogOn != '' && isLogOn != 'false'){
	    location.href=articleForm;
	  }else{
	    alert("로그인 후 글쓰기가 가능합니다.")
	    location.href=loginForm+'?action=/board/articleForm.do';
	  }
	}
</script> 
<body>
<h3 style="font-size:2em;width:900px; height:60px; margin-left:300px; margin-right:auto;">자유게시판</h3>
<table align="center" border="1"  width="80%" class="list_view">
  <tr height="10%" align="center" >
     <td id="topz" style="font-size:0.8em;">회원 유형</td>
     <td id="topz" style="font-size:0.8em;">작성자</td>              
     <td id="topz" style="font-size:0.8em;">제목 </td>  
     <td id="topz" style="font-size:0.8em;">작성일</td>   
     <td id="topz" style="font-size:0.8em;">조회수</td>    
  </tr> 
<c:choose>
  <c:when test="${articlesList ==null }" >
    <tr>  
      <td colspan="4">  
         <p align="center">
            <b><span style="font-size:9pt;">등록된 글이 없습니다.</span></b>
        </p>
      </td>  
    </tr> 
  </c:when> 
  <c:when test="${articlesList !=null }" >
    <c:forEach  var="article" items="${articlesList }" varStatus="articleNum" >
     <tr align="center" style="height:70px;" >
	<td width="5%" style="font-size:0.7em;">${article.status}</td>
	<td width="10%" >${article.id }</td>
	<td align='center'  width="35%" > 
	  <span style="padding-right:30px"></span>
	   <c:choose>
	      <c:when test='${article.level > 1 }'>  
	         <c:forEach begin="1" end="${article.level }" step="1">
	              <span style="padding-left:10px"></span>    
	         </c:forEach>
	         <span style="font-size:12px;">[답변]</span>
                   <a class='cls1' href="${contextPath}/board/viewArticle.do?board_num=${article.board_num}">${article.board_title}</a>
	          </c:when>
	          <c:otherwise>
	            <a class='cls1' href="${contextPath}/board/viewArticle.do?board_num=${article.board_num}">${article.board_title }</a>
	          </c:otherwise> 
	        </c:choose> 
	  </td> 
	  <td  width="10%" height="10%" style="font-size:0.9em;">${article.writeDate}</td> 
	  <td width="5%" height="10%" style="font-size:1em;">${article.viewCnt }</td>  
	</tr>
    </c:forEach>
     </c:when>
    </c:choose>
</table>
<!-- <a  class="cls1"  href="#"><p class="cls2">글쓰기</p></a> -->
<a  class="write_btn2"  href="javascript:fn_articleForm('${isLogOn}','${contextPath}/board/articleForm.do', 
                                                    '${contextPath}/member/loginForm.do')"><input type="text" value="글쓰기" class="write_btn1"/></a>

</body>
</html>