<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="./asset/css/productList.css"/> 
<link rel="stylesheet" href="./asset/css/global.css"/> 

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<script type="text/javascript" src="./asset/js/jquery-1.9.1.min.js"></script>
<title>상품 리스트</title>
<script type="text/javascript">
	
	var brand = new Array();
	var sort = "${param.sort}";
	
	$(function(){
		
		//서브카테고리 셋팅
		$("[data-category-sub='${param.sub}']").addClass("on");		
		//페이지 번호 셋팅
		$(".pageIndex_Btn[value='${param.pageNum}']").addClass("on");
		//브랜드 셋팅
		<c:forEach items="${paramValues.brand}" var="item">
			brand.push(${item}.value);
			$("input:checkbox[id='"+${item}.value+"']").prop("checked", true);
		</c:forEach>
		//정렬방법 셋팅
		$("#productList_Align_Wrap li[data-sort='${param.sort}'] a").addClass("on");
		
		$("input:checkbox[name=brand]").on('click', function(){
			selectBrand();
			var brandUrl="";
			for(var i = 0; i<brand.length; i++){
				brandUrl +="&brand="+brand[i];
			}
			location.href="ProductList.pro?main=${param.main}&sub=${param.sub}&sort=${param.sort}&pageNum=1"+brandUrl;
		});
		
	});
	
	//브랜드 전체보여주기/일부만 보여주기 함수
	function BrandToggle(){
		var toggle = $("#productList_Brand_List").data("toggle");

		if(toggle=="up"){
			$("#productList_Brand_List ul").css("max-height", "1000px");
			$("#productList_Brand_List").data("toggle", "down");
			$("#brandToggleBtn").html("닫기");
		}else{
			$("#productList_Brand_List ul").css("max-height", "140px");
			$("#productList_Brand_List").data("toggle", "up");
			$("#brandToggleBtn").html("더보기");
		}
		
	}

	function selectBrand(){
		brand = new Array();
		$.each($("input:checkbox[name='brand']:checked"),function(){
			brand.push($(this).val());
		} );	
	}
	
	function selectPage(n){
		var brandUrl="";
		for(var i = 0; i<brand.length; i++){
			brandUrl +="&brand="+brand[i];
		}
		location.href="ProductList.pro?main=${param.main}&sub=${param.sub}&sort=${param.sort}&pageNum="+n+brandUrl;
	}
	

</script>

</head>
<body>
	<c:set var="PATH" value="./upload/" />
	<div id="content"> <!-- content 나중에 제거하고 main에 추가-->
		<!--메인카테고리 이름-->
		<div  id="proudctList_Category_Main">
			<h1>${param.main}</h1>
		</div>
		
		<!--서브카테고리 이름-->
		<!--6개씩 출력-->
		<div id="proudctList_Category_Sub">
			<ul>
				<li data-category-sub="all"><a href="ProductList.pro?main=${param.main}&sub=all&sort=${param.sort}&pageNum=1">전체</a></li>
				<c:forEach var="sub" items="${requestScope.subList}">
					<li data-category-sub="${sub}"><a href="ProductList.pro?main=${param.main}&sub=${sub}&sort=${param.sort}&pageNum=1">${sub}</a></li>
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
				<p>Total ${brand_num}</p>
			</div>
			
			<div id="productList_Brand_List" data-toggle="up">
				<c:set var="brandList" value="${requestScope.brandList}"/>
				<ul>
					<c:forEach var="brand" items="${brandList}">
						<li>
							<input id="${brand}" name="brand" type="checkbox" value="${brand}"><label for="${brand}">${brand}</label>
						</li>
					</c:forEach>
				</ul>
			</div>
			<div id="productList_Brand_Btn">
				<c:if test="${fn:length(brandList) > 15}">
					<button id="brandToggleBtn" class="List_moreBtn" onclick="BrandToggle();">더보기</button>
				</c:if>
				<div class="Check_resetBtn">
				<button onclick="location.href='ProductList.pro?main=${param.main}&sub=${param.sub}&sort=${param.sort}&pageNum=1'")>
				선택초기화</button></div>
			</div>
		</div>
		
		<!--상품 갯수-->
		<div id="productList_Num">
		<p>
		<c:choose>
			<c:when test="${param.sub eq 'all'}">전체</c:when>
			<c:otherwise>${param.sub}</c:otherwise>
		</c:choose>
		카테고리에 <span>${requestScope.productCount}</span>개의 상품이 등록되어 있습니다.</p>
		</div>
		
		<!--상품 정렬-->
		<div id="productList_Align_Wrap">
			<ul>
				<!-- 브랜드 주소 만들기 -->
				<c:set var="brand" value=""/>
				<c:forEach var="item" items='${paramValues.brand}'>
					<c:set var="brands" value="${brands}&brand=${item}"/>
				</c:forEach>
				
				<li data-sort="pop">
				<a href="ProductList.pro?main=${param.main}&sub=${param.sub}&sort=pop&pageNum=1${brands}">인기순</a>
				</li>
				<li>|</li>
				<li data-sort="recent">
				<a href="ProductList.pro?main=${param.main}&sub=${param.sub}&sort=recent&pageNum=1${brands}">최근등록순</a>
				</li>
				<li>|</li>
				<li data-sort="price_count">
				<a href="ProductList.pro?main=${param.main}&sub=${param.sub}&sort=price_count&pageNum=1${brands}">판매수량순</a>
				</li>
				<li>|</li>
				<li data-sort="low_price">
				<a href="ProductList.pro?main=${param.main}&sub=${param.sub}&sort=low_price&pageNum=1${brands}">낮은가격순</a>
				</li>
				<li>|</li>
				<li data-sort="high_price">
				<a href="ProductList.pro?main=${param.main}&sub=${param.sub}&sort=high_price&pageNum=1${brands}">높은가격순</a>
				</li>
			</ul>
		</div>
		
		<!--상품 목록-->
		<div id="productList_Product_Wrap">
			<c:forEach var="row" items="${requestScope.productList}">
				<ul class="productList_Product_Row">
					<c:forEach var="item" items="${row}">
						<li class="productList_Product">
							<a href="./ProductDetailAction.pro?product_num=${item.product_num}">
								<img src="${PATH}${item.img_main}">
								<div class="productList_Product_Text">
									<p class="productList_Text_Brand">${item.brand}</p>
									<p class="productList_Text_Name">${item.product_name}</p>
									<p class="producteList_Text_Price">
									
									<!-- 0이 아닐때만 세일 표시 -->
									<c:if test="${item.product_sale_price ne 0 }">
										<span><fmt:formatNumber value="${item.product_price}" pattern="#,###" /> 원</span>
									</c:if>
									<fmt:formatNumber value="${item.product_price-item.product_sale_price}" pattern="#,###" /> 원</p>	
								</div>
								
								<!-- 품절표시 -->
								<c:if test="${item.product_count eq 0}">
                       				<div class="SoldOut_Box"> <p>품절</p></div>
                       			</c:if>
							</a>
						</li>
					</c:forEach>
					<div class="productList_UnderLine"></div>
				</ul>	
			</c:forEach>
		</div>
		
		<!-- 페이징 -->
		<div id="pageIndex_Btn_Wrap">
		
		<!-- 페이지 객체 불러오기 -->
		<c:set var="page" value="${requestScope.page}"/>
		
		<!-- 뒤로가기  -->
		<c:if test="${page.startPage ne 1}">
			<button class="pageIndex_Btn" onclick="selectPage(${page.startPage-1})" value="${page.startPage-1}">《</button>
		</c:if>	

		<!-- 번호 순서대로(10개씩) -->
		<c:forEach begin="${page.startPage}" end="${page.endPage}" varStatus="status">
			<button class="pageIndex_Btn" onclick="selectPage(${status.current})" value="${status.current}">${status.current}</button>	
		</c:forEach>
		
		<!-- 앞으로가기 -->	
		<c:if test="${page.endPage ne page.maxPage }">
			<button class="pageIndex_Btn" onclick="selectPage(${page.endPage+1})" value="${page.endPage+1}">》</button>	
		</c:if>
		
		</div>
	</div>
</body>
</html>
