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
body {
font-family: Arial, sans-serif;
background-color: #ffffff;
}
/* Style for heading elements */
h1, h2, h3 {
font-weight: bold;
margin-top: 0;
}

h1 {
font-size: 36px;
line-height: 1.2;
}

h2 {
font-size: 30px;
line-height: 1.3;
}

h3 {
font-size: 24px; 
line-height: 1.4;
}
.memInfo{    
   width: 850px; 
   margin-left:330px;
    text-align: left;   
  
}
.memInfo .dot_line .fixed_join {
   width: 100px; 
   text-align:center;
   font-weight:bold;
}   
.memInfo .dot_line fixed_join2 {   
   width:50px;    
}  
.memInfo .dot_line input[type=text],input[type=tel],input[type=email],input[type=password]{
   width:180px;
   height:30px;
   border-radius: 5px;
   margin : 7px 0px;
   padding-left:10px;
}
.memInfo input[type=button] {
   width: 100px; 
   height:40px;
   border: 1px solid rgb(248, 248, 248);
   border-radius: 5px;
   background-color: rgb(245, 215, 0);
   color:#fff;   
}
.bottom3 {
 background-color: rgb(245, 215, 0);
 font-size:1.1em;
 font-weight: bolder;
   width: 110px; height: 45px;
   border: none;
   color:White;
  position:relative; 
  left:250px;
  top:10px;  
  border-radius: 5px;
}       
.bottom4 { 
   background-color:#C4C4C4;
 font-size:1.1em;
 font-weight: bolder;  
   width: 110px; height: 45px;
   border: none;
   color:White;
    position:relative;
  left:250px;
   top:10px;
   border-radius: 5px;
}   
</style>
<%
    session.removeAttribute("side_menu");
%>


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
                   document.getElementById("jibunAdd").value = extraAddr;

               } else {
                   document.getElementById("jibunAdd").value = '';
               }

               // 우편번호와 주소 정보를 해당 필드에 넣는다.
               document.getElementById('zipcode').value = data.zonecode;
               document.getElementById("roadAdd").value = addr;
               // 커서를 상세주소 필드로 이동한다.
               document.getElementById("namujiAdd").focus();
           }
       }).open();
   }

 function fn_modify_member_info(attribute){
      var value;
      // alert(member_id);
      // alert("mod_type:"+mod_type);
         var frm_mod_member=document.frm_mod_member;
         if (attribute == 'pwd') {
              value = frm_mod_member.pwd.value;
              // alert("member_pw:"+value);
         }else if (attribute == 'nickname') {
              value = frm_mod_member.nickname.value;
         } else if(attribute == 'tel'){     
            var tel=frm_mod_member.tel;
            var smssts_yn=frm_mod_member.smssts_yn;
            
            value_tel=frm_mod_member.tel.value;
            value_smssts_yn=frm_mod_member.smssts_yn.checked;
            value=value_tel+","+value_smssts_yn;
         }else if(attribute=='email'){
            var email=frm_mod_member.email;
            var emailsts_yn=frm_mod_member.emailsts_yn;
            
            value_email=frm_mod_member.email.value;
            value_emailsts_yn=frm_mod_member.emailsts_yn.checked;
            value=value_email+","+value_emailsts_yn;
            //alert(value);
         }else if(attribute =='address'){
            var zipcode=frm_mod_member.zipcode;
            var roadAdd=frm_mod_member.roadAdd;
            var jibunAdd=frm_mod_member.jibunAdd;
            var namujiAdd=frm_mod_member.namujiAdd;
            
            value_zipcode=zipcode.value;
            value_roadAdd=roadAdd.value;
            value_jibunAdd=jibunAdd.value;
            value_namujiAdd=namujiAdd.value;
            value=value_zipcode+","+value_roadAdd+","+value_jibunAdd+","+value_namujiAdd;
         }
         console.log(attribute);
       
         $.ajax({
            type : "post",
            async : false, //false인 경우 동기식으로 처리한다.
            url : "${contextPath}/mypage/modifyMyInfo.do",
            data : {
               attribute:attribute,
               value:value,
            },
            success : function(data, textStatus) {
               if(data.trim()=='mod_success'){
                  alert("회원 정보를 수정했습니다.");
               }else if(data.trim()=='failed'){
                  alert("다시 시도해 주세요.");   
               }
               
            },
            error : function(data, textStatus) {
               alert("에러가 발생했습니다."+data);
            },
            complete : function(data, textStatus) {
               //alert("작업을완료 했습니다");
               
            }
         }); //end ajax
   }
   </script>
</head>    
<body>     
   <form method="post" action="${contextPath}/mypage/modifyMyInfo.do" name="frm_mod_member">
   <br> 
   <h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;회원 정보 수정창</h3>
   <br><br>  
      <table class="memInfo" style="width:600px; height:500px;">  
         <tr class="dot_line">
               <td class="fixed_join">아이디</td>
               <td class="fixed_join2" style="width:100px;">
                  <input name="id" type="text" size="20" value="${memberInfo.id }" style="width:220px;" disabled/>
               </td> 
                <td> 
               </td>
            </tr>
              <tr class="dot_line">
               <td class="fixed_join">비밀번호</td>
               <td> 
                 <input name="pwd" type="password" size="20" style="width:220px;" value="${memberInfo.pwd }" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="수정하기" onClick="fn_modify_member_info('pwd')" />
               </td>      
            </tr>
              <tr class="dot_line">
               <td class="fixed_join">이름</td>
               <td>
                 <input name="name" type="text" size="20" style="width:220px;"  value="${memberInfo.name }"  disabled />
                </td>
              
            </tr>
            <tr class="dot_line">
               <td class="fixed_join">닉네임</td>
               <td> 
                 <input name="nickname" type="text" size="20" style="width:220px;" value="${memberInfo.nickname }" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="수정하기" onClick="fn_modify_member_info('nickname')" />
               </td>
            </tr>
              <tr class="dot_line">
               <td class="fixed_join">성별</td>
               <td>
                 <c:choose >
                   <c:when test="${memberInfo.gender =='F' }">
                     <input type="radio" name="gender" value="F" />
                    여성 <span style="padding-left:30px"></span>
                  <input type="radio" name="gender" value="M" checked />남성
                   </c:when>
                   <c:otherwise>
                     <input type="radio" name="gender" value="F"  checked />
                     여성 <span style="padding-left:30px"></span>
                     <input type="radio" name="gender" value="M"  />남성
                  </c:otherwise>
                  </c:choose>
               </td>
            </tr>
              <tr class="dot_line">
               <td class="fixed_join">휴대폰번호</td>
               <td> 
               <input type="text" size=10  name="tel"  style="width:320px;" value="${memberInfo.tel }"/>    
                <br>
    <c:choose>
            <c:when test="${memberInfo.smssts_yn=='true' }">
            <input type="checkbox" name="smssts_yn" value="Y" checked /> AA에서 발송하는 e-mail을 수신합니다.
            </c:when>
            <c:otherwise>
            <input type="checkbox" name="smssts_yn" value="N" /> AA에서 발송하는 e-mail을 수신합니다.
            </c:otherwise>
            </c:choose>
             </td>
                 <td style="width:120px;">
                     <input type="button" value="수정하기" onClick="fn_modify_member_info('tel')" />
                  </td>   
             </tr>
               <tr class="dot_line">
               <td class="fixed_join">이메일<br>(e-mail)</td>
               <td>
                  <input type="text" name="email" size=10  style="width:320px;" value="${memberInfo.email }" />
                <br> 
    <c:choose>
               <c:when test="${memberInfo.emailsts_yn=='true' }">
                  <input type="checkbox" name="emailsts_yn" value="Y" checked /> AA에서 발송하는 e-mail을 수신합니다.
            </c:when>
                  <c:otherwise>
                     <input type="checkbox" name="emailsts_yn" value="N" /> AA에서 발송하는 e-mail을 수신합니다.
                  </c:otherwise>
                     </c:choose>
               </td>
               <td style="width:120px;">
                 <input type="button" value="수정하기" onClick="fn_modify_member_info('email')" />
               </td>
            </tr> 
              <tr class="dot_line">
               <td class="fixed_join">주소</td>
                 <td>
                 <p> 
                    <input type="text" id="zipcode" name="zipcode" size="15" value="${memberInfo.zipcode}"  style="width:200px;" placeholder="우편번호">&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="우편번호검색" onclick="execDaumPostcode()"><br>
                  <b style="color:black;font-size:0.8em;">도로명 주소</b><input type="text" id="roadAdd"  name="roadAdd" size="50" style="width:320px;" value="${memberInfo.roadAdd }"><br><br>
                  <b style="color:black;font-size:0.8em;">지번 주소</b><input type="text" id="jibunAdd" name="jibunAdd" size="50" style="width:320px;" value="${memberInfo.jibunAdd }"><br><br>
                  <b style="color:black;font-size:0.8em;">상세 주소</b><input type="text"  id="namujiAdd" name="namujiAdd" size="50" style="width:320px;" value="${memberInfo.namujiAdd }" />
                  </p>
               </td>  
               <td style="width:120px; height:300px;">
                 <input type="button" value="수정하기" onClick="fn_modify_member_info('address')" />
               </td>
            </tr>
     </table>
           <div class="memInfo"> 
              <br><br>  
                 <input type="button"  value="수정 완료" id="check" onClick="fn_check()" class="bottom3">
               <input type="hidden" name="command"  value="modify_my_info" /> 
               <input name="btn_cancel_member" type="button"  value="수정 취소" class="bottom4" style="background-color:#C4C4C4;">


         </div>
        </form>
</body>
</html>