<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
</style>
</head>

<body>
	<section>
		<div id="Container">
			<div id="Contents">
				<h2>상품등록</h2>
				<form action="./productAddAction.ad" id="fm" name="fm" enctype="multipart/form-data" method="post">
					<table border="1" class="table">
						<tr>
							<th>상품이름</th>
							<td><input type="text" name="product_name" id="product_name"></td>
						</tr>
						<tr>
							<th>상품세부이름</th>
							<td><input type="text" name="product_subname" id="product_subname"></td>
						</tr>
						<tr>
							<th>브랜드</th>
							<td><input type="text" name="brand" id="brand"></td>
						</tr>
						<tr>
							<th>가격</th>
							<td><input type="text" name="product_price" id="product_price"></td>
						</tr>
						<tr>
							<th>상품이미지</th>
							<td><input type="file" required name="img_main" id="img_main"></td>
						</tr>
						<tr>
							<th>내용이미지</th>
							<td><input type="file" name="img_contents" id="img_contents"></td>
						</tr>
						<tr>
							<th>메인 카테고리</th>
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
							<th>서브 카테고리</th>
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
							<th>할인</th>
							<td>
								<select name="product_sale_price">
									<option value="10">10%</option>
									<option value="20">20%</option>
									<option value="30">30%</option>
									<option value="40">40%</option>
									<option value="50">50%</option>
									<option value="60">60%</option>
									<option value="70">70%</option>
									<option value="80">80%</option>
									<option value="90">90%</option>
								</select>
							</td>
						</tr>
						<tr>
							<td colspan="2" align="center">
								<input type="submit" value="등록" class="button">
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
