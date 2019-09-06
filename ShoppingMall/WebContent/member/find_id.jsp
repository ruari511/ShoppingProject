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
	String email = request.getParameter("find_email");

 	//3.아이디 중복을 위한 DB작업할 객체 생성
	MemberDAO dao = new MemberDAO();

	MemberDTO finddto = dao.find_info_id(email);

	String id = finddto.getId();
	
	int check = dao.find_id(email);
	
	if(check == 1){
		out.println("이메일 확인 완료: " + email);
		out.println("<br>");
		out.println("아이디 : " + id);
	}else{
		out.println("이메일 확인 부탁드립니다.");
	}

%>

<br>

<input type="button" value="돌아가기" onclick="history.back();"  />

</body>
</html>