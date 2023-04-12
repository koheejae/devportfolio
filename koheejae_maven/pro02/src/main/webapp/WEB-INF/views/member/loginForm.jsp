<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="result" value="${param.result }" />
<%
request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>로그인 창</title>
<c:choose>
<c:when test="${result=='loginFailed' }">
<script>
window.onload=function(){
	alert("아이디나 비밀번호가 틀립니다. 다시 로그인하세요!");
}
</script>
</c:when>
</c:choose>
</head>
<body>
	<form name="frmLogin" method="post" action="${contextPath }/member/login.do">
		<table border="1" width="80%" align="center">
			<tr align="center">
				<td>아이디</td>
				<td>비밀번호</td>
			</tr>
			<tr align="center">
				<td>
				<input type="text" name="id" value="" size="20">
				</td>
				<td>
				<input type="password" name="pwd" value="" size="20">
				</td>
			</tr>
			<tr align="center">
				<td colspan="2">
				<input type="submit" value="로그인">
				<input type="reset" value="다시입력">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>