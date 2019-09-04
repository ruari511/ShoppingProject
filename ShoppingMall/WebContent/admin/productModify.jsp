<%@page import="net.product.db.ProductDTO"%>
<%@page import="net.product.db.ProductDAO"%>
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
	  position: relative;
	}
	
	 h2{text-align: center; margin: 10px;}
	 
	 input[type="text"] {width: 100px;height:36px;boredr: 1px solid #dbdbdb;;padding:8px 10px 8px 0;font-family:'dotum', '돋움';font-size:12px;outline:0}
</style>
</head>
<%	
	
	int num = Integer.parseInt(request.getParameter("product_num"));
	
	ProductDAO pdao = new ProductDAO();
	
	ProductDTO productInfo = pdao.getProductInfo(num);
	
	request.setAttribute("product", productInfo);
	
%>
<body>
	<section>
		<div id="Container">
			<div id="Contents">
				<h2>상품수정</h2>
				<form action="./ProductModifyAction.ad" id="fm" name="fm" enctype="multipart/form-data" method="post">
					<input type="hidden" name="product_num" value="${product.product_num}"/>
					<table border="1" class="table">
						<tr>
							<th>상품이름</th>
							<td><input type="text" name="product_name" value="${product.product_name}"></td>
						</tr>
						<tr>
							<th>상품세부이름</th>
							<td><input type="text" name="product_subname" value="${product.product_subname}"></td>
						</tr>
						<tr>
							<th>브랜드</th>
							<td><input type="text" name="brand" value="${product.brand}"></td>
						</tr>
						<tr>
							<th>가격</th>
							<td><input type="text" name="product_price" value="${product.product_price}"></td>
						</tr>
						<tr>
							<th>상품재고량</th>
							<td><input type="text" name="product_count" value="${product.product_count}"></td>
						</tr>
						<tr>
							<th>상품구매량</th>
							<td><input type="text" name="price_count" value="${product.price_count}"></td>
						</tr>
						<tr>
							<th>상품이미지</th>
							<td><input type="file" required name="img_main" value="${product.img_main}"></td>
						</tr>
						<tr>
							<th>내용이미지</th>
							<td><input type="file" name="img_contents" value="${product.img_contents}"></td>
						</tr>
						<tr>
							<th>메인 카테고리</th>
							<td>
								<select name="category_main">
									<option value="1" <c:if test="${product.category_main eq '1'}">selected</c:if>>1</option>
								 	<option value="2" <c:if test="${product.category_main eq '2'}">selected</c:if>>2</option>
								 	<option value="3" <c:if test="${product.category_main eq '3'}">selected</c:if>>3</option>
								 	<option value="4" <c:if test="${product.category_main eq '4'}">selected</c:if>>4</option>
								 	<option value="5" <c:if test="${product.category_main eq '5'}">selected</c:if>>5</option>
								</select>
							</td>
						</tr>
						<tr>
							<th>서브 카테고리</th>
							<td>
								<select name="category_sub">
									<option value="1" <c:if test="${product.category_sub eq '1'}">selected</c:if>>1</option>
									<option value="2" <c:if test="${product.category_sub eq '2'}">selected</c:if>>2</option>
									<option value="3" <c:if test="${product.category_sub eq '3'}">selected</c:if>>3</option>
									<option value="4" <c:if test="${product.category_sub eq '4'}">selected</c:if>>4</option>
									<option value="5" <c:if test="${product.category_sub eq '5'}">selected</c:if>>5</option>
								</select>
							</td>
							
						</tr>
						<tr>
							<th>할인</th>
							<td>
								<select name="product_sale_price">
									<option value="10" <c:if test="${product.product_sale_price eq '10'}">selected</c:if>>10%</option>
									<option value="20" <c:if test="${product.product_sale_price eq '20'}">selected</c:if>>20%</option>
									<option value="30" <c:if test="${product.product_sale_price eq '30'}">selected</c:if>>30%</option>
									<option value="40" <c:if test="${product.product_sale_price eq '40'}">selected</c:if>>40%</option>
									<option value="50" <c:if test="${product.product_sale_price eq '50'}">selected</c:if>>50%</option>
									<option value="60" <c:if test="${product.product_sale_price eq '60'}">selected</c:if>>60%</option>
									<option value="70" <c:if test="${product.product_sale_price eq '70'}">selected</c:if>>70%</option>
									<option value="80" <c:if test="${product.product_sale_price eq '80'}">selected</c:if>>80%</option>
									<option value="90" <c:if test="${product.product_sale_price eq '90'}">selected</c:if>>90%</option>
								</select>
							</td>
						</tr>
						<tr>
							<td colspan="2" align="center">
								<input type="submit" value="수정" class="button">
								<input type="reset" value="취소" class="button">
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</section>
</body>
</html>
