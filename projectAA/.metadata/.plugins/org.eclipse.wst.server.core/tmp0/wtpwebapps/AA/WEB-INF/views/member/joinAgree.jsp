<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="${contextPath}/resources/jquery/tabs.js" type="text/javascript"></script>
<script>
	//체크박스 모두 동의
	 $(document).ready(function() {
	      $("#all_agree").click(function() { //ID가 "all_agree"인 요소를 클릭하면 실행되는 함수
	         if($("#all_agree").is(":checked")) $("input[name=cbox]").prop("checked", true);
	         else $("input[name=cbox]").prop("checked", false);
	      });//"all_agree" 체크박스가 체크된 경우, 이름이 "cbox"인 모든 체크박스를 체크.
          //"all_agree" 체크박스가 체크되지 않은 경우, 이름이 "cbox"인 모든 체크박스를 체크해제.
	   
	      $("input[name=cbox]").click(function() {
	         var total = $("input[name=cbox]").length;
	         var checked = $("input[name=cbox]:checked").length;
	         //  name=cbox 인 체크박스의 개수를 total 변수에 저장.
	         //  name=cbox 인 체크박스중 체크된 cbox 개수를 checked 변수에 저장.
	   
	         if(total != checked) $("#all_agree").prop("checked", false);
	         else $("#all_agree").prop("checked", true); 
	      });
	   });
	
	//체크박스 동의 했는지 안했는지
	function write_check(){
	    if(document.getElementById("all_agree").checked == false) {// "all_agree" 체크 여부를 확인합니다.
	    	alert("필수 약관에 동의해주세요.");//"all_agree가 체크되지 않았을시 경고창 띄움
	    	e.eventPrevent;
	    } else {
	    	location.href="${contextPath}/member/memberForm.do";  //체크되어 있을시 memberForm 으로 경로설정 
	    }
	}
	
	function write_check2(){
	    if(document.getElementById("all_agree").checked == false) {
	    	alert("필수 약관에 동의해주세요.");
	    	e.eventPrevent;
	    } else {
	    	location.href="${contextPath}/member/companyForm.do";
	    }
	}
</script>
   <%
   String url = request.getQueryString();//URL에서 특정 값을 추출 member or company 
   String result = url.substring(url.lastIndexOf("=")+1);//url 문자열에서 '=' 문자 뒤에 위치하는 값만 추출.

   %>   
<style>
/* joinAgree 약관 동의 */
.memberForm_02 {
   text-align: left;
   width: 450px;
   padding: 50px 70px;
   font-size: 0.75em;
   background-color: rgb(248, 248, 248);
   margin-left: 355px;
}
.check {
   margin: 10px 0px;
}
.check input span {
   text-align: left;
}
.btn_2 {
   margin:20px 20px;

   text-align: center;
}
.btn_2 a input[type=button], .btn_submit3 {
   width: 200px;
   height: 40px;
   font-weight: bold;
   border: 0px;
   background-color: rgb(230, 230, 230);   
}
button:disabled {
  pointer-events: none;
  opacity: .40;

} 
.btn_2 .sibazzz {
  position:relative;
  
  top:3px; 
}


</style>
</head>
<body>
<div>
   <img class="logo" alt="booktopia" src="${contextPath}/resources/image/loginForm.png">
   <div class="memberForm_02" onsubmit="return CheckForm(this)" id="terms_form">
      <textarea style="text-align: left;" rows="10" cols="63">
1) 회사는 텍스트, 이미지, 음성 등의 개인정보를 수집 및 이용할 수 있습니다. 회사가 수집하는 정보 및 보유기간에 대한 상세한 내용은 아래 표와 같습니다. 

2) 수집한 개인정보는 법령에 따른 개인정보 이용·보유기간 또는 정보주체로부터 개인정보를 수집 시에 동의 받은 개인정보 이용·보유기간 내에서 처리 및 보관합니다.

3) 회사는 전자상거래 등에서의 소비자보호에 관한 법률, 국세기본법, 전자금융거래법 등 관련 법령에 따라 주민등록번호 및 은행 계좌번호의 수집∙보관이 불가피한 경우에는 회원에게 사전 고지하여 정보를 수집할 수 있습니다.

4) 회사는 회원의 기본적 인권을 침해할 우려가 있는 민감한 정보(인종 및 민족, 사상 및 신조, 출신지 및 본적지, 정치적 성향, 범죄기록, 건강 상태 등)는 회원의 동의 또는 법령의 규정에 의한 경우 이외에는 수집하지 않습니다.

 

◾️ 서비스 이용 시 수집되는 정보

분류   유형   수집∙이용목적   수집∙이용항목
회원 정보
회원 식별
(회원가입)   - 회원의 식별 및 성인인증
- 회원서비스 제공
- 서비스 이용에 대한 공지
- 서비스 이용에 대한 상담·민원처리
- 부정이용 확인∙방지관리   
[공통]
고객센터 상담 서비스 이용 기록(음성 녹취)
[구매 회원]
이메일, 비밀번호, 휴대폰 번호, 이름, 생년월일, 성별, 외국인등록번호, CI, DI, 서비스 관련 선택 정보(주소)
[개인 판매 회원]
주민등록번호(부가가치세법 제 32조에 따른 세금계산서 발행), 계좌번호, 은행명, 프로필 관련 선택 정보(경력·이력 사항, 학력 사항, 자격증 및 증명서 자료 등)
[기업 판매 회원]
기업형태, 회사명, 사업자등록정보(사업자번호, 사업자유형, 대표자명, 업태, 종목, 사업장주소, 세금계산서 이메일, 은행계좌 정보, 통장사본), 프로필 관련 선택 정보(경력·이력 사항, 학력 사항, 자격증 및 증명서 자료 등)
주문/결제   
- 주문 상품의 결제 및 환불
- 배송/계약사항 및 주문내역 안내 등 고지
- 부정이용 관리∙방지
[결제수단 선택에 따른 수집]
신용카드 : 카드사명, 카드번호, 유효기간
휴대폰 : 휴대폰 번호, 통신사명
계좌이체 : 은행명, 계좌번호
무통장입금 : 은행명, 입금자명
현금영수증발급정보 : 휴대폰 번호,현금영수증카드정보,주민(사업자) 번호
배송   
수취인정보-성명, 연락처, 주소
취소/환불   
예금주 성명, 은행명, 계좌번호
서비스이용 기록   - 서비스 이용 기록 통계 분석 등 품질 관리
- 소비자보호를 위한 법적 의무 준수
- 부정이용 확인∙방지관리
- 회원 간 분쟁 조정
- 상품(경품) 발송을 위한 발송정보 확인   
쿠키, 서비스 이용기록(방문일시, IP, 불량 이용 기록 등), 기기정보(고유기기식별값, OS버전)
IP주소, 쿠키, 접속일시, 모바일 기기정보(UDID, 광고식별자 등), 메시지 수·발신 내역, 안심번호 서비스 이용 기록(음성 녹취), 기타 서비스 이용 기록
추가   정산   세금계산서 발행   
업태, 종목, 전자세금계산서 발급용 이메일, 사업장 혹은 담당자 연락처
 

◾️ 개인정보의 보유 및 이용기간

수집된 개인정보는 원칙적으로 개인정보의 수집 및 이용목적이 달성되면 지체 없이 파기합니다.
다만, 회원이 개인정보 제공에 대한 동의를 철회하는 등 개인정보의 수집 및 이용목적이 달성된 경우에도, 관계법령의 규정과 회사의 운영 정책에 의하여 보존할 필요가 있는 경우 일정한 기간 동안 회원 개인정보를 보관합니다.
이 경우 회사는 해당 정보를 아래의 보존 이유에 따른 목적과 기간 내에서만 보관할 수 있습니다.

항목   보존 이유   보존 기간
계약 또는 청약철회 등에 관한 기록   전자상거래 등에서의 소비자보호에 관한 법률 제6조 및 시행령 제6조   5년
대금결제 및 재화 등의 공급에 관한 기록   전자상거래 등에서의 소비자보호에 관한 법률 제6조 및 시행령 제6조   5년
소비자의 불만 또는 분쟁처리에 관한 기록   전자상거래 등에서의 소비자보호에 관한 법률 제6조 및 시행령 제6조   3년
접속에 관한 기록   통신비밀보호법 제15조의2 및 시행령 제41조   3개월
부정이용 기록   부정거래 등 서비스의 원활한 운영에 지장을 주는 행위에 대한 방지 및 제재   5년
 

※ 개인정보 수집·이용 동의 거부
이용자가 상기 '필수' 동의 사항을 거부하는 경우, 서비스 가입 및 이용에 제한이 있을 수 있습니다.
      </textarea>
      <div class="check">
           <input id="agree1" type="checkbox" class="normal" name="cbox" onclick="toggleTextbox(this)" value="1">
           <label for="agree1">
             <span>(필수)개인정보 수집 및 이용 약관에 동의합니다.</span>
          </label>
      </div>
      <textarea style="text-align: left;" rows="10" cols="63">
제1조 목적

본 약관은 주식회사 Ability Assemble(이하 AA)이 제공하는 제반 서비스 이용과 관련하여 회사와 이용자의 권리, 의무 및 책임사항, 기타 필요한 사항을 규정함을 목적으로 합니다. 본 약관은 이용자가 회사가 제공하는 스마트폰, 태블릿 기기용 앱 등을 이용하는 경우에도 그 성질에 반하지 않는 한 준용됩니다.

 

제2조 용어의 정의

1. "회사"란 "회원"이 컴퓨터 등 정보통신설비를 이용하여 "용역 등"을 거래할 수 있는 가상의 영업장 및 2항의 "서비스"를 제공하는 주체로, 주식회사 크몽을 말합니다.

2. "서비스"란 "회사"에서 제공하는 제9조에 명시된 인터넷 관련 서비스를 말합니다.

3. "콘텐츠"는 "회사"가 온라인을 통해 제공하는 사전에 제작된 영상 및 기타 관련 자료 또는 정보를 포함하는 개념으로서, 정보통신망에서 사용되는 부호, 문자, 음성, 음향, 이미지 또는 영상 등 정보 형태를 불문합니다.

4. "용역 등"은 "회사"가 제공하는 "서비스"를 이용하여 "회사" 또는 "전문가"가 판매하는 재화 또는 용역 일체를 말하며, "콘텐츠"를 포함합니다. 

5. "이용자"란 본 약관에 따라 "회사"가 제공하는 "서비스"를 이용하는 "회원" 및 "비회원"을 말합니다. 

6. "회원"이란 "회사"가 제공하는 "서비스"에 “회원”가입을 하여 "이용자" 아이디(ID)를 부여받은 "이용자"로서, 계속적으로 "회사"가 제공하는 "서비스"를 이용할 수 있는 자를 말합니다. "회원"은 가입 형태에 따라 "의뢰인"과 "전문가"로 구분되며, "전문가" 회원은 인증 유형에 따라 개인 전문가와 사업자 전문가로 구분됩니다. 이는 “회사”가 정한 방식에 따라 변경될 수 있습니다. 

7. "비회원"이란 "회원"으로 가입하지 않고 "회사"가 제공하는 서비스를 이용하는 자를 말합니다. 

8. "전문가"란 본 약관에 따라 "회사"가 제공하는 "서비스"를 통하여 "용역 등"을 판매할 목적으로 "회사"가 제공하는 양식에 맞추어 게시글∙프로필을 등록하거나 "회사"와 별도의 이용계약을 체결한 "이용자"를 말합니다. 

9. "의뢰인"이란 "회사" 또는 "전문가"가 판매하는 "용역 등"을 구입할 의사를 가지고 "회사"를 이용하는 "이용자"를 말합니다. 

10. "아이디(ID)"란 "회원"의 식별과 서비스 이용을 위하여 "회원"이 입력 또는 연동한 이메일(전자우편) 주소를 말합니다.

11. "비밀번호(PASSWORD)"란 "회원"이 부여받은 "아이디"와 일치되는 "회원"임을 확인하고 비밀 보호를 위해 "회원"자신이 정한 문자, 숫자 또는 특수문자의 조합을 말합니다.

12. "닉네임"이란 "회원"의 본명을 대신하여 프로필에 노출되는 정보로, "회원" 상호 간의 식별을 위해 활용됩니다. 가입 직후 모든 "회원"에게는 임시 닉네임이 부여되며, "회사"가 정한 기준에 따라 닉네임을 수정할 수 있습니다. 

13. "직접 결제"란 "회사"를 통하지 않고 "전문가"와 "의뢰인"이 직접 결제 대금을 주고받는 행위를 말합니다.

14. 본 조에서 정의되지 않은 본 약관상 용어의 의미는 개별 약관, 운영정책 및 일반 상관례에 따릅니다. 

 

제3조 약관 등의 명시와 설명 및 개정

1 .회사는 본 약관의 내용과 상호 및 대표자 성명, 영업소 소재지 주소(소비자의 불만을 처리할 수 있는 곳의 주소를 포함), 전화번호, 모사전송번호, 이메일 주소, 사업자등록번호, 통신판매업 신고번호 등을 이용자가 쉽게 알 수 있도록 회사의 초기 서비스 화면(전면)에 게시합니다. 다만, 약관의 내용은 이용자가 연결 화면을 통하여 볼 수 있도록 할 수 있습니다.

2. 회사는 이용자가 약관에 동의하기에 앞서 약관에 정해져 있는 내용 중 청약철회, 배송책임, 환불 조건 등과 같은 중요한 내용을 이해할 수 있도록 별도의 연결 화면 또는 팝업 화면 등을 제공하여 약관에 대한 이용자의 확인을 구하여야 합니다.

3. 본 약관의 내용은 서비스의 화면에 게시하거나 기타의 방법으로 공지하고, 본 약관에 동의한 이용자 모두에게 그 효력이 발생합니다. 비회원의 경우 이용 가능한 서비스와 관련된 약관을 적용받습니다.

4. 회사는 필요한 경우 「전자상거래 등에서의 소비자보호에 관한 법률」, 「약관의 규제에 관한 법률」, 「전자문서 및 전자거래기본법」, 「전자금융거래법」, 「전자서명법」, 「정보통신망 이용촉진 및 정보보호 등에 관한 법률」, 「방문판매 등에 관한 법률」, 「소비자기본법」 등 관련 법령을 위배하지 않는 범위 내에서 본 약관을 변경할 수 있습니다. 본 약관이 변경되는 경우 회사는 변경사항을 시행일자 7일 전부터 이용자에게 서비스 공지사항에서 공지 또는 별도로 통지하는 것을 원칙으로 하며, 피치 못하게 이용자에게 불리한 내용으로 변경할 경우에는 최소한 그 시행일자 30일 전부터 제7조에 규정한 방법으로 개별적으로 알려 드리겠습니다.

5. 회사는 전 항에 따라 공지 또는 통지를 하면서 공지 또는 통지일로부터 개정약관 시행일 7일 후까지 거부 의사를 표시하지 아니하면 승인한 것으로 본다는 뜻을 명확하게 고지하였음에도 이용자의 의사표시가 없는 경우에는 변경된 약관을 승인한 것으로 봅니다.

6. 회사가 본 약관을 개정할 경우에는 그 개정약관은 그 적용일자 이후에 체결되는 계약에만 적용되고 그 이전에 이미 체결된 계약에 대해서는 개정 전의 약관조항이 그대로 적용됩니다. 다만 이미 계약을 체결한 이용자가 개정약관 조항의 적용을 받기를 원하는 뜻을 제3항에 의한 개정약관의 공지 기간 내에 회사에 송신하여 회사의 동의를 받은 경우에는 개정약관 조항이 적용됩니다.

7. 이용자는 개정약관에 동의하지 않을 권리가 있으며 개정약관에 동의하지 않을 경우 개정약관의 적용을 받는 서비스의 이용이 불가합니다. 이용자는 이용을 중단하고 이용계약의 해지를 선택할 수 있습니다.

8. 본 약관은 이용자가 본 약관에 동의한 날로부터 이용계약의 해지 시까지 적용하는 것을 원칙으로 합니다. 단, 본 약관의 일부 조항은 이용계약의 해지 후에도 유효하게 적용될 수 있습니다.

9. 본 약관 또는 관련 운영정책에서 정하지 아니한 사항 및 해석에 관하여는 약관의 규제 등에 관한 법률 및 기타 서비스와 관련된 관계법령 또는 상관례에 따릅니다.

 

제2장 이용계약 및 정보보호
제4조 회원가입

1. 회원으로 가입하고자 하는 이용자가 회사가 정한 가입 양식에 정해진 사항을 기입한 후 본 약관 및 개인정보수집∙이용동의서 등 회원의 동의가 필요한 사항에 대하여 동의한다는 의사표시를 하면, 회원과 회사 사이에 이용계약이 체결됩니다. 

2. 실명 기준으로 1인 당 1개의 계정을 사용하여 회원가입하는 것을 원칙으로 합니다.

 

제5조 회원가입 제한 등

1. 회사는 아래 각 호의 경우에는 회원가입을 승낙하지 않거나 제13조에 따른 제재 또는 사후적으로 이용계약을 해지할 수 있습니다.

1) 타인의 명의나 이메일 주소 등 타인의 개인정보를 이용한 경우
2) 회사로부터 서비스 이용정지 조치 등 제재를 받은 자가 그 조치 기간에 서비스 이용계약을 임의로 해지하고 재가입하고자 하는 경우
3) 회사가 이용계약을 해지한 전(前) 회원이 재이용 신청을 하는 경우
4) 회원가입 시 양식에 기입한 내용에 허위, 기재누락, 오기가 있는 경우
5) 부정한 용도로 서비스를 이용하고자 하는 경우
6) 법령 위반 또는 본 약관에 위배되거나 기타 부당한 회원가입임이 회사의 합리적인 판단에 비추어 인정되는 경우
7) 만 14세 미만인 자가 법정대리인의 동의 없이 가입한 것으로 확인되는 경우
8) 이미 가입된 회원과 이름 및 주민등록번호(또는 사업자등록번호, 법인등록번호)가 동일한 경우

2. 회사는 아래 각 호의 경우에는 회원가입의 승낙을 유보하거나 이용을 유보할 수 있습니다. 이용을 유보할 경우 회사는 이용 유보의 사유와 이용 가능 시기, 이용에 필요한 자료 등 관련 사항을 서비스 화면에 게시하거나 제7조에 따라 개별 통지합니다.

1) 서비스 제공 설비 용량에 여유가 없는 경우
2) 서비스 제공을 위한 기술적인 부분에 문제가 있다고 판단되는 경우
3) 기타 회사가 재정적, 기술적으로 필요하다고 인정하는 경우

3. 회원은 회원가입 시 등록한 사항에 변경이 있는 경우 상당한 기간 이내에 회사에 회원정보를 수정하는 등의 방법으로 그 변경사항을 알려야 하며, 변경된 회원정보를 회사에 알리지 않아 발생하는 손해에 대한 책임은 회원에게 있습니다.

4. 전문가로 인증받은 회원이 휴대폰 및 실명 정보를 변경할 경우, 전문가 인증 정보도 수정하여야 합니다. 

5. 변경된 정보는 회원정보에 즉시 반영되지 않을 수 있으며, 회원은 이를 인지하고 이로 인해 발생될 수 있는 모든 불이익에 대해 회사의 고의 또는 중과실이 없는 한 회사에 책임을 묻지 않습니다.

 

제6조 회원의 아이디 및 비밀번호에 대한 의무 

1. 아이디와 비밀번호에 관한 관리 책임은 회원에게 있습니다.

2. 회원은 자신의 아이디 및 비밀번호를 제3자에 이용하게 해서는 안 됩니다. 

3. 회원이 자신의 아이디 및 비밀번호를 도난당하거나 제3자가 사용하고 있음을 인지한 경우에는 바로 회사에 통보하고 회사의 안내 또는 조치가 있는 경우에는 그에 따라야 하며, 회사의 안내 또는 조치를 따르지 않음으로써 발생하는 손해에 대한 책임은 회원에게 있습니다.

 

제7조 이용자에 대한 통지

1. 회사가 이용자에 대한 통지를 하는 경우 본 약관에 별도 규정이 없는 한 이용자가 제공한 이메일 주소, (휴대)전화번호, 크몽 안내, 배너, 문자메시지, 알림톡, 고객센터 게시글 등 서비스 내 각종 통지 수단으로 할 수 있습니다.

2. 회사는 이용자의 권리에 중대한 영향을 미치지 않는 사항에 대해서는 7일 이상 회사가 제공하는 서비스에 공지함으로써 제1항의 통지에 갈음할 수 있습니다.

 

제8조 개인정보보호

1. 회사는 서비스 제공을 위하여 이용자의 개인정보를 수집할 수 있으며, 이 경우 필요한 최소한의 범위 내에서 개인정보를 수집합니다.

2. 회사는 이용자의 개인정보 보호를 위하여 [개인정보처리방침]을 수립하고, [개인정보처리방침] 및 개인정보 보호법, 정보통신망 이용촉진 및 정보보호 등에 관한 법률(이하 ‘정보통신망법’) 등 관계 법령에 따라 개인정보를 보호하기 위하여 노력합니다. 개인정보 보호와 관련한 상세한 사항은 [개인정보처리방침]을 참고하시기 바랍니다.

 

제3장 서비스 이용
제9조 서비스의 제공 및 변경

1. 회사는 이용자에게 아래와 같은 서비스를 제공합니다. 

1) 중개서비스: 회사가 전문가와 의뢰인 간에 용역 등을 거래할 수 있는 온라인 장소를 제공하는 데에 수반되는 서비스 및 부가서비스 일체를 말합니다.
2) 엔터프라이즈서비스: 회사가 기업 의뢰인의 요청사항 및 프로젝트의 종류에 따라 무형 서비스를 제공하는 전문가를 직접 추천하는 서비스 및 부가 서비스 일체를 말합니다.
3) 콘텐츠서비스: 회사가 회원 상호 간에 전자책·VOD 등의 제작된 콘텐츠를 거래할 수 있도록 제공하는 서비스 및 부가서비스 일체를 말합니다.
4) 기타 회사가 정하는 업무

2. 전항의 서비스에 대하여 전문가가 부담하는 판매 수수료는 서비스의 종류, 전문가 카테고리별로 다르게 책정될 수 있습니다.

3. 회사는 용역 등의 기술적 사양의 변경 등의 경우에는 장차 체결되는 계약에 의해 제공할 용역 등의 내용을 변경 또는 종료할 수 있습니다. 이 경우에는 변경된 용역 등의 내용을 현재의 내용을 게시한 곳에 공지하거나, 그 제공을 즉시 중단합니다.

4. 회사가 제공하기로 이용자와 계약을 체결한 서비스의 내용을 용역 등의 기술적 사양 등의 사유로 변경할 경우에는 그 사유를 제7조의 방법으로 사전에 공지하며, 서비스의 변경이 이용자에게 중대한 영향을 미치는 경우 이용자의 이메일 주소로 메일을 발송하거나 휴대전화번호로 문자메시지를 전송하는 방법으로 개별적으로 공지합니다.

5. 전항의 경우 유상으로 제공한 서비스에 대하여 회사는 이로 인하여 이용자가 입은 손해를 배상합니다. 다만, 회사가 고의 또는 과실이 없음을 입증하는 경우에는 그러하지 아니하며, 무상으로 제공한 서비스에 대하여도 그러하지 않습니다. 

 

제10조 서비스 중단

1. 회사는 서비스의 제공과 관련한 회사의 정책 변경, 서비스의 기술적 사양의 변경 필요성이 있는 경우 또는 다음 각호의 사유를 포함한 기타 상당한 사유가 있는 경우에는 서비스의 전부 또는 일부의 내용을 중단할 수 있습니다.

1) 서비스용 설비의 유지·보수 등을 위한 정기 또는 임시 점검의 경우
2) 정전, 제반 설비의 장애 또는 이용량의 폭주 등으로 정상적인 서비스 이용에 지장이 있는 경우
3) 관계사와의 계약 종료, 정부의 명령/규제 등 회사의 제반 사정으로 서비스의 전부 또는 일부를 유지할 수 없는 경우
4) 기타 천재지변, 국가비상사태 등 불가항력적 사유가 있는 경우

2. 이 경우 중단되는 서비스의 내용은 제7조의 방법으로 사전에 공지하며, 서비스의 변경이 이용자에게 중대한 영향을 미치는 경우 제7조의 방법으로 개별적으로 공지합니다. 다만, 회사가 예측할 수 없거나 통제할 수 없는 사유(회사의 과실이 없는 디스크 내지 서버 장애, 시스템 다운 등)로 인해 사전 통지 내지 공지가 불가능한 경우에는 사후에 공지할 수 있습니다.

3. 회사는 제1항의 사유로 서비스가 중단되는 경우 최대한 빠른 시일 내에 서비스를 재개하도록 노력하겠습니다.

 

제11조 회사의 의무

1. 회사는 법령과 본 약관이 금지하거나 공서양속에 반하는 행위를 하지 않으며 본 약관이 정하는 바에 따라 지속적이고, 안정적으로 서비스를 제공하는 데 최선을 다하여야 합니다.

2. 회사는 이용자가 안전하게 인터넷 서비스를 이용할 수 있도록 이용자의 개인정보(신용정보 포함) 보호를 위한 보안 시스템을 갖추어야 합니다.

3. 회사가 용역 등에 대하여 「표시∙광고의 공정화에 관한 법률」 제3조 소정의 부당한 표시∙광고행위를 함으로써 이용자가 손해를 입은 때에는 이를 배상할 책임을 집니다.

4. 회사는 이용자가 원하지 않는 영리목적의 광고성 전자우편, 문자메시지 등을 발송하지 않습니다.

 

제12조 이용자의 의무

1. 이용자는 서비스를 이용하며 다음 각 호의 행위를 하여서는 아니 되며, 그렇지 않으면 회사는 해당 이용자에 대하여 제13조에 따른 제재를 하거나 민형사상 책임을 물을 수 있습니다.

1) 신청 또는 변경 시 허위 내용의 등록
2) 타인의 정보 도용
3) 회사가 게시한 정보의 임의변경
4) 회사가 정한 정보 이외의 정보(컴퓨터 프로그램 등) 등의 송신 또는 게시
5) 회사와 기타 제3자의 저작권 등 지식재산권에 대한 침해
6) 회사 및 기타 제3자의 명예를 손상시키거나 업무를 방해하는 행위
7) 외설 또는 폭력적인 메시지, 화상, 음성, 기타 공서양속에 반하는 정보를 서비스에 공개 또는 게시하는 행위
8) 회사의 동의 없이 영리를 목적으로 서비스를 사용하는 행위
9) 기타 법령, 선량한 풍속 기타 사회통념에 반하거나 본 약관과 제44조의 ‘약관 및 정책’을 위반하는 행위

2. 전문가는 신뢰와 협조로써 회사와 상호 발전을 도모하며, 회사의 정책에 따라 공정하고 투명한 거래를 위해 노력해야 합니다. 기타 자세한 사항은 판매/홍보 대행 약관을 참고해 주시기 바랍니다.

 

제13조 회원탈퇴 및 이용제한

1. 회원은 회사에 언제든지 탈퇴를 요청할 수 있으며 회사는 즉시 회원탈퇴를 처리합니다. 다만, 의뢰인은 모든 구매 절차와 크몽 캐시의 정산을 완료한 이후, 전문가는 모든 판매 절차와 수익금·채무의 정산을 완료한 이후에만 탈퇴 신청할 수 있습니다.

2. 회사는 이용자가 본 약관 및 회사의 서비스의 운영을 위하여 정하는 정책에 따른 의무를 위반하거나 서비스의 정상적인 운영을 방해하거나 다음 각 호에 해당하는 경우, 경고 조치하거나 사전 통보 후 이용정지 및 영구 이용정지 등으로 서비스 이용을 제한할 수 있습니다.

1) 회원에게 제5조에서 정하고 있는 가입 제한 사유가 있음이 확인된 경우
2) 회사가 제공하는 서비스를 이용하여 구입한 용역 등 또는 서비스의 대금, 기타 서비스 이용에 관련하여 회원이 부담하는 채무를 기일에 지급하지 않는 경우
3) 다른 사람의 서비스 이용을 방해하거나 그 정보를 도용하는 등 전자상거래 질서를 위협하는 경우
4) 서비스를 이용하여 법령 또는 본 약관, 페널티 정책에서 금지하거나 공서양속에 반하는 행위를 하는 경우
5) 회원 간 직접 결제 등 회사가 제공하는 서비스의 원활한 진행을 방해하는 행위를 하거나 시도한 경우
6) 회원에게 파산·금치산·한정치산·회생·파산의 결정 또는 선고, 사망, 실종선고, 해산, 부도 등 정상적 서비스 이용을 불가능하게 하거나 곤란하게 하는 사유가 발생한 경우 

3. 회사는 제2항에도 불구하고, 주민등록법을 위반한 명의도용 및 결제도용, 저작권법 및 컴퓨터프로그램보호법을 위반한 불법 프로그램의 제공 및 운영방해, 정보통신망법을 위반한 불법통신 및 해킹, 악성 프로그램의 배포, 접속 권한 초과행위 등과 같이 관련법을 위반한 경우에는 즉시 이용정지 및 영구이용정지를 하거나 이용계약을 해지할 수 있습니다.

4. 회사가 이용계약을 해지하는 경우, 회원이 제공한 연락처 정보의 오류로 인하여 회사가 해지 의사를 통지할 수 없는 경우에는 회사가 제7조의 방식을 통해 해지 의사를 통지하는 시점으로부터 3일 이후 종료됩니다. 만약 3일 이전에 권리를 회복할 사유가 발생할 경우, 회원의 권리는 소급하여 회복됩니다.

5. 회사가 이용계약을 해지하는 경우, 회사는 즉시 별도의 통지 없이 해당 회원과 관련된 매매를 취소할 수 있으며 회원이 서비스 대금을 신용카드로 결제한 경우에는 그 신용카드 매출을 취소할 수 있습니다. 다만, 회원의 보호를 위하여 필요한 경우에는 그러하지 아니합니다.

6. 회사가 이용계약을 해지하는 경우 의뢰인은 구매 절차 및 크몽 캐시의 정산 등, 전문가는 판매 절차 및 수익금·채무의 정산 등 해지를 위해 필요한 절차에 협조하여야 합니다.

7. 회사는 회원이 계속해서 1년 이상 로그인을 하지 않는 경우 회원정보의 보호를 위하여 해당 정보를 분리·보관할 수 있습니다.

8. 본 조에 따른 이용제한 제재를 받은 이용자가 이의를 제기하고자 할 경우 회사의 고객센터에 문의할 수 있습니다.

9. 이용계약 종료 후 해당 회원이 진행했던 거래에 대한 분쟁이 발생하는 경우, 이에 대한 해결 및 책임은 회원이 부담하여야 합니다. 회사는 고의 또는 과실이 없는 한 이에 대해 책임지지 않습니다.

 

제14조 저작권의 귀속 및 게시물 관련

1. 회사가 작성한 저작물에 대한 저작권 기타 지식재산권 일체는 회사에 귀속합니다.

2. 이용자는 회사가 제공하는 서비스를 이용함으로써 얻은 정보 중 회사에 지식재산권이 귀속된 정보를 회사의 사전 승낙 없이 복제, 송신, 출판, 배포, 방송 기타 방법에 의하여 영리목적으로 이용하거나 제3자에게 이용하게 하여서는 안 됩니다.

3. 회사가 이용자가 게시물을 게재할 수 있는 서비스를 제공하는 경우, 해당 게시물의 저작권은 이를 게시한 이용자에게 귀속됩니다.

4. 회사는 이용자의 게시물에 대하여 서비스 내에서 이를 노출할 필요가 있는 경우, 서비스의 개선 등을 위한 필요한 최소한의 범위에서만 저작권법 등 관련 법령의 제한에 따라 이용할 수 있습니다. 이 경우 이용자는 언제든지 고객센터를 통해 해당 게시물에 대해 삭제, 비공개 등의 조치를 요청할 수 있습니다. 부득이 이러한 범위를 넘어 이용자의 게시물을 이용하고자 할 경우 사전에 이용 목적에 대한 설명을 드린 후 동의를 얻어 이용할 수 있습니다. 

5. 이용자는 회사의 서비스를 이용해 자신이 작성∙제공한 게시물에 관해, 이를 수정∙격리∙삭제할 수 있는 권리를 포함하여, 복제권∙공연권∙공중송신권∙전시권∙배포권∙대여권∙2차적저작물작성권 등 저작재산권 일체에 대한 권리를 회사에 부여하는 것에 동의합니다. 회사와 서비스 제공에 대한 계약상 관계가 있는 제3자에 대해서도 해당 서비스 제공의 목적으로 하는 경우 동일합니다.

6. 본 약관에서 회사에 부여된 권리를 제외하고 이용자는 이용자의 게시물에 대한 모든 권리를 보유합니다. 이용자의 동의 없이 회사는 이용자의 게시물을 공개할 수 없습니다. 단, 이용자가 공유를 목적으로 배포한 게시물 또는 이용자의 동의를 얻은 게시물에 한해서는 이용자의 게시물을 이용, 전시, 배포 및 수정하는 것에 동의한 것으로 봅니다.

7. 이용자의 게시물이 법령에 위반되는 내용을 포함하는 경우, 권리자는 회사에 관련 법령이 정한 절차에 따라 해당 게시물의 게시중단 및 삭제 등을 요청할 수 있으며, 회사는 관련 법령에 따라 조치를 취할 수 있습니다. 이로 인한 분쟁 발생 시 해당 이용자는 본인의 책임과 비용으로 분쟁을 해결하며 회사를 면책시켜야 합니다.

8. 회사는 권리자의 요청이 없는 경우라도 다음 각호의 사유의 경우에는 사전통지 없이 해당 게시물에 대해 삭제 또는 임시 조치 등을 취할 수 있습니다. 

1) 법령을 위반하거나 범죄 행위에 결부된다고 인정되는 경우
2) 회사 또는 제3자의 권리를 침해한다고 인정될 만한 사유가 있는 경우 
3) 기타 회사의 정책에 위반되는 경우

 

제15조 유료서비스 관련

1. 회사는 서비스의 전부 또는 일부에 대하여 이를 유료로 제공할 수 있습니다.

2. 회사가 유료서비스를 제공하는 경우 해당 서비스의 이용요금, 납부방법, 교환, 대금 환불 등 절차에 관하여 이용자가 이해할 수 있도록 별도의 화면을 제공하여 명시합니다. 

 

제4장 통신 판매업 
제17조 구매 규정

1. 본 장의 규정 일체는 본 장에만 적용됩니다. 

2. 회원은 회사가 제공하는 서비스 이용에 있어 다음 또는 이와 유사한 방법에 의하여 용역 등을 구매하며, 회사는 회원이 구매 과정에서 다음의 각 내용을 알기 쉽게 제공하여야 합니다. 

1) 용역 등의 검색 및 선택
2) 회원의 성명, 전화번호, 전자우편주소 등의 입력
3) 전문가 정보, 용역 등의 정보, 약관 내용, 청약철회권이 제한되는 서비스 등의 비용 부담과 관련한 내용에 대한 확인
4) 본 약관에 동의하고 위 3호의 사항을 확인하거나 거부하는 표시(예, 마우스 클릭)
5) 결제방법의 선택

 

제18조 계약의 성립

1. 회원의 구매와 동시에 계약이 성립합니다.

2. 회사의 안내에는 회원의 구매계약에 대한 정보와 기타 안내 사항이 포함됩니다.

3. 단, 회사는 제17조의 구매가 다음 각 호에 해당하면 회원에게 확인을 요청하거나 구매 취소를 안내할 수 있습니다.

1) 신청 내용에 허위, 기재누락, 오기가 있는 경우
2) 기타 구매 건의 제공에 있어 회사 기술상 현저히 지장이 있다고 판단하는 경우

 

제19조 지급방법 및 구매 수수료

1. 회사에서 구매한 용역 등에 대한 대금 지급방법은 아래 방법으로 할 수 있습니다.

1) 폰뱅킹, 인터넷뱅킹 등의 각종 계좌이체
2) 선불카드, 직불카드, 신용카드 등의 각종 카드 결제
3) 무통장입금
4) 휴대폰 결제
5) 선불전자지급수단에 의한 결제
6) 할인쿠폰
7) 기타 전자적 지급 방법에 의한 대금 지급 등

2. 회원이 회사에 지불하는 용역 등에 대한 대금에는 구매 수수료가 포함됩니다. 구매 수수료는 서비스의 종류와 전문가 카테고리별로 다르게 책정될 수 있으며, 변경될 수 있습니다. 회사는 관련 사항을 서비스 화면에서 공지합니다.


제20조 수신확인통지, 구매 취소

1. 회사는 회원의 구매 후 수신확인통지를 합니다. 이 때 수신확인통지는 ‘구매가 완료되었다’는 취지를 제7조의 방법에 따라 전달합니다. 또한, 수신확인통지에는 용역 등의 예상 완료일이 포함됩니다.

2. 수신확인통지를 받은 회원은 의사표시의 불일치 등이 있는 경우에는 수신확인통지를 받은 후 즉시 구매 취소를 요청할 수 있고 회사는 용역 등 제공이 시작되기 전에 회원의 요청이 있는 경우에는 지체 없이 그 요청에 따라 처리하여야 합니다. 다만 회사가 용역 등의 작업 진행을 시작했거나 용역 등을 이미 발송한 경우에는 이미 제22조에 따라 청약철회를 처리합니다.

 

제21조 환급

회사는 회원이 구매한 용역 등을 품절 등의 사유로 인도 또는 제공을 할 수 없을 때에는 지체 없이 그 사유를 회원에게 통지하고 사전에 서비스 등의 대금을 받은 경우에는 거래를 취소하여 회원의 계정에 충전 캐시 형태로 거래 대금을 환급합니다. 이후 회원의 환불 신청 시 3영업일 이내에 결제수단으로  환급하거나 환급에 필요한 조치를 취합니다.

 

제22조 청약철회 등

1. 회사와 용역 등의 구매에 관한 계약을 체결한 회원은 「전자상거래 등에서의 소비자보호에 관한 법률」 제17조 제1항에 따라 해당 계약에 관한 청약의 철회를 할 수 있습니다. 

2. 단, 회원은 용역 등을 제공받은 경우 등 같은 법 제17조 제2항에 따라 다음 각 호에 해당하는 경우에는 반품 및 교환을 할 수 없습니다.

1) 회원에게 책임 있는 사유로 용역 등이 멸실 또는 훼손된 경우(다만, 용역 등의 내용을 확인하기 위하여 포장 등을 훼손한 경우에는 청약철회를 할 수 있습니다)
2) 회원의 사용 또는 일부 소비에 의하여 용역 등의 가치가 현저히 감소한 경우
3) 시간의 경과에 의하여 재판매가 곤란할 정도로 용역 등의 가치가 현저히 감소한 경우
4) 같은 성능을 지닌 용역 등으로 복제가 가능한 경우 그 원본인 용역 등의 포장을 훼손한 경우
5) 용역 또는 「문화산업진흥 기본법」 제2조제5호에 해당하는 디지털콘텐츠의 제공이 개시된 경우. 다만, 가분적 용역 또는 가분적 디지털콘텐츠로 구성된 계약의 경우에는 제공이 개시되지 아니한 부분에 대하여는 그러하지 않습니다.
6) 그 밖에 「전자상거래 등에서의 소비자보호에 관한 법률」에서 정하는 경우

3. 제2항 제2호 내지 제5호의 경우에 회사가 사전에 청약철회 등이 제한되는 사실을 소비자가 쉽게 알 수 있는 곳에 명기하거나 시용상품을 제공하는 등의 조치를 하지 않았다면 회원의 청약철회 등이 제한되지 않습니다.

4. 회원은 제1항 및 제2항의 규정에 불구하고 용역 등의 내용이 표시·광고 내용과 다르거나 계약 내용과 다르게 이행된 때에는 당해 용역 등을 공급받은 날부터 3개월 이내, 그 사실을 안 날 또는 알 수 있었던 날부터 30일 이내에 청약철회 등을 할 수 있습니다.

 

제23조 청약철회 등의 효과

1. 청약철회 등을 한 경우 회원은 제공받은 용역 등 일체를 반환하여야 하며, 다운로드한 것이 있는 경우 이를 삭제하여야 합니다. 

2. 회사는 회원이 청약철회 후 환불 신청한 날부터 3영업일 이내에 이미 지급받은 용역 등의 대금을 환급합니다. 이 경우 회사가 회원에게 용역 등의 환급을 지연한 때에는 그 지연 기간에 대하여 「전자상거래 등에서의 소비자보호에 관한 법률 시행령」 제21조의 3에서 정하는 지연이자율을 곱하여 산정한 지연이자를 지급합니다. 단, 회사의 귀책사유 없이 금융기관의 전산오류 내지는 마비 등 외부적 사정에 의하여 지연된 경우 회사는 그 책임을 부담하지 않습니다. 

3. 회사는 위 대금을 환급함에 있어서 회원이 신용카드 등의 결제수단으로 용역 등의 대금을 지급한 때에는 지체 없이 당해 결제수단을 제공한 사업자로 하여금 용역 등의 대금의 청구를 정지 또는 취소하도록 요청합니다.

4. 회사가 결제업자로부터 용역 등 대금을 지급받은 때에는 지체 없이 이를 결제업자에게 환급하고, 그 사실을 회원에게 통지하여야 합니다. 이 경우 대금을 환급받은 결제업자는 지체 없이 대금을 지급한 회원에게 이를 환급하거나 이에 필요한 조치를 취합니다.

5. 회사는 반환된 용역 등이 일부 사용 또는 일부 소비된 경우 그 용역 등의 사용 또는 일부 소비에 의하여 회원이 얻은 이익 또는 그 용역 등의 제공에 소요된 비용에 상당하는 금액(용역 등의 사용으로 인하여 소모성 부품의 재판매가 곤란하거나 재판매 가격이 현저히 하락하는 경우에는 당해 소모성 부품의 제공에 소요된 비용 또는 다수의 동일한 가분물로 구성된 용역 등의 경우에는 회원의 일부 소비로 인하여 소비된 부분의 제공에 소요된 비용)의 범위 내에서 회원에게 청구할 수 있습니다.

 

제24조 회사의 면책

1. 회사가 천재지변 또는 이에 준하는 불가항력으로 인하여 서비스를 제공할 수 없는 경우에는 관련 책임이 면제됩니다. 

2. 회사는 회원의 귀책사유로 인한 서비스 이용의 장애에 대하여는 책임을 지지 않습니다.

 

제5장 통신판매중개업(제9조 제1항 제1, 4호의 경우)
제25조 구매 규정

1. 본 장의 규정 일체는 본 장에만 적용됩니다. 

2. 이용자는 회사가 제공하는 서비스 이용에 있어 다음 또는 이와 유사한 방법에 의하여 용역 등을 구매하며, 회사는 회원이 구매 과정에서 다음의 각 내용을 알기 쉽게 제공하여야 합니다. 

1) 용역 등의 검색 및 선택
2) 의뢰인의 정보 입력
3) 전문가 정보, 용역 등의 정보, 약관 내용, 청약철회권이 제한되는 서비스, 배송료 등의 비용 부담과 관련한 내용에 대한 확인
4) 본 약관에 동의하고 위 3.호의 사항을 확인하거나 거부하는 표시(예, 마우스 클릭)
5) 용역 등의 구매신청
6) 결제방법의 선택

 

제26조 수신확인통지, 취소, 구매 확정
1. 회사는 의뢰인의 구매 후 수신확인통지를 합니다. 이 때 수신확인통지는 ‘구매가 완료되었다’는 취지를 제7조의 방법에 따라 전달합니다. 또한, 수신확인통지에는 용역 등의 예상 완료일이 포함됩니다.

2. 수신확인통지를 받은 의뢰인은 의사표시의 불일치 등이 있는 경우에는 수신확인통지를 받은 후 즉시 전문가에게 구매 취소를 요청할 수 있고 전문가는 작업 진행 전에 의뢰인의 요청이 있는 경우에는 지체 없이 그 요청에 따라 처리하여야 합니다.

3. 전문가가 용역 등의 작업 진행을 시작했거나 용역 등을 이미 발송한 경우, 의뢰인은 제28조에 따라 전문가에게 청약철회를 요청할 수 있습니다.

4. 의뢰인이 용역 등을 수령한 경우, 수령일로부터 7일 이내에 회사가 제공하는 기능(수정 요청, 구매 확정 기능)을 통해 수정을 요청하거나 구매 확정을 하여야 합니다. 단, 콘텐츠 서비스의 경우 그 특성상 별도의 수정 요청 기능이 제공되지 않을 수 있습니다.

5. 전항의 기한 내에 구매 확정, 반품, 기타 구매 확정하지 않을 사유에 대한 의사표시가 접수되지 않는 경우 회사는 자동으로 구매 확정 절차를 진행할 수 있습니다. 단, 의뢰인이 기한 내에 수정을 요청을 하는 경우에는 자동 구매 확정 절차가 중단됩니다.

6. 의뢰인이 구매 확정을 하거나 자동 구매 확정 절차가 진행되면 중개서비스가 종료되므로 청약철회(거래 취소), 환불, 용역 등에 대한 수정과 판매 수수료 및 구매 수수료 반환 등의 절차는 원칙적으로 불가능하며,  의뢰인은 회사에 대하여 이의를 제기할 수 없습니다. 이 경우 구매대금 환불 등의 모든 문제는 전문가와 직접 해결해야 합니다.

7. 중개서비스가 종료된 이후 회사는 이에 개입하지 않으므로, 의뢰인과 전문가 간 모든 분쟁은 거래 당사자가 직접 해결하여야 합니다.

8. 의뢰인이 구매 확정을 하거나 자동 구매 확정 절차가 진행되면 회사는 용역 등의 대금에서 판·구매 수수료를 제외한 금액을 전문가에게 전달합니다.

9. 회사는 배송과 관련하여 전문가, 의뢰인, 배송업체 등 관련 당사자 사이에 분쟁 등이 발생하는 경우에는 이에 관여하지 않으며 어떠한 책임도 부담하지 아니합니다. 이 경우 해당 분쟁 등은 관련 당사자가 직접 해결하여야 합니다.

 

제27조 지급방법 및 구매 수수료

제19조 규정을 준용합니다.

 

제28조 청약철회 등

1. 청약철회∙환불의 경우 회사가 서비스 상세페이지에서 제공하는 '취소·환불 규정'과 당사자 간 합의에 따라 결정됩니다. 

2. 의뢰인은 제1항의 규정에도 불구하고 용역 등의 내용이 표시·광고 내용과 다르거나 계약 내용과 다르게 이행된 경우에는 전문가와 합의하에 청약철회 등을 할 수 있습니다.

3. 의뢰인은 회사가 제공하는 기능(크몽메시지, 안심번호, 취소 요청 기능) 등을 통해 청약철회 요청을 할 수 있습니다.

4. 의뢰인이 3항의 방법으로 취소 요청을 하는 경우, 의사표시를 한 날에 그 효력이 발생합니다. 

5. 청약철회를 요청받은 전문가는 청약철회 가능 여부를 검토하고, 회사는 제29조에 따라 환불에 필요한 조치를 합니다. 다만 전문가는 다음 각 호의 어느 하나에 해당하는 경우 의뢰인의 청약철회 요청을 거부할 수 있습니다.

1) 회원 탈퇴한 후 환불을 요구할 경우
2) 기타 정당한 환불 사유로 판명되지 않은 경우

 

제29조 청약철회 등의 효과

1. 청약철회를 요청한 경우 의뢰인은 제공받은 용역 등 일체를 반환하여야 하며, 다운로드한 것이 있는 경우 이를 삭제하여야 합니다. 

2. 전문가가 의뢰인의 청약철회 요청을 수락한 경우, 용역 등의 대금은 의뢰인의 계정에 충전 캐시의 형태로 환급되며, 의뢰인의 환불 신청 시 회사는 3영업일 이내 결제수단으로 환급하거나 환급에 필요한 조치를 취합니다.

3. 전문가는 회사로부터 용역 등의 대금을 지급받은 때에는 그 사실을 의뢰인에게 통지하고 환급을 위한 조치를 취하여야 합니다.

4. 전문가와 회사는 반환된 용역 등과 그와 함께 제공받은 콘텐츠와 관련된 자료, 파일 등 일체가 일부 사용 또는 일부 소비된 경우 그 사용 또는 일부 소비에 의하여 의뢰인이 얻은 이익 또는 그 제공에 소요된 비용에 상당하는 금액(그 사용 또는 일부 소비로 인하여 재판매가 곤란하거나 재판매가격이 현저히 하락하는 경우에는 해당 부분의 제공에 소요된 비용 또는 다수의 동일한 가분물로 구성된 콘텐츠의 경우에는 의뢰인의 사용 또는 일부 소비된 부분의 제공에 소요된 비용)의 범위 내에서 의뢰인에게 청구할 수 있습니다.

 

제30조 의뢰인의 유의사항

1. 의뢰인은 전문가가 기재한 용역 등 관련 정보를 충분히 확인하고 구매 여부를 결정해야 합니다. 

2. 회사는 통신판매중개자로서 의뢰인과 전문가 간의 자유로운 용역 등의 거래를 위한 시스템을 운영 및 관리, 제공할 뿐이므로, 의뢰인은 용역 등을 구매하기 전에 반드시 전문가가 서비스 내에 작성한 용역 등의 상세 내용과 거래의 조건을 정확하게 확인해야 합니다. 구매하려는 용역 등의 내용과 거래의 조건을 확인하지 않고 구매하여 발생한 모든 손실과 손해는 의뢰인 본인이 부담합니다.

3. 회사는 의뢰인이 제2항을 위반한 경우에는 서비스의 일부 또는 전부를 이용 정지하거나 서비스 이용계약을 임의로 해지할 수 있으며, 이 경우 발생하는 손해에 대한 책임은 이용자가 부담합니다.

4. 의뢰인은 본 약관 및 회사가 서비스 화면에서 공지하는 내용과 이용방법을 준수하여야 하고, 이를 위반하거나 이행하지 않아서 발생하는 모든 손실과 손해에 대하여 책임을 집니다.

5. 의뢰인은 구매한 용역 등에 청약철회의 원인이 발생하면 수령한 용역 등을 임의로 사용하거나 훼손되도록 방치해서는 아니 되고, 용역 등의 임의 사용이나 보관의 미흡으로 용역 등이 훼손되었을 때에는 그에 합당한 비용을 부담하여야 합니다.

6. 의뢰인은 전문가와 용역 등의 구매 절차에서 분쟁이 발생하면 분쟁의 해결을 위하여 성실히 임해야 하며, 분쟁 해결의 불성실로 전문가와 용역 등에 손실 또는 손해가 발생하면 그에 대한 모든 책임을 부담하여야 합니다.

7. 의뢰인은 용역 등을 구매할 경우에는 본인 명의의 결제수단을 사용하여야 하고, 타인의 결제수단을 임의로 사용하여서는 아니 되며, 타인의 결제수단을 임의로 사용하여 회사, 전문가 및 해당 결제수단 소유자에게 발생하는 손실 또는 손해 등에 대한 모든 책임을 부담합니다. 단, 의뢰인 본인이 소속된 사업자 소유의 결제 수단 사용은 예외로 합니다.

8. 의뢰인은 구매대금의 결제와 관련하여 의뢰인이 입력한 정보 및 그 정보와 관련하여 발생하는 제반 문제에 대한 모든 책임을 부담합니다.

9. 의뢰인은 회사가 의뢰인의 서비스 이용 편의를 높이기 위하여 전문가 등으로부터 용역 등의 관련 정보를 제공받아 게재하거나 제3자가 제공하는 방식으로 사이트를 통하여 참조용 상품정보를 제공하는 경우에도 용역 등의 구매와 관련하여 자신의 판단과 책임으로 결정하여야 합니다. 이 경우 회사는 어떠한 경우에도 의뢰인의 거래에 대하여 책임을 부담하지 아니 합니다.

 

제31조 의뢰인의 서비스 이용

1. 회사는 의뢰인의 대금 결제 시 해당 결제수단에 대하여 정당한 사용 권한이 있는지 확인할 수 있고, 이에 대한 확인이 완료될 때까지 해당 거래의 진행을 중지하거나 해당 거래를 취소할 수 있습니다.

2. 회사는 의뢰인에게 서비스가 안전하게 제공될 수 있도록 각종 설비와 자료를 관리하고, 서비스가 제공 목적에 맞게 이용되고 있는지 확인합니다. 이 경우 의뢰인에게 이용 목적에 위반되는 부분이 있는 것으로 확인되면 사유의 소명을 요청할 수 있고, 거래 취소 등 필요한 조치를 할 수 있습니다.

3. 미성년자가 사이트를 통하여 용역 등을 구매하는 경우에 법정대리인이 해당 계약에 대하여 동의하지 아니하면, 미성년자 본인 또는 법정대리인은 그 계약을 취소할 수 있습니다.

 

제32조 금지행위

1. 전문가와 의뢰인이 회사가 제공하는 서비스를 이용하지 아니하고 직접 거래하는 행위(직접 결제)는 거래의 안전을 위하여 금지됩니다. 이 경우 직접 결제를 통하여 발생한 제반 문제에 대한 책임은 거래 당사자에게 있으며 회사는 이에 대해 어떠한 책임도 부담하지 아니 합니다.

2. 물품 판매 또는 용역 제공을 가장하여 자금을 융통하는 것과 같이 여신전문금융업법 등 법령에 따라 금지된 방법으로 비정상적인 결제 행위는 금지됩니다.

3. 실제 용역 등의 제공이 없는 등 용역 등의 실질적인 구매의사가 없는 구매행위와 회사가 제공하는 할인율 등을 이용하여 비정상적인 거래를 하는 것은 금지됩니다.

4. 회사는 이용자가 본 조의 금지행위를 하는 경우에는 해당 이용자에게 부가적으로 제공한 혜택의 일부 또는 전부의 회수, 서비스의 이용 제한, 이용계약 해지 등의 조치를 할 수 있습니다.

 

제33조 회사의 면책

1. 회사는 다음의 사항에 대해서는 책임을 지지 않습니다. 단, 회사 및 회사의 임직원, 대리인의 고의 또는 중대한 과실이 인정되는 경우에는 그러하지 아니합니다.

1) 회사는 통신판매중개자로서 의뢰인과 전문가 간 자유로운 용역 등의 거래를 위한 시스템을 운영 및 관리, 제공할 뿐이므로 의뢰인 또는 전문가를 대리하지 않으며, 이용자 사이에 성립된 거래와 관련된 책임과 이용자가 제공한 정보에 대한 책임은 해당 이용자가 직접 부담하여야 합니다.

2) 회사는 전문가가 등록한 용역 등의 내용과 거래 조건에 대해서 어떠한 보증이나 대리를 하지 않습니다. 따라서 의뢰인은 스스로 책임지고 용역 등을 구매해야 합니다.

3) 회사는 이용자 간의 모든 행위(거래 행위 포함)와 관련하여 판매의사 또는 구매의사의 존부 및 진정성, 등록 용역 등의 품질, 완전성, 안정성, 적법성 및 타인의 권리에 대한 비침해성, 의뢰인 또는 전문가가 입력하는 정보 및 그 정보를 통하여 링크된 URL에 게재된 자료의 진실성 또는 적법성 등 일체에 대하여 보증하지 아니하며, 이와 관련된 일체의 위험과 책임은 해당 당사자가 부담합니다. 다만, 허위성·위법성이 객관적으로 확인된 경우는 예외로 합니다.

4) 회사가 천재지변 또는 이에 준하는 불가항력으로 인한 서비스를 제공할 수 없는 경우에는 관련한 책임이 면제됩니다.

5) 회사는 이용자의 귀책사유로 인한 서비스 이용의 장애에 대하여는 책임을 지지 않습니다.

 


제8장 이용계약의 해지
제43조 이용계약 해지

1. 이용자가 서비스의 이용을 더 이상 원하지 않을 경우 언제든지 이용계약의 해지 신청을 할 수 있으며, 회사는 관련 법령이 정하는 바에 따라 이를 신속히 처리하도록 하겠습니다. 단, 이용자가 법령을 위반하였거나 위반하였다고 판단되는 경우, 회사 또는 다른 이용자와의 분쟁이 있는 경우에는 이용계약의 해지가 상당 기간 동안 제한될 수 있습니다.

2. 이용자는 회사 내의 모든 거래를 완료하여야만 이용계약을 해지할 수 있습니다. 

3. 본 조에 따라 해지를 한 회원은 본 약관이 정하는 회원가입 절차와 관련 조항에 따라 회원으로 다시 가입할 수 있습니다. 다만 회원이 중복 참여가 제한된 이벤트 중복 참여 등 부정한 목적으로 회원 탈퇴 후 재가입 신청하는 경우 회사는 재가입을 일정 기간 동안 제한할 수 있습니다.

4. 이용자가 이용계약을 해지할 경우 관련 법령에 따라 회사가 이용자의 정보를 일정 기간 보유하여야 하는 경우를 제외하고는 해지 즉시 이용자가 등록한 정보 및 게시물 등 모든 데이터는 삭제됩니다. 다만, 다른 이용자의 정상적 서비스 이용을 위하여 필요한 범위 내의 데이터, 법령상 회사에 보관 의무가 있는 데이터는 삭제되지 않습니다.

 

제9장 기타
제44조 연결 서비스와 피연결 서비스 간의 관계

1. 상위 서비스와 하위 서비스가 하이퍼링크(예: 하이퍼링크의 대상에는 문자, 그림 및 동화상, 각종 광고 등이 포함됨) 방식 등으로 연결된 경우, 전자를 연결 서비스(웹 사이트)이라고 하고 후자를 피연결 서비스(웹사이트)이라고 합니다.

2. 연결 서비스가 피연결 서비스가 독자적으로 제공하는 용역 등에 의하여 이용자와 행하는 거래에 대해서 보증 책임을 지지 않는다는 뜻을 연결 서비스의 초기화면 또는 연결되는 시점의 팝업화면으로 명시한 경우에는 그 거래에 대한 보증 책임을 지지 않습니다.

3. 회사의 공식 사이트 이외의 피연결 서비스에서는 회사의 본 약관과 개인정보처리방침이 적용되지 않습니다. 피연결 서비스의 서비스 이용 및 용역 등 구매에 관하여는 해당 피연결 서비스의 약관 및 개인정보처리방침을 확인하여야 하며, 그렇지 않음으로 인하여 발생한 책임은 이용자에게 있고 회사는 이에 대하여 책임을 부담하지 않습니다. 

 

제45조 개별서비스에 대한 이용 약관

1. 회사가 서비스의 제공과 관련한 별도의 서비스를 제공하게 될 경우 해당 서비스를 위한 약관 및 정책을 둘 수 있습니다. 이는 각 서비스의 개별 페이지에 유의사항의 형태로 구현될 수 있으며, 그 형태나 명칭을 불문하고 본 조에서 규정하는 ‘약관 및 정책’에 해당합니다. 

2. 회사가 전항에 따른 개별서비스의 약관 및 정책을 둘 경우 이용자가 최초로 해당 서비스를 이용할 때에 동의 절차를 거치도록 하거나 이를 이용자가 충분히 확인할 수 있도록 제시하며, 개별 서비스에 대한 이용약관이 본 약관에 우선합니다.

 

제46조 책임 제한

회사는 이용자에게 본 약관에 명시되지 않는 사항에 대한 약정이나 보증을 하지 않습니다. 단, 회사 및 회사의 임직원, 대리인의 고의 또는 중대한 과실이 인정되는 경우에는 그러하지 아니합니다.

 

제47조 손해배상

1. 회사는 회사의 고의, 과실로 인하여 회원이 손해를 입게 될 경우 본 약관 및 관련 법령에 따라 회원의 손해를 배상하겠습니다. 다만 회사는 회사의 고의, 과실 없이 발생된 아래와 같은 손해에 대해서는 책임을 부담하지 않습니다. 또한 회사는 법률상 허용되는 한도 내에서 간접 손해, 특별 손해, 결과적 손해, 징계적 손해, 및 징벌적 손해에 대한 책임을 부담하지 않습니다.

1) 천재지변 또는 이에 준하는 불가항력의 상태에서 발생한 손해
2) 이용자의 귀책사유로 서비스 이용에 장애가 발생한 경우
3) 서비스 접속 또는 이용과정에서 발생하는 개인적인 손해
4) 제3자가 불법적으로 회사의 서버에 접속하거나 서버를 이용함으로써 발생하는 손해
5) 제3자가 회사 서버에 대한 전송 또는 회사 서버로부터의 전송을 방해함으로써 발생하는 손해
6) 제3자가 악성 프로그램을 전송 또는 유포함으로써 발생하는 손해
7) 전송된 데이터의 생략, 누락, 파괴 등으로 발생한 손해, 명예훼손 등 제3자가 서비스를 이용하는 과정에서 발생된 손해
8) 제10조 제1항에 따라 이용자 또는 제3자가 입은 손해
9) 기타 회사의 고의 또는 과실이 없는 사유로 인해 발생한 손해

2. 회사는 회사의 고의, 과실이 없는 한 이용자 상호 간 또는 이용자와 제3자 상호 간에 서비스를 매개로 발생한 분쟁에 대해서는 개입할 의무가 없으며 이로 인한 손해를 배상할 책임도 없습니다.

3. 회사는 서비스 및 서비스에 게재된 정보, 자료, 사실의 신뢰도, 정확성 등에 대해서는 보증을 하지 않으며 이로 인해 발생한 이용자의 손해에 대하여는 책임을 부담하지 아니합니다.

4. 회사는 이용자가 서비스를 이용함으로써 기대되는 수익을 얻지 못하거나 서비스를 통해 얻은 자료를 이용하여 발생한 손해에 대해서는 책임을 부담하지 않습니다. 

5. 이용자가 본 약관의 규정 또는 관련 법령을 위반하여 회사에 손해가 발생한 경우 회사는 이용자에 대하여 손해배상을 청구할 수 있습니다. 이 경우 이용자는 고의, 과실이 없음을 입증하지 못하는 경우 책임을 면할 수 없습니다.

6. 회사가 천재지변 또는 이에 준하는 불가항력으로 인하여 서비스를 제공할 수 없는 경우에는 관련 책임이 면제됩니다. 

7. 회사는 이용자의 귀책사유로 인한 서비스 이용의 장애에 대하여는 책임을 지지 않습니다.

 

제48조 분쟁해결

1. 회사는 전문가와 의뢰인 간의 분쟁이 발발했음을 양 당사자 중 한 명 이상으로부터 통보를 받을 경우, 관련 법령에 따라 원만한 문제 해결을 위해 개입하거나 문제 해결에 필요하다고 판단되는 모든 조치(거래금액의 정산 및 환급 보류, 서비스 이용제한, 거래 이력의 열람 등)를 취할 수 있습니다. 이 조치는 분쟁이 해결되는 시점까지 지속할 수 있습니다. 또한 양 당사자의 합의 또는 회사의 개입을 통해 자체적으로 분쟁 해결이 어렵다고 판단되는 경우, 회사는 하기의 기관을 포함한 외부기관에 분쟁 건을 이관하거나 당사자에게 이관 신청을 안내할 수 있으며 관련 정보를 제공할 수 있습니다. 이관된 시점 이후부터는 해당 기관의 의견을 신뢰하며 이를 기준으로 분쟁 관련 업무를 처리합니다.

- 대한상사중재원 ( http://www.kcab.or.kr/ )

- 한국공정거래조정원 ( http://www.kofair.or.kr/ )

- 한국인터넷진흥원 전자문서·전자거래분쟁조정위원회 ( http://www.ecmc.or.kr/ )

- 한국콘텐츠진흥원 콘텐츠분쟁조정위원회 ( https://www.kcdrc.kr/ )

- 한국소비자원 ( https://www.kca.go.kr/ )

 

제48조 준거법 및 재판권

1. 본 약관은 대한민국 법령에 의하여 규정되고 이행됩니다. 

2. 회사는 이용자와의 분쟁이 발생할 경우 이의 해결을 위해 성실히 협의할 것이나, 그럼에도 불구하고 분쟁이 해소되지 않으면 이에 관한 소송은 회사의 본사 소재지를 관할하는 법원을 합의 관할법원으로 정합니다. 

 

 

 

부칙

서비스 이용약관 버전번호: v.20230228
서비스 이용약관 공고일자: 20230228
서비스 이용약관 적용일자: 20230401
      </textarea> 
      <div class="check">
           <input id="agree2" type="checkbox" class="normal" name="cbox" onclick="toggleTextbox(this)" value="2"> 
           <label for="agree2">
             <span>(필수)서비스 이용 약관 및 개인정보 처리 방침에 동의합니다.</span>
          </label>
      </div> 
      <div class="check">
           <input id="all_agree" type="checkbox" onclick="toggleTextbox(this)">
           <label for="all_agree">
             <span>모두 동의합니다.</span> 
          </label> 
      </div> 
      <%if(result.equals("member")){ %>  
 
      <div class="btn_2">
      
         <a href="${contextPath}/member/selectJoinMember.do">
            <input type="button" value="이전 단계">        
         </a>
           <input style="background-color: rgb(245, 215, 0); color: #fff; z-index: 200;" type="button" id="target_btn" value="다음 단계" class="btn_submit3" onclick="write_check()"/> 
          
      </div>
      
       
      <%}else if(result.equals("company")){ %>
      <div class="btn_2">
         <a href="${contextPath}/member/selectJoinMember.do">
            <input type="button" value="이전 단계">      
         </a>
            <input style="background-color: rgb(245, 215, 0); color: #fff;" type="button" id="target_btn" value="다음 단계" class="btn_submit3" onclick="write_check2()"/>
      </div>
      <%} %>
   </div>
</div>
</body>
</html>