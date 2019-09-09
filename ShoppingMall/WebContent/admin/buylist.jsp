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
						<th>주문일자 / 주문번호</th>
						<th>주문자 아이디</th>
						<th>받는분</th>
						<th>배송지</th>
						<th>구입 제품명</th>
						<th>수량</th>
						<th>주문금액</th>
						<th>배송상태</th>
						<th>수정</th>
					</tr>
					<c:forEach items="${buylist}" var="buylist">
					<form action="./buylistUpdate.ad" method="post">
					<tr align="center">
						<td class="gubun">
							<a href="mypage_BuyListDetail.mp?buynum=${buylist.buynum }">${buylist.buydate} <br> / ${buylist.buynum }</a>
						</td>
						<td><a href="./buylistCheck.ad?search_id=${buylist.id }">${buylist.id}</a></td>
						<td>${buylist.delivery_name}</td>
						<td>${buylist.delivery_address}</td>
						<td><a class="thum" href="ProductDetailAction.pro?product_num=${buylist.product_num }">${buylist.product_name}</a></td>
						<td>${buylist.buy_count}</td>
						<td>${(buylist.product_price - buylist.product_sale_price) * buylist.buy_count }원</td>
						<td><select name="delivery_result" title="배송 상태 선택" style="width:80px;">
												<option>선택해주세요</option>
												<option value="주문접수" <c:if test="${buylist.delivery_result eq '주문접수'}"> selected </c:if>>주문접수</option>
												<option value="결제완료" <c:if test="${buylist.delivery_result eq '결제완료' }"> selected </c:if>>결제완료</option>
												<option value="상품준비중" <c:if test="${buylist.delivery_result eq '상품준비중' }"> selected </c:if>>상품준비중</option>
												<option value="배송중" <c:if test="${buylist.delivery_result eq '배송중' }"> selected </c:if>>배송중</option>
												<option value="배송완료" <c:if test="${buylist.delivery_result eq '배송완료' }"> selected </c:if>>배송완료</option>
							</select>
						</td>
						<td>
							<input type="hidden" name="buynum" value="${buylist.buynum }">
							<input type="hidden" name="product_num" value="${buylist.product_num }">
							<input type="submit" value="수정" style="background-color: white;">
						</td>
					</tr>
					</form>
					</c:forEach>
				</table>
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
