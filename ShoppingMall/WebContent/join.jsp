<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<!-- 본문내용 -->
<center>
		<article>
			<h1>Join Us</h1>
			<%--MemberFrontController서블릿에.. 회원가입 처리 요청! --%>
			<form action="./MemberJoinAction.me" id="join" method="post">
				
				<fieldset>
				<legend>회원가입 정보</legend>
				<label>아이디</label>
					<input type="text" name="id" class="id" required><br>
				<label>비밀번호</label>
					<input type="password" name="pass" required><br>
				<label>이름</label>
					<input type="text" name="name" required><br>
				<label>생년월일</label>
					<input type="date" name="birth_date" required><br>
				<label>성별</label>
					남자<input type="radio" name="gender" value="남자" checked>
					여자<input type="radio" name="gender" value="여자" ><br>
				<label>이메일</label>
					<input type="email" name="email" required><br>
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

</center>
<!-- 본문내용 -->
</body>
</html>