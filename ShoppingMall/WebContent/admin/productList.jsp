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
				상품리스트
				<table>
					<tr align="center">
						<td>번호</td>
						<td>상품이름</td>
						<td>상품세부이름</td>
						<td>브랜드</td>
						<td>가격</td>
						<td>상품이미지</td>
						<td>내용이미지</td>
						<td>메인카테고리</td>
						<td>서브카테고리</td>
						<td>구매갯수</td>
						<td>할인</td>
					</tr>
					<c:forEach items="${productList}" var="product">
					<tr align="center">
						<td>${product.product_num}</td>
						<td>${product.product_name}</td>
						<td>${product.product_subname}</td>
						<td>${product.brand}</td>
						<td>${product.product_price}</td>
						<td>${product.img_main}</td>
						<td>${product.img_contents}</td>
						<td>${product.category_main}</td>
						<td>${product.category_sub}</td>
						<td>${product.price_count}</td>
						<td>${product.discount}</td>
						<td><button onclick="deleteProduct(${product.product_num})">삭제</button></td>
					</tr>
					</c:forEach>
				</table>
				
				<input type="button" onclick="productAdd()" value="상품추가"/>		
			</div>
		</div>
	</section>
</body>
<script type="text/javascript">
	function deleteProduct(num){
		
		if (confirm("정말 삭제하시겠습니까?") == true){    //확인
		    //document.form.submit();
			location.href="ProductDeleteAction.ad?product_num=" + num;
		}else{   //취소
		    return;
		}
	}
	function productAdd() {
		location.href='./productAdd.ad';
	}

</script>
</html>
