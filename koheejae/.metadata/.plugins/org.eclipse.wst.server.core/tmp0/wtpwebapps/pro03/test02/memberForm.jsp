<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*,sec02.ex01.*"
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
<title>회원 가입창</title>
<script type="text/javascript">
</script>
</head>
<body>
	<form method="post" action="${contextPath }/member/addMember.do">
		<table border="0" align="center">
			<th>회원 가입창</th>
		<tr align="center" >
			<td><b>아이디</b></td>
			<td><input type="text" name="id"></td>
		</tr>
		<tr align="center" >
			<td><b>비밀번호</b></td>
			<td><input type="password" name="pwd"></td>
		</tr>
		<tr align="center" >
			<td><b>이름</b></td>
			<td><input type="text" name="name"></td>
		</tr>
		<tr align="center" >
			<td><b>이메일</b></td>
			<td><input type="text" name="email"></td>
		</tr>
		<tr align="center">
			<td><p>&nbsp;</p></td>
			<td><input type="submit" value="가입하기"><input type="reset" value="다시입력"></td>
		</tr>
	</table>
	</form>
</body>
</html>