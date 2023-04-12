<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
int n1 = Integer.parseInt(request.getParameter("n1"));
int n2 = Integer.parseInt(request.getParameter("n2"));
String op = request.getParameter("op");
long result = 0;
switch(request.getParameter("op")){
case "+": result = n1+n2; break;
case "-": result = n1-n2; break;
case "*": result = n1*n2; break;
case "/": result = n1/n2; break;
}
%>
<body>
<h2>계산 결과-jsp</h2>
<hr>
결과 : <%=result %>

</body>
</html>