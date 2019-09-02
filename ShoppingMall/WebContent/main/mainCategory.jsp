<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC>
<html>
<head>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>메인카테고리</title>
<script type="text/javascript" src="../asset/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		$(".mainCategory_name").mouseover(function(){
			$(this).children(".subCategory_Wrap").css("display", "block");
		}).mouseout(function(){
			$(this).children(".subCategory_Wrap").css("display", "none");
		});
	});

</script>
</head>
<body>
	<!-- 메인 카테고리  -->
			<div id="mainCategory_Wrap">
				<ul id="mainCategory_List">
					<li class="mainCategory_name"><a href="#">스킨케어</a>
						<div class="subCategory_Wrap">
							<ul class="subCategory_List">
								<li><a href="#">안녕</a></li>
								<li><a href="#">안녕</a></li>
								<li><a href="#">안녕</a></li>
								<li><a href="#">안녕</a></li>
							</ul>
						</div>
					</li>
					<li class="mainCategory_name"><a href="#">메이크업</a>
						<div class="subCategory_Wrap">
							<ul class="subCategory_List">
								<li><a href="#">안녕2</a></li>
								<li><a href="#">안녕2</a></li>
								<li><a href="#">안녕2</a></li>
								<li><a href="#">안녕2</a></li>
							</ul>
						</div>
					</li>
					<li class="mainCategory_name"><a href="#">바디케어</a>
						<div class="subCategory_Wrap">
							<ul class="subCategory_List">
								<li><a href="#">안녕3</a></li>
								<li><a href="#">안녕3</a></li>
								<li><a href="#">안녕3</a></li>
								<li><a href="#">안녕3</a></li>
							</ul>
						</div>
					</li>
					<li><a href="#">헤어케어</a>
						<div class="subCategory_Wrap">
							<ul class="subCategory_List">
				
							</ul>
						</div>
					</li>
					<li><a href="#">향수/디퓨져</a>
						<div class="subCategory_Wrap">
							<ul class="subCategory_List">
				
							</ul>
						</div>
					</li>
					<li><a href="#">미용용품</a>
						<div class="subCategory_Wrap">
							<ul class="subCategory_List">
				
							</ul>
						</div>
					</li>
					<li><a href="#">남성</a>
						<div class="subCategory_Wrap">
							<ul class="subCategory_List">
				
							</ul>
						</div>
					</li>
					<li><a href="#">건강/위생용품</a>
						<div class="subCategory_Wrap">
							<ul class="subCategory_List">
				
							</ul>
						</div>
					</li>
					<li><a href="#">건강식품</a>
						<div class="subCategory_Wrap">
							<ul class="subCategory_List">
				
							</ul>
						</div>
					</li>
					<li><a href="#">일반식품</a>
						<div class="subCategory_Wrap">
							<ul class="subCategory_List">
				
							</ul>
						</div>
					</li>
					<li><a href="#">반려동물</a>
						<div class="subCategory_Wrap">
							<ul class="subCategory_List">
				
							</ul>
						</div>
					</li>
					
					<li><a href="#">베이비</a>
						<div class="subCategory_Wrap">
							<ul class="subCategory_List">
				
							</ul>
						</div>
					</li>
					<li><a href="#">잡화</a>
						<div class="subCategory_Wrap">
							<ul class="subCategory_List">
								<li><a href="#">안녕</a></li>
								<li><a href="#">안녕</a></li>
								<li><a href="#">안녕</a></li>
								<li><a href="#">안녕</a></li>
							</ul>
							<div class="Category_Ad">
								<p>
									<span>MD's Pick</span>
									<span>{product_name}</span>
									<span>{discript}<br>
									{discript}</span>
									<span>{product_price}</span>
									<span>{price}원</span><img src="img/diary.jpg">
								</p>
							</div>
						</div>
					</li>
					<li><a href="#">프리미엄관</a></li>
					

				</ul>
			</div>
</body>
</html>