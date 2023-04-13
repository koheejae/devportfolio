<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="footcontainer">
<div class="footcontainer2">
<div class="foot_logo">
<a href="${contextPath}/main/main.do">
	<img width="150px"  height="150px" alt="Booktopia" src="${contextPath}/resources/image/logo_1.png" />
</a>
</div>
<div class="text">
(주)Ability Assemble(이하 AA) 서울시 서초구 사임당로 157, 3층 대표 : 박현호 개인정보관리책임자 : 송준이 사업자등록번호 : 613-81-65278
통신판매업신고 : 2018-서울서초-2134 유료직업소개사업등록번호 : 제 2021-3210195-14-5-00035호 고객센터 : 1544-6254help@kmong.com
(주)AA는 통신판매중개자이며, 통신판매의 당사자가 아닙니다. 상품, 상품정보, 거래에 관한 의무와 책임은 판매회원에게 있습니다.
(주)AA 사이트의 상품/판매회원/중개 서비스/거래 정보, 콘텐츠, UI 등에 대한 무단복제, 전송, 배포, 스크래핑 등의 행위는 저작권법, 콘텐츠산업 진흥법 등 관련법령에 의하여 엄격히 금지됩니다.
</div>
<div class="center">
	<ul style="text-align: center;">
		<h3>고객센터</h3><br>
		<p>10:30~18:00<br>
		(점심시간 13:00~14:00)<br>
		주말, 공휴일 휴무</p>
		<a href="#"><input type="button" value="1:1 문의" /></a>
	</ul>
</div>
<div class="help">
	<ul>
		<h3>지원</h3><br>
		<li><a href="#">공지사항</a></li>
		<li><a href="#">자주 묻는 질문</a></li>
		<li><a href="#">이용약관</a></li>
		<li><a href="#">개인정보처리방침</a></li>
	</ul>
</div>
</div>
</div>
<div class="clear"></div>

</body>
</html>