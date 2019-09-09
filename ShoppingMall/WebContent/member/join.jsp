<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<!-- 제이쿼리 최선버전의 js파일을 불러와 jquery를 사용하기 위해 반드시 설정해야함 -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script language="javascript">
// opener관련 오류가 발생하는 경우 아래 주석을 해지하고, 사용자의 도메인정보를 입력합니다. ("팝업API 호출 소스"도 동일하게 적용시켜야 합니다.)
//document.domain = "abc.go.kr";
function goPopup(){
   // 주소검색을 수행할 팝업 페이지를 호출합니다.
   // 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
   var pop = window.open("./popup/jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
   
   // 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
    //var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
}

function jusoCallBack(roadAddrPart1,addrDetail){
   // 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
   document.form.roadAddrPart1.value = roadAddrPart1;
   document.form.addrDetail.value = addrDetail;
   
}

function email_change() { //이메일 자동으러 뒤에받아오는것 ex)naver.com
	var obj = document.getElementById("email_sel");
	
	if(obj.value==1){
		document.getElementById("email_2").value = "";
		document.getElementById("email_2").readOnly = false;
	} else{
		document.getElementById("email_2").value = obj.value;
		document.getElementById("email_2").readOnly = true;
	}
}
 
</script>
<link rel="stylesheet" href="./asset/css/member.css"/> 


</head>
<body>
<!-- 본문내용 -->
	
			<%--MemberFrontController서블릿에.. 회원가입 처리 요청! --%>
			<div>
			<form action="./MemberJoinAction.do" id="join" name="form" method="post">
				<div class="jointo">
				
				<h1 align="center" class="tit">Join Us</h1>
				<h3 align="center">회원가입을 통해 다양한 서비스와 혜택을 누리세요.</h3>
				
				<div class="joinin">
				
				<div>
				<h3 class="join_title">
				<label for="id">아이디</label>
				</h3>
					<input type="text" name="id" class="join" id="id" onblur="join_check('check')" placeholder="아이디"/>
					<div class="check_font" id="idMessage"></div>
				</div>

				<div>
				<h3 class="join_title">
				<label for="pass">비밀번호</label>
				</h3>
					<input type="password" name="password" class="join" id="pass" required><br>
				</div>
				
				
				<div>
				<h3 class="join_title">
				<label for="pass2">비밀번호 확인</label>
				</h3>
					<input type="password" name="password2" class="join" id="pass2" onblur="join_check('pass2')" required>
					<div class="check_font" id="passMessage"></div>
				</div>

				
				<div>
				<h3 class="join_title">
				<label for="name">이름</label>
				</h3>
				<%
					if(request.getParameter("name") != null  && request.getParameter("name").length() != 0){
						String name = request.getParameter("name");
				%>
				
					<input type="text" name="name" class="join" id="name" onblur="join_check('name')" value="<%=name %>" required>
				<%
					} else{
				%>
					<input type="text" name="name" class="join" id="name" onblur="join_check('name')" value="" required>
				<%
					}
				%>
					<%-- value="<%=name %>"--%>
					<div class="check_font" id="nameMessage"></div>
				</div>
				
				<div class="fontphone">
				<h3 class="join_title">
				<label for="phone2">휴대전화 번호</label>
				</h3>
				<span class="sp" >
					<select name = "phone1" id="phone1" class="join" style="height:50px; font-size: 14px; text-align: center;">
		              <option value="010">010</option>
		              <option value="011">011</option>
		              <option value="019">019</option>
		         	</select> - 
		         	<input type = "text" name = "phone2" id="phone2" maxlength="4" size = "5" style="height:50px; font-size: 14px; text-align: center;" required/>  - 
		          	<input type = "text" name = "phone3" id="phone3" maxlength="4" size = "5" style="height:50px; font-size: 14px; text-align: center;"  onblur="join_check('check')" required/><br>
		        </span>
		          	<div class="check_font" id="phoneMessage" style="font-size: 14px;"></div>
				</div>
				
				<div>
				<h3 class="join_title">
				<label for="birth">생년월일</label>
				</h3>
					<input type="date" name="birth_date" class="join" id="birth" onblur="join_check('birth')" placeholder="05년생 이전 출생자만 가능(YYYY/MM/DD)" required>
					<div class="check_font" id="birthMessage"></div>
				</div>

				<div>
				<h3 class="join_title">
				<label>성별</label>
				</h3>
					<label for="m" style="height: 50px; font-size: 14px;">남자</label><input type="radio" name="gender" id="m" value="남자" checked > &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;          
					<label for="g" style="height: 50px; font-size: 14px;">여자</label><input type="radio" name="gender" id="g" value="여자" ><br>
				</div>
				
				
				<%
					if(request.getParameter("email") != null && request.getParameter("email").length() != 0){
						String email = request.getParameter("email");
						
						// 먼저 @ 의 인덱스를 찾는다 - 인덱스 값: 5
						int idx = email.indexOf("@"); 

						// @ 앞부분을 추출
						// substring은 첫번째 지정한 인덱스는 포함하지 않는다.
						// 아래의 경우는 첫번째 문자열인 a 부터 추출된다.
						String email1 = email.substring(0, idx);

						// 뒷부분을 추출
						// 아래 substring은 @ 바로 뒷부분인 n부터 추출된다.
						String email2 = email.substring(idx+1);
				%>
				<div>
				<h3 class="join_title">
				<label for="email">이메일</label>
				</h3>
				<input type="text" id="email_1" name="email_1" value="<%=email1 %>" class="join" style="width: 150px; font-size: 14px;" required>
				@ <input type="text" id="email_2" name="email_2" value="<%=email2 %>" class="join" style="width: 150px; font-size: 14px;" required>
					<div class="check_font" id="emailMessage"></div> 
				</div>
				
				<%
					}else{
				%>

				<div>
				<h3 class="join_title">
				<label for="email">이메일</label>
				</h3>
				<input type="text" id="email_1" name="email_1" value="" class="join" style="width: 150px; font-size: 14px;" required>
				@ <input type="text" id="email_2" name="email_2" value="" class="join" style="width: 150px; font-size: 14px;" required>
				<select id="email_sel" onchange="email_change();" style="height: 50px; font-size: 14px;">
					<option value="1">직접입력</option>
					<option value="hanmir.com">hanmir.com</option>
					<option value="naver.com">naver.com</option>
					<option value="hanmail.net">hanmail.net</option>
					<option value="nate.com">nate.com</option>
					<option value="yahoo.co.kr">yahoo.co.kr</option>
					<option value="gmail.com">gmail.com</option>
					<option value="hotmail.com">hotmail.com</option>
					<option value="empal.com">empal.com</option>
					<option value="paran.com">paran.com</option>
					<option value="lycos.co.kr">lycos.co.kr</option>
					<option value="freechal.com">freechal.com</option>
					<option value="hanafos.com">hanafos.com</option>
					<option value="korea.com">korea.com</option>
					<option value="dreamwiz.com">dreamwiz.com</option>
				</select>
					<div class="check_font" id="emailMessage"></div> 
				</div>
				
				<%
					}
				%>
				
				
				<div>
				<h3 class="join_title">
				<label onClick="goPopup();">주소</label>
				</h3>
            	<div id="callBackDiv">
            		<div class="ad"><input type="text" class="address_main" id="roadAddrPart1" name="address_main" class="form-control" placeholder="Enter Addr" required="true" readonly="true" />
            		<input type="button" onClick="goPopup();" value="주소 찾기" class="adbtn"/></div><br>
            		<input type="text" class="join" id="addrDetail" name="address_detail" /><br>
            	</div>
            	</div>
            	
				


				<div class="join_SR">
						<input type="submit" value="회원가입" class="submit">
						<input type="reset" value="다시쓰기" class="cancel">
				</div>
				</div>
				</div><!-- jointo끝 -->

			</form>
			</div>
<!-- 본문내용 -->
</body>
<script type="text/javascript">
	function join_check(aa){
		var _id = $("#id").val();
		
		var _pass = $("#pass").val();
		var _pass2 = $("#pass2").val();
		
		var _name = $("#name").val();
		var chkName= /^[가-힣]{2,4}$/;
		
		var _email = $("#email").val();
		var chkEmail = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
		
		var _phone = $("#phone1").val()+"-"+$("#phone2").val()+"-"+$("#phone3").val()
		
		var now = new Date();
		var yearNow = now.getFullYear();
		var _birth = $("#birth").val();
		
		if(aa == 'check'){
			var contextPath = "http://localhost:8090/ShoppingMall";
			// ajax 아이디 중복 체크
			$.ajax(
					{
						url:"${pageContext.request.contextPath}/ShoppingMall/Check",
						type:"post",
						async:false,
						data:{id:_id, phone:_phone},
						dataType:"text",
						success:function(data,textStatus){
							// 아이디 체크
							if(data == 14){  //  아이디 중복 o
								$("#idMessage").text("사용중인 아이디입니다.");
								$("#idMessage").css("color","red");
								$(".submit").attr("disabled",true);
							}else if(data == 24 ){//  아이디 중복 x
								if(_id.length < 4 ||_id.length > 12){// 아이디가 4~12자가 아닐 시
									$("#idMessage").text("아이디 4~12자를 입력해주세요 :)");
									$("#idMmessage").css("color","red");
									$(".submit").attr("disabled",true);
								}else if(_id == ""){// 아이디가 공백일때
									$("#idMessage").text("아이디를 입력해주세요 :)");
									$("#idMessage").css("color","red");
									$(".submit").attr("disabled",true);
								}else{
									$("#idMessage").text("사용할 수 있는  아이디입니다:)");
									$("#idMessage").css("color","blue");
									$(".submit").attr("disabled",false);
								}
							}else if(data == 23 ){ // 폰번호 중복 x
								$("#phoneMessage").text("이미 가입된 번호입니다.");
								$("#phoneMessage").css("color","red");
								$(".submit").attr("disabled",true);
							}else if(data == 24 ){ // 아이디 중복 x, 폰번호 중복 x
								$("#phoneMessage").text("");
								$(".submit").attr("disabled",false);
							}		
						},
						error:function(request,status,error){ //작업중 오류가 발생했을 경우에 수행할 작업을 설정 합니다.
							alert("code = "+ request.status + "\n message = " + request.responseText + "\n error = " + error); // 실패 시 처리

             }
         }); // ajax 메소드 끝
   }else if(aa == 'pass2'){
      // 비밀번호 체크
      if(_pass != _pass2 ){
         $("#passMessage").text("비밀번호가 일치하지 않습니다.");
         $("#passMessage").css("color","red");
         $(".submit").attr("disabled",true);
      }else if(_pass.length < 4 || _pass2.length < 4){
         $("#passMessage").text("비밀번호 4자리 이상 입력해주세요");
         $("#passMessage").css("color","red");
         $(".submit").attr("disabled",true);
      }else{ 
         $("#passMessage").text("비밀번호가 일치합니다.");
         $("#passMessage").css("color","blue");
         $(".submit").attr("disabled",false);
      }
   }else if(aa == 'name'){
      // 이름 유효성
      if(!chkName.test(_name)){
         $("#nameMessage").text("이름을 정확히 입력해주세요");
         $("#nameMessage").css("color","red");
         $(".submit").attr("disabled",true);
      }else{
         $("#nameMessage").text("");
         $(".submit").attr("disabled",false);
      }
   }else if(aa == "email"){
      if(!chkEmail.test(_email)){
         $("#emailMessage").text("메일을 정확히 입력해주세요");
         $("#emailMessage").css("color","red");
         $(".submit").attr("disabled",true);
      }else{
         $("#emailMessage").text("");
         $(".submit").attr("disabled",false);
      }
   
   }else if(aa == "birth"){// 14세미만 회원가입 불가능
      if(yearNow - (_birth.substr(0,4)) < 14){
         $("#birthMessage").text("14세미만은 회원가입을 할 수 없습니다.");
         $("#birthMessage").css("color","red");
         $(".submit").attr("disabled",true);
      }else{
         $("#birthMessage").text("");
         $(".submit").attr("disabled",false);
      }
   }
}

</script>
</html>
