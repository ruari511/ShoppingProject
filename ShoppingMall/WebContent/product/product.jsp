<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./asset/css/global.css"/> 
<link rel="stylesheet" href="./asset/css/product.css"/> 
<% String id = (String)session.getAttribute("id"); %>
<script type="text/javascript">
function minuscount(num){
	var product_price = document.getElementById("product_price").value;
	var count = Number(document.getElementById("product_count").value) + num;
	
	if(count<1){
		count=1;
		alert("최소 1개이상 구매할 수 있는 상품입니다.");
	}
	document.getElementById("product_count").value = count;
	document.getElementById("totalPrice").value = product_price*count;
	document.getElementById("totalPriceTxt").innerHTML = product_price*count;
}

function pluscount(num){
	var product_price = document.getElementById("product_price").value;
	var count = Number(document.getElementById("product_count").value) + num;
	
	document.getElementById("product_count").value = count;
	document.getElementById("totalPrice").value = product_price*count;
	document.getElementById("totalPriceTxt").innerHTML = product_price*count;
}

function product_detailOn(){
	document.getElementById("productInfo").setAttribute("class", "on");
	document.getElementById("buyInfo").removeAttribute("class");
	document.getElementById("product_detail").style.display="block";
	document.getElementById("buy_detail").style.display="none";
}

function buy_detailOn(){
	document.getElementById("buyInfo").setAttribute("class", "on");
	document.getElementById("productInfo").removeAttribute("class");
	document.getElementById("product_detail").style.display="none";
	document.getElementById("buy_detail").style.display="block";
}

function goCart() {
	var id = '<%=id%>';
	var product_num = document.getElementById("product_num").value;
	var product_count = document.getElementById("product_count").value;
	
	if(id==null){
		location.href="./login.do";
	} else{
		location.href="CartInsertAction.buy?product_num="+product_num+"&product_count="+product_count;
	}
}

function goBuy() {
	var id = '<%=id%>';
	var product_num = document.getElementById("product_num").value;
	var product_count = document.getElementById("product_count").value;
	
	if(id==null){
		location.href="./login.do";
	} else{
		location.href="GoBuyAction.buy?product_num="+product_num+"&product_count="+product_count;
	}
}
</script>
</head>
<body>
<!-- header -->
	<jsp:include page="../include/Header.jsp"/>
<!-- header// -->
	
<div id="Container">
	<div id="Contents">
	<c:set var="product" value="${requestScope.pdto}" />
	<input type="hidden" id="product_num" name="product_num" value="${product.product_num}">
		<!-- 상단 카테고리 history -->
		<div class="page_location">
			<a href="" class="loc_home">홈</a>
			<ul class="loc_history">
				<li>
					<a href="" class="cate_y">${product.category_main}</a>
					<div class="history_cate_box" style="width: 122px;">
						<ul>
							<li><a href="" class="on">${product.category_main}</a></li>
							<li><a href="" class="goods_category1">건강식품</a></li>
							<li><a href="" class="goods_category1">일반식품</a></li>
						</ul>
					</div>
				</li>
				<li>
					<a href="" class="cate_y">${product.category_sub}</a>
					<div class="history_cate_box" style="width: 122px;">
						<ul>
							<li><a href="" class="on">${product.category_sub}</a></li>
							<li><a href="" class="goods_category2">아이케어</a></li>
							<li><a href="" class="goods_category2">여성/위생용품</a></li>
							<li><a href="" class="goods_category2">마사지/교정/헬스용품</a></li>
							<li><a href="" class="goods_category2">스팟패치/의료용품</a></li>
						</ul>
					</div>
				</li>
				<li>
					<a href="" class="cate_y">${product.category_sub}</a>
					<div class="history_cate_box" style="width: 122px;">
						<ul>
							<li><a href="" class="goods_category3">칫솔</a></li>
							<li><a href="" class="on">${product.category_sub}</a></li>
							<li><a href="" class="goods_category3">전동칫솔</a></li>
							<li><a href="" class="goods_category3">치실/치간칫솔</a></li>
							<li><a href="" class="goods_category3">치아미백용품</a></li>
							<li><a href="" class="goods_category3">구강청결용품</a></li>
							<li><a href="" class="goods_category3">칫솔살균기</a></li>
							<li><a href="" class="goods_category3">여행용세트</a></li>
						</ul>
					</div>
				</li>
			</ul>
		</div>
<!-- //상단 카테고리 history -->
		<div class="prd_detail_box">
			<div class="left_area">
				<div class="prd_img">
					<img src="./asset/image/${product.img_main}" alt="상품명 이미지">
				</div>
				<ul class="prd_thumb_list">
					<li class="sel"><a href=""><img src="./asset/image/${product.img_main}" alt="썸네일이미지""></a></li>
					<li class=""><a href=""><img src="./asset/image/${product.img_main}" alt="썸네일이미지"></a></li>
				</ul>
			</div>
			<div class="right_area">
				<div class="prd_info">
				<strong>
					08.19  - 09.05 
				</strong>
					<p class="prd_brand">
						${product.brand}
						<a href="javascript:;" class="link_brand2 goods_brandall" id="moveBrandShop">브랜드 상품 전체보기</a>
					</p>
					<p class="prd_name">[온라인단독] ${product.product_name}</p>
					<p class="prd_flag">				
						<span class="icon_flag sale">세일</span>
					</p>
					<ul class="info_list">
						<li>
							<span class="tx_tit">판매가</span> 
							<span class="tx_cont org_price"><span class="tx_num">${product.product_price}</span>원</span>
						</li>
						<li>
							<span class="tx_tit">세일가</span> 
							<span class="tx_cont cur_price"><span class="tx_num">${product.product_price-product.product_sale_price}</span>원</span>
							<input type="hidden" id="product_price" value="${product.product_price-product.product_sale_price}">
						</li>
						<li>
							<span class="tx_tit">카드할인혜택 <a href="javascript:goods.detail.openCardFullPop();" class="ico_info">카드혜택안내 레이어열기</a></span>
							<span class="tx_cont bene_price">The CJ카드 추가 10%</span>
						</li>
						<li class="line_top">
							<span class="tx_tit">CJ ONE 포인트 예상적립</span>
							<span class="tx_cont">
								<span class="tx_num">2%</span>적립
							</span>
						</li>
	<!-- 노출할 배송비 -->
	<!-- 배송비 계산 -->
	<!-- 노출할 배송비 -->
	<!-- //배송비 계산 -->
						<li class="line_top liNormalDeli">
							<span class="tx_tit">배송비</span>
							<span class="tx_cont">
									<!-- 그외 표기 -->
							<span class="tx_num">2,500</span>원 
								(결제금액 <span class="tx_num">20,000</span>원 이상 무료)
							</span>
						</li>
						<li class="liNormalDeli">
							<span class="tx_tit">배송방법</span>
							<span class="tx_cont">올리브영 배송</span>
						</li>	
						<li class="liNormalDeli">
							<span class="tx_tit">배송기간</span>
							<span class="tx_cont">평균 3일 이내 배송</span>
						</li>
					</ul>
				</div>
				<div class="option_add_area">
					<div class="prd_cnt_box">
						<div class="tit_area"><span>구매수량</span></div>
						<div class="cont_area">
							<span class="option_cnt_box">
								<button class="btnCalc minus" onclick="minuscount(-1);">수량 1감소</button>
								<input type="text" id="product_count" name="product_count" value="1" class="tx_num" title="구매수량">
								<button class="btnCalc plus" onclick="pluscount(1);">수량 1증가</button>
							</span>
						</div>
					</div>
				</div>
				<div class="prd_total_price">
					<span class="tx_tit">상품금액 합계</span>
					<input type="hidden" id="totalPrice" value="${product.product_price-product.product_sale_price}" name="totalPrice">
					<span class="tx_cont"><span class="tx_num" id="totalPriceTxt">${product.product_price-product.product_sale_price}</span>원</span>
				</div>
				<div class="prd_btn_area">
					<button class="btnBasket  goods_cart" onclick="goCart();">장바구니</button>
					<button class="btnBuy goods_buy" id="cartBtn" onclick="goBuy();">구매하기</button>
					<button class="btnZzim  goods_wish">찜하기</button>
				</div>
			</div>
		</div>
		<!-- 큐레이션 2차 S -->
		<div class="curation_area_a003_lead"></div>
		<!-- 큐레이션 2차 E -->
		<ul class="prd_detail_tab" id="tabList">
			<li class="on" id="productInfo"><a onclick="product_detailOn();" class="goods_detailinfo">상세정보</a></li>
			<li id="buyInfo"><a onclick="buy_detailOn();" class="goods_buyinfo">구매정보</a></li>
			<li id="reviewInfo"><a href="javascript:;" class="goods_reputation">상품평<span>(0)</span></a></li>
			<li id="qnaInfo"><a href="javascript:;" class="goods_qna">Q&amp;A<span>(1)</span></a></li>
		</ul>
		
		
		<!-- 상세정보 탭이 on일경우 -->
		<div class="tabConts prd_detail_cont show" id="product_detail" style="display:block;">
			<div class="detail_area">
				<div class="contEditor">
					<img alt="" src="./asset/image/${product.img_contents}">
				</div>
				<div style="text-align:center;padding:20px 0px 0px 0px;">
					<p style="display:inline-block;font-size:14px;border:1px solid #ddd;padding:10px 40px 10px 40px;text-align:center;">본 상품 정보(상품 상세, 상품 설명 등)의 내용은 협력사가 직접 등록한 것 입니다.</p>
				</div>
			</div>
		</div>
		<!-- 상세정보 탭이 on일경우 -->
		
		
		
		
		<!-- 구매정보 탭이 on일경우 -->
		<div class="tabConts prd_detail_cont" id="buy_detail" style="display:none;">
			<h3 class="detail_tit">상품정보 제공고시</h3>
			<div id="artcInfo">		
				<dl class="detail_info_list">
					<dt>품명 및 모델명</dt>
					<dd>루치펠로 치약3종 (온)</dd>
				</dl>
				<dl class="detail_info_list">
					<dt>인증·허가</dt>
					<dd>의약외품</dd>
				</dl>
				<dl class="detail_info_list">
					<dt>제조국</dt>
					<dd>대한민국</dd>
				</dl>
				<dl class="detail_info_list">
					<dt>제조자</dt>
					<dd>금호덴탈제약(주)</dd>
				</dl>
				<dl class="detail_info_list">
					<dt>A/S 책임자 / 전화번호</dt>
					<dd>주식회사 루치펠로코리아 / 070-7750-7970</dd>
				</dl>
			</div>
			<h3 class="detail_tit mgT40">배송안내</h3>
			<dl class="detail_info_list" id="dlexAjaxInfo">
				<dt>배송비/배송가능일</dt>
				<dd>
					<p><strong>배송지역 : </strong>전국</p>
					<p><strong>배송비 : </strong>
			<!-- 그외 표기 -->
						<span>2,500원</span>
					</p>
					<p>올리브영 배송 상품의 총 결제금액 <span>20,000</span>원 이상일 경우 <span>무료배송</span> 됩니다.</p>
					<p>도서, 산간, 오지 일부 지역은 배송비가 추가될 수 있습니다.</p>
					<p><strong>배송가능일 : </strong><span>3</span>일</p>
					배송가능일이란 본 상품을 주문하신 고객님들께 상품 배송이 가능한 기간을 의미합니다. 단, 연휴 및 공휴일은 기간 계산시 제외하며 현금 주문일 경우 입금일 기준 입니다.<br>
					예약 상품의 경우 예약된 날짜에 출고되며, 상품의 입고가 빠르게 진행된 경우 예약일 보다 일찍 배송될 수 있습니다.
				</dd>
			</dl>
			<h3 class="detail_tit mgT40">교환/반품/환불 안내</h3>
			<dl class="detail_info_list">
				<dt>교환/반품 신청 기간</dt>
				<dd>
					교환, 반품 신청은 배송이 완료된 후 15일 이내 가능합니다.<br>
					고객님이 배송 받으신 상품의 내용이 표시∙광고의 내용과 다르거나 계약내용과 다르게 이행된 경우에는  배송 받으신 날로부터 3개월 이내, 혹은 그 사실을 알 수 있었던 날로 부터 30일 이내에 가능합니다.
				</dd>
			</dl>
			<dl class="detail_info_list">
				<dt>교환/반품/회수 비용</dt>
				<dd>
					고객님의 사유에 의한 교환 및 반품은 회수 및 배송에 필요한 비용을 부담해주셔야 합니다.<br>
					기본 비용은 교환 5,000원(회수비+배송비), 반품 2,500원(회수비)입니다.<br>
					제주도 및 도서산간 지방에는 추가 운임이 발생합니다.<br>
					당사의 사유(상품의 하자, 배송의 오류 등)로 인한 경우 교환 및 반품에 필요한 비용은 당사에서 부담합니다.
				</dd>
			</dl>
			<dl class="detail_info_list">
				<dt>교환/반품 불가안내</dt>
				<dd>
					고객님의 사유에 의한 교환 및 반품이 불가한 경우<br>
					1. 배송이 완료된 후 7일이 경과한 경우<br>
					2. 포장 훼손 및 사용 또는 일부 소비, 구성품 누락 및 상품의 결함 발생으로 인해 상품의 가치가 훼손된 경우<br><br>
					당사의 사유에 의한 교환 및 반품이 불가한 경우<br>
					1. 배송 받으신 날로부터 3개월, 혹은 그 사실을 알 수 있었던 날로 부터 30일이 경과한 경우<br>
					2. 당사의 귀책(상품의 불량, 생산 및 제조 및 배송 간의 파손 등)으로 인한 현상이 아닌 해당 상품의 고유한 특성, 혹은 상품 수령 후 고객님의 과실로 인한 문제임이 규명된 경우
				</dd>
			</dl>
		</div>
		<!-- 구매정보 탭이 on일경우 -->
	</div>
</div>
	<!-- 2017-02-23 수정 : TOP 바로가기 버튼 추가 -->
	<div id="directTop" style="display: block;">
		<button><span></span>TOP</button>
	</div>
	<!--// 2017-02-23 수정 : TOP 바로가기 버튼 추가 -->
	
	<!-- #Footer -->
	<jsp:include page="../include/Footer.jsp"/>
	<!-- //#Footer -->
</body>
</html>