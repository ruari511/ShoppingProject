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
				<h2>주문목록</h2>
				<table class="table">
					<tr align="center">
						<th>글번호</th>
						<th>작성자</th>
						<th>카테고리</th>
						<th>상품번호</th>
						<th>상품명</th>
						<th>제목</th>
						<th>작성일</th>
						<th>내용</th>
						<th>답변여부</th>
						<th>답변작성일</th>
						<th>답변내용</th>
						<th>답변</th>
					</tr>
					<form action="./BoardQnaReplyAction.ad" method="post">
					<c:forEach items="${qnaList}" var="qnaList">
					<tr align="center">
						<td>${qnaList.num}</td>
						<td>
							<a href="./buylistCheck.ad?id=${qnaList.id }">${qnaList.id}</a>
						</td>
						<td>
							<c:if test="${qnaList.category eq '10' }">
								일반
							</c:if>
							<c:if test="${qnaList.category eq '20' }">
								매장
							</c:if>
							<c:if test="${qnaList.category eq '30' }">
								이벤트
							</c:if>
							<c:if test="${qnaList.category eq '40' }">
								뷰티테스터
							</c:if>
						</td>
						<td>
							<c:if test="${qnaList.product_num eq '0'}">
								-
							</c:if>
							<c:if test="${qnaList.product_num != '0' }">
								${qnaList.product_num }
							</c:if>
						 </td>
						 <td>
						 	<c:if test="${empty qnaList.product_name }">
								-
						 	</c:if>
						 	<c:if test="${!empty qnaList.product_name }">
						 		${qnaList.product_name }
						 	</c:if>
						 </td>
						<td>${qnaList.subject }</td>
						<td><fmt:formatDate pattern="yyyy-MM-dd" value="${qnaList.reg_date }" /></td>
						<td>${qnaList.content}</td>
						<td>
							<c:if test="${qnaList.re_result eq '0'}"> 
								답변대기
							</c:if>
							<c:if test="${qnaList.re_result eq '1'}">
								답변완료
							</c:if>	
						</td>
						<td><fmt:formatDate pattern="yyyy-MM-dd" value="${qnaList.re_reg_date }" /></td>
						<td style="width:40% ;height:100px;">
							<c:if test="${empty qnaList.reply }">
								<input type="hidden" name="num" value="${qnaList.num }">
								<textarea id="reply" name="reply" cols="2" rows="1" placeholder="답변을 입력하세요" style="width:100%;height:100px;"></textarea>
							</c:if>
							<c:if test="${!empty qnaList.reply }">
								<p  style="white-space:pre;">${qnaList.reply }</p>
							</c:if>
						</td>
						<td>
							<input type="submit" value="답변달기">
						</td>
					</tr>
					</c:forEach>
					</form>
				</table>
				
		
		<div id="pageing">
			<c:if test="${pageNo != 0}">
				<c:if test="${pageNo > pageBlock }">
					<a href="./qnalistcheck.ad?pageNum=${firstPage }"> [첫페이지] </a>
				</c:if>
				<c:if test="${startPage != 1 }">
					<a href="./qnalistcheck.ad?pageNum=${startPage-pageBlock }"> [이전] </a>
				</c:if>
			
				<c:forEach var="i" begin="${startPage }" end="${endPage }" step="1">
					<c:choose>
						<c:when test="${i eq pageNo }">
							<a href="./qnalistcheck.ad?pageNum=${i }"><Strong>${i }</Strong></a>
						</c:when>
						<c:otherwise>
							<a href="./qnalistcheck.ad?pageNum=${i }">${i }</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			
				<c:if test="${pageNo != finalPage}">
					<a href="./qnalistcheck.ad?pageNum=${startPage+pageBlock}"> [다음] </a>
				</c:if>
				
				<c:if test="${pageNo < finalPage }">
					<a href="./qnalistcheck.ad?pageNum=${finalPage }"> [마지막페이지]</a>
				</c:if>
			</c:if>
		</div>
		
		</div>
	</section>
</body>
<script type="text/javascript">
$(window).load(function () {
	/* 주문번호 병합 */
	$(".gubun").each(function () {
	    var rows = $(".gubun:contains('" + $(this).text() + "')");
	    if (rows.length > 1) {
	        rows.eq(0).attr("rowspan", rows.length);
	        rows.not(":eq(0)").remove(); 
	    } 
	});
});
/* 	function deleteMember(num){
		
		if (confirm("정말 강퇴하시겠습니까?") == true){    //확인
		    //document.form.submit();
			location.href="MemberDeleteAction.ad?num=" + num;
		}else{   //취소
		    return;
		}
	}
 */
</script>
</html>
