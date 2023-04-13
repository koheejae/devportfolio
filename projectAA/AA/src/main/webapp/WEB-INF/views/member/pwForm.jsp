<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" isELIgnored="false"%>

<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<script>

   </script>
   <script>
   $(document).ready(function() {
	   $('#findPwdForm').submit(function(event) {
	       // 기본 이벤트인 form 전송을 막습니다.
	       event.preventDefault();

	       // form 데이터를 가져와서 JSON 형태로 변환합니다.
	       var formData = $('#findPwdForm').serialize();

	       // 이미 Ajax 요청이 보내진 상태라면 요청을 중지합니다.
	       if ($(this).data('requestRunning')) {
	           return;
	       }

	       // AJAX 요청을 보냅니다.
	       $.ajax({
	           type: 'POST',
	           url: '${contextPath}/member/findPwd.do',
	           data: formData,
	           beforeSend: function() {
	               // Ajax 요청이 보내지기 전에 data-request-running 속성을 true로 설정하여
	               // 요청이 보내지는 중임을 나타냅니다.
	               $('#findPwdForm').data('requestRunning', true);
	           },
	           success: function(result) {
	               // pwd 속성이 존재하는 경우
	               if (result != null && result != '') {
	                   $('#pwdformouttop').text("찾으시는 비밀번호는 '" + result + "' 입니다.");
	               }
	               // pwd 속성이 존재하지 않는 경우
	               else {
	                   $('#pwdformouttop').text("일치하는 정보가 존재하지 않습니다.");
	               }
	           },
	           error: function() {
	               alert('오류가 발생했습니다.');
	           },
	           complete: function() {
	               // Ajax 요청이 완료된 후에 data-request-running 속성을 false로 설정하여
	               // 다음 요청이 보내질 수 있도록 합니다.
	               $('#findPwdForm').data('requestRunning', false);
	           }
	       });
	   });
	});

   </script>
<script type="text/javascript">


function mail_change(){
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
var Checked = 0;
function sendEmail() {
    

		if($("#email2").val() == 9){
			var email1 = $("#email1").val(); // 이메일1 입력값
		    var email2 = $("#email3").val(); // 이메일3 입력값
		    var email = email1 + "@" + email2; //이메일 1과 2를 중간에 "@" 를 더해 이메일로 가능
		}else{
			var email1 = $("#email1").val(); // 이메일1 입력값
		    var email2 = $("#email2").val(); // 이메일2 입력값
		    var email = email1 + "@" + email2; //이메일 1과 2를 중간에 "@" 를 더해 이메일로 가능
	}
	
    var emailCheck = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
    console.log(email);
    
    if (!emailCheck.test(email)) {
      alert("이메일 형식에 맞추어 작성하세요");
    } else {
      $.ajax({
        url: "mailSender.do",
        type: "get",
        data: {'email': email},
        success: function(rnum) {
          alert("기입하신 이메일로 인증번호를 전송했습니다.");
          $("#codeInput").attr("disabled", false); // 인증번호 입력란 활성화
          code = rnum;
        },
        error: function () {
          alert("전송에 실패했습니다. 다시 시도해주세요.");
        }
      });
    }
    
    $("#codeInput").blur(function() {
      console.log(code);
      if (code == $("#codeInput").val()) { // 인증번호가 일치할 경우
        alert("인증되었습니다.");
      email = true;
      var email = $("#email1").val() + "@" + $("#email2").val();
      $("#email").val(email);

        Checked=1;
      } else {
        alert("인증번호를 다시 입력해주세요.");
        email = false;
      }
    });
  }
function fn_check(obj) {
    if(Checked==0){
      alert('이메일 인증은 필수사항입니다.');
   } else {
      $(obj).submit();
   } 
}

</script>

<style>
.pwd_find_form {
   width: 475px;
   background: rgb(248, 248, 248);
   text-align: center;
   padding: 50px;
   margin-left: 180px;
}

.p1 {
   font-size: 1.5em;
   color: rgb(102, 102, 102);
   font-weight: bold;
   margin-bottom: 20px;
}

.p2 {
   font-size: 1em;
   color: rgb(102, 102, 102);
   margin-bottom: 20px;
}

.pwd {
   position:relative;
   left:10px;
   width: 373px;
   height: 40px;
   margin: 10px 40px;
   border: solid 1px #E2E2E2;
   color: #6a6a6a;
   display: block;
   text-align: center;
}

.email1, .email2, .email3 {
   width: 120px;
   height: 40px;
   border: solid 1px #E2E2E2;
   color: #6a6a6a;
   text-align: center;
}
 
.seamil {
   width: 250px;
   height: 40px;
   background-color: #868e96;
   margin-top: 10px;
   margin-left:10px;
   margin-right:7px;
   color: white;
   border: none;
   font-weight: bold;

}
.seamil2 {
   width: 250px;
   height: 40px;
   background-color: rgb(255, 215, 0);
   margin-top: 30px;
   color: white;
   border: none;
   font-weight: bold;
} 
   
.putNum {    
   width: 195px;
   height: 40px; 
   border: solid 1px #E2E2E2;
   magin: 10px 0px;
   margin-top: 20px;
   color: #6a6a6a;
   margin-left:8px;
   text-align: center;
}

.send {
   width: 50px;
   height: 40px;
   background-color: rgb(255, 215, 0);
   color: white;
   border: none;
   font-weight: bold;
   margin-top: 20px;
}


#findPwdForm{
  margin-left:180px;
}
#nana {
   margin-top: 15px;
   font-size: 0.75em;
}

input[disabled] {
  background-color: #fff;
}
a:hover {color:(255,215,0);}
</style>
              
</head>
<body>
   <div class="middle">
      <img width="600px" height="200px" class="logo" alt="AA"
         src="${contextPath}/resources/image/loginForm.png">
      <form id="findPwdForm" method="post" action="${contextPath}/member/findPwd.do" name="join">
         <div class="pwd_find_form" title="flex-direction:column">
            
            <h4 class="p1">비밀번호 찾기</h4>
            <h4 id="pwdformouttop" name="pwdformouttop" class="p2">비밀번호는 가입시 입력한 아이디와 이메일로 찾을 수 있습니다.</h4><br>
            <tr>
              <td> <input type="text" placeholder="&nbsp&nbsp아이디를 입력하세요." name="id" id="id" class="pwd"></td>
              <td> <input  type="text" name="email1" class="email1" id="email1" onfocus="this.value='';"/>&nbsp;@ 
               <td><input type="text" name="email3" id="email3" class="email3" value="" disabled="disabled" />
               <input  type="hidden" name="email" class="email" id="email" value=""/></td>
               <td><select name="email2" id="email2" class="email2" onchange="mail_change()"style="width:100px;height:35px;border-radius: 5px;">
                           <option value="">도메인 선택</option>
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
                     </tr>
               <input type="button" value="이메일로 인증번호 보내기" class="seamil" id="mail-Check-Btn" onclick="sendEmail()">
               <input type="text" placeholder="&nbsp&nbsp인증번호를 입력해주세요" class="putNum" id="codeInput" disabled="disabled">
               <input type="button" value="인증" class="send"><br>

               <input type="button"  value="비밀번호 찾기" class="seamil2" onclick="fn_check(this.form),send_btn();" id="send"><br><br>
               
               <!-- <input type="text" placeholder="&nbsp&nbsp인증번호를 입력해주세요" class="putNum">
               <input type="button" value="인증"class="send"><br> -->
               <div id="nana">
               <a href="${contextPath}/member/selectJoinMember.do">회원가입</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;<a href="${contextPath}/member/idForm.do">아이디 찾기</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;<a href="${contextPath}/member/loginForm.do">로그인</a>
               </div>
         </div>
      </form>
   </div>
</body>
</html>