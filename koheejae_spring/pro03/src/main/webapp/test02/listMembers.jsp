<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"
    %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("utf-8"); %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form>
		<table border="1" align="center" width="100%" >
			<tr bgcolor="lightgreen">
				<td align="center"><b>ID</b></td>
				<td align="center"><b>PWD</b></td>
				<td align="center"><b>이름</b></td>
				<td align="center"><b>이메일</b></td>
				<td align="center"><b>가입일</b></td>
			</tr>
			<c:forEach var="member" items="${membersList }">
				<tr align="center">
					<td>${member.id}</td>
					<td>${member.pwd}</td>
					<td>${member.name}</td>
					<td>${member.email}</td>
					<td>${member.joinDate}</td>
				</tr>
			</c:forEach>
		</table>
		<a href="${contextPath}/member/memberForm.do"><h1 style="text-align:center">회원가입</h1></a>
	</form>
</body>
</html>