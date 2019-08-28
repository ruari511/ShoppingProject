<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>아이디 찾기</title>
</head>

<script type="text/javascript">

	function moveClose() {
		opener.location.href = "../login.do";
		self.close();
	}
	
</script>

<body>

<form action="find_id.jsp" method="get">
	<h1>아이디 찾기</h1>
	<b>이메일을 입력해주세요!</b> : <input type="text" name="find_email"> <br><br>
	
	<input type="submit" value="아이디 찾기">
</form>
	
	<br><hr>
	
	<h1>비밀번호 찾기</h1>
	<form action="find_pw.jsp" method="get">
	<b>아이디를 입력해주세요!</b> : <input type="text" name="find_id"> <br>
	<b>핸드폰 번호를 입력해주세요!</b> : <input type="text" name="find_phone"> <br>

	<input type="submit" value="비밀번호 찾기">
</form>
	
	<br><br>
	
	<input type="button" value="닫 기" onclick="self.close();"  />
	<input type="button" value="로그인 페이지로 이동" onclick="moveClose();" />
</body>
</html>