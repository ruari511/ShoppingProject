<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="./asset/css/global.css"/> 
<link rel="stylesheet" href="./asset/css/ProductSelect.css"/> 
<title>Insert title here</title>
<script type="text/javascript">
	function brandOnOff(){
		var check = document.getElementById("brandOnOffCheck").value;
		if(check == "off"){
			document.getElementById("brandOnOff").className="search_box brand on"
			document.getElementById("brandOnOffCheck").value="on";
		}else{
			document.getElementById("brandOnOff").className="search_box brand"
			document.getElementById("brandOnOffCheck").value="off";
		}
	}
	
	function cateOnOff(){
		var check = document.getElementById("cateOnOffCheck").value;
		if(check == "off"){
			document.getElementById("cateOnOff").className="search_box cate on"
			document.getElementById("cateOnOffCheck").value="on";
			document.getElementById("catelist").className="list show";
		}else{
			document.getElementById("cateOnOff").className="search_box cate"
			document.getElementById("cateOnOffCheck").value="off";
			document.getElementById("catelist").className="list";
		}
	}
	
	function subcateOnOff(){
		var check = document.getElementById("subcateOnOffCheck").value;
		if(check == "off"){
			document.getElementById("subcateOnOff").className="search_box subcate on"
			document.getElementById("subcateOnOffCheck").value="on";
			document.getElementById("subcatelist").className="list show";
		}else{
			document.getElementById("subcateOnOff").className="search_box subcate"
			document.getElementById("subcateOnOffCheck").value="off";
			document.getElementById("subcatelist").className="list";
		}
	}
	
	
	function attBoxOnOff(){
		var check = document.getElementById("attBoxOnOffCheck").value;
		if(check == "off"){
			document.getElementById("attBoxOnOff").className="search_box attBox on"
			document.getElementById("attBoxOnOffCheck").value="on";
		}else{
			document.getElementById("attBoxOnOff").className="search_box attBox"
			document.getElementById("attBoxOnOffCheck").value="off";
		}
	}
	
	$(function(){
		var flag = true;
		$('#cateBtn').each(function(index,items){
			$('#cateBtn').click(function(){
				if(flag==true){
					$('.list').addClass('show');
					flag = false;
				} else{
					$('.list').removeClass('show');
					$('#firstlist').addClass('show');
					flag = true;
				}
				});
			});
		});
	$(function(){
		var flag = true;
		$('#subcateBtn').each(function(index,items){
			$('#subcateBtn').click(function(){
				if(flag==true){
					$('.sublist').addClass('show');
					$('#subcateOnOff').css('height', '109px');
					$('#subcateOnOff .inner').css('height', '108px');
					flag = false;
				} else{
					$('.sublist').removeClass('show');
					$('#subfirstlist').addClass('show');
					$('#subcateOnOff').css('height', '55px');
					$('#subcateOnOff .inner').css('height', '54px');
					flag = true;
				}
				});
			});
		});
	
</script>
</head>
<body>

<!-- header -->
<jsp:include page="./include/Header.jsp"/>
<!-- header// -->

<!-- #Container -->
	<c:set var="productList" value="${requestScope.productList}" />
	<c:set var="count" value="${requestScope.count}" />
	<c:set var="query" value="${requestScope.query}" />
	<div id="Container">
		<!-- #Contents -->
		<div id="Contents">
			<!-- 검색어오류 영역 추가 (2017-01-13 추가)  -->
			<div class="searchResultArea"> 
				<p class="resultTxt"><strong>로션</strong>검색결과 (전체 <span>${count}개</span>의 상품)					
				</p>
				<div class="searchWrap">
					<input type="text" title="결과 내 검색창" placeholder="결과 내 검색" id="reChk">
					<input type="submit" value="검색" title="검색" onclick="return reSearch()">
				</div>
			</div>
			<!-- 상품 속성 정보 검색 서비스 개선 -->
			<div class="detailSearch new">
			    <!-- 카테고리 -->
				<div class="search_box cate" id="cateOnOff">
				<c:set var="categorylength" value="${requestScope.category }"/>
				<div class="inner">
					<h4 class="tit_th">카테고리
					<c:if test="${fn:length(categorylength) >= 4}">
						<button id="cateBtn" class="btnMore" onclick="cateOnOff();">열기/닫기</button>
					</c:if>
					</h4><!-- 버튼은 6개 이상만 노출 --><!-- 카테고리는 서브 텝 존재로 구조가 다름 -->
					<input type="hidden" id="cateOnOffCheck" value="off">
					<c:set var="cate" value="${requestScope.cate }"/>
				<c:forEach var="category" items="${requestScope.category}" varStatus="idx">
						<c:choose>
						<c:when test="${idx.index < 4}">
							<c:if test="${idx.index % 4 == 0}">
								<ul class="list show" id="firstlist">	
									<li><a href="./ProductSelectAction.pro?query=${query}&startrow=0&cate=${category}" id="category_10000010001" onclick="">${category}<span></span></a></li>
							</c:if>
							<c:if test="${idx.index % 4 == 1}">
								<li><a href="./ProductSelectAction.pro?query=${query}&startrow=0&cate=${category}" id="category_10000010001" onclick="">${category}<span></span></a></li>
							</c:if>
							<c:if test="${idx.index % 4 == 2}">
								<li><a href="./ProductSelectAction.pro?query=${query}&startrow=0&cate=${category}" id="category_10000010001" onclick="">${category}<span></span></a></li>
							</c:if>
							<c:if test="${idx.index % 4 == 3}">
								<li><a href="./ProductSelectAction.pro?query=${query}&startrow=0&cate=${category}" id="category_10000010001" onclick="">${category}<span></span></a></li>
								</ul>
							</c:if>
						</c:when>
						<c:otherwise>
							<c:if test="${idx.index % 4 == 0}">
								<ul class="list ">	
									<li><a href="./ProductSelectAction.pro?query=${query}&startrow=0&cate=${category}" id="category_10000010001" onclick="">${category}<span></span></a></li>
							</c:if>
							<c:if test="${idx.index % 4 == 1}">
								<li><a href="./ProductSelectAction.pro?query=${query}&startrow=0&cate=${category}" id="category_10000010001" onclick="">${category}<span></span></a></li>
							</c:if>
							<c:if test="${idx.index % 4 == 2}">
								<li><a href="./ProductSelectAction.pro?query=${query}&startrow=0&cate=${category}" id="category_10000010001" onclick="">${category}<span></span></a></li>
							</c:if>
							<c:if test="${idx.index % 4 == 3}">
								<li><a href="./ProductSelectAction.pro?query=${query}&startrow=0&cate=${category}" id="category_10000010001" onclick="">${category}<span></span></a></li>
								</ul>
							</c:if>
						</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:if test="${fn:length(category) <= 4}"></ul></c:if>
				</div>
			</div>								
				<!-- //카테고리 -->
				<!-- 서브카테고리 -->
				<c:set var="subcate" value="${requestScope.subcategory}"/>
				<c:set var="subcategorylength" value="${requestScope.subcategory}"/>
				<c:if test="${subcate == null}">
				<div class="search_box subcate" id="subcateOnOff" style="display:none;">
				<div class="inner">
					<h4 class="tit_th">서브카테고리
					<c:if test="${fn:length(subcategorylength) >= 4}">
						<button id="subcateBtn" class="btnMore" onclick="subcateOnOff();">열기/닫기</button>
					</c:if>
					</h4><!-- 버튼은 6개 이상만 노출 --><!-- 카테고리는 서브 텝 존재로 구조가 다름 -->
					<input type="hidden" id="subcateOnOffCheck" value="off">
				<c:forEach var="subcategory" items="${requestScope.subcategory}" varStatus="idx">
						<c:choose>
						<c:when test="${idx.index < 4}">
							<c:if test="${idx.index % 4 == 0}">
								<ul class="sublist show" id="subfirstlist">	
									<li><a href="./ProductSelectAction.pro?query=${query}&startrow=0&cate=${cate}&subcate=${subcategory}" id="category_10000010001" onclick="">${subcategory}<span></span></a></li>
							</c:if>
							<c:if test="${idx.index % 4 == 1}">
								<li><a href="./ProductSelectAction.pro?query=${query}&startrow=0&cate=${cate}&subcate=${subcategory}" id="category_10000010001" onclick="">${subcategory}<span></span></a></li>
							</c:if>
							<c:if test="${idx.index % 4 == 2}">
								<li><a href="./ProductSelectAction.pro?query=${query}&startrow=0&cate=${cate}&subcate=${subcategory}" id="category_10000010001" onclick="">${subcategory}<span></span></a></li>
							</c:if>
							<c:if test="${idx.index % 4 == 3}">
								<li><a href="./ProductSelectAction.pro?query=${query}&startrow=0&cate=${cate}&subcate=${subcategory}" id="category_10000010001" onclick="">${subcategory}<span></span></a></li>
								</ul>
							</c:if>
						</c:when>
						<c:otherwise>
							<c:if test="${idx.index % 4 == 0}">
								<ul class="sublist ">	
									<li><a href="./ProductSelectAction.pro?query=${query}&startrow=0&cate=${cate}&subcate=${subcategory}" id="category_10000010001" onclick="">${subcategory}<span></span></a></li>
							</c:if>
							<c:if test="${idx.index % 4 == 1}">
								<li><a href="./ProductSelectAction.pro?query=${query}&startrow=0&cate=${cate}&subcate=${subcategory}" id="category_10000010001" onclick="">${subcategory}<span></span></a></li>
							</c:if>
							<c:if test="${idx.index % 4 == 2}">
								<li><a href="./ProductSelectAction.pro?query=${query}&startrow=0&cate=${cate}&subcate=${subcategory}" id="category_10000010001" onclick="">${subcategory}<span></span></a></li>
							</c:if>
							<c:if test="${idx.index % 4 == 3}">
								<li><a href="./ProductSelectAction.pro?query=${query}&startrow=0&cate=${cate}&subcate=${subcategory}" id="category_10000010001" onclick="">${subcategory}<span></span></a></li>
								</ul>
							</c:if>
						</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:if test="${fn:length(subcategory) <= 4}"></ul></c:if>
				</div>
			</div>	
			</c:if>	
			<c:if test="${subcate != null}">
			<c:set var="subcategorylength" value="${requestScope.subcategory}"/>
			<c:set var="subcate" value="${requestScope.subcate}"/>
				<div class="search_box subcate" id="subcateOnOff" style="display:block;">
				<div class="inner">
					<h4 class="tit_th">서브카테고리
					<c:if test="${fn:length(subcategorylength) >= 4}">
						<button id="subcateBtn" class="btnMore" onclick="subcateOnOff();">열기/닫기</button>
					</c:if>
					</h4><!-- 버튼은 6개 이상만 노출 --><!-- 카테고리는 서브 텝 존재로 구조가 다름 -->
					<input type="hidden" id="subcateOnOffCheck" value="off">
					
				<c:forEach var="subcategory" items="${requestScope.subcategory}" varStatus="idx">
						<c:choose>
						<c:when test="${idx.index < 4}">
							<c:if test="${idx.index % 4 == 0}">
								<ul class="sublist show" id="subfirstlist">	
									<li><a href="./ProductSelectAction.pro?query=${query}&startrow=0&cate=${cate}&subcate=${subcategory}" id="category_10000010001" onclick="">${subcategory}<span></span></a></li>
							</c:if>
							<c:if test="${idx.index % 4 == 1}">
								<li><a href="./ProductSelectAction.pro?query=${query}&startrow=0&cate=${cate}&subcate=${subcategory}" id="category_10000010001" onclick="">${subcategory}<span></span></a></li>
							</c:if>
							<c:if test="${idx.index % 4 == 2}">
								<li><a href="./ProductSelectAction.pro?query=${query}&startrow=0&cate=${cate}&subcate=${subcategory}" id="category_10000010001" onclick="">${subcategory}<span></span></a></li>
							</c:if>
							<c:if test="${idx.index % 4 == 3}">
								<li><a href="./ProductSelectAction.pro?query=${query}&startrow=0&cate=${cate}&subcate=${subcategory}" id="category_10000010001" onclick="">${subcategory}<span></span></a></li>
								</ul>
							</c:if>
						</c:when>
						<c:otherwise>
							<c:if test="${idx.index % 4 == 0}">
								<ul class="sublist ">	
									<li><a href="./ProductSelectAction.pro?query=${query}&startrow=0&cate=${cate}&subcate=${subcategory}" id="category_10000010001" onclick="">${subcategory}<span></span></a></li>
							</c:if>
							<c:if test="${idx.index % 4 == 1}">
								<li><a href="./ProductSelectAction.pro?query=${query}&startrow=0&cate=${cate}&subcate=${subcategory}" id="category_10000010001" onclick="">${subcategory}<span></span></a></li>
							</c:if>
							<c:if test="${idx.index % 4 == 2}">
								<li><a href="./ProductSelectAction.pro?query=${query}&startrow=0&cate=${cate}&subcate=${subcategory}" id="category_10000010001" onclick="">${subcategory}<span></span></a></li>
							</c:if>
							<c:if test="${idx.index % 4 == 3}">
								<li><a href="./ProductSelectAction.pro?query=${query}&startrow=0&cate=${cate}&subcate=${subcategory}" id="category_10000010001" onclick="">${subcategory}<span></span></a></li>
								</ul>
							</c:if>
						</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:if test="${fn:length(subcategory) <= 4}"></ul></c:if>
				</div>
			</div>	
			</c:if>							
				<!-- //서브카테고리 -->
			<div class="search_box brand" id="brandOnOff">
				<div class="inner">
					<h4 class="tit_th">브랜드<button class="btnMore" onclick="brandOnOff();">열기/닫기</button></h4>
					<input type="hidden" id="brandOnOffCheck" value="off">
					<ul class="list scrbar">
					<c:forEach var="brand" items="${requestScope.brand}" varStatus="idx">
						<li><input type="checkbox" id="" name="brand_check" value="A000451" onclick=""><label for="inpChk1_A000451">${brand}</label></li>
					</c:forEach>
					</ul>
					</div>
				</div><!-- //브랜드 -->
				<!-- //카테고리 -->
		<div class="search_box">
			<div class="inner">
				<h4 class="tit_th">가격대</h4>
				<div class="priceSearch">
					<input type="text" id="sale_below_price" name="sale_below_price" placeholder="최저가" value="" title=""><span>~</span>
					<input type="text" id="sale_over_price" name="sale_over_price" placeholder="최고가" value="" title="">
					<input type="submit" value="가격대 적용" title="가격대 적용" onclick="return Price_Search()">
				</div>
			</div>
		</div><!-- //가격대 -->
	</div>
			<!-- // 상품 속성 정보 검색 서비스 개선 -->
			<!-- 원래꺼 -->
				<p class="cate_info_tx">전체
				 <span>
				${count}</span>개의 상품이 등록되어 있습니다.</p>
			<!-- bFirstSearch -->
			<!-- 상품 정렬 조건 영역 -->
			<div class="cate_align_box">
				<div class="align_sort"> 
					<ul>
						<li class="on"><a href="" onclick="">인기순</a></li>
						<li><a href="" onclick="">최근등록순</a></li>
						<li><a href="" onclick="">판매수량순</a></li>
						<li><a href="" onclick="">낮은 가격순</a></li>
						<li><a href="" onclick="">높은 가격순</a></li>
					</ul>
				</div>
				<div class="type_sort" style="float: right;">
					<button class="btn_thumb active">컬럼형식으로 보기</button>
					<button class="btn_list">리스트형식으로 보기</button>
				</div> 
			</div>
			<!--// 상품 정렬 조건 영역 -->  
			
			<!-- 카테고리 상품 리스트 --> 
			<!-- 컬럼형 리스트 -->
		<c:forEach var="productList" items="${requestScope.productList}" varStatus="idx">
			<c:choose>
				<c:when test="${idx.index % 4 == 0}">
					<ul id="w_cate_prd_list" class="cate_prd_list"><!-- 1단형일 경우 클래스 list_type 추가 -->
					<li class="flag">
						<div class="prd_info ">
						<!-- 이미지 영역 -->
						<a href="" class="prd_thumb">
							<img src="./asset/image/product_sum.jpg" alt="이미지 썸네일">
						</a>
						<!--// 이미지 영역 -->
						<!-- 상품명 -->
						<div class="prd_name">
							<a href="">
								<span class="tx_brand">${productList.brand}</span>
								<p class="tx_name">${productList.product_name}</p>
							</a>							
						</div>
						<!--// 상품명  -->
						<!-- 상품가격 영역 -->
						<p class="prd_price">
							<span class="tx_org"><span class="tx_num">${productList.product_price}</span>원</span>
							<span class="tx_cur"><span class="tx_num">${productList.product_price-productList.product_sale_price}</span>원</span>
						</p>
						<!--// 상품가격 영역 -->
						</div>
					</li>
				</c:when>
				<c:when test="${idx.index % 4 == 1}">
					<li class="flag">
						<div class="prd_info ">
						<!-- 이미지 영역 -->
						<a href="" class="prd_thumb">
							<img src="./asset/image/product_sum.jpg" alt="이미지 썸네일">
						</a>
						<!--// 이미지 영역 -->
						<!-- 상품명 -->
						<div class="prd_name">
							<a href="">
								<span class="tx_brand">${productList.brand}</span>
								<p class="tx_name">${productList.product_name}</p>
							</a>							
						</div>
						<!--// 상품명  -->
						<!-- 상품가격 영역 -->
						<p class="prd_price">
							<span class="tx_org"><span class="tx_num">${productList.product_price}</span>원</span>
							<span class="tx_cur"><span class="tx_num">${productList.product_price-productList.product_sale_price}</span>원</span>
						</p>
						<!--// 상품가격 영역 -->
						</div>
					</li>
				</c:when>
				<c:when test="${idx.index % 4 == 2}">
					<li class="flag">
						<div class="prd_info ">
						<!-- 이미지 영역 -->
						<a href="" class="prd_thumb">
							<img src="./asset/image/product_sum.jpg" alt="이미지 썸네일">
						</a>
						<!--// 이미지 영역 -->
						<!-- 상품명 -->
						<div class="prd_name">
							<a href="">
								<span class="tx_brand">${productList.brand}</span>
								<p class="tx_name">${productList.product_name}</p>
							</a>							
						</div>
						<!--// 상품명  -->
						<!-- 상품가격 영역 -->
						<p class="prd_price">
							<span class="tx_org"><span class="tx_num">${productList.product_price}</span>원</span>
							<span class="tx_cur"><span class="tx_num">${productList.product_price-productList.product_sale_price}</span>원</span>
						</p>
						<!--// 상품가격 영역 -->
						</div>
					</li>
				</c:when>
				<c:when test="${idx.index % 4 == 3}">
					<li class="flag">
						<div class="prd_info ">
						<!-- 이미지 영역 -->
						<a href="" class="prd_thumb">
							<img src="./asset/image/product_sum.jpg" alt="이미지 썸네일">
						</a>
						<!--// 이미지 영역 -->
						<!-- 상품명 -->
						<div class="prd_name">
							<a href="">
								<span class="tx_brand">${productList.brand}</span>
								<p class="tx_name">${productList.product_name}</p>
							</a>							
						</div>
						<!--// 상품명  -->
						<!-- 상품가격 영역 -->
						<p class="prd_price">
							<span class="tx_org"><span class="tx_num">${productList.product_price}</span>원</span>
							<span class="tx_cur"><span class="tx_num">${productList.product_price-productList.product_sale_price}</span>원</span>
						</p>
						<!--// 상품가격 영역 -->
						</div>
					</li>
					</ul>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:if test="${fn:length(productList)%4 != 0}"></ul></c:if>
			<!--// 컬럼형 리스트 -->
			<!--// 카테고리 상품 리스트 -->
			<!-- pageing start -->
			<!--<div class="pageing">
				<strong title="현재 페이지">1</strong><a href="" onclick="" title="Paging"> 2 </a><a href="" onclick="" title="Paging"> 3 </a><a href="" onclick="" title="Paging"> 4 </a><a href="" onclick="" title="Paging"> 5 </a><a href="" onclick="" title="Paging"> 6 </a><a href="" onclick="" title="Paging"> 7 </a><a href="" onclick="" title="Paging"> 8 </a><a href="" onclick="" title="Paging"> 9 </a><a href="" onclick="" title="Paging"> 10 </a><a class="next" href="" onclick="" title="Next Page">다음 페이지</a>
			-->
			<div class="pageing">
				<c:set var="i" value="1" />
				<c:set var="j" value="0" />
				<c:set var="startrow" value="${requestScope.startrow}"/>
				<c:forEach begin="0" end="${count}" varStatus="idx">
					<c:if test="${idx.index % 24 == 0}">
						<c:choose>
							<c:when test="${startrow==j}"><a href="./ProductSelectAction.pro?query=${query}&startrow=${(i-1)*24}&cate=${cate}&subcate=${subcate}" title="Paging" class="page123 on"> ${idx.index%24+i} </a></c:when>
							<c:otherwise><a href="./ProductSelectAction.pro?query=${query}&startrow=${(i-1)*24}&cate=${cate}&subcate=${subcate}" title="Paging" class="page123"> ${idx.index%24+i} </a></c:otherwise>
						</c:choose>
						<c:set var="i" value="${i+1}"/>
					</c:if>
					<c:set var="j" value="${j+1}"/>
				</c:forEach>
			</div>
			<!-- //pageing end -->			
		<!-- </div> -->
		
		</div>
		<!-- //#Contents -->
	</div>
	<!-- //#Container -->

	<!-- 2017-02-23 수정 : TOP 바로가기 버튼 추가 -->
	<div id="directTop" style="display: block;">
		<button><span></span>TOP</button>
	</div>
	<!--// 2017-02-23 수정 : TOP 바로가기 버튼 추가 -->
	
	<!-- #Footer -->
	<jsp:include page="./include/Footer.jsp"/>
	<!-- //#Footer -->
</body>
</html>