<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입창</title>
<script type="text/javascript">
	function fn_sendMember(){
		var frmMember=document.frmMember;
		var id=frmMember.id.value;
		var pwd=frmMember.pwd.value;
		var name=frmMember.name.value;
		var email=frmMember.email.value;
		if(id.length==0 || id==""){
			alert("아이디는 필수입니다.");
		}else if(pwd.length==0 || pwd==""){
			alert("비밀번호는 필수입니다.");
		}else if(name.length==0 || name==""){
			alert("이름은 필수입니다.");
		}else if(email.length==0 || email==""){
			alert("이메일은 필수입니다.");
		}else{
			frmMember.method="post";
			frmMember.action="member9.jsp";
			frmMember.submit();
		}
		
	}
</script>
</head>
<body>
	<form name="frmMember">
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
			<td><input type="button" value="가입하기" onClick="fn_sendMember()"></td>
			<td><input type="reset" value="다시입력"><input type="hidden" name="command" value="addMember"></td>
		</tr>
	</table>
	</form>
</body>
</html>