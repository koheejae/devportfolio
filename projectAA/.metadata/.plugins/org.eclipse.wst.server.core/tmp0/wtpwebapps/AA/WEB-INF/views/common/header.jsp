<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>sibal!</title>
<script type="text/javascript">



	var loopSearch=true;
	function keywordSearch(){
		if(loopSearch==false) 
			return;
	 var value=document.frmSearch.searchWord.value;
		$.ajax({
			type : "get",
			async : true, //false인 경우 동기식으로 처리한다.
			url : "${contextPath}/goods/keywordSearch.do",
			data : {keyword:value},
			success : function(data, textStatus) {
			    var jsonInfo = JSON.parse(data);
				displayResult(jsonInfo);
			},
			 error : function(data, textStatus) {
				alert("에러가 발생했습니다."+data);
			},
			complete : function(data, textStatus) {
				//alert("작업을완료 했습니다");
				
			}
		}); //end ajax	
	}
	
	function displayResult(jsonInfo){
		var count = jsonInfo.keyword.length;
		if(count > 0) {
		    var html = '';
		    for(var i in jsonInfo.keyword){
			   html += "<a href=\"javascript:select('"+jsonInfo.keyword[i]+"')\">"+jsonInfo.keyword[i]+"</a><br/>";
		    }
		    var listView = document.getElementById("suggestList");
		    listView.innerHTML = html;
		    show('suggest');
		}else{
		    hide('suggest');
		} 
	}
	
	function select(selectedKeyword) {
		 document.frmSearch.searchWord.value=selectedKeyword;
		 loopSearch = false;
		 hide('suggest');
	}
		
	function show(elementId) {
		 var element = document.getElementById(elementId);
		 if(element) {
		  element.style.display = 'block';
		 }
		}
	
	function hide(elementId){
	   var element = document.getElementById(elementId);
	   if(element){
		  element.style.display = 'none';
	   }
	}

</script>
</head>
<body>
<div id="headercontent">
<div id="logo">
	<a href="${contextPath}/main/main.do">
		<img width="147px" height="147px" alt="booktopia" src="${contextPath}/resources/image/logo_1.png">
		</a>
	</div>
	<div id="search" >
		<form name="frmSearch" action="${contextPath}/goods/searchGoods.do" >
			<input name="searchWord" class="main_input" type="text"  onKeyUp="keywordSearch()"> 
			<input type="submit" name="search" class="btn1"  value="검 색" >
		</form>
	</div>
	<div id="head_link">
		<ul>
		   <c:choose>
		     <c:when test="${isLogOn == true and not empty memberInfo }">
		       <li style="margin-top: 1.5px;">${memberInfo.nickname} 님 안녕하세요!</a></li>
			   <li><a href="${contextPath}/member/logout.do">로그아웃</a></li>
			 </c:when>
			 <c:when test="${isLogOn == true and not empty companyInfo }">
			   <li style="margin-top: 2px;">${companyInfo.nickname} 님 안녕하세요!</a></li>
			   <li><a href="${contextPath}/member/logout.do">로그아웃</a></li>
			 </c:when>
			 <c:otherwise>
			   <li><a href="${contextPath}/member/loginForm.do">로그인</a></li>
			   <li><a href="${contextPath}/member/selectJoinMember.do">회원가입</a></li> 
			 </c:otherwise>
			</c:choose>
			   <li onclick="alert('로그인 후 이용해주세요.')"><a href="${contextPath}/member/loginForm.do" >고객센터</a></li>
      <c:if test="${isLogOn == true and memberInfo.status =='관리자' }">  
	   	   <li class="no_line"><a href="${contextPath}/admin/goods/adminGoodsMain.do">관리자</a></li>
	    </c:if> 
		</ul>
	</div>
	<div id="head_navi">
		<ul>
			<li><a href="${contextPath}/goods/goodsListByCategory.do" class="navimenu">전체 카테고리</a>
				<ul>
					<li><span class="bold"><a style="color:black;" href="${contextPath}/goods/goodsListByCategory.do?goods_main_category=비즈니스">&nbsp;&nbsp;비즈니스</a></span></li>
					<li><a href="${contextPath}/goods/goodsListByCategory.do?goods_main_category=비즈니스&goods_middle_category=디자인">&nbsp;&nbsp;디자인</a>
						<ul><span class="bold">&nbsp;&nbsp;디자인<br><br></span>
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
					<li><a href="${contextPath}/goods/goodsListByCategory.do?goods_main_category=비즈니스&goods_middle_category=IT/프로그래밍">&nbsp;&nbsp;IT/프로그래밍</a>
						<ul><span class="bold" style="margin-bottom:5px;">&nbsp;&nbsp;IT/프로그래밍<br><br></span>
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
					<li><a href="${contextPath}/goods/goodsListByCategory.do?goods_main_category=비즈니스&goods_middle_category=영상/사진/음향">&nbsp;&nbsp;영상/사진/음향</a>
						<ul><span class="bold" style="margin-bottom:5px;">&nbsp;&nbsp;영상/사진/음향<br><br></span>
							<li><a href="${contextPath}/goods/goodsListByCategory.do?goods_main_category=비즈니스&goods_middle_category=영상/사진/음향&goods_sub_category=영상">&nbsp;&nbsp;영상</a></li>
							<li><a href="${contextPath}/goods/goodsListByCategory.do?goods_main_category=비즈니스&goods_middle_category=영상/사진/음향&goods_sub_category=사진">&nbsp;&nbsp;사진</a></li>
							<li><a href="${contextPath}/goods/goodsListByCategory.do?goods_main_category=비즈니스&goods_middle_category=영상/사진/음향&goods_sub_category=음향">&nbsp;&nbsp;음향</a></li>
							<li><a href="${contextPath}/goods/goodsListByCategory.do?goods_main_category=비즈니스&goods_middle_category=영상/사진/음향&goods_sub_category=엔터테이너">&nbsp;&nbsp;엔터테이너</a></li>
							<li><a href="${contextPath}/goods/goodsListByCategory.do?goods_main_category=비즈니스&goods_middle_category=영상/사진/음향&goods_sub_category=기타">&nbsp;&nbsp;기타</a></li>
						</ul>
					</li>
					<li><a href="${contextPath}/goods/goodsListByCategory.do?goods_main_category=비즈니스&goods_middle_category=마케팅">&nbsp;&nbsp;마케팅</a>
						<ul><span class="bold">&nbsp;&nbsp;마케팅<br><br></span>
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
					<li><a href="${contextPath}/goods/goodsListByCategory.do?goods_main_category=비즈니스&goods_middle_category=문서/번역">&nbsp;&nbsp;문서/번역</a>
						<ul><span class="bold">&nbsp;&nbsp;문서/번역<br><br></span>
							<li><a href="${contextPath}/goods/goodsListByCategory.do?goods_main_category=비즈니스&goods_middle_category=문서/번역&goods_sub_category=비즈니스 카피">&nbsp;&nbsp;비즈니스 카피</a></li>
							<li><a href="${contextPath}/goods/goodsListByCategory.do?goods_main_category=비즈니스&goods_middle_category=문서/번역&goods_sub_category=마케팅 글쓰기">&nbsp;&nbsp;마케팅 글쓰기</a></li>
							<li><a href="${contextPath}/goods/goodsListByCategory.do?goods_main_category=비즈니스&goods_middle_category=문서/번역&goods_sub_category=콘텐츠 글쓰기">&nbsp;&nbsp;콘텐츠 글쓰기</a></li>
							<li><a href="${contextPath}/goods/goodsListByCategory.do?goods_main_category=비즈니스&goods_middle_category=문서/번역&goods_sub_category=스토리텔링">&nbsp;&nbsp;스토리텔링</a></li>
							<li><a href="${contextPath}/goods/goodsListByCategory.do?goods_main_category=비즈니스&goods_middle_category=문서/번역&goods_sub_category=타이핑/첨삭">&nbsp;&nbsp;타이핑/첨삭</a></li>
							<li><a href="${contextPath}/goods/goodsListByCategory.do?goods_main_category=비즈니스&goods_middle_category=문서/번역&goods_sub_category=번역/통역">&nbsp;&nbsp;번역/통역</a></li>
							<li><a href="${contextPath}/goods/goodsListByCategory.do?goods_main_category=비즈니스&goods_middle_category=문서/번역&goods_sub_category=기타">&nbsp;&nbsp;기타</a></li>
						</ul>
					</li>
					<li><a href="${contextPath}/goods/goodsListByCategory.do?goods_main_category=비즈니스&goods_middle_category=경영자문/운영지원">&nbsp;&nbsp;경영자문/운영지원</a>
						<ul><span class="bold">&nbsp;&nbsp;경영자문/운영지원<br><br></span>
							<li><a href="${contextPath}/goods/goodsListByCategory.do?goods_main_category=비즈니스&goods_middle_category=경영자문/운영지원&goods_sub_category=사업계획">&nbsp;&nbsp;사업계획</a></li>
							<li><a href="${contextPath}/goods/goodsListByCategory.do?goods_main_category=비즈니스&goods_middle_category=경영자문/운영지원&goods_sub_category=스타트업 자문">&nbsp;&nbsp;스타트업 자문</a></li>
							<li><a href="${contextPath}/goods/goodsListByCategory.do?goods_main_category=비즈니스&goods_middle_category=경영자문/운영지원&goods_sub_category=기업 자문">&nbsp;&nbsp;기업 자문</a></li>
							<li><a href="${contextPath}/goods/goodsListByCategory.do?goods_main_category=비즈니스&goods_middle_category=경영자문/운영지원&goods_sub_category=업종별 창업">&nbsp;&nbsp;업종별 창업</a></li>
							<li><a href="${contextPath}/goods/goodsListByCategory.do?goods_main_category=비즈니스&goods_middle_category=경영자문/운영지원&goods_sub_category=비즈니스 문서">&nbsp;&nbsp;비즈니스 문서</a></li>
							<li><a href="${contextPath}/goods/goodsListByCategory.do?goods_main_category=비즈니스&goods_middle_category=경영자문/운영지원&goods_sub_category=기타">&nbsp;&nbsp;기타</a></li>
						</ul>
					</li>
					<li><a href="${contextPath}/goods/goodsListByCategory.do?goods_main_category=비즈니스&goods_middle_category=주문제작">&nbsp;&nbsp;주문제작</a>
						<ul><span class="bold">&nbsp;&nbsp;주문제작<br><br></span>
							<li><a href="${contextPath}/goods/goodsListByCategory.do?goods_main_category=비즈니스&goods_middle_category=주문제작&goods_sub_category=인쇄/판촉물">&nbsp;&nbsp;인쇄/판촉물</a></li>
							<li><a href="${contextPath}/goods/goodsListByCategory.do?goods_main_category=비즈니스&goods_middle_category=주문제작&goods_sub_category=시공">&nbsp;&nbsp;시공</a></li>
							<li><a href="${contextPath}/goods/goodsListByCategory.do?goods_main_category=비즈니스&goods_middle_category=주문제작&goods_sub_category=기타">&nbsp;&nbsp;기타</a></li>
						</ul>
					</li>
					<li><a href="${contextPath}/goods/goodsListByCategory.do?goods_main_category=비즈니스&goods_middle_category=세무/법무/노무">&nbsp;&nbsp;세무/법무/노무</a>
						<ul><span class="bold">&nbsp;&nbsp;세무/법무/노무<br><br></span>
							<li><a href="${contextPath}/goods/goodsListByCategory.do?goods_main_category=비즈니스&goods_middle_category=세무/법무/노무&goods_sub_category=법무">&nbsp;&nbsp;법무</a></li>
							<li><a href="${contextPath}/goods/goodsListByCategory.do?goods_main_category=비즈니스&goods_middle_category=세무/법무/노무&goods_sub_category=세무/회계">&nbsp;&nbsp;세무/회계</a></li>
							<li><a href="${contextPath}/goods/goodsListByCategory.do?goods_main_category=비즈니스&goods_middle_category=세무/법무/노무&goods_sub_category=지식재산권 보호">&nbsp;&nbsp;지식재산권 보호</a></li>
							<li><a href="${contextPath}/goods/goodsListByCategory.do?goods_main_category=비즈니스&goods_middle_category=세무/법무/노무&goods_sub_category=노무">&nbsp;&nbsp;노무</a></li>
							<li><a href="${contextPath}/goods/goodsListByCategory.do?goods_main_category=비즈니스&goods_middle_category=세무/법무/노무&goods_sub_category=기타">&nbsp;&nbsp;기타</a></li>
						</ul>
					</li>
					<li><span class="bold"><a style="color:black;" href=${contextPath}/goods/goodsListByCategory.do?goods_main_category=N잡/커리어>&nbsp;&nbsp;N잡·커리어</a></span></li>
					<li><a href="${contextPath}/goods/goodsListByCategory.do?goods_main_category=N잡/커리어&goods_middle_category=취업/입시/노하우/직무역량">&nbsp;&nbsp;취업/입시/노하우/직무역량</a>
						<ul><span class="bold">&nbsp;&nbsp;취업/입시/노하우/직무역량<br><br></span>
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
					<li><span class="bold"><a style="color:black;" href=${contextPath}/goods/goodsListByCategory.do?goods_main_category=취미/생활>&nbsp;&nbsp;취미·생활</a></span></li>
					<li><a href="${contextPath}/goods/goodsListByCategory.do?goods_main_category=취미/생활&goods_middle_category=취미/생활">&nbsp;&nbsp;취미/생활</a>
						<ul><span class="bold">&nbsp;&nbsp;취미/생활<br><br></span>
							<li><a href="${contextPath}/goods/goodsListByCategory.do?goods_main_category=취미/생활&goods_middle_category=취미/생활&goods_sub_category=뷰티/운동">&nbsp;&nbsp;뷰티/운동</a></li>
							<li><a href="${contextPath}/goods/goodsListByCategory.do?goods_main_category=취미/생활&goods_middle_category=취미/생활&goods_sub_category=댄스/뮤직">&nbsp;&nbsp;댄스/뮤직</a></li>
							<li><a href="${contextPath}/goods/goodsListByCategory.do?goods_main_category=취미/생활&goods_middle_category=취미/생활&goods_sub_category=미술/글쓰기">&nbsp;&nbsp;미술/글쓰기</a></li>
							<li><a href="${contextPath}/goods/goodsListByCategory.do?goods_main_category=취미/생활&goods_middle_category=취미/생활&goods_sub_category=공예/취미">&nbsp;&nbsp;공예/취미</a></li>
							<li><a href="${contextPath}/goods/goodsListByCategory.do?goods_main_category=취미/생활&goods_middle_category=취미/생활&goods_sub_category=웨딩">&nbsp;&nbsp;웨딩</a></li>
							<li><a href="${contextPath}/goods/goodsListByCategory.do?goods_main_category=취미/생활&goods_middle_category=취미/생활&goods_sub_category=청소/수리/설치">&nbsp;&nbsp;청소/수리/설치</a></li>
							<li><a href="${contextPath}/goods/goodsListByCategory.do?goods_main_category=취미/생활&goods_middle_category=취미/생활&goods_sub_category=기타">&nbsp;&nbsp;기타</a></li>
						</ul>
					</li>
				</ul>
			</li>
			<li ><a href="#" class="navimenu">공지사항</a>
				<ul>
					<li><a href="#">&nbsp;&nbsp;공지사항</a></li>
					<li><a href="#">&nbsp;&nbsp;이벤트</a></li>
					<li><a href="#">&nbsp;&nbsp;사이트 사용법</a></li>
				</ul>
			</li>
			<li class="navimenu"><li><a href="${contextPath}/board/listArticles.do">자유게시판</a></li>
			<li class="navimenu"><a href="#" >Prime</a></li>
			<c:choose>
				<c:when test="${isLogOn == true}">
					<li  id="mypage" class="navimenu"><a href="#" >마이페이지</a>
				</c:when>
				<c:otherwise>
					<li id="mypage" class="navimenu" onclick="alert('로그인 후 이용해주세요.')"><a href="${contextPath}/member/loginForm.do" >마이페이지</a>
				</c:otherwise>
			</c:choose>
				<c:choose>
					<c:when test="${isLogOn == true and not empty memberInfo}">
					<ul>
						<li><a href="${contextPath}/mypage/myDetailInfo.do">&nbsp;&nbsp;기본 정보 관리</a></li>
						<li><a href="${contextPath}/cart/myCartList.do">&nbsp;&nbsp;장바구니</a></li>
						<li><a href="#">&nbsp;&nbsp;구매 내역</a></li>
						<li><a href="#">&nbsp;&nbsp;문의 내역</a></li>
						<li><a href="${contextPath}/mypage/myOrderCheck.do">&nbsp;&nbsp;주문 조회</a></li>
						<li><a href="#">&nbsp;&nbsp;My 포인트</a></li>
						<li><a href="#">&nbsp;&nbsp;My 게시글 조회</a></li>
						<li><a href="#">&nbsp;&nbsp;회원 탈퇴</a></li>
					</ul>
					</c:when>
					<c:when test="${isLogOn == true and not empty companyInfo}">
					<ul>
						<li><a href="${contextPath}/mypage/comDetailInfo.do">&nbsp;&nbsp;사업자 정보 관리</a></li>
						<li><a href="#">&nbsp;&nbsp;상품 문의 내역</a></li>
						<li><a href="#">&nbsp;&nbsp;판매 내역</a></li>
						<li><a href="${contextPath}/cart/myCartList.do">&nbsp;&nbsp;장바구니</a></li>
						<li><a href="#">&nbsp;&nbsp;스케줄 관리</a></li>
						<li><a href="${contextPath}/mypage/comGoodsInfo.do">&nbsp;&nbsp;My 상품 조회</a></li>
						<li><a href="#">&nbsp;&nbsp;My 게시글 조회</a></li>
						<li><a href="#">&nbsp;&nbsp;회원 탈퇴</a></li>
					</ul>
					</c:when>
				</c:choose>
				<c:if test="${isLogOn == true and memberInfo.status =='관리자' }">  
	   	   			<ul>
	   	   				<li><a href="#">&nbsp;&nbsp;등록 회원 조회</a></li>
						<li><a href="#">&nbsp;&nbsp;등록 사업체 조회</a></li>
						<li><a href="#">&nbsp;&nbsp;상품 조회</a></li>
						<li><a href="#">&nbsp;&nbsp;문의 내역</a></li>
						<li><a href="#">&nbsp;&nbsp;신고 내역</a></li>
						<li><a href="#">&nbsp;&nbsp;게시판 관리</a></li>
						<li><a href="#">&nbsp;&nbsp;전체 주문 조회</a></li>
						<li><a href="#">&nbsp;&nbsp;매출 관리</a></li>
						<li><a href="#">&nbsp;&nbsp;이벤트 관리</a></li>
						<li><a href="#">&nbsp;&nbsp;관리자 게시물 등록</a></li>
					</ul>	
	    		</c:if> 
			</li>
		</ul>
	</div>
	<div id="suggest">
        <div id="suggestList"></div>
	</div>
</body>
</html>