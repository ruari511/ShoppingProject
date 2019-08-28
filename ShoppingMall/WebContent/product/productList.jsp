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
		<!--메인카테고리 이름-->
		<div  id="proudctList_Category_Main">
			<h1>{product_main_category}</h1>
		</div>
		
		<!--서브카테고리 이름-->
		<!--6개씩 출력-->
		<div id="proudctList_Category_Sub">
			<ul>
				<li class="on"><a href="#">전체</a></li>
				<li><a href="#">{sub_category}</a></li>
				<li><a href="#">{sub_category}</a></li>
				<li><a href="#">{sub_category}</a></li>
				<li><a href="#">{sub_category}</a></li>
				<li><a href="#">{sub_category}</a></li>
				<li><a href="#">{sub_category}</a></li>
				<li><a href="#">{sub_category}</a></li>
				<li><a href="#">{sub_category}</a></li>
				<li><a href="#">{sub_category}</a></li>
				<li>&nbsp;</li>
				<li>&nbsp;</li>

			</ul>
		</div>
		
		<!--브랜드 필터-->
		<!--https://cocosoft.kr/397 체크박스 클릭시 이벤트-->
		<div id="productList_Brand">
			<div id="productList_Brand_Title">
				<p>브랜드</p>
				<p>Total {brand_num}</p>
			</div>
			
			<div id="productList_Brand_List">
				<ul>
					<li>
						<input id="brand1" name="brand" type="checkbox" value="brand1"><label for="brand1">brand1</label>
					</li>
					<li>
						<input id="brand2" name="brand" type="checkbox" value="brand1"><label for="brand2">brand2</label>
					</li>
					<li>
						<input id="brand3" name="brand" type="checkbox" value="brand1"><label for="brand3">brand3</label>
					</li>
					<li>
						<input id="brand4" name="brand" type="checkbox" value="brand1"><label for="brand4">brand4</label>
					</li>
					
					
					<li>
						<input id="brand1" name="brand" type="checkbox" value="brand1"><label for="brand1">brand1</label>
					</li>
					<li>
						<input id="brand2" name="brand" type="checkbox" value="brand1"><label for="brand2">brand2</label>
					</li>
					<li>
						<input id="brand3" name="brand" type="checkbox" value="brand1"><label for="brand3">brand3</label>
					</li>
					<li>
						<input id="brand4" name="brand" type="checkbox" value="brand1"><label for="brand4">brand4</label>
					</li>
					<li>
						<input id="brand1" name="brand" type="checkbox" value="brand1"><label for="brand1">brand1</label>
					</li>
					<li>
						<input id="brand2" name="brand" type="checkbox" value="brand1"><label for="brand2">brand2</label>
					</li>
					<li>
						<input id="brand3" name="brand" type="checkbox" value="brand1"><label for="brand3">brand3</label>
					</li>
					<li>
						<input id="brand4" name="brand" type="checkbox" value="brand1"><label for="brand4">brand4</label>
					</li>
					<li>
						<input id="brand1" name="brand" type="checkbox" value="brand1"><label for="brand1">brand1</label>
					</li>
					<li>
						<input id="brand2" name="brand" type="checkbox" value="brand1"><label for="brand2">brand2</label>
					</li>
					<li>
						<input id="brand3" name="brand" type="checkbox" value="brand1"><label for="brand3">brand3</label>
					</li>
					<li>
						<input id="brand4" name="brand" type="checkbox" value="brand1"><label for="brand4">brand4</label>
					</li>
				</ul>
			</div>
			<div id="productList_Brand_Btn">
				<button class="List_moreBtn">더보기</button>
				<div class="Check_resetBtn"><button>선택초기화</button></div>
			</div>
		</div>
		
		<!--상품 갯수-->
		<div id="productList_Num">
		<p>{product_name} 카테고리에 <span>{num}</span>개의 상품이 등록되어 있습니다.</p>
		</div>
		
		<!--상품 정렬-->
		<div id="productList_Align_Wrap">
			<ul>
				<li><a href="#">인기순</a></li>
				<li>|</li>
				<li><a href="#">최근등록순</a></li>
				<li>|</li>
				<li><a href="#">판매수량순</a></li>
				<li>|</li>
				<li><a href="#">낮은가격순</a></li>
				<li>|</li>
				<li><a href="#">높은가격순</a></li>
			</ul>
		</div>
		
		<!--상품 목록-->
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
				<div class="productList_UnderLine"></div>
			</ul>	
			
		</div>
	</div>
</body>
</html>