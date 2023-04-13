<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<meta charset="UTF-8">
<title>Insert title here</title>
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

<style>
#sticky {
	right:-150px;
	top:600px;
}
</style>
</head>
<body> 
<!-- 메인 슬라이더 -->
<div id="sliderdiv">
<div id="slider_center">
<div id="main_searchform">

<h3 style="margin-top:140px; font-size:1.5em;">재능마켓 No.2! Ability Assemble에서<br><br> 필요한 서비스를 찾아보세요!</h3><br><br>

<form name="mainSearch" action="${contextPath}/goods/searchGoods.do" >
			<input name="searchWord" class="main_input" type="text"  onKeyUp="keywordSearch()"> 
			<input type="submit" name="search" class="btn1"  value="검색" style="display:none;" >
		</form>

</div>
<div id="carouselExampleInterval" class="carousel slide" data-bs-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item active" data-bs-interval="10000">
      <img src="${contextPath}/resources/image/slider_1.jpg" class="d-block w-100" alt="캐러셀1">
    </div>
    <div class="carousel-item" data-bs-interval="2000">
      <img src="${contextPath}/resources/image/slider_2.png" class="d-block w-100" alt="캐러셀2">
    </div>
    <div class="carousel-item">
      <img src="${contextPath}/resources/image/slider_3.png" class="d-block w-100" alt="캐러셀3">
    </div>      
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden"></span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden"></span>
  </button>
</div>
</div>
</div>
<script>
$('#carouselExampleInterval').on('slide.bs.carousel', function (e) {
	  var index = $(e.relatedTarget).index();
	  var images = [
	    '${contextPath}/resources/image/slider_1.jpg',
	    '${contextPath}/resources/image/slider_2.png',
	    '${contextPath}/resources/image/slider_3.png'
	  ];
	  var colors = ['#dff0d8', '#fcf8e3', '#f2dede'];
	  var sliderdiv = $('#sliderdiv');
	  sliderdiv.css('background-color', colors[index % colors.length]);
	});
</script>
<!-- 카테고리 -->
<h2 class="main_h2">카테고리</h2>
<div id="main_categorylist">

	<div class="main_category"><a href="${contextPath}/goods/goodsListByCategory.do?goods_main_category=비즈니스&goods_middle_category=디자인">
	<img src="${contextPath}/resources/image/design_01.png" width=100px; height=100px;><br><span>디자인</span></a></div>
	<div class="main_category"><a href="${contextPath}/goods/goodsListByCategory.do?goods_main_category=비즈니스&goods_middle_category=IT/프로그래밍">
	<img src="${contextPath}/resources/image/it_01.png" width=120px; height=100px;><br><span>IT, 프로그래밍</span></a></div>
	<div class="main_category"><a href="${contextPath}/goods/goodsListByCategory.do?goods_main_category=비즈니스&goods_middle_category=영상/사진/음향">
	<img src="${contextPath}/resources/image/picture_01.png" width=100px; height=100px;><br><span>영상, 사진, 음향</span></a></div>
	<div class="main_category"><a href="${contextPath}/goods/goodsListByCategory.do?goods_main_category=비즈니스&goods_middle_category=마케팅">
	<img src="${contextPath}/resources/image/ma2.png" width=100px; height=100px;><br><span>마케팅</span></a></div>
	<div class="main_category"><a href="${contextPath}/goods/goodsListByCategory.do?goods_main_category=비즈니스&goods_middle_category=문서/번역">
	<img src="${contextPath}/resources/image/report_01.png" width=100px; height=100px;><br><span>문서, 번역</span></a></div>
	<div class="main_category"><a href="${contextPath}/goods/goodsListByCategory.do?goods_main_category=비즈니스&goods_middle_category=경영자문/운영지원">
	<img src="${contextPath}/resources/image/ques.png" width=100px; height=100px;><br><span>경영자문, 운영지원</span></a></div>
	<div class="main_category"><a href="${contextPath}/goods/goodsListByCategory.do?goods_main_category=비즈니스&goods_middle_category=주문제작">
	<img src="${contextPath}/resources/image/gift_01.png" width=100px; height=100px;><br><span>주문제작</span></a></div>
	<div class="main_category"><a href="${contextPath}/goods/goodsListByCategory.do?goods_main_category=비즈니스&goods_middle_category=세무/법무/노무">
	<img src="${contextPath}/resources/image/law_01.png" width=100px; height=100px;><br><span>세무, 법무, 노무</span></a></div>
	<div class="main_category"><a href="${contextPath}/goods/goodsListByCategory.do?goods_main_category=N잡/커리어&goods_middle_category=취업/입시/노하우/직무역량">
	<img src="${contextPath}/resources/image/job_01.png" width=100px; height=100px;><br><span>취업, 입시, <br>노하우, 직무역량</span></a></div>
	<div class="main_category"><a href="${contextPath}/goods/goodsListByCategory.do?goods_main_category=취미/생활&goods_middle_category=취미/생활">
	<img src="${contextPath}/resources/image/hobby_01.png" width=100px; height=100px;><br><span>취미, 생활</span></a></div>
</div>
<!-- 인기 상품 -->
<h2 class="main_h22">인기상품</h2>
<div class="main_goods">
	
	<c:set  var="goods_count" value="0" />

	<c:forEach var="item" items="${goodsList}">
		<c:if test="${goods_count < 4 }">
	   <c:set  var="goods_count" value="${goods_count+1 }" />
		<div class="book">
			<a href="${contextPath}/goods/goodsDetail.do?goods_num=${item.goods_num }">
			<img class="link"  src="${contextPath}/resources/image/1px.gif"> 
			</a> 
				<img width="121" height="154" 
				     src="${contextPath}/thumbnails.do?goods_num=${item.goods_num}&fileName=${item.goods_fileName}">
			<div class="title">${item.goods_title }</div>
			<div class="price">
		  	   <fmt:formatNumber  value="${item.goods_standardPrice}" type="number" var="goods_standardPrice" />
		          ${goods_standardPrice}원
			</div>
		</div>
	   <c:if test="${goods_count == 4 }">
         <div class="goods_more">
           <font size=5> <a href="${contextPath}/goods/goodsListByCategory.do?sortBy=totalSell">더보기></a></font>
         </div>
     </c:if>
     </c:if>
  </c:forEach>
  
</div>

<!-- 랭킹 -->
<div id="main_rank">
<h2 class="main_h22">랭킹</h2>
<div class="main_rank1">
	<div class="o1st">
		<h2>게시글따봉순</h2>
		<h3><a href="#"><img src="${contextPath}/resources/image/1st.png" style="width:30px;height:30px;"></a>1등 : 너무 어렵다 이거</h3>
	</div>
	<div class="no1st">
		<h3><a href="#"><img src="${contextPath}/resources/image/2st.png" style="width:30px;height:30px;"></a>2등 : 요즘 한강 물온도</h3>
		<h3><a href="#"><img src="${contextPath}/resources/image/3st.png" style="width:30px;height:30px;"></a>3등 : 무릉도원이네요</h3>
	</div>
</div>

<div class="main_rank1">
<h2>최다판매자</h2>
	<div class="1st">
		<h3><a href="#"><img src="${contextPath}/resources/image/1st.png" style="width:30px;height:30px;"></a>1등 : 로고고디자인</h3>
	</div>
	<div>
		<li><h3><a href="#"><img src="${contextPath}/resources/image/2st.png" style="width:30px;height:30px;"></a>2등 : 로직생각은나중에</h3></li>
		<li><h3><a href="#"><img src="${contextPath}/resources/image/3st.png" style="width:30px;height:30px;"></a>3등 : 내일의내가하겠지</h3></li>
	</div>
</div>
</div>
<!-- 광고 -->
<h2 class="main_h22">광고</h2>
<div class="AAad">
	<iframe width="560" height="315" src="https://www.youtube.com/embed/dPCrRBuyFEA" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
	<iframe width="560" height="315" src="https://www.youtube.com/embed/8WjaNbRmvQ0" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
</div>
<!-- 공지사항/사용법 -->
<h2 class="main_h22">사이트 사용법</h2>
<div id="guide">
	<img src="${contextPath}/resources/image/slider_1.PNG" alt="사용법">
</div>
</body>
</html>