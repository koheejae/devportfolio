<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:useBean id="calc" class="sec01.ex02.Calculator"/>
    <jsp:setProperty name="calc" property="*"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>useBean 사용 계산기</title>
</head>
<body>
<h2> 계산 결과-useBean</h2>
<hr>
결과 : <%=calc.clac() %>
</body>
</html>