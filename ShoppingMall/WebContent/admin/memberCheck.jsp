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
    .table {
      margin-left:auto; 
      margin-right:auto;
      border-collapse: collapse;
      border-top: 3px solid #168;
    }  
    .table th {
      color: #168;
      background: #f0f6f9;
      text-align: center;
    }
    .table th, .table td {
      padding: 10px;
      border: 1px solid #ddd;
    }
    .table th:first-child, .table td:first-child {
      border-left: 0;
    }
    .table th:last-child, .table td:last-child {
      border-right: 0;
    }
    .table tr td:first-child{
      text-align: center;
    }
    .table caption{caption-side: bottom; display: none;}
    
    h2{text-align: center; margin: 10px;}
</style>
</head>
<body>
	<section>
		<div id="Container">
				<h2>회원목록</h2>
				<table class="table">
					<tr align="center">
						<th>번호</th>
						<th>아이디</th>
						<th>비밀번호</th>
						<th>이름</th>
						<th>생년월일</th>
						<th>성별</th>
						<th>이메일</th>
						<th>회원가입일</th>
						<th>메인주소</th>
						<th>상세주소</th>
						<th>등급</th>
						<th>총구매액</th>
						<th>포인트</th>
						<th>핸드폰번호</th>
						<th>삭제</th>
					</tr>
					<c:forEach items="${memberList}" var="member">
					<tr align="center">
						<td>${member.num}</td>
						<td><a href="./buylistCheck.mp?search_id=${member.id }">${member.id}</a></td>
						<td>${member.password}</td>
						<td>${member.name}</td>
						<td>${member.birth_date}</td>
						<td>${member.gender}</td>
						<td>${member.email}</td>
						<td><fmt:formatDate value="${member.reg_date}" pattern="yyyy-MM-dd"/></td>
						<td>${member.address_main}</td>
						<td>${member.address_detail}</td>
						<td>${member.grade}</td>
						<td>${member.totalprice}</td>
						<td>${member.point}</td>
						<td>${member.phone}</td>
						<td onclick="deleteMember(${member.num})" style="cursor: pointer; font-weight: bold;">강퇴</td>
					</tr>
					</c:forEach>
				</table>
		</div>
	</section>
</body>
<script type="text/javascript">
	function deleteMember(num){
		
		if (confirm("정말 강퇴하시겠습니까?") == true){    //확인
		    //document.form.submit();
			location.href="MemberDeleteAction.ad?num=" + num;
		}else{   //취소
		    return;
		}
	}

</script>
</html>
