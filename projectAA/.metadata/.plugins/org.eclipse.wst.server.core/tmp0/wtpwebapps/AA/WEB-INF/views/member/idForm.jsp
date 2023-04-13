<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" isELIgnored="false"%>

<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>아이디 찾기창</title>
<script>
function send_btn(){
   document.getElementById("#idformouttop").style.display = "none";
}
   </script>
<style>
.id_find_form {
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

input[type=text] {
   width: 250px;
   height: 40px;
   margin: 10px 0px;
   border: none;
   color: #6a6a6a;
}

.tel {
   width: 250px;
   height: 40px;
   border: none;
   color: #6a6a6a;
}

.seamil {
   width: 250px;
   height: 40px;
   background-color: rgb(255, 215, 0);
   margin-top: 30px;
   color: #fff;
   border: none;
   font-weight: bold;
}

.putNum {
   width: 250px;
   height: 40px;
   border: none;
   magin: 10px 0px;
   margin-top: 20px;
   color: #6a6a6a;
}

.bottom1 {
   border: none;
   margin-left: 400px;
   margin-right: 10px;
   margin-top: 30px;
   color: #545454;
}

.bottom2 {
   border: none;
   margin-left: 30px;
   margin-top: 30px;
   color: #545454;
}
#findIdForm{
  margin-left:180px;
}
#nana {
   margin-top: 15px;
   font-size: 0.75em;
}
#findIdForm input[type=text] {
   padding-left: 10px;
}
.name{
  text-align: center; 
}
.phone{
  text-align: center;
}
a:hover {color:rgb(255,215,0);}
</style>
<script>

$(document).ready(function() {
    $('#findIdForm').submit(function(event) {
        // 기본 이벤트인 form 전송을 막습니다.
        event.preventDefault();
        
        // form 데이터를 가져와서 JSON 형태로 변환합니다.
        var formData = $('#findIdForm').serialize();
        
        // AJAX 요청을 보냅니다.
        $.ajax({
            type: 'POST',
            url: '${contextPath}/member/findId.do',
            data: formData,
            success: function(result) {
                // id 속성이 존재하는 경우
                if (result != null && result != '') {
                    $('#idformouttop').text("찾으시는 아이디는 '" + result + "' 입니다.");
                }
                // id 속성이 존재하지 않는 경우
                else {
                    $('#idformouttop').text("일치하는 정보가 존재하지 않습니다.");
                }
            },
            error: function() {
                alert('오류가 발생하였습니다.');
            }
        });
    });
});

</script>        
</head>
<body>
   <div class="middle">
      <img width="600px" height="200px" class="logo" alt="booktopia"
         src="${contextPath}/resources/image/loginForm.png">
      <form id="findIdForm" method="post" action="${contextPath}/member/findId.do">
         <div class="id_find_form" title="flex-direction:column">
            <h4 class="p1">아이디 찾기</h4>
            <h4 id="idformouttop" name="idformouttop" class="p2">아이디는 가입시 입력한 이름과 전화번호로 찾을 수 있습니다.</h4><br>
               <label id="idformouttop"></label><br>
               <input type="text" placeholder="이름을 입력하세요." name="name" class="name" style="border: solid 1px #E2E2E2;">
               <input type="text" placeholder="등록한 번호를 입력해주세요." name="phone" class="phone" style="border: solid 1px #E2E2E2;">
               <input type="submit" value="찾기" class="seamil" onclick="send_btn()" id="send"><br><br>
              
         <div id="nana">
            <a href="${contextPath}/member/selectJoinMember.do">회원가입</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;<a href="${contextPath}/member/pwForm.do">비밀번호 찾기</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;<a href="${contextPath}/member/loginForm.do">로그인</a>
         </div>
         </div>
      </form>
   </div>
</body>
</html>