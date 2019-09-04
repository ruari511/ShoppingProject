<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인 페이지</title>

<!-- 제이쿼리 최선버전의 js파일을 불러와 jquery를 사용하기 위해 반드시 설정해야함 -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<style type="text/css">
	div.menu{width:100%;height:300px;text-align: center;margin-left:auto;margin-right:auto;}
	div.menu_Inner{float:left;margin: 100px;}
	h2{margin-top: 20px;}
</style>
<body>
	<section>
		<div id="Container">
			<div id="Contents">
				<div class="menu">
					<div class="menu_Inner">
						<a href="./memberCheck.ad"><img alt="회원관리" src="./asset/image/member.png">
							<h2>회원 목록</h2>
						</a>
					</div>
					<div class="menu_Inner">
						<a href="./productList.ad"><img alt="상품등록" src="./asset/image/product.png">
							<h2>상품 목록 및 추가</h2>
						</a>
					</div>
				</div>			
			</div>
		</div>
	</section>
</body>

</html>
