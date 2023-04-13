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
<script>
function deletemember(_login_id){
	if(confirm("회원 정보는 30일간 저장 됩니다. 정말로 탈퇴 하시겠습니까?")){

	var formObj = document.createElement("form");
	var i_login_id = document.createElement("input");
	i_login_id.name = "login_id";
	i_login_id.value = _login_id;
	
	formObj.appendChild(i_login_id);
	document.body.appendChild(formObj);
	formObj.method="post";
	formObj.action="${contextPath}/mypage/deleteMember.do";
	formObj.submit();		
	} else {
		alert("취소합니다.");
	}
	}
</script>
<script>
function deleteComMember(_login_id){
	if(confirm("회원 정보는 30일간 저장 됩니다. 정말로 탈퇴 하시겠습니까?")){

	var formObj = document.createElement("form");
	var i_login_id = document.createElement("input");
	i_login_id.name = "login_id";
	i_login_id.value = _login_id;
	
	formObj.appendChild(i_login_id);
	document.body.appendChild(formObj);
	formObj.method="post";
	formObj.action="${contextPath}/mypage/deleteComMember.do";
	formObj.submit();		
	} else {
		alert("취소합니다.");
	}
	}
</script>
</head>

<body> 
<nav class="sidebar">
<ul>

<c:choose>
<c:when test="${not empty sessionScope.side_menu and sessionScope.side_menu eq 'admin_mode'}">
   <li>
		<H3>관리자</H3>
		<ul>
			<li><a href="#">등록 회원 조회</a></li>
			<li><a href="#">등록 사업체 조회</a></li>
			<li><a href="#">상품 조회</a></li>
			<li><a href="#">문의 내역</a></li>
			<li><a href="#">신고 내역</a></li>
			<li><a href="#">전체 주문 조회</a></li>
			<li><a href="#">매출 관리</a></li>
			<li><a href="#">이벤트 관리</a></li>
			<li><a href="#">관리자 게시물 등록</a></li>
		</ul>
	</li>
</c:when>
<c:when test="${not empty sessionScope.side_menu and sessionScope.side_menu eq 'my_page'}">
	<li>
		<h3>마이페이지</h3>
		<ul>
			<li><a href="#">기본 정보</a></li>
			<li><a href="#">회원 정보 수정</a></li>
			<li><a href="#">장바구니</a></li>
			<li><a href="#">구매 내역</a></li>
			<li><a href="#">문의 내역</a></li>
			<li><a href="${contextPath}/mypage/myOrderCheck.do">주문 조회</a></li>
			<li><a href="#">My 포인트</a></li>
			<li><a href="#">My 게시글 조회</a></li>
			<li><a href="javascript:deletemember('${login_id}')">회원 탈퇴</a></li>
		</ul>
	</li>
</c:when>
<c:when test="${not empty sessionScope.side_menu and sessionScope.side_menu eq 'company_page'}">
	<li>
		<h3>마이페이지</h3>
		<ul>
			<li><a href="#">기본 정보</a></li>
			<li><a href="#">회원 정보 수정</a></li>
			<li><a href="#">상품 문의 내역</a></li>
			<li><a href="#">판매 내역</a></li>
			<li><a href="#">스케줄 관리</a></li>
			<li><a href="#">My 상품 조회</a></li>
			<li><a href="#">My 게시글 조회</a></li>
			<li><a href="javascript:deleteComMember('${login_id}')">회원 탈퇴</a></li>
		</ul>
	</li>
</c:when>
<c:otherwise>
	<li>
		<a href="${contextPath}/goods/goodsListByCategory.do?goods_main_category=비즈니스&goods_middle_category=디자인"><h3>디자인</h3></a>
		<ul>
							<li><a href="${contextPath}/goods/goodsListByCategory.do?goods_main_category=비즈니스&goods_middle_category=디자인&goods_sub_category=인쇄/홍보물">&nbsp;&nbsp;인쇄/홍보물</a></li>
							<li><a href="${contextPath}/goods/goodsListByCategory.do?goods_main_category=비즈니스&goods_middle_category=디자인&goods_sub_category=패키지/커버/로고">&nbsp;&nbsp;패키지/커버/로고</a></li>
							<li><a href="${contextPath}/goods/goodsListByCategory.do?goods_main_category=비즈니스&goods_middle_category=디자인&goods_sub_category=웹/모바일">&nbsp;&nbsp;웹/모바일</a></li>
							<li><a href="${contextPath}/goods/goodsListByCategory.do?goods_main_category=비즈니스&goods_middle_category=디자인&goods_sub_category=브랜딩/마케팅">&nbsp;&nbsp;브랜딩/마케팅</a></li>
							<li><a href="${contextPath}/goods/goodsListByCategory.do?goods_main_category=비즈니스&goods_middle_category=디자인&goods_sub_category=산업/제품디자인">&nbsp;&nbsp;산업/제품디자인</a></li>
							<li><a href="${contextPath}/goods/goodsListByCategory.do?goods_main_category=비즈니스&goods_middle_category=디자인&goods_sub_category=캐릭터/일러스트">&nbsp;&nbsp;캐릭터/일러스트</a></li>
							<li><a href="${contextPath}/goods/goodsListByCategory.do?goods_main_category=비즈니스&goods_middle_category=디자인&goods_sub_category=캘리그라피/폰트">&nbsp;&nbsp;캘리그라피/폰트</a></li>
							<li><a href="${contextPath}/goods/goodsListByCategory.do?goods_main_category=비즈니스&goods_middle_category=디자인&goods_sub_category=공간/건축">&nbsp;&nbsp;공간/건축</a></li>
							<li><a href="${contextPath}/goods/goodsListByCategory.do?goods_main_category=비즈니스&goods_middle_category=디자인&goods_sub_category=패션/텍스타일">&nbsp;&nbsp;패션/텍스타일</a></li>
							<li><a href="${contextPath}/goods/goodsListByCategory.do?goods_main_category=비즈니스&goods_middle_category=디자인&goods_sub_category=기타">&nbsp;&nbsp;기타</a></li>
						</ul>
					</li>
					<li>
					<a href="${contextPath}/goods/goodsListByCategory.do?goods_main_category=비즈니스&goods_middle_category=IT/프로그래밍"><h3>IT/프로그래밍</h3></a>
						<ul>
							<li><a href="${contextPath}/goods/goodsListByCategory.do?goods_main_category=비즈니스&goods_middle_category=IT/프로그래밍&goods_sub_category=UX기획">&nbsp;&nbsp;UX기획</a></li>
							<li><a href="${contextPath}/goods/goodsListByCategory.do?goods_main_category=비즈니스&goods_middle_category=IT/프로그래밍&goods_sub_category=웹">&nbsp;&nbsp;웹</a></li>
							<li><a href="${contextPath}/goods/goodsListByCategory.do?goods_main_category=비즈니스&goods_middle_category=IT/프로그래밍&goods_sub_category=커머스">&nbsp;&nbsp;커머스</a></li>
							<li><a href="${contextPath}/goods/goodsListByCategory.do?goods_main_category=비즈니스&goods_middle_category=IT/프로그래밍&goods_sub_category=모바일">&nbsp;&nbsp;모바일</a></li>
							<li><a href="${contextPath}/goods/goodsListByCategory.do?goods_main_category=비즈니스&goods_middle_category=IT/프로그래밍&goods_sub_category=프로그램">&nbsp;&nbsp;프로그램</a></li>
							<li><a href="${contextPath}/goods/goodsListByCategory.do?goods_main_category=비즈니스&goods_middle_category=IT/프로그래밍&goods_sub_category=트렌드">&nbsp;&nbsp;트렌드</a></li>
							<li><a href="${contextPath}/goods/goodsListByCategory.do?goods_main_category=비즈니스&goods_middle_category=IT/프로그래밍&goods_sub_category=데이터">&nbsp;&nbsp;데이터</a></li>
							<li><a href="${contextPath}/goods/goodsListByCategory.do?goods_main_category=비즈니스&goods_middle_category=IT/프로그래밍&goods_sub_category=기타">&nbsp;&nbsp;기타</a></li>
						</ul>
					</li>
					<li>
					<a href="${contextPath}/goods/goodsListByCategory.do?goods_main_category=비즈니스&goods_middle_category=영상/사진/음향"><h3>영상/사진/음향</h3></a>
						<ul>
							<li><a href="${contextPath}/goods/goodsListByCategory.do?goods_main_category=비즈니스&goods_middle_category=영상/사진/음향&goods_sub_category=영상">&nbsp;&nbsp;영상</a></li>
							<li><a href="${contextPath}/goods/goodsListByCategory.do?goods_main_category=비즈니스&goods_middle_category=영상/사진/음향&goods_sub_category=사진">&nbsp;&nbsp;사진</a></li>
							<li><a href="${contextPath}/goods/goodsListByCategory.do?goods_main_category=비즈니스&goods_middle_category=영상/사진/음향&goods_sub_category=음향">&nbsp;&nbsp;음향</a></li>
							<li><a href="${contextPath}/goods/goodsListByCategory.do?goods_main_category=비즈니스&goods_middle_category=영상/사진/음향&goods_sub_category=엔터테이너">&nbsp;&nbsp;엔터테이너</a></li>
							<li><a href="${contextPath}/goods/goodsListByCategory.do?goods_main_category=비즈니스&goods_middle_category=영상/사진/음향&goods_sub_category=기타">&nbsp;&nbsp;기타</a></li>
						</ul>
					</li>
					<li>
					<a href="${contextPath}/goods/goodsListByCategory.do?goods_main_category=비즈니스&goods_middle_category=마케팅"><h3>마케팅</h3></a>
						<ul>
							<li><a href="${contextPath}/goods/goodsListByCategory.do?goods_main_category=비즈니스&goods_middle_category=마케팅&goods_sub_category=채널 활성화">&nbsp;&nbsp;채널 활성화</a></li>
							<li><a href="${contextPath}/goods/goodsListByCategory.do?goods_main_category=비즈니스&goods_middle_category=마케팅&goods_sub_category=바이럴/체험단">&nbsp;&nbsp;바이럴/체험단</a></li>
							<li><a href="${contextPath}/goods/goodsListByCategory.do?goods_main_category=비즈니스&goods_middle_category=마케팅&goods_sub_category=업종/목적별">&nbsp;&nbsp;업종/목적별</a></li>
							<li><a href="${contextPath}/goods/goodsListByCategory.do?goods_main_category=비즈니스&goods_middle_category=마케팅&goods_sub_category=최적화 노출">&nbsp;&nbsp;최적화 노출</a></li>
							<li><a href="${contextPath}/goods/goodsListByCategory.do?goods_main_category=비즈니스&goods_middle_category=마케팅&goods_sub_category=광고(퍼포먼스)">&nbsp;&nbsp;광고(퍼포먼스)</a></li>
							<li><a href="${contextPath}/goods/goodsListByCategory.do?goods_main_category=비즈니스&goods_middle_category=마케팅&goods_sub_category=PR/행사">&nbsp;&nbsp;PR/행사</a></li>
							<li><a href="${contextPath}/goods/goodsListByCategory.do?goods_main_category=비즈니스&goods_middle_category=마케팅&goods_sub_category=분석/전략">&nbsp;&nbsp;분석/전략</a></li>
							<li><a href="${contextPath}/goods/goodsListByCategory.do?goods_main_category=비즈니스&goods_middle_category=마케팅&goods_sub_category=옥외/인쇄/방송 광고">&nbsp;&nbsp;옥외/인쇄/방송 광고</a></li>
							<li><a href="${contextPath}/goods/goodsListByCategory.do?goods_main_category=비즈니스&goods_middle_category=마케팅&goods_sub_category=해외 마케팅">&nbsp;&nbsp;해외 마케팅</a></li>
							<li><a href="${contextPath}/goods/goodsListByCategory.do?goods_main_category=비즈니스&goods_middle_category=마케팅&goods_sub_category=기타">&nbsp;&nbsp;기타</a></li>
						</ul>
					</li>
					<li>
					<a href="${contextPath}/goods/goodsListByCategory.do?goods_main_category=비즈니스&goods_middle_category=문서/번역"><h3>문서/번역</h3></a>
						<ul>
							<li><a href="${contextPath}/goods/goodsListByCategory.do?goods_main_category=비즈니스&goods_middle_category=문서/번역&goods_sub_category=비즈니스 카피">&nbsp;&nbsp;비즈니스 카피</a></li>
							<li><a href="${contextPath}/goods/goodsListByCategory.do?goods_main_category=비즈니스&goods_middle_category=문서/번역&goods_sub_category=마케팅 글쓰기">&nbsp;&nbsp;마케팅 글쓰기</a></li>
							<li><a href="${contextPath}/goods/goodsListByCategory.do?goods_main_category=비즈니스&goods_middle_category=문서/번역&goods_sub_category=콘텐츠 글쓰기">&nbsp;&nbsp;콘텐츠 글쓰기</a></li>
							<li><a href="${contextPath}/goods/goodsListByCategory.do?goods_main_category=비즈니스&goods_middle_category=문서/번역&goods_sub_category=스토리텔링">&nbsp;&nbsp;스토리텔링</a></li>
							<li><a href="${contextPath}/goods/goodsListByCategory.do?goods_main_category=비즈니스&goods_middle_category=문서/번역&goods_sub_category=타이핑/첨삭">&nbsp;&nbsp;타이핑/첨삭</a></li>
							<li><a href="${contextPath}/goods/goodsListByCategory.do?goods_main_category=비즈니스&goods_middle_category=문서/번역&goods_sub_category=번역/통역">&nbsp;&nbsp;번역/통역</a></li>
							<li><a href="${contextPath}/goods/goodsListByCategory.do?goods_main_category=비즈니스&goods_middle_category=문서/번역&goods_sub_category=기타">&nbsp;&nbsp;기타</a></li>
						</ul>
					</li>
					<li>
					<a href="${contextPath}/goods/goodsListByCategory.do?goods_main_category=비즈니스&goods_middle_category=경영자문/운영지원"><h3>경영자문/운영지원</h3></a>
						<ul>
							<li><a href="${contextPath}/goods/goodsListByCategory.do?goods_main_category=비즈니스&goods_middle_category=경영자문/운영지원&goods_sub_category=사업계획">&nbsp;&nbsp;사업계획</a></li>
							<li><a href="${contextPath}/goods/goodsListByCategory.do?goods_main_category=비즈니스&goods_middle_category=경영자문/운영지원&goods_sub_category=스타트업 자문">&nbsp;&nbsp;스타트업 자문</a></li>
							<li><a href="${contextPath}/goods/goodsListByCategory.do?goods_main_category=비즈니스&goods_middle_category=경영자문/운영지원&goods_sub_category=기업 자문">&nbsp;&nbsp;기업 자문</a></li>
							<li><a href="${contextPath}/goods/goodsListByCategory.do?goods_main_category=비즈니스&goods_middle_category=경영자문/운영지원&goods_sub_category=업종별 창업">&nbsp;&nbsp;업종별 창업</a></li>
							<li><a href="${contextPath}/goods/goodsListByCategory.do?goods_main_category=비즈니스&goods_middle_category=경영자문/운영지원&goods_sub_category=비즈니스 문서">&nbsp;&nbsp;비즈니스 문서</a></li>
							<li><a href="${contextPath}/goods/goodsListByCategory.do?goods_main_category=비즈니스&goods_middle_category=경영자문/운영지원&goods_sub_category=기타">&nbsp;&nbsp;기타</a></li>
						</ul>
					</li>
					<li>
					<a href="${contextPath}/goods/goodsListByCategory.do?goods_main_category=비즈니스&goods_middle_category=주문제작"><h3>주문제작</h3></a>
						<ul>
							<li><a href="${contextPath}/goods/goodsListByCategory.do?goods_main_category=비즈니스&goods_middle_category=주문제작&goods_sub_category=인쇄/판촉물">&nbsp;&nbsp;인쇄/판촉물</a></li>
							<li><a href="${contextPath}/goods/goodsListByCategory.do?goods_main_category=비즈니스&goods_middle_category=주문제작&goods_sub_category=시공">&nbsp;&nbsp;시공</a></li>
							<li><a href="${contextPath}/goods/goodsListByCategory.do?goods_main_category=비즈니스&goods_middle_category=주문제작&goods_sub_category=기타">&nbsp;&nbsp;기타</a></li>
						</ul>
					</li>
					<li><a href="${contextPath}/goods/goodsListByCategory.do?goods_main_category=비즈니스&goods_middle_category=세무/법무/노무"><h3>세무/법무/노무</h3></a>
						<ul>
							<li><a href="${contextPath}/goods/goodsListByCategory.do?goods_main_category=비즈니스&goods_middle_category=세무/법무/노무&goods_sub_category=법무">&nbsp;&nbsp;법무</a></li>
							<li><a href="${contextPath}/goods/goodsListByCategory.do?goods_main_category=비즈니스&goods_middle_category=세무/법무/노무&goods_sub_category=세무/회계">&nbsp;&nbsp;세무/회계</a></li>
							<li><a href="${contextPath}/goods/goodsListByCategory.do?goods_main_category=비즈니스&goods_middle_category=세무/법무/노무&goods_sub_category=지식재산권 보호">&nbsp;&nbsp;지식재산권 보호</a></li>
							<li><a href="${contextPath}/goods/goodsListByCategory.do?goods_main_category=비즈니스&goods_middle_category=세무/법무/노무&goods_sub_category=노무">&nbsp;&nbsp;노무</a></li>
							<li><a href="${contextPath}/goods/goodsListByCategory.do?goods_main_category=비즈니스&goods_middle_category=세무/법무/노무&goods_sub_category=기타">&nbsp;&nbsp;기타</a></li>
						</ul>
					</li>
					
					<li>
					<a href="${contextPath}/goods/goodsListByCategory.do?goods_main_category=N잡/커리어&goods_middle_category=취업/입시/노하우/직무역량"><h3>취업/입시/노하우/<br>직무역량</h3></a>
						<ul>
							<li><a href="${contextPath}/goods/goodsListByCategory.do?goods_main_category=N잡/커리어&goods_middle_category=취업/입시/노하우/직무역량&goods_sub_category=취업/이직">&nbsp;&nbsp;취업/이직</a></li>
							<li><a href="${contextPath}/goods/goodsListByCategory.do?goods_main_category=N잡/커리어&goods_middle_category=취업/입시/노하우/직무역량&goods_sub_category=입시/자격증">&nbsp;&nbsp;입시/자격증</a></li>
							<li><a href="${contextPath}/goods/goodsListByCategory.do?goods_main_category=N잡/커리어&goods_middle_category=취업/입시/노하우/직무역량&goods_sub_category=투잡/재테크">&nbsp;&nbsp;투잡/재테크</a></li>
							<li><a href="${contextPath}/goods/goodsListByCategory.do?goods_main_category=N잡/커리어&goods_middle_category=취업/입시/노하우/직무역량&goods_sub_category=전자책/VOD">&nbsp;&nbsp;전자책/VOD</a></li>
							<li><a href="${contextPath}/goods/goodsListByCategory.do?goods_main_category=N잡/커리어&goods_middle_category=취업/입시/노하우/직무역량&goods_sub_category=데이터/개발 레슨">&nbsp;&nbsp;데이터/개발 레슨</a></li>
							<li><a href="${contextPath}/goods/goodsListByCategory.do?goods_main_category=N잡/커리어&goods_middle_category=취업/입시/노하우/직무역량&goods_sub_category=실무/자기개발 레슨">&nbsp;&nbsp;실무/자기개발 레슨</a></li>
							<li><a href="${contextPath}/goods/goodsListByCategory.do?goods_main_category=N잡/커리어&goods_middle_category=취업/입시/노하우/직무역량&goods_sub_category=외국어 레슨">&nbsp;&nbsp;외국어 레슨</a></li>
							<li><a href="${contextPath}/goods/goodsListByCategory.do?goods_main_category=N잡/커리어&goods_middle_category=취업/입시/노하우/직무역량&goods_sub_category=디자인/영상 레슨">&nbsp;&nbsp;디자인/영상 레슨</a></li>
							<li><a href="${contextPath}/goods/goodsListByCategory.do?goods_main_category=N잡/커리어&goods_middle_category=취업/입시/노하우/직무역량&goods_sub_category=기타">&nbsp;&nbsp;기타</a></li>
						</ul>
					</li>
					<li><a href="${contextPath}/goods/goodsListByCategory.do?goods_main_category=취미/생활&goods_middle_category=취미/생활"><h3>취미/생활</h3></a>
						<ul>
							<li><a href="${contextPath}/goods/goodsListByCategory.do?goods_main_category=취미/생활&goods_middle_category=취미/생활&goods_sub_category=뷰티/운동">&nbsp;&nbsp;뷰티/운동</a></li>
							<li><a href="${contextPath}/goods/goodsListByCategory.do?goods_main_category=취미/생활&goods_middle_category=취미/생활&goods_sub_category=댄스/뮤직">&nbsp;&nbsp;댄스/뮤직</a></li>
							<li><a href="${contextPath}/goods/goodsListByCategory.do?goods_main_category=취미/생활&goods_middle_category=취미/생활&goods_sub_category=미술/글쓰기">&nbsp;&nbsp;미술/글쓰기</a></li>
							<li><a href="${contextPath}/goods/goodsListByCategory.do?goods_main_category=취미/생활&goods_middle_category=취미/생활&goods_sub_category=공예/취미">&nbsp;&nbsp;공예/취미</a></li>
							<li><a href="${contextPath}/goods/goodsListByCategory.do?goods_main_category=취미/생활&goods_middle_category=취미/생활&goods_sub_category=웨딩">&nbsp;&nbsp;웨딩</a></li>
							<li><a href="${contextPath}/goods/goodsListByCategory.do?goods_main_category=취미/생활&goods_middle_category=취미/생활&goods_sub_category=청소/수리/설치">&nbsp;&nbsp;청소/수리/설치</a></li>
							<li><a href="${contextPath}/goods/goodsListByCategory.do?goods_main_category=취미/생활&goods_middle_category=취미/생활&goods_sub_category=기타">&nbsp;&nbsp;기타</a></li>
						</ul>
					</li>
 </c:otherwise>
</c:choose>	
</ul>
</nav>
</body>
</html>