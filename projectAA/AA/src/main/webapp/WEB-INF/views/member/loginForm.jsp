<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" language="java"%>
    
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>
    
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<c:if test='${not empty message }'>
<script>
window.onload=function()
{
  result();
}

function result(){
   alert("아이디나  비밀번호가 틀립니다. 다시 로그인해주세요");
}
</script>
</c:if>
<style>
@import url(http://www.openhiun.com/hangul/nanumbarungothic.css);

.naver {
  background-color:#1EC800;
  color:white;
  font-family: 'Nanum Barun Gothic', sans-serif;
  font-weight: bolder;
}
.loginForm input[type=text], input[type=password] {
   padding-left: 10px;
}
div .c,.d {
        display: inline;
        flex-direction: column;
     margin-right:0px;
     margin-left:0px;

      }
</style>
</head>
<body>
<div class="middle">
   <img width="600px" height="200px" alt="booktopia" src="${contextPath}/resources/image/loginForm.png">
   <div class="loginForm">
      <form action="${contextPath}/member/login.do" method="post">
         <input name="id" type="text" size="20" placeholder="아이디"/><br>
         <input name="pwd" type="password" size="20" placeholder="비밀번호"/><br><br>
         <input style="border-radius: 8px / 0px / 0px / 8px; position:relative; left:5px; background-color: rgb(255, 215, 0); color:#ffffff; font-size:3.2em; margin:0; font-weight: bolder; width: 50px; height: 51px;" type="submit" value="A" />
         <input style=" border-radius: 0px / 8px / 8px / 0px; position:relative; right:2px;  background-color: rgb(255, 215, 0); color: #ffffff; font-weight: bolder; margin:0; width: 80px; height: 51px;" type="submit" value="로그인" />
         <%
          String clientId = "JZCME5fpTBi8685huUZM";//애플리케이션 클라이언트 아이디값";
          String redirectURI = URLEncoder.encode("http://localhost:8080/AA/main/main.do", "UTF-8");
          SecureRandom random = new SecureRandom();
          String state = new BigInteger(130, random).toString();
          String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
          apiURL += "&client_id=" + clientId;
          apiURL += "&redirect_uri=" + redirectURI;
          apiURL += "&state=" + state;
          session.setAttribute("state", state);
       %>
        <a href="<%=apiURL%>"><img height="50" width="115" src="http://static.nid.naver.com/oauth/small_g_in.PNG"/></a>
         <br>
         <br>
         <a href="${contextPath}/member/idForm.do">아이디 찾기</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;<a href="${contextPath}/member/pwForm.do">비밀번호 찾기</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;<a href="${contextPath}/member/selectJoinMember.do">회원가입</a>               
      </form>
   </div>
</div>
</body>
</html>