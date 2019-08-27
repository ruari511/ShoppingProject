<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인 페이지</title>

<!-- 제이쿼리 최선버전의 js파일을 불러와 jquery를 사용하기 위해 반드시 설정해야함 -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style type="text/css">
        table{
            margin-left:auto; 
            margin-right:auto;
            border:1px solid black;
        }
        
        td{
            border:1px solid black;
        }
    </style>

</head>

<body>
	<section>
		<div id="Container">
			<div id="Contents">
				회원관리
				<table>
					<tr align="center">
						<td>아이디</td>
						<td>비밀번호</td>
						<td>이름</td>
						<td>생년월일</td>
						<td>성별</td>
						<td>이메일</td>
						<td>회원가입일</td>
						<td>메인주소</td>
						<td>상세주소</td>
						<td>등급</td>
						<td>총구매액</td>
						<td>포인트</td>
						<td>핸드폰번호</td>
					</tr>
					<c:forEach items="${memberList}" var="member">
					<tr align="center">
						<td>${member.id}</td>
						<td>${member.password}</td>
						<td>${member.name}</td>
						<td>${member.birth_date}</td>
						<td>${member.gender}</td>
						<td>${member.email}</td>
						<td>${member.reg_date}</td>
						<td>${member.address_main}</td>
						<td>${member.address_detail}</td>
						<td>${member.grade}</td>
						<td>${member.totalprice}</td>
						<td>${member.point}</td>
						<td>${member.phone}</td>
						<td><button onclick="deleteMember()">삭제</button></td>
					</tr>
					</c:forEach>
				</table>
				
			</div>
		</div>
	</section>
</body>
<script type="text/javascript">
	function deleteMember() {
		location.href="./deletemMember.ad";
	}
</script>
</html>
