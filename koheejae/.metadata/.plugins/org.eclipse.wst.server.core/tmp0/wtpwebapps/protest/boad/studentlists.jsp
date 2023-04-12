<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*,boad.*"
    isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<style>
	.cls1 {text-decoration:none}
	.cls2 {text-align:left; font-size:30px}
</style>
<meta charset="UTF-8">
<title>학생정보</title>
</head>
<body>
<h1>학생 정보</h1>
	<table align="left" border="1" width="30%">
		<tr height="10" align="center" bgcolor="lightgreen">
			<td>id</td>
			<td>이름</td>
			<td>대학</td>
			<td>생일</td>
			<td>이메일</td>
		</tr>
	<c:choose>
		<c:when test="${empty studentLists}">
			<tr height="10">
				<td colspan="5">
					<p align="center">
					<b><span style="font-size:9pt">등록된 학생이 없습니다.</span></b>
				</td>
			</tr>
		</c:when>
		<c:when test="${!empty studentLists}">
			<c:forEach var="student" items="${studentLists}" >
				<tr align="center">
				<td width="5%">${student.id}</td>
				<td width="10%">${student.username}</td>
				<td width="10%">${student.univ}</td>
				<td width="10%">${student.birth}</td>
				<td width="10%">${student.email}</td>
			</tr>
			</c:forEach>
			
			</c:when>
	</c:choose>
	</table>
	<form>
	<a class="cls1" href="${contextPath }/boad/addstudent"><p class="cls2">학생 추가</p></a>
	</form>
</body>
</html>