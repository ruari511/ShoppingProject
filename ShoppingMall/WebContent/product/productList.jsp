<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../asset/css/productList.css"/>
<link rel="stylesheet" href="./asset/css/productList.css"/> 
<link rel="stylesheet" href="../asset/css/global.css"/> 
<link rel="stylesheet" href="./asset/css/global.css"/> 

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script type="text/javascript" src="./asset/js/jquery-1.9.1.min.js"></script>
<title>상품 리스트</title>
<script type="text/javascript">

	$(function(){
		
		//브랜드 셋팅
		var on = $("[data-category-sub="+"<c:out value='${param.sub}'/>"+"]").addClass("on");
		on.addClass("on");
	});
	//브랜드 전체보여주기/일부만 보여주기 함수
	function BrandToggle(){
		var toggle = $("#productList_Brand_List").data("toggle");
		console.log(toggle);
		if(toggle=="up"){
			$("#productList_Brand_List ul").css("max-height", "1000px");
			$("#productList_Brand_List").data("toggle", "down");
		}else{
			$("#productList_Brand_List ul").css("max-height", "140px");
			$("#productList_Brand_List").data("toggle", "up");
		}
		
	}

</script>

</head>
<body>
	<div id="content"> <!-- content 나중에 제거하고 main에 추가-->
		<!--메인카테고리 이름-->
		<div  id="proudctList_Category_Main">
			<h1>${param.main}</h1>
		</div>
		
		<!--서브카테고리 이름-->
		<!--6개씩 출력-->
		<div id="proudctList_Category_Sub">
			<ul>
				<li data-category-sub="전체"><a href="#">전체</a></li>
				<c:forEach var="sub" items="${requestScope.subList}">
					<li data-category-sub="${sub}"><a href="#">${sub}</a></li>
				</c:forEach>
				
				<!-- 남은 빈칸 채워주기 -->
				<c:set var="nbsp" value="${6-((fn:length(requestScope.subList)+1)%6)}"/>
				<c:forEach begin="1" end="${nbsp}">
					<li>&nbsp;</li>
				</c:forEach>

			</ul>
		</div>
		
		<!--브랜드 필터-->
		<!--https://cocosoft.kr/397 체크박스 클릭시 이벤트-->
		<div id="productList_Brand">
			<div id="productList_Brand_Title">
				<p>브랜드</p>
				<p>Total {brand_num}</p>
			</div>
			
			<div id="productList_Brand_List" data-toggle="up">
				<ul>
					<c:forEach var="brand" items="${requestScope.brandList }">
						<li>
							<input id="${brand}" name="${brand}" type="checkbox" value="${brand}"><label for="${brand}">${brand}</label>
						</li>
					</c:forEach>
				</ul>
			</div>
			<div id="productList_Brand_Btn">
				<button class="List_moreBtn" onclick="BrandToggle();">더보기</button>
				<div class="Check_resetBtn"><button>선택초기화</button></div>
			</div>
		</div>
		
		<!--상품 갯수-->
		<div id="productList_Num">
		<p>${param.sub} 카테고리에 <span>${requestScope.productCount}</span>개의 상품이 등록되어 있습니다.</p>
		</div>
		
		<!--상품 정렬-->
		<div id="productList_Align_Wrap">
			<ul>
				<li data-sort="like"><a href="#" class="on">인기순</a></li>
				<li>|</li>
				<li data-sort="recent"><a href="#">최근등록순</a></li>
				<li>|</li>
				<li data-sort="price_count"><a href="#">판매수량순</a></li>
				<li>|</li>
				<li data-sort="product_price"><a href="#">낮은가격순</a></li>
				<li>|</li>
				<li data-sort="product_price"><a href="#">높은가격순</a></li>
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
		
		<div id="pageIndex_Btn_Wrap">
			<button class="pageIndex_Btn" onclick="" value="">《</button>
			<button class="pageIndex_Btn on" onclick="" value="1">1</button>
			<button class="pageIndex_Btn" onclick="" value="2">2</button>
			<button class="pageIndex_Btn" onclick="" value="3">3</button>
			<button class="pageIndex_Btn" onclick="" value="4">4</button>
			<button class="pageIndex_Btn" onclick="" value="5">5</button>
			<button class="pageIndex_Btn" onclick="" value="6">6</button>
			<button class="pageIndex_Btn" onclick="" value="7">7</button>
			<button class="pageIndex_Btn" onclick="" value="8">8</button>
			<button class="pageIndex_Btn" onclick="" value="9">9</button>
			<button class="pageIndex_Btn" onclick="" value="10">10</button>
			<button class="pageIndex_Btn" onclick="" value="">》</button>	
		</div>
	</div>
</body>
</html>