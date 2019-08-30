<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
            border:1px double black;
        }
        
        td{
            border:1px double black;
        }
</style>
</head>

<body>
	<section>
		<div id="Container">
			<div id="Contents">
				<h2>상품등록</h2>
				<form action="./productAddAction.ad" id="fm" name="fm" enctype="multipart/form-data" method="post">
					<table border="1">
						<tr>
							<td>상품이름</td>
							<td><input type="text" name="product_name" id="product_name"></td>
						</tr>
						<tr>
							<td>상품세부이름</td>
							<td><input type="text" name="product_subname" id="product_subname"></td>
						</tr>
						<tr>
							<td>브랜드</td>
							<td><input type="text" name="brand" id="brand"></td>
						</tr>
						<tr>
							<td>가격</td>
							<td><input type="text" name="product_price" id="product_price"></td>
						</tr>
						<tr>
							<td>상품이미지</td>
							<td><input type="file" required name="img_main" id="img_main"></td>
						</tr>
						<tr>
							<td>내용이미지</td>
							<td><input type="file" name="img_contents" id="img_contents"></td>
						</tr>
						<tr>
							<td>메인 카테고리</td>
							<td>
								<select name="category_main">
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5">5</option>
								</select>
							</td>
						</tr>
						<tr>
							<td>서브 카테고리</td>
							<td>
								<select name="category_sub">
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5">5</option>
								</select>
							</td>
						</tr>
						<tr>
							<td>할인</td>
							<td>
								<select name="discount">
									<option value="1">10</option>
									<option value="2">20</option>
									<option value="3">30</option>
									<option value="4">40</option>
									<option value="5">50</option>
									<option value="5">60</option>
									<option value="5">70</option>
									<option value="5">80</option>
									<option value="5">90</option>
								</select>
							</td>
						</tr>
						<tr>
							<td colspan="2" align="center">
								<input type="submit" value="등록">
								<input type="reset" value="취소">
							</td>
						</tr>
					</table>
				</form>
				
			</div>
		</div>
	</section>
</body>

</html>
