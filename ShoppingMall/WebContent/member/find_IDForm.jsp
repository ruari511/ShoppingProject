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
	function wc() {
		window.close();
	}
	

</script>

<body>

<form action="find_id.jsp" method="get">
	<table width="600" border="0" cellspacing="0" cellpadding="0">
	<tr>
	<td bgcolor="#969937" style="padding: 5px 10px; color: #fff;" class="white12bold"">아이티영 아이디 찾기</td>
	</tr>
	</table>
	<table width="550" border="0" cellspacing="0" cellpadding="0" class="grey12">
	<tr>
	<td style="padding: 20px 0 0 0"> 
	<table width="500" border="0" align="center" cellpadding="0" cellspacing="0">
	<tr>
	<td style="padding: 15px; border-top: 2px #cccccc solid; border-right: 2px #cccccc solid; border-bottom: 2px #cccccc solid; border-left: 2px #cccccc solid;">
	<h5>아이티영 아이디를 잊으셨나요? 아래에 이메일을 입력해주세요</h5>
	<table width="400" border="0" cellspacing="1" class="regtable">
	<tr>
	<td>
	</td>
	</tr>
	<tr>
	<td width="280" height="20" bgcolor="#f4f4f4">이메일을 입력해주세요!</td>
	<td width="130">
	<input type="text" name="find_email" placeholder="이메일">
	</td>
	</tr>	
	</table>
	</td>
	</tr>
	</table>
	<table border="0" align="right" cellpadding="0" cellspacing="0">
	<tr>
	<td rowspan="2" align="center">
	<div class="bts">
	<a> 
	<span><input type="submit" value="아이디 찾기" style="border-radius: 5px;"></span>
	</a>
	</div>
	</td>
	<td height="40" style="padding: 0 13px 0 0">
	<div class="bts">
	<span><input type="button" class="passwd_UpdateBtn" style="border-radius: 5px;" value="취소" onclick="wc()"></span>
	</div>
	</td>
	</tr>
	</table>
	</td>
	</tr>
	</table>
</form>




<br><br><hr><br><br>



<form action="find_pw.jsp" method="get">
	<table width="600" border="0" cellspacing="0" cellpadding="0">
	<tr>
	<td bgcolor="#969937" style="padding: 5px 10px; color: #fff;" class="white12bold">아이티영 비밀번호 찾기</td>
	</tr>
	</table>
	<table width="550" border="0" cellspacing="0" cellpadding="0" class="grey12">
	<tr>
	<td style="padding: 20px 0 0 0"> 
	<table width="500" border="0" align="center" cellpadding="0" cellspacing="0">
	<tr>
	<td style="padding: 15px; border-top: 2px #cccccc solid; border-right: 2px #cccccc solid; border-bottom: 2px #cccccc solid; border-left: 2px #cccccc solid;">
	<h5>아이티영 비밀번호를 잊으셨나요?<br> 아래에 아이디와 휴대폰 번호를 입력해주세요</h5>
	<table width="400" border="0" cellspacing="1" class="regtable">
	<tr>
	<td>
	</td>
	</tr>
	<tr>
	<td width="280" height="20" bgcolor="#f4f4f4">아이디를 입력해주세요</td>
	<td width="130">
	<input type="text" name="find_id">
	</td>
	</tr>
	<tr>
	<td width="280" height="20" bgcolor="#f4f4f4">휴대폰 번호를 입력해주세요</td>
	<td width="130">
	<input type="text" name="find_phone">
	</td>
	</tr>		
	</table>
	</td>
	</tr>
	</table>
	<table border="0" align="right" cellpadding="0" cellspacing="0">
	<tr>
	<td rowspan="2" align="center">
	<div class="bts">
	<a> 
	<span><input type="submit" style="border-radius: 5px;" value="비밀번호 찾기"></span>
	</a>
	</div>
	</td>
	<td height="40" style="padding: 0 13px 0 0">
	<div class="bts">
	<span><input type="button" class="passwd_UpdateBtn" style="border-radius: 5px;" value="취소" onclick="wc()"></span>
	</div>
	</td>
	</tr>
	</table>
	</td>
	</tr>
	</table>
</form>



















<!--////////////////////////////////////////////////////  -->







	
	<br><br>
	
	<input type="button" value="닫 기" onclick="self.close();"  />
	<input type="button" value="로그인 페이지로 이동" onclick="moveClose();" />
</body>
</html>
