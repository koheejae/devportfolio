<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입창</title>
</head>
<body>
	<form method="post" action="member1.jsp">
		<h1 style="text-align:center">회원 가입창</h1>
		
		<table border="0" align="center">
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
			<td><input type="submit" value="가입하기"></td>
			<td><input type="reset" value="다시입력"></td>
		</tr>
	</table>
	</form>
</body>
</html>