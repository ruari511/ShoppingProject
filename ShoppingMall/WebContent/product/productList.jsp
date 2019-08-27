<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../asset/css/productList.css"/> 
<link rel="stylesheet" href="../asset/css/global.css"/> 
<title>Insert title here</title>
</head>
<body>
	<div id="content"> <!-- content 나중에 제거하고 main에 추가-->
		<div id="productList_Product_Wrap">
			<ul class="productList_Product_Row">
				<li class="productList_Product">
					<a href="#">
						<img src="{item.img_main }">
						<div class="productList_Product_Text">
							<p class="productList_Text_Brand">{item.brand }</p>
							<p class="productList_Text_Name">{item.product_name }</p>
							<p class="producteList_Text_Price">{item.product_price } 원</p>	
						</div>
					</a>
				</li>
				<li class="productList_Product">
					<a href="#">
						<img src="{item.img_main }">
						<div class="productList_Product_Text">
							<p class="productList_Text_Brand">{item.brand }</p>
							<p class="productList_Text_Name">{item.product_name }</p>
							<p class="producteList_Text_Price">{item.product_price } 원</p>	
						</div>
					</a>
				</li>
				<li class="productList_Product">
					<a href="#">
						<img src="{item.img_main }">
						<div class="productList_Product_Text">
							<p class="productList_Text_Brand">{item.brand }</p>
							<p class="productList_Text_Name">{item.product_name }</p>
							<p class="producteList_Text_Price">{item.product_price } 원</p>	
						</div>
					</a>
				</li>
				<li class="productList_Product">
					<a href="#">
						<img src="{item.img_main }">
						<div class="productList_Product_Text">
							<p class="productList_Text_Brand">{item.brand }</p>
							<p class="productList_Text_Name">{item.product_name }</p>
							<p class="producteList_Text_Price">{item.product_price } 원</p>	
						</div>
					</a>
				</li>
				<div class="productList_UnderLine"/>
			</ul>	
			
		</div>
	</div>
</body>
</html>