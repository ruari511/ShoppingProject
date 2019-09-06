<%@page import="net.member.db.MemberDTO"%>
<%@page import="net.member.db.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>아이디 찾기</title>
</head>
<body>

<%
	request.setCharacterEncoding("UTF-8");

	//1.join.jsp의 function winopen()함수에 의해서 전달 받은 userid값(입력한 아이디)얻기
	//2. 밑의 중복체크 버튼 <form>태그로 부터 전달받은  userid값 얻기
	String id = request.getParameter("find_id");
	String phone = request.getParameter("find_phone");

 	//3.아이디 중복을 위한 DB작업할 객체 생성
	MemberDAO dao = new MemberDAO();

	MemberDTO finddto = dao.find_info_pw(id, phone);

	String pw = finddto.getPassword();
	
	int check = dao.find_pw(id, phone);
	%>
	
	<table width="600" border="0" cellspacing="0" cellpadding="0">
	<tr>
	<td bgcolor="#969937" style="padding: 5px 10px; color: #fff;" class="white12bold">아이티영 아이디 찾기</td>
	</tr>
	</table>
	<table width="550" border="0" cellspacing="0" cellpadding="0" class="grey12">
	<tr>
	<td style="padding: 20px 0 0 0"> 
	<table width="500" border="0" align="center" cellpadding="0" cellspacing="0">
	<tr>
	<td style="padding: 15px; border-top: 2px #cccccc solid; border-right: 2px #cccccc solid; border-bottom: 2px #cccccc solid; border-left: 2px #cccccc solid;">
	<%
	
	if(check == 1){
		out.println("아이디 확인 완료: " + id);
		out.println("<br>");
		out.println("비밀번호 : " + pw);
	}else{
		out.println("아이디와  휴대폰번호를 다시 작성해 주세요.");
	}

%>

<table width="400" border="0" cellspacing="1" class="regtable">
	<tr>
	<td>
	</td>
	</tr>
	
	</table>
	</td>
	</tr>
	</table>
	<table border="0" align="right" cellpadding="0" cellspacing="0">
	<tr>
	<td height="40" style="padding: 0 13px 0 0">
	<div class="bts">
	<span><input type="button" class="passwd_UpdateBtn" style="border-radius: 5px;" value="취소" onclick="wc()"></span>
	</div>
	</td>
	<td height="40" style="padding: 0 13px 0 0">
	<div class="bts">
	<span><input type="button" class="passwd_UpdateBtn" style="border-radius: 5px;" value="돌아가기" onclick="history.back();"></span>
	</div>
	</td>
	</tr>
	</table>
	</td>
	</tr>
	</table>

</body>
</html>