<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<c:if test='${not empty message }'>
<script>
window.onload=function()
{
  result();
}

function result(){
   alert("아이디나  비밀번호가 틀립니다. 다시 로그인해주세요");
}
</script>
</c:if>
</head>
<body>
<div class="middle">
   <img class="logo" alt="booktopia" src="${contextPath}/resources/image/loginForm.png">
   <div class="memberForm_01">
      <a href="${contextPath}/member/joinAgree.do?result=member">
         <img width="200px" height="200px" style="margin-right: 20px;" src="${contextPath}/resources/image/memberForm.jpg">      
      </a>
      <a href="${contextPath}/member/joinAgree.do?result=company">
         <img width="200px" height="200px" src="${contextPath}/resources/image/companyForm.jpg">
      </a>
   </div>
</div>
</body>
</html>