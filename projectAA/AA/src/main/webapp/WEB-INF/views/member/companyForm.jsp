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
<style>
.member{    
   width: 850px; 
   margin-left:330px;
    text-align: left;   
}
.member .field th {
   width: 60px; 
   text-align:center;
}  
.member .field td {
   width:200px;
  
}
.member .field input[type=text],input[type=tel],input[type=email],input[type=password]{
   width:180px;
   height:30px;
   border-radius: 5px;
   margin : 7px 0px;
   padding-left:10px;
}
.member input[type=button] {
   width: 100px;
   height:40px;
   border: 1px solid rgb(248, 248, 248);
   border-radius: 5px;
   background-color: rgb(245, 215, 0);
   color:#fff;   
}
.member input[type=submit]{
   width: 250px; height: 60px;
   border: 1px solid rgb(248, 248, 248);
   border-radius: 5px;
   background-color: rgb(245, 215, 0);
   color:#fff;
   font-size: 1.1em;
   font-weight: bold;
}
.member input:focus {
    border: 1px solid rgb(245, 215, 0);
}
.bottom1 {
 background-color: rgb(245, 215, 0);
 font-size:1.1em;
 font-weight: bold;
   width: 110px; height: 45px;
   border: none;
   color:White;
  position:relative;
  left:530px;
  top:30px;
  border-radius: 5px;
}       
.bottom2 { 
   background-color:#C4C4C4;
 font-size:1.1em;
 font-weight: bold;  
   width: 110px; height: 45px;
   border: none;
   color:White;
    position:relative;
  left:530px;
   top:30px;
   border-radius: 5px;
}    
.company_regist2 { 
  margin-left:10px;  
}
.checkboxz1 {
  position:relative;
  left:900px;  
  top:318px;
}
.checkboxz2 {
  position:relative;
  left:900px;  
  top:373px;
}
.hi {
   width: 350px;
   font-size:0.7em;
   overflow: hidden;
} 
span {
 color:red;
}
</style>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
function execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                document.getElementById("company_jibunAdd").value = extraAddr;

            } else {
                document.getElementById("company_jibunAdd").value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('company_zipcode').value = data.zonecode;
            document.getElementById("company_roadAdd").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("company_namujiuAdd").focus();
        }
    }).open();
}
var Checked = 0;

function fn_overlapped(){
    var _id=$("#company_member_id").val();
    if(_id==''){
       alert("ID를 입력하세요");
       return;
    }
    $.ajax({
       type:"post",
       async:false,  
       url:"${contextPath}/member/overlapped.do",
       dataType:"text",
       data: {id:_id},
       success:function (data,textStatus){
          if(data!=_id){
              alert("사용할 수 있는 ID입니다.");
              $('#btnOverlapped').prop("disabled", false);
              $('#company_member_id').prop("disabled", false);
              $('#id').val(_id);
             Checked=1;
          }else{
             alert("사용할 수 없는 ID입니다.");
          }
       },
       error:function(data,textStatus){
        //  alert("에러가 발생했습니다.");ㅣ
       },
       complete:function(data,textStatus){
        //  alert("작업을완료 했습니다");
       }
    });  //end ajax    
 }   
function fn_check() {
    //변수에 담아주기
    var id = document.getElementById("id");
    var pwd = document.getElementById("pwd");
    var name = document.getElementById("company_name");
    var nickName = document.getElementById("nickName");
    var capName = document.getElementById("capName");
    var codeInput = document.getElementById("codeInput");
    var email = document.getElementById("email");
    var tel = document.getElementById("company_phone");
    if (id.value == "") { //해당 입력값이 없을 경우
      alert("아이디 인증은 필수 항목입니다.");
      uid.focus(); //focus(): 커서가 깜빡이는 현상
      return false; // 
    };
    //비밀번호 값이 공백일때
    if (pwd.value == "") {
      alert("비밀번호는 필수 항목입니다.");  
      pwd.focus();
      return false;
    };
    //이름 값이 공백일때
    if (name.value == "") {
      alert("이름은 필수 항목입니다.");
      name.focus();
      return false;
    };
    //닉네임 값이 공백일때
    if (nickName.value == "") {
         alert("닉네임은 필수 항목입니다.");
         nickName.focus();
         return false;
       }
    //주민번호 앞자리 값이 공백일때
    if (capName.value == "") {
         alert("대표 이름은 필수 항목입니다.");
         capName.focus();
         return false;
       }
    //이메일 값이 공백일때
    if (email.value == "") {
      alert("이메일은 필수 항목입니다.");
      email.focus();
      return false;          
    }
    //인증번호 입력 값이 공백일때
    if (codeInput.value == "") {
        alert("인증번호 입력은 필수 항목입니다.");
        codeInput.focus();
        return false;          
      }
    var reg = /^[0-9]+/g; //숫자만 입력하는 정규식 - 정규식 형식으로 사이에 모든 숫자를 매칭하는 [0-9]에 부정을 뜻하는 ^ 를 붙여
                          //[^0-9] 를하면 모든 숫자를 제외한 문자만을 매칭하고발생할 모든 패턴에 대한 전체 검색을 뜻하는 플래그인 g를 붙여 만듭니다.
                                             
    if (!reg.test(tel.value)) {
      alert("휴대폰 번호는 숫자만 입력할 수 있습니다.");
      tel.focus();
      return false;
    }
    //전화번호 값이 공백일때
    if (tel.value == "") {
         alert("휴대폰 번호 항목은 필수 항목입니다.");
         tel.focus();
         return false;
       }
    else{
    //입력 값 전송
   document.join.submit();//유효성 검사 마지막 
  }}
  </script>

<!-- 이메일 체크박스 -->
<script type="text/javascript">
function email_change(){
   if(document.join.email2.options[document.join.email2.selectedIndex].value == '도메인을 선택하세요'){
    document.join.email3.disabled = true;
    document.join.email3.value = "";
   }

   if(document.join.email2.options[document.join.email2.selectedIndex].value == '9'){
    document.join.email3.disabled = false;
    document.join.email3.value = "";
    document.join.email3.focus();
   } else{
    document.join.email3.disabled = true;
    document.join.email3.value = document.join.email2.options[document.join.email2.selectedIndex].value;
   }
   }
</script>
<script>
function sendEmail() {
   if($("#email2").val() == 9){
      var _email=$("#_email").val() + "@" + $("#email3").val();
   }else{
   var _email=$("#_email").val() + "@" + $("#email2").val();
}
    var emailCheck = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
    console.log(email);
    
    if (!emailCheck.test(_email)) {
      alert("이메일 형식에 맞추어 작성하세요");
    } else
    $.ajax({ //비동기통신 
       type:"post",
       url:"${contextPath}/member/overlappedComEmail.do", //이메일 중복 검사 
       dataType:"text",
       data: {email:_email}, // [input]에 작성한 email 비교 
       success:function (data,textStatus){
          if(data!=_email){
              alert("사용할 수 있는 email입니다.");
              $('#btnOverlapped').prop("disabled", false);
              $('#_email').prop("disabled", false);
              $('#email').val(_email);
              
           var email = $("#email").val();
           console.log(email)
              $.ajax({
                  url: "mailSender.do",   // memberController 에서 사용된 mailSender.do 실행 
                  type: "get",  // get 방식으로 호출
                  data: {'email': email}, // //[input]에 작성한 email 을 가져옴 
                  success: function(rnum) {  //난수
                    alert("기입하신 이메일로 인증번호를 전송했습니다.");
                    $("#codeInput").attr("disabled", false); // 인증번호 입력란 활성화
                    code = rnum; // code 와 난수를 비교 
                  },
                  error: function () { 
                    alert("전송에 실패했습니다. 다시 시도해주세요.");
                  }
                });
          }else{
             alert("이미 가입 된 email 입니다.");
          }
       },
       error:function(data,textStatus){
        //  alert("에러가 발생했습니다.");ㅣ
       },
       complete:function(data,textStatus){
        //  alert("작업을완료 했습니다");
       }
    });  //end ajax
    
    $("#codeInput").blur(function() {
      console.log(code);
      if (code == $("#codeInput").val()) { // 인증번호와 난수가 일치할 경우 
        alert("인증되었습니다."); //인증
        email = true; 
      } else {
        alert("인증번호를 다시 입력해주세요."); //인증 안됨 
        email = false;
      }
    });
  }

</script>
</head> 
<body>  
   <img class="logo" alt="booktopia" width="680px" height="230px" src="${contextPath}/resources/image/loginForm.png">
   <form method="post" action="${contextPath}/member/addCompany.do"  name="join">
      <table class="member">
         <tr class="field">
              <th><b>아이디</b><span> *</span></th>
              <td><input type="text" name="company_member_id" id="company_member_id" class="company_member_id"><input type="hidden" name="id"  id="id" />&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" id="btnOverlapped" value="중복확인" onClick="fn_overlapped()"></td>
          </tr>
              <tr class="field">
                  <th><b>비밀번호</b><span> *</span></th>
                  <td><input type="password" name="pwd" class="pwd" id="pwd"></td>
              </tr>
              <tr class="field">
                  <th><b>이름</b><span> *</span></th>
                  <td><input type="text" name="company_name" class="company_name" id="company_name"></td>
              </tr>
              <tr class="field"> 
                  <th><b>닉네임</b><span> *</span></th>
                  <td><input type="text" name="nickname" class="nickname" id="nickName"></td>
              </tr>
              <tr class="field" >
                  <th><b>대표 이름</b><span> *</span></th>
                  <td><input type="text" name="capName" class="capName" id="capName"></td>
              </tr> 
              <tr class="field" >
                  <th><b>사업자 등록번호</b></th>
                  <td><input type="text" name="company_Number" class="company_Number"></td>
              </tr>    
                   <tr class="field">
                  <th><b>이메일</b><span> *</span></th>
                  <td style="width:440px;"><input  type="text" name="_email" class="email" id="_email" onfocus="this.value='';"/><input  type="hidden" name="email" class="email" id="email" onfocus="this.value='';"/>&nbsp;&nbsp;@&nbsp;&nbsp;<input type="text"name="email3" id="email3" class="email3" style="width:100px;" value="" disabled/>
                   &nbsp; <select name="email2"id="email2" class="email2" onchange="email_change()" style="width:100px; height:30px; border-radius: 5px;">
                           <option value="도메인을 선택하세요">도메인 선택</option>
                           <option value="9">직접입력</option>
                           <option value="hanmail.net">hanmail.net</option> 
                           <option value="naver.com">naver.com</option>
                           <option value="yahoo.co.kr">yahoo.co.kr</option>
                           <option value="hotmail.com">hotmail.com</option>
                           <option value="paran.com">paran.com</option>
                           <option value="nate.com">nate.com</option>
                           <option value="google.com">google.com</option>
                           <option value="gmail.com">gmail.com</option>
                           <option value="empal.com">empal.com</option>
                           <option value="korea.com">korea.com</option>
                           <option value="freechal.com">freechal.com</option>
                     </select></td>
                 <td><input type="button" id="mail-Check-Btn" value="인증번호 발송" onclick="sendEmail()"></td>
              </tr>
              <tr class="field">
                 <td></td>
                 <td><input type="checkbox" id="emailsts_yn" name="emailsts_yn" checked><label for="emailsts_yn" class="hi">&nbsp;AA에서 발송하는 email을 수신합니다.</label></td>
              </tr>
                <tr class="field">
                    <th><b>인증번호입력</b></th>
               <td><input type="text" id="codeInput" size="30" placeholder="인증번호 입력" disabled="disabled">&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="인증"></td>    
              </tr>
              <tr class="field">
                  <th><b>휴대폰 번호</b><span> *</span></th>
                  <td><input type="text" name="company_phone" id="company_phone" placeholder="하이픈(-) 없이 입력하세요" class="phone"></td>
              </tr>
              <tr class="field">
                  <th><b>회사 전화번호</b></th>
                  <td><input type="text" name="company_tel" placeholder="하이픈(-) 없이 입력하세요" class="phone"></td>
              </tr>
              <tr class="field">
                 <td></td>
                 <td><input type="checkbox" id="smssts_yn" name="smssts_yn" checked><label for="smssts_yn" class="hi">&nbsp;AA에서 발송하는 SMS를 수신합니다.</label></td>
              </tr>
            <tr class="field">
            <th></th>
            <td><input type="text" id="company_zipcode" name="company_zipcode" size="15" placeholder="우편번호">&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="우편번호검색" onclick="execDaumPostcode()"></td>
              </tr>
             <tr class="field">
             <th>주소</th>
             <td><input type="text" id="company_roadAdd"  name="company_roadAdd" style="width:310px;" size="70" placeholder="도로명 주소"></td>
             </tr>
             <tr class="field">
             <th></th>
             <td style="width:470px;"><input type="text" id="company_jibunAdd" name="company_jibunAdd" style="width:310px;" size="70" placeholder="지번 주소">&nbsp;<input type="text" id="company_namujiAdd" name="company_namujiAdd" size="50" style="width:120px;" placeholder="참고항목"></td>
              </table> 
              <div class="siba" >
              <tr>
                 <td><input type="button" value="회원가입" class="bottom1" id="check" onClick="fn_check()" ></td>
                 <td><input  type="reset"  value="다시입력" class="bottom2"></td>
              </tr>
           </div>
        </form>
   
</body>
</html>