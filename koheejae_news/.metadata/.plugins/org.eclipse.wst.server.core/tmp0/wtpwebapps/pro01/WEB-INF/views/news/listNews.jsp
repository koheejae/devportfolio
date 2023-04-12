<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"
    %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("utf-8"); %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>뉴스 관리 앱</title>
<style>
	*{
		margin:0px;
		padding:0px;
	}
	.text-align{
		text-align: center;
	}
	.content{
		  overflow: hidden;
		  word-wrap : break-word;
		  text-align : left; 
		  display: -webkit-box;
		  line-height: 1.2;
	  text-overflow: ellipsis;
	 -webkit-line-clamp: 2 ;
     -webkit-box-orient: vertical;
	}
	
</style>
</head>
<body>
	<form>
		<h1 class="text-align">뉴스 목록</h1>
		<hr>
		<c:forEach var="news" items="${newsList}">
			<table border="1" class="text-align">
			<tr align="center">
				<td width="50" height="50"><a href="${contextPath}/news/newsInfo.do?newsNO=${news.newsNO}">[${news.newsNO}]</a></td>
				<td width="200" height="50"><a href="${contextPath}/news/newsInfo.do?newsNO=${news.newsNO}"><p class="content">${news.newsName}</a></td>
				<td width="400" height="50"><p class="content">${news.newsContent}</td>
				<td width="100" height="50">${news.imageFileName}</td>
				<td width="100" height="50">${news.writeDate}</td>
				<td width="100" height="50"><a href="${contextPath}/news/removeNews.do?newsNO=${news.newsNO}">삭제하기</a></td>
				<td width="100" height="50"><a href="${contextPath}/news/modNewsForm.do?newsNO=${news.newsNO}">수정하기</a></td>
			</tr>
		</table>
		</c:forEach>
		<hr>
	</form>
	<button>뉴스 등록</button>
	<form>
		
	</form>
</body>
</html>