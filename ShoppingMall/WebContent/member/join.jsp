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
<script type="text/javascript">
	
	function join_check(){
		var _id = $("#id").val();
		
		var _pass = $("#pass").val();
		var _pass2 = $("#pass2").val();
		
		var _name = $("#name").val();
		var chkName= /^[가-힣]{2,4}$/;
		
		
		if(_id == ''){// 아이디를 입력하지 않았을 경우
			alter("ID를 입력하세요.");
			return;
		}
		$.ajax(
			{
				url:"http://localhost:8090/ShoppingMall/joinCheck",
				type:"post",
				async:false,
				data:{id:_id, pass:_pass, name:_name},
				dataType:"text",
				success:function(data,textStatus){
					
					// 아이디 체크
					if(data == 'usable'){ // 아이디가 중복이 아닐 시(사용가능)
						if(_id.length < 4 || _id.length > 12){// 아이디가 4~12자가 아닐 시
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
					}else{// 중복일 때
						$("#idMessage").text("사용중인 아이디입니다.");
						$("#idMessage").css("color","red");
						$(".submit").attr("disabled",true);
					}
					
					// 비밀번호 체크
					if(_pass != "" || _pass2 != ""){
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
					}
					
					// 이름 유효성
					if(_name != ""){
						if(!chkName.test(_name)){
							$("#nameMessage").text("이름을 정확히 입력해주세요");
							$("#nameMessage").css("color","red");
							$(".submit").attr("disabled",true);
						}else{
							
						}
					}
					
				},
				error:function(data,textStatus){ //작업중 오류가 발생했을 경우에 수행할 작업을 설정 합니다.
					 alert("에러가 발생했습니다.");
			 }
		}); // ajax 메소드 끝
		
	};	
	
</script>

</head>
<body>
<!-- 본문내용 -->
<section>
		<article>
			<h1>Join Us</h1>
			<%--MemberFrontController서블릿에.. 회원가입 처리 요청! --%>
			<form action="./MemberJoinAction.me" id="join" method="post">
				
				<fieldset>
				<legend>회원가입 정보</legend>
				<label>아이디</label>
					<input type="text" name="id" class="id" id="id" onblur="join_check()"  required>
					<div class="check_font" id="idMessage"></div>
				<label>비밀번호</label>
					<input type="password" name="pass" id="pass" required><br>
				<label>비밀번호 확인</label>
					<input type="password" name="pass2" id="pass2" onblur="join_check()" required>
					<div class="check_font" id="passMessage"></div>
				<label>이름</label>
					<input type="text" name="name" id="name" onblur="join_check()" required>
					<div class="check_font" id="nameMessage"></div>
				<label>생년월일</label>
					<input type="date" name="birth_date" id="birth" required><br>
				<label>성별</label>
					남자<input type="radio" name="gender" value="남자" checked>
					여자<input type="radio" name="gender" value="여자" ><br>
				<label>이메일</label>
					<input type="email" name="email" id="email" required><br>
				<label>address_main *</label>
					<input type="text" name="address_main"><br>
				<label>address_detail *</label>
					<input type="text" name="address_detail"><br>
				<label>자택 전화 번호 </label>
					<input type = "text" name = "tel1" maxlength="3" size = "3" /> -
		         	<input type = "text" name = "tel2" maxlength="3" size = "3" /> - 
		          	<input type = "text" name = "tel3" maxlength="4" size = "5" /><br>
				<label>휴대전화 번호 *</label>
					<select name = "phone1">
		              <option value="010">010</option>
		              <option value="011">011</option>
		              <option value="019">019</option>
		         	</select> - 
		         	<input type = "text" name = "phone2" maxlength="4" size = "5" required/> - 
		          	<input type = "text" name = "phone3" maxlength="4" size = "5" required/><br>
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
</html>