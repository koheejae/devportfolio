<%@ page language="java" contentType="text/html; charset=UTF-8"
    import="java.util.*,sec01.ex02.*" pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<%
request.setCharacterEncoding("utf-8");
String id=request.getParameter("id");
String pwd=request.getParameter("pwd");
String name=request.getParameter("name");
String email=request.getParameter("email");

MemberBean m = new MemberBean(id, pwd, name, email);
MemberDAO memberDAO = new MemberDAO();
memberDAO.addMember(m);
List membersList = memberDAO.listMembers();
%>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 출력창</title>
</head>
<body>
	<table border="1" align="center">
		<tr align="center" bgcolor="#99ccff">
			<td width="7%"><b>아이디</b></td>
			<td width="7%"><b>비밀번호</b></td>
			<td width="5%"><b>이름</b></td>
			<td width="11%"><b>이메일</b></td>
			<td width="5%"><b>가입일</b></td>
		</tr>
		<%
			if(membersList.size()==0){
		%>
		<tr>
			<td colspan="5">
				<p align="center"><b><span style="font-size:9pt;">
					등록된 회원이 없습니다.</span></b></p>
			</td>
		</tr>
		<%
			}else{
				for(int i=0; i<membersList.size(); i++){
					MemberBean bean = (MemberBean) membersList.get(i);
		%>
		<tr align="center">
			<td>
				<%=bean.getId() %>
			</td>
			<td>
				<%=bean.getPwd() %>
			</td>
			<td>
				<%=bean.getName() %>
			</td>
			<td>
				<%=bean.getEmail() %>
			</td>
			<td>
				<%=bean.getJoinDate() %>
			</td>
		</tr>
		<%
				}
			}
		%>
		<tr height="1" bgcolor="#99ccff">
			<td colspan="5"></td>
		</tr>
	</table>
</body>
</html>