<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생 추가</title>
</head>
<body>
<h1>학생 추가</h1>
<hr>
<form name="addstudent" method="post" action="${contextPath}/boad/addstudent.do" enctype="multipart/form-data">
<p>이름<input type="text" name="username"></p>
<p>대학<input type="text" name="univ"></p>
<p>생일<input type="text" name="birth"></p>
<p>이메일<input type="email" name="email"></p>
<input type="submit" value="등록">
</form>
</body>
</html>