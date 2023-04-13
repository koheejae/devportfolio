<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<meta charset="utf-8">
<head>
<style>
.addNewGoodsForm {
   max-width: 900px;
   width: 900px;
   margin-left: 300px;
   margin-right: auto;
   padding-top: 10px;
   border-top: 5px solid rgb(255, 215, 0);
   font-size: 1em;
}
.addNewGoodsForm li{
	list-style: none;
	margin: 30px 0px;
}
.bigName {
	font-size: 1.3em;
	font-weight: bold;
	margint-right: 10px;
}
.opName {
	font-size: 1.1em;
	margin: 0px 20px;
}
.addNewGoodsForm select {
	width: 200px;
	height: 40px;
	margin-left: 20px;
}
.addNewGoodsForm input[type=text] {
	width: 600px;
	height: 40px;
	margin-left: 20px;
}
.addNewGoodsForm .image_button {
   width: 150px;
   height: 40px;
   border: 1px solid rgb(248, 248, 248);
   border-radius: 5px;
   background-color: rgb(245, 215, 0);
   color:#fff;
   font-size: 1em;
   margin-left: 20px;
}
.addNewGoodsForm .goods_button {
   width: 250px; height: 60px;
   border: 1px solid rgb(248, 248, 248);
   border-radius: 5px;
   background-color: rgb(245, 215, 0);
   color:#fff;
   font-size: 1.1em;
   font-weight: bold;
}
</style>
<script type="text/javascript">
	var cnt = 0;
	function fn_addFile() {
		if (cnt == 0) {
			$("#d_file")
					.append(
							"<br>"
									+ "<input  type='file' name='main_image' id='f_main_image' />");
		} else {
			$("#d_file")
					.append(
							"<br>"
									+ "<input  type='file' name='detail_image"+cnt+"' />");
		}

		cnt++;
	}

	function fn_add_new_goods(obj) {
		fileName = $('#f_main_image').val();
		if (fileName != null && fileName != undefined) {
			obj.submit();
		} else {
			alert("메인 이미지는 반드시 첨부해야 합니다.");
			return;
		}

	}
</script>
<script>
    function middleCategoryChange(e) {
      var business = ["선택", "디자인", "IT/프로그래밍", "영상/사진/음향", "마케팅","문서/번역", "경영자문/운영지원", "주문제작", "세무/법무/노무"];
      var nJob = ["선택", "취업/입시/노하우/직무역량"];
      var hobby = ["선택", "취미/생활"];
      var target = document.getElementById("goods_middle_category");
     
      if(e.value == "비즈니스") var show = business;
      else if(e.value == "N잡·커리어") var show = nJob;
      else if(e.value == "취미·생활") var show = hobby;
     
      target.options.length = 0;
     
      for (i in show) {
        var opt = document.createElement("option");
        opt.value = show[i];
        opt.innerHTML = show[i];
        target.appendChild(opt);
      } 
    }
    
    function subCategoryChange(e) {
      var design = ["선택", "인쇄/홍보물", "패키지/커버/로고", "웹/모바일", "브랜딩/마케팅","산업/제품디자인", "캐릭터/일러스트", "캘리그라피/폰트", "공간/건축", "패션/텍스타일", "기타"];
      var it = ["선택", "UX기획", "웹", "커머스", "모바일", "프로그램", "트렌드", "데이터", "기타"];
      var video = ["선택", "영상", "사진", "음향", "엔터테이너", "기타"];
      var marketing = ["선택", "채널 활성화", "바이럴/체험단", "업종/목적별", "최적화 노출","광고(퍼포먼스)", "PR/행사", "분석/전략", "옥외/인쇄/방송 광고", "해외 마케팅", "기타"];
      var doc = ["선택", "비즈니스 카피", "마케팅 글쓰기", "콘텐츠 글쓰기", "스토리텔링","타이핑/첨삭", "번역/통역", "기타"];
      var operate = ["선택", "사업계획", "스타트업 자문", "기업 자문", "업종별 창업","비즈니스 문서", "기타"];
      var handmade = ["선택", "인쇄/판촉물", "시공", "기타"];
      var law = ["선택", "법무", "세무/회계", "지식재산권 보호", "노무", "기타"];
      var job = ["선택", "취업/이직", "입시/자격증", "투잡/재테크", "전자책/VOD", "데이터/개발 레슨", "실무 자기개발 레슨", "디자인/영상 레슨", "기타"];
      var life = ["선택", "뷰티/운동", "댄스/뮤직", "미술/글쓰기", "공예/취미", "웨딩", "청소/수리/설치", "기타"];
      var target = document.getElementById("goods_sub_category");
     
      if(e.value == "디자인") var show = design;
      else if(e.value == "IT/프로그래밍") var show = it;
      else if(e.value == "영상/사진/음향") var show = video;
      else if(e.value == "마케팅") var show = marketing;
      else if(e.value == "문서/번역") var show = doc;
      else if(e.value == "경영자문/운영지원") var show = operate;
      else if(e.value == "주문제작") var show = handmade;
      else if(e.value == "세무/법무/노무") var show = law;
      else if(e.value == "취업/입시/노하우/직무역량") var show = job;
      else if(e.value == "취미/생활") var show = life;
     
      target.options.length = 0;
     
      for (i in show) {
        var opt = document.createElement("option");
        opt.value = show[i];
        opt.innerHTML = show[i];
        target.appendChild(opt);
      } 
    }
</script>
</head>
<body>
	<form action="${contextPath}/company/addNewGoods.do" method="post"enctype="multipart/form-data">
		<h3 style="font-size:2em;height:60px; margin-left:300px; margin-right:auto;">상품 등록</h3>
		<input name="goods_status" type="hidden" value="활성==" />
		<!-- 내용 들어 가는 곳 -->
			<ul class="addNewGoodsForm">
				<li><span class="bigName">카테고리</span>
				<select name="goods_main_category" onchange="middleCategoryChange(this)">
			      <option>선택</option>
			      <option value="비즈니스">비즈니스</option>
			      <option value="N잡·커리어">N잡·커리어</option>
			      <option value="취미·생활">취미·생활</option>
			    </select>
			    <select id="goods_middle_category" name="goods_middle_category" onchange="subCategoryChange(this)">
			      <option>선택</option>
			    </select>
			    <select id="goods_sub_category" name="goods_sub_category">
			      <option>선택</option>
			    </select></li>
				<li><span class="bigName">상품명</span>
				<input name="goods_title" type="text"/></li>
				<li><span class="bigName">업체명</span>
				<input type="text" /></li>
				<li><span class="bigName">옵션 분류</span><span class="opName">스탠다드</span> 
				<span class="bigName">가격</span>
				<input name="goods_standardPrice" type="text"/></li>
				<li><span class="bigName">옵션 설명</span></li>
				<li><textarea name="goods_standardContent" rows="10" cols="125"></textarea></li>
				<li><span class="bigName">옵션 분류</span><span class="opName"> 디럭스</span>
				<span class="bigName">가격</span>
				<input name="goods_deluxePrice" type="text" /></li>
				<li><span class="bigName">옵션 설명</span></li>
				<li><textarea name="goods_deluxeContent" rows="10" cols="125"></textarea></li>
				<li><span class="bigName">옵션 분류</span><span class="opName">프리미엄</span>
				<span class="bigName">가격</span>
				<input name="goods_premiumPrice" type="text"/></li>
				<li><span class="bigName">옵션 설명</span></li>
				<li><textarea name="goods_premiumContent" rows="10" cols="125"></textarea></li>
				<li><span class="bigName">상품 대표 이미지</span>
				<input type="button" value="파일 추가" onClick="fn_addFile()" class="image_button" />
					<div id="d_file"></div></li>
				<li><span class="bigName">상품 상세 이미지</span>
				<input type="button" value="파일 추가" onClick="fn_addFile()" class="image_button" />
					<div id="d_file"></div></li>
				<li><span class="bigName">상품 한줄 설명</span>
				<input type="text" name="goods_intro" /></li>
				<li><span class="bigName">상품 상세 설명</span></li>
				<li><textarea name="goods_content" rows="20" cols="125"></textarea></li>
				<li style="text-align: center;"><input type="button" value="상품 등록하기" onClick="fn_add_new_goods(this.form)" class="goods_button"></li>
		</ul>
	</form>
</body>
</html>