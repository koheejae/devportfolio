<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*,sec02.ex02.*"
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

</head>
<body>
	<form method="post" action="${contextPath }/member151/addMember.do">
		<table align="center">
			<caption>회원 가입창</caption>
		<tr>
			<td width="110"><p>아이디 : </p></td>
			<td width="50"><input type="text" name="id"></td>
		</tr>
		<tr>
			<td width="110"><p>이름 : </p></td>
			<td width="50"><input type="text" name="name"></td>
		</tr>
		<tr>
			<td width="110"><p>비밀번호 : </p></td>
			<td width="50"><input type="password" name="pwd"></td>
		</tr>
		<tr>
			<td width="110"><p>이메일 : </p></td>
			<td width="50"><input type="email" name="email"></td>
		</tr>
		<tr>
			<td width="110"><input type="button" onclick="location.href='${contextPath}/member151/listMember.do'"value="취소"></td>
			<td width="50"><input type="submit" value="회원가입"><input type="reset" value="다시입력"></td>
		</tr>
	</table>
	</form>
	</table>
	</form>
</body>
</html>