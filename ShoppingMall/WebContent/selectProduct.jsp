<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="./asset/css/global.css"/> 
<link rel="stylesheet" href="./asset/css/selectProduct.css"/> 
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

</script>
</head>
<body>

<!-- header -->
<jsp:include page="./include/Header.jsp"/>
<!-- header// -->

<!-- #Container -->
	<div id="Container">
		<!-- #Contents -->
		<div id="Contents">
			<!-- 검색어오류 영역 추가 (2017-01-13 추가)  -->
			<div class="searchResultArea"> 
				<p class="resultTxt"><strong>로션</strong>검색결과 (전체 <span>364개</span>의 상품)					
				</p>
				<div class="searchWrap">
					<input type="text" title="결과 내 검색창" placeholder="결과 내 검색" id="reChk">
					<input type="submit" value="검색" title="검색" onclick="return reSearch()">
				</div>
			</div>
			<!-- 연관검색어 -->			
			<div class="relatedSearch" style="display:none;">
				<div class="tit"><span>연관검색어</span></div>
				<div class="link" id="recommend">
				</div>
				<button class="btn_more">더보기</button>
			</div>			
			<!-- //연관검색어 -->
			<!-- 상품 속성 정보 검색 서비스 개선 -->
			<div class="detailSearch new">
			    <!-- 카테고리 -->
				<div class="search_box cate" id="cateOnOff">
				<div class="inner">
					<h4 class="tit_th">카테고리<button class="btnMore" onclick="cateOnOff();">열기/닫기</button></h4><!-- 버튼은 6개 이상만 노출 --><!-- 카테고리는 서브 텝 존재로 구조가 다름 -->
					<input type="hidden" id="cateOnOffCheck" value="off">
					<ul class="list show">	
						<li><a href="" id="category_10000010001" onclick="">스킨케어<span></span></a></li>
						<li><a href="" id="category_10000010003" onclick="">바디케어<span></span></a></li>
						<li><a href="" id="category_10000010007" onclick="">남성<span></span></a></li>
						<li><a href="" id="category_10000030004" onclick="">베이비<span></span></a></li>
						<li><a href="" id="category_10000010004" onclick="">헤어케어<span></span></a></li>
					</ul>
					<ul class="list " id="catelist">	<!-- cateId.equals("") -->
						<li><a href="" id="category_10000020003" onclick="">건강/위생용품<span></span></a></li>
						<li><a href="" id="category_10000010005" onclick="">향수/디퓨저<span></span></a></li>
						<li><a href="" id="category_10000010002" onclick="">메이크업<span></span></a></li>
						<li><a href="" id="category_10000010006" onclick="">미용소품<span></span></a></li>
						<li><a href="" id="category_10000030003" onclick="">반려동물<span></span></a></li>
					</ul>
			<!-- //1카테고리 종료 -->	
				</div>
			</div>								
				<!-- //카테고리 -->
			<div class="search_box brand" id="brandOnOff">
				<div class="inner">
					<h4 class="tit_th">브랜드<button class="btnMore" onclick="brandOnOff();">열기/닫기</button></h4>
					<input type="hidden" id="brandOnOffCheck" value="off">
					<ul class="list scrbar">	
						<li><input type="checkbox" id="inpChk1_A000451" name="brand_check" value="A000451" onclick=""><label for="inpChk1_A000451">바이오더마</label></li>
						<li><input type="checkbox" id="inpChk1_A000003" name="brand_check" value="A000003" onclick=""><label for="inpChk1_A000003">아벤느</label></li>
						<li><input type="checkbox" id="inpChk1_A000517" name="brand_check" value="A000517" onclick=""><label for="inpChk1_A000517">하다라보</label></li>
						<li><input type="checkbox" id="inpChk1_A001468" name="brand_check" value="A001468" onclick=""><label for="inpChk1_A001468">오스트레일리안골드</label></li>
						<li><input type="checkbox" id="inpChk1_A001641" name="brand_check" value="A001641" onclick=""><label for="inpChk1_A001641">크리니크</label></li>
						<li><input type="checkbox" id="inpChk1_A000565" name="brand_check" value="A000565" onclick=""><label for="inpChk1_A000565">세타필</label></li>
						<li><input type="checkbox" id="inpChk1_A000044" name="brand_check" value="A000044" onclick=""><label for="inpChk1_A000044">뉴트로지나</label></li>
						<li><input type="checkbox" id="inpChk1_A000426" name="brand_check" value="A000426" onclick=""><label for="inpChk1_A000426">닥터자르트</label></li>
						<li><input type="checkbox" id="inpChk1_A000859" name="brand_check" value="A000859" onclick=""><label for="inpChk1_A000859">랩시리즈</label></li>
						<li><input type="checkbox" id="inpChk1_A000290" name="brand_check" value="A000290" onclick=""><label for="inpChk1_A000290">아비노</label></li>
						<li><input type="checkbox" id="inpChk1_A000204" name="brand_check" value="A000204" onclick=""><label for="inpChk1_A000204">존슨즈</label></li>
						<li><input type="checkbox" id="inpChk1_A002481" name="brand_check" value="A002481" onclick=""><label for="inpChk1_A002481">헤지스 맨 룰429</label></li>
						<li><input type="checkbox" id="inpChk1_A000049" name="brand_check" value="A000049" onclick=""><label for="inpChk1_A000049">니베아</label></li>
						<li><input type="checkbox" id="inpChk1_A000288" name="brand_check" value="A000288" onclick=""><label for="inpChk1_A000288">엠도씨</label></li>
						<li><input type="checkbox" id="inpChk1_A000968" name="brand_check" value="A000968" onclick=""><label for="inpChk1_A000968">일리윤</label></li>
						<li><input type="checkbox" id="inpChk1_A002294" name="brand_check" value="A002294" onclick=""><label for="inpChk1_A002294">필로소피</label></li>
						<li><input type="checkbox" id="inpChk1_A002789" name="brand_check" value="A002789" onclick=""><label for="inpChk1_A002789">더바디샵</label></li>
						<li><input type="checkbox" id="inpChk1_A002513" name="brand_check" value="A002513" onclick=""><label for="inpChk1_A002513">록시땅</label></li>
						<li><input type="checkbox" id="inpChk1_A000985" name="brand_check" value="A000985" onclick=""><label for="inpChk1_A000985">더마비</label></li>
						<li><input type="checkbox" id="inpChk1_A002630" name="brand_check" value="A002630" onclick=""><label for="inpChk1_A002630">러쉬</label></li>
						<li><input type="checkbox" id="inpChk1_A001601" name="brand_check" value="A001601" onclick=""><label for="inpChk1_A001601">닥터틸즈</label></li>
						<li><input type="checkbox" id="inpChk1_A000866" name="brand_check" value="A000866" onclick=""><label for="inpChk1_A000866">더블유드레스룸</label></li>
						<li><input type="checkbox" id="inpChk1_A001034" name="brand_check" value="A001034" onclick=""><label for="inpChk1_A001034">더블하트</label></li>
						<li><input type="checkbox" id="inpChk1_A001218" name="brand_check" value="A001218" onclick=""><label for="inpChk1_A001218">더프트앤도프트</label></li>
						<li><input type="checkbox" id="inpChk1_A000791" name="brand_check" value="A000791" onclick=""><label for="inpChk1_A000791">디티알티</label></li>
						<li><input type="checkbox" id="inpChk1_A000954" name="brand_check" value="A000954" onclick=""><label for="inpChk1_A000954">라로슈포제</label></li>
						<li><input type="checkbox" id="inpChk1_A001306" name="brand_check" value="A001306" onclick=""><label for="inpChk1_A001306">라운드어라운드</label></li>
						<li><input type="checkbox" id="inpChk1_A001722" name="brand_check" value="A001722" onclick=""><label for="inpChk1_A001722">로벡틴</label></li>
						<li><input type="checkbox" id="inpChk1_A000888" name="brand_check" value="A000888" onclick=""><label for="inpChk1_A000888">바디판타지</label></li>
						<li><input type="checkbox" id="inpChk1_A000774" name="brand_check" value="A000774" onclick=""><label for="inpChk1_A000774">불독</label></li>
						<li><input type="checkbox" id="inpChk1_A000883" name="brand_check" value="A000883" onclick=""><label for="inpChk1_A000883">아토팜</label></li>
						<li><input type="checkbox" id="inpChk1_A000828" name="brand_check" value="A000828" onclick=""><label for="inpChk1_A000828">우르오스</label></li>
						<li><input type="checkbox" id="inpChk1_A001775" name="brand_check" value="A001775" onclick=""><label for="inpChk1_A001775">쿤달</label></li>
						<li><input type="checkbox" id="inpChk1_A001444" name="brand_check" value="A001444" onclick=""><label for="inpChk1_A001444">클로란</label></li>
						<li><input type="checkbox" id="inpChk1_A001127" name="brand_check" value="A001127" onclick=""><label for="inpChk1_A001127">트리헛</label></li>
						<li><input type="checkbox" id="inpChk1_A001424" name="brand_check" value="A001424" onclick=""><label for="inpChk1_A001424">궁중비책</label></li>
						<li><input type="checkbox" id="inpChk1_A000397" name="brand_check" value="A000397" onclick=""><label for="inpChk1_A000397">그린핑거</label></li>
						<li><input type="checkbox" id="inpChk1_A000486" name="brand_check" value="A000486" onclick=""><label for="inpChk1_A000486">눅스</label></li>
						<li><input type="checkbox" id="inpChk1_A000447" name="brand_check" value="A000447" onclick=""><label for="inpChk1_A000447">닥터브로너스</label></li>
						<li><input type="checkbox" id="inpChk1_A000786" name="brand_check" value="A000786" onclick=""><label for="inpChk1_A000786">무스텔라</label></li>
						<li><input type="checkbox" id="inpChk1_A002545" name="brand_check" value="A002545" onclick=""><label for="inpChk1_A002545">버블티</label></li>
						<li><input type="checkbox" id="inpChk1_A000471" name="brand_check" value="A000471" onclick=""><label for="inpChk1_A000471">버츠비</label></li>
						<li><input type="checkbox" id="inpChk1_A000093" name="brand_check" value="A000093" onclick=""><label for="inpChk1_A000093">보닌</label></li>
						<li><input type="checkbox" id="inpChk1_A000143" name="brand_check" value="A000143" onclick=""><label for="inpChk1_A000143">세인트이브스</label></li>
						<li><input type="checkbox" id="inpChk1_A001642" name="brand_check" value="A001642" onclick=""><label for="inpChk1_A001642">오리진스</label></li>
						<li><input type="checkbox" id="inpChk1_A000615" name="brand_check" value="A000615" onclick=""><label for="inpChk1_A000615">온더바디</label></li>
						<li><input type="checkbox" id="inpChk1_A000697" name="brand_check" value="A000697" onclick=""><label for="inpChk1_A000697">유세린</label></li>
						<li><input type="checkbox" id="inpChk1_A001042" name="brand_check" value="A001042" onclick=""><label for="inpChk1_A001042">캐스키드슨</label></li>
						<li><input type="checkbox" id="inpChk1_A000065" name="brand_check" value="A000065" onclick=""><label for="inpChk1_A000065">해피바스</label></li>
						<li><input type="checkbox" id="inpChk1_A000033" name="brand_check" value="A000033" onclick=""><label for="inpChk1_A000033">겐조</label></li>
						<li><input type="checkbox" id="inpChk1_A001316" name="brand_check" value="A001316" onclick=""><label for="inpChk1_A001316">다슈</label></li>
						<li><input type="checkbox" id="inpChk1_A000014" name="brand_check" value="A000014" onclick=""><label for="inpChk1_A000014">라끄베르</label></li>
						<li><input type="checkbox" id="inpChk1_A002699" name="brand_check" value="A002699" onclick=""><label for="inpChk1_A002699">라마린</label></li>
						<li><input type="checkbox" id="inpChk1_A001328" name="brand_check" value="A001328" onclick=""><label for="inpChk1_A001328">라우쉬</label></li>
						<li><input type="checkbox" id="inpChk1_A000084" name="brand_check" value="A000084" onclick=""><label for="inpChk1_A000084">로레알 파리</label></li>
						<li><input type="checkbox" id="inpChk1_A000129" name="brand_check" value="A000129" onclick=""><label for="inpChk1_A000129">린든리브즈</label></li>
						<li><input type="checkbox" id="inpChk1_A001924" name="brand_check" value="A001924" onclick=""><label for="inpChk1_A001924">마녀공장</label></li>
						<li><input type="checkbox" id="inpChk1_A000059" name="brand_check" value="A000059" onclick=""><label for="inpChk1_A000059">바세린</label></li>
					</ul>
					</div>
				</div><!-- //브랜드 -->
				<!-- //카테고리 -->
		<div class="search_box attBox" id="attBoxOnOff">
			<div class="inner ">
				<h4 class="tit_th">제형<button class="btnMore" onclick="attBoxOnOff();">열기/닫기</button></h4>
				<input type="hidden" id="attBoxOnOffCheck" value="off">
				<ul class="list scrbar">
					<li><input type="checkbox" id="inpChk1_68fb5e6665b2dbfd620460c2971008ea" name="attr_check0" value="68fb5e6665b2dbfd620460c2971008ea" onclick="javascript:attrOnclick(0);"><label for="inpChk1_68fb5e6665b2dbfd620460c2971008ea">크림/로션</label></li>  
					<li><input type="checkbox" id="inpChk1_1ceab9c793694e6ffe96b9d72642aa6f" name="attr_check0" value="1ceab9c793694e6ffe96b9d72642aa6f" onclick="javascript:attrOnclick(0);"><label for="inpChk1_1ceab9c793694e6ffe96b9d72642aa6f">밀크</label></li>  
					<li><input type="checkbox" id="inpChk1_1a168dbb039e32b676d1945183670650" name="attr_check0" value="1a168dbb039e32b676d1945183670650" onclick="javascript:attrOnclick(0);"><label for="inpChk1_1a168dbb039e32b676d1945183670650">리퀴드</label></li>  
					<li><input type="checkbox" id="inpChk1_18e386fcca6b2010d16c276d8284e926" name="attr_check0" value="18e386fcca6b2010d16c276d8284e926" onclick="javascript:attrOnclick(0);"><label for="inpChk1_18e386fcca6b2010d16c276d8284e926">겔/젤</label></li>  
					<li><input type="checkbox" id="inpChk1_41efb1311e502a67f044b933ac03f89d" name="attr_check0" value="41efb1311e502a67f044b933ac03f89d" onclick="javascript:attrOnclick(0);"><label for="inpChk1_41efb1311e502a67f044b933ac03f89d">오일스프레이</label></li>  
					<li><input type="checkbox" id="inpChk1_a04e7065506d31f272b2fa4a0df7c6af" name="attr_check0" value="a04e7065506d31f272b2fa4a0df7c6af" onclick="javascript:attrOnclick(0);"><label for="inpChk1_a04e7065506d31f272b2fa4a0df7c6af">밤</label></li>  
					<li><input type="checkbox" id="inpChk1_6cc50a364cf6c0231a9584d71569f5c1" name="attr_check0" value="6cc50a364cf6c0231a9584d71569f5c1" onclick="javascript:attrOnclick(0);"><label for="inpChk1_6cc50a364cf6c0231a9584d71569f5c1">스틱</label></li>  
					<li><input type="checkbox" id="inpChk1_55eed05306531ec0bd7f4410deb175e0" name="attr_check0" value="55eed05306531ec0bd7f4410deb175e0" onclick="javascript:attrOnclick(0);"><label for="inpChk1_55eed05306531ec0bd7f4410deb175e0">오일</label></li>  
				</ul>
			</div>	
		</div><!-- //속성항목 -->
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
				364</span>개의 상품이 등록되어 있습니다.</p>
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
								<span class="tx_brand">아벤느</span>
								<p class="tx_name">아벤느 젠틀 토닝 로션 200ml +100ml   기획</p>
							</a>							
						</div>
						<!--// 상품명  -->
						<!-- 상품가격 영역 -->
						<p class="prd_price">
							<span class="tx_org"><span class="tx_num">27,000</span>원</span>
							<span class="tx_cur"><span class="tx_num">21,600</span>원</span>
						</p>
						<!--// 상품가격 영역 -->
					</div>
				</li>
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
								<span class="tx_brand">아벤느</span>
								<p class="tx_name">아벤느 젠틀 토닝 로션 200ml +100ml   기획</p>
							</a>							
						</div>
						<!--// 상품명  -->
						<!-- 상품가격 영역 -->
						<p class="prd_price">
							<span class="tx_org"><span class="tx_num">27,000</span>원</span>
							<span class="tx_cur"><span class="tx_num">21,600</span>원</span>
						</p>
					</div>
				</li>
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
								<span class="tx_brand">아벤느</span>
								<p class="tx_name">아벤느 젠틀 토닝 로션 200ml +100ml   기획</p>
							</a>							
						</div>
						<!--// 상품명  -->
						<!-- 상품가격 영역 -->
						<p class="prd_price">
							<span class="tx_org"><span class="tx_num">27,000</span>원</span>
							<span class="tx_cur"><span class="tx_num">21,600</span>원</span>
						</p>
					</div>
				</li>
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
								<span class="tx_brand">아벤느</span>
								<p class="tx_name">아벤느 젠틀 토닝 로션 200ml +100ml   기획</p>
							</a>							
						</div>
						<!--// 상품명  -->
						<!-- 상품가격 영역 -->
						<p class="prd_price">
							<span class="tx_org"><span class="tx_num">27,000</span>원</span>
							<span class="tx_cur"><span class="tx_num">21,600</span>원</span>
						</p>
					</div>
				</li>
			</ul>			
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
								<span class="tx_brand">아벤느</span>
								<p class="tx_name">아벤느 젠틀 토닝 로션 200ml +100ml   기획</p>
							</a>							
						</div>
						<!--// 상품명  -->
						<!-- 상품가격 영역 -->
						<p class="prd_price">
							<span class="tx_org"><span class="tx_num">27,000</span>원</span>
							<span class="tx_cur"><span class="tx_num">21,600</span>원</span>
						</p>
						<!--// 상품가격 영역 -->
					</div>
				</li>
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
								<span class="tx_brand">아벤느</span>
								<p class="tx_name">아벤느 젠틀 토닝 로션 200ml +100ml   기획</p>
							</a>							
						</div>
						<!--// 상품명  -->
						<!-- 상품가격 영역 -->
						<p class="prd_price">
							<span class="tx_org"><span class="tx_num">27,000</span>원</span>
							<span class="tx_cur"><span class="tx_num">21,600</span>원</span>
						</p>
					</div>
				</li>
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
								<span class="tx_brand">아벤느</span>
								<p class="tx_name">아벤느 젠틀 토닝 로션 200ml +100ml   기획</p>
							</a>							
						</div>
						<!--// 상품명  -->
						<!-- 상품가격 영역 -->
						<p class="prd_price">
							<span class="tx_org"><span class="tx_num">27,000</span>원</span>
							<span class="tx_cur"><span class="tx_num">21,600</span>원</span>
						</p>
					</div>
				</li>
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
								<span class="tx_brand">아벤느</span>
								<p class="tx_name">아벤느 젠틀 토닝 로션 200ml +100ml   기획</p>
							</a>							
						</div>
						<!--// 상품명  -->
						<!-- 상품가격 영역 -->
						<p class="prd_price">
							<span class="tx_org"><span class="tx_num">27,000</span>원</span>
							<span class="tx_cur"><span class="tx_num">21,600</span>원</span>
						</p>
					</div>
				</li>
			</ul>	
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
								<span class="tx_brand">아벤느</span>
								<p class="tx_name">아벤느 젠틀 토닝 로션 200ml +100ml   기획</p>
							</a>							
						</div>
						<!--// 상품명  -->
						<!-- 상품가격 영역 -->
						<p class="prd_price">
							<span class="tx_org"><span class="tx_num">27,000</span>원</span>
							<span class="tx_cur"><span class="tx_num">21,600</span>원</span>
						</p>
						<!--// 상품가격 영역 -->
					</div>
				</li>
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
								<span class="tx_brand">아벤느</span>
								<p class="tx_name">아벤느 젠틀 토닝 로션 200ml +100ml   기획</p>
							</a>							
						</div>
						<!--// 상품명  -->
						<!-- 상품가격 영역 -->
						<p class="prd_price">
							<span class="tx_org"><span class="tx_num">27,000</span>원</span>
							<span class="tx_cur"><span class="tx_num">21,600</span>원</span>
						</p>
					</div>
				</li>
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
								<span class="tx_brand">아벤느</span>
								<p class="tx_name">아벤느 젠틀 토닝 로션 200ml +100ml   기획</p>
							</a>							
						</div>
						<!--// 상품명  -->
						<!-- 상품가격 영역 -->
						<p class="prd_price">
							<span class="tx_org"><span class="tx_num">27,000</span>원</span>
							<span class="tx_cur"><span class="tx_num">21,600</span>원</span>
						</p>
					</div>
				</li>
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
								<span class="tx_brand">아벤느</span>
								<p class="tx_name">아벤느 젠틀 토닝 로션 200ml +100ml   기획</p>
							</a>							
						</div>
						<!--// 상품명  -->
						<!-- 상품가격 영역 -->
						<p class="prd_price">
							<span class="tx_org"><span class="tx_num">27,000</span>원</span>
							<span class="tx_cur"><span class="tx_num">21,600</span>원</span>
						</p>
					</div>
				</li>
			</ul>	
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
								<span class="tx_brand">아벤느</span>
								<p class="tx_name">아벤느 젠틀 토닝 로션 200ml +100ml   기획</p>
							</a>							
						</div>
						<!--// 상품명  -->
						<!-- 상품가격 영역 -->
						<p class="prd_price">
							<span class="tx_org"><span class="tx_num">27,000</span>원</span>
							<span class="tx_cur"><span class="tx_num">21,600</span>원</span>
						</p>
						<!--// 상품가격 영역 -->
					</div>
				</li>
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
								<span class="tx_brand">아벤느</span>
								<p class="tx_name">아벤느 젠틀 토닝 로션 200ml +100ml   기획</p>
							</a>							
						</div>
						<!--// 상품명  -->
						<!-- 상품가격 영역 -->
						<p class="prd_price">
							<span class="tx_org"><span class="tx_num">27,000</span>원</span>
							<span class="tx_cur"><span class="tx_num">21,600</span>원</span>
						</p>
					</div>
				</li>
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
								<span class="tx_brand">아벤느</span>
								<p class="tx_name">아벤느 젠틀 토닝 로션 200ml +100ml   기획</p>
							</a>							
						</div>
						<!--// 상품명  -->
						<!-- 상품가격 영역 -->
						<p class="prd_price">
							<span class="tx_org"><span class="tx_num">27,000</span>원</span>
							<span class="tx_cur"><span class="tx_num">21,600</span>원</span>
						</p>
					</div>
				</li>
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
								<span class="tx_brand">아벤느</span>
								<p class="tx_name">아벤느 젠틀 토닝 로션 200ml +100ml   기획</p>
							</a>							
						</div>
						<!--// 상품명  -->
						<!-- 상품가격 영역 -->
						<p class="prd_price">
							<span class="tx_org"><span class="tx_num">27,000</span>원</span>
							<span class="tx_cur"><span class="tx_num">21,600</span>원</span>
						</p>
					</div>
				</li>
			</ul>
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
								<span class="tx_brand">아벤느</span>
								<p class="tx_name">아벤느 젠틀 토닝 로션 200ml +100ml   기획</p>
							</a>							
						</div>
						<!--// 상품명  -->
						<!-- 상품가격 영역 -->
						<p class="prd_price">
							<span class="tx_org"><span class="tx_num">27,000</span>원</span>
							<span class="tx_cur"><span class="tx_num">21,600</span>원</span>
						</p>
						<!--// 상품가격 영역 -->
					</div>
				</li>
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
								<span class="tx_brand">아벤느</span>
								<p class="tx_name">아벤느 젠틀 토닝 로션 200ml +100ml   기획</p>
							</a>							
						</div>
						<!--// 상품명  -->
						<!-- 상품가격 영역 -->
						<p class="prd_price">
							<span class="tx_org"><span class="tx_num">27,000</span>원</span>
							<span class="tx_cur"><span class="tx_num">21,600</span>원</span>
						</p>
					</div>
				</li>
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
								<span class="tx_brand">아벤느</span>
								<p class="tx_name">아벤느 젠틀 토닝 로션 200ml +100ml   기획</p>
							</a>							
						</div>
						<!--// 상품명  -->
						<!-- 상품가격 영역 -->
						<p class="prd_price">
							<span class="tx_org"><span class="tx_num">27,000</span>원</span>
							<span class="tx_cur"><span class="tx_num">21,600</span>원</span>
						</p>
					</div>
				</li>
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
								<span class="tx_brand">아벤느</span>
								<p class="tx_name">아벤느 젠틀 토닝 로션 200ml +100ml   기획</p>
							</a>							
						</div>
						<!--// 상품명  -->
						<!-- 상품가격 영역 -->
						<p class="prd_price">
							<span class="tx_org"><span class="tx_num">27,000</span>원</span>
							<span class="tx_cur"><span class="tx_num">21,600</span>원</span>
						</p>
					</div>
				</li>
			</ul>			
			<!--// 컬럼형 리스트 -->
			<!--// 카테고리 상품 리스트 -->
			<!-- pageing start -->
			<div class="pageing">
				<strong title="현재 페이지">1</strong><a href="" onclick="" title="Paging"> 2 </a><a href="" onclick="" title="Paging"> 3 </a><a href="" onclick="" title="Paging"> 4 </a><a href="" onclick="" title="Paging"> 5 </a><a href="" onclick="" title="Paging"> 6 </a><a href="" onclick="" title="Paging"> 7 </a><a href="" onclick="" title="Paging"> 8 </a><a href="" onclick="" title="Paging"> 9 </a><a href="" onclick="" title="Paging"> 10 </a><a class="next" href="" onclick="" title="Next Page">다음 페이지</a>
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