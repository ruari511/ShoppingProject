<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
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

</script>


</head>
<body>
<!-- 본문내용 -->
	<section>
		<article>
			<h1>Join Us</h1>
			<%--MemberFrontController서블릿에.. 회원가입 처리 요청! --%>
			<form action="./MemberJoinAction.me" id="join" name="form" method="post">
				
				<fieldset>
				<legend>회원가입 정보</legend>
				<label>아이디</label>
					<input type="text" name="id" class="id" id="id" onblur="join_check('check')" />
					<div class="check_font" id="idMessage"></div>
				<label>비밀번호</label>
					<input type="password" name="password" id="pass" required><br>
				<label>비밀번호 확인</label>
					<input type="password" name="password2" id="pass2" onblur="join_check('pass2')" required>
					<div class="check_font" id="passMessage"></div>
				<label>이름</label>
					<input type="text" name="name" id="name" onblur="join_check('name')" required>
					<div class="check_font" id="nameMessage"></div>
				<label>생년월일</label>
					<input type="date" name="birth_date" id="birth" onblur="join_check('birth')" required >
					<div class="check_font" id="birthMessage"></div>
				<label>성별</label>
					남자<input type="radio" name="gender" value="남자" checked>
					여자<input type="radio" name="gender" value="여자" ><br>
				<label>이메일</label>
					<input type="email" name="email" id="email" onblur="join_check('email')" required><br>
					<div class="check_font" id="emailMessage"></div>
				<label>주소</label>
					<input type="button" onClick="goPopup();" value="팝업_domainChk"/>
            	<div id="list"></div>
            	<div id="callBackDiv">
            		<input type="text"  style="width:250px;" id="roadAddrPart1"  name="address_main" class="form-control" style="width:500px;" placeholder="Enter Addr" required="true" readonly="true" /><br>
            		<input type="text"  style="width:250px;" id="addrDetail"  name="address_detail" />
            	</div>
				<label>휴대전화 번호 *</label>
					<select name = "phone1" id="phone1">
		              <option value="010">010</option>
		              <option value="011">011</option>
		              <option value="019">019</option>
		         	</select> - 
		         	<input type = "text" name = "phone2" id="phone2" maxlength="4" size = "5" required/> - 
		          	<input type = "text" name = "phone3" id="phone3" maxlength="4" size = "5" onblur="join_check('check')" required/><br>
		          	<div class="check_font" id="phoneMessage"></div>
				</fieldset>
				
				<fieldset>
						<input type="submit" value="Submit" class="submit">
						<input type="reset" value="Cancel" class="cancel">
				</fieldset>			
			</form>
		</article>
	</section>
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
			// ajax 아이디 중복 체크
			$.ajax(
					{
						url:"http://localhost:8090/ShoppingMall/Check",
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
						error:function(data,textStatus){ //작업중 오류가 발생했을 경우에 수행할 작업을 설정 합니다.
							 alert("에러가 발생했습니다.");
					 }
				}); // ajax 메소드 끝
		}else if(aa == 'password2'){
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
