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
    
    /* 버튼 */
    div.button_div{text-align: center;}
    
    .button {
	  display: inline-block;
	  border-radius: 4px;
	  background-color: #168;
	  border: none;
	  color: #FFFFFF;
	  text-align: center;
	  font-size: 20px;
	  padding: 10px;
	  width: 150px;
	  transition: all 0.5s;
	  cursor: pointer;
	  margin-top: 10px;
	}
	
	.button span {
	  cursor: pointer;
	  display: inline-block;
	  position: relative;
	  transition: 0.5s;
	}
	
	.button span:after {
	  content: '\00bb';
	  position: absolute;
	  opacity: 0;
	  top: 0;
	  right: -20px;
	  transition: 0.5s;
	}

	.button:hover span {
	  padding-right: 25px;
	}
	
	.button:hover span:after {
	  opacity: 1;
	  right: 0;
	}
	 h2{text-align: center; margin: 10px;}

    
</style>

</head>

<body>
	<section>
		<div id="Container">
				<h2>상품리스트</h2>
				<table class="table">
					<tr align="center">
						<th>번호</th>
						<th>상품이름</th>
						<th>상품세부이름</th>
						<th>브랜드</th>
						<th>가격</th>
						<th>할인(%)</th>
						<th>상품재고량</th>
						<th>상품구매량</th>
						<th>상품이미지</th>
						<th>내용이미지</th>
						<th>메인카테고리</th>
						<th>서브카테고리</th>
						<th>수정</th>
						<th>삭제</th>
					</tr>
					<c:forEach items="${productList}" var="product">
					<tr align="center">
						<td>${product.product_num}</td>
						<td>${product.product_name}</td>
						<td>${product.product_subname}</td>
						<td>${product.brand}</td>
						<td>${product.product_price}</td>
						<td>${product.product_sale_price}</td>
						<td>${product.product_count}</td>
						<td>${product.price_count}</td>
						<td>${product.img_main}</td>
						<td>${product.img_contents}</td>
						<td>${product.category_main}</td>
						<td>${product.category_sub}</td>
						<td onclick="modifyProduct(${product.product_num})" style="cursor: pointer; font-weight: bold;">수정</td>
						<td onclick="deleteProduct(${product.product_num})" style="cursor: pointer; font-weight: bold;">삭제</td>
					</tr>
					</c:forEach>
				</table>
				<div class="button_div">
					<button class="button" style="vertical-align:middle" onclick="productAdd()"><span>상품추가</span></button>
				</div>
		</div>
	</section>
</body>
<script type="text/javascript">
	function modifyProduct(num) {
		location.href="productModify.ad?product_num=" + num;
	}
	
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
