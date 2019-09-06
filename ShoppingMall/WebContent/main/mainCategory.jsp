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
		
		$(".subCategory_Wrap").mouseover(function(){
			$(this).children(".Category_Ad").css("display", "block");
		}).mouseout(function(){
			$(this).children(".Category_Ad").css("display", "none");
		});
	
	});

</script>
</head>
<body>
	<c:set var="PATH" value="./upload/" />
	<!-- 메인 카테고리  -->
			<div id="mainCategory_Wrap">
				<ul id="mainCategory_List">
					<c:forEach var="main" items="${requestScope.mainCategory}">
						<li class="mainCategory_name"><a href="ProductList.pro?main=${main}&sub=all&sort=pop&pageNum=1">${main}</a>
							<div class="subCategory_Wrap">
								<ul class="subCategory_List">
								
								<!-- 서브카테고리 -->
								<c:forEach var="sub" items="${requestScope.subCategory[main]}">
									<li><a href="ProductList.pro?main=${main}&sub=${sub}&sort=pop&pageNum=1">${sub}</a></li>						
								</c:forEach>
								
								
								
								</ul>
								
								<!-- 광고 -->
								<div class="Category_Ad">
									<p>
										<c:set var="item" value="${requestScope.Ad[main]}"/>
										<a href="ProductDetailAction.pro?product_num=${item.product_num }">										
											<span>MD's Pick</span>
											<span>${item.brand}</span>
											<span>${item.product_name}</span>
											<c:if test="${item.product_sale_price ne 0 }">
												<span class="Ad_product_price"><fmt:formatNumber value="${item.product_price}" pattern="#,###" /> 원</span>
											</c:if>
											<span class="Ad_discount_price">
											<fmt:formatNumber value="${item.product_price-item.product_sale_price}" pattern="#,###" /> 원</span>
											<img src="${PATH}${item.img_main}">
										</a>
									</p>
								</div>
							</div>
						</li>
					</c:forEach>
					<li class="mainCategory_name"><a href="#">건강식품</a></li>
					<li class="mainCategory_name"><a href="#">일반식품</a></li>
					<li class="mainCategory_name"><a href="#">반려동물</a></li>
					<li class="mainCategory_name"><a href="#">베이비</a></li>
					<li class="mainCategory_name"><a href="#">잡화</a></li>
					<li class="premium_category"><a href="#">프리미엄관</a></li>
					

				</ul>
			</div>
</body>
</html>