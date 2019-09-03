<%@page import="net.review.db.ReviewDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 

<%@ page trimDirectiveWhitespaces="true" %>
<%@page import="net.review.db.review_DAO"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./asset/css/global.css"/> 
<link rel="stylesheet" href="./asset/css/product.css"/>

	<!-- BootStrap CDN -->
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css"/>
	<!-- jQuery library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<!-- Latest compiled JavaScript -->
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>



<% 
	String id = (String)session.getAttribute("id");
	
	//파라미터 한글처리
	request.setCharacterEncoding("utf-8"); 
	
	 int tot = 0;
	 // Null값일때 형변환 하면 에러가나니.. 체크
	 if(request.getAttribute("tot") != null){
				 
		 tot = (Integer)request.getAttribute("tot");
		 
	 }
	 
	 review_DAO dao = new review_DAO();
	 
	 int cnt = dao.review_getPageCount();
 
%>

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
	document.getElementById("reviewInfo").removeAttribute("class");
	document.getElementById("product_detail").style.display="block";
	document.getElementById("buy_detail").style.display="none";
	document.getElementById("reviewInfo_detail").style.display="none";
}

function buy_detailOn(){
	document.getElementById("buyInfo").setAttribute("class", "on");
	document.getElementById("productInfo").removeAttribute("class");
	document.getElementById("reviewInfo").removeAttribute("class");
	document.getElementById("buy_detail").style.display="block";
	document.getElementById("product_detail").style.display="none";
	document.getElementById("reviewInfo_detail").style.display="none";
}

function review_detailOn(){
	document.getElementById("reviewInfo").setAttribute("class", "on");
	document.getElementById("buyInfo").removeAttribute("class");
	document.getElementById("productInfo").removeAttribute("class");
	document.getElementById("reviewInfo_detail").style.display="block";
	document.getElementById("product_detail").style.display="none";
	document.getElementById("buy_detail").style.display="none";
}

function goCart() {
	var id = '<%=id%>';
	var product_num = document.getElementById("product_num").value;
	var product_count = document.getElementById("product_count").value;
	
	if(id==null){
		location.href="./login.do";
	} else{
		location.href="CartInsertController.do?product_num="+product_num+"&product_count="+product_count;
	}
}

function goBuy() {
	var id = '<%=id%>';
	var product_num = document.getElementById("product_num").value;
	var product_count = document.getElementById("product_count").value;
	
	if(id==null){
		location.href="./login.do";
	} else{
		location.href="GoBuyController.buy?product_num="+product_num+"&product_count="+product_count;
	}
}


function ordersubmit(a) {
	document.getElementById("order").value = a;
	var frm2 = document.getElementById("frm2");
	frm2.submit();
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
	<input type="hidden" id="product_num" value="${product.product_num}">
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
					<li class="sel"><a href=""><img src="./asset/image/${product.img_main}" alt="썸네일이미지"></a></li>
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
			<li id="reviewInfo"><a onclick="review_detailOn();" class="goods_reputation">상품평<span>(<%=cnt %>)</span></a></li>
			<li id="qnaInfo"><a href="javascript:;" class="goods_qna">Q&amp;A<span>(1)</span></a></li>
		</ul>


<c:if test="${requestScope.startRow == 0 || requestScope.startRow == null}">
		<!-- 상세정보 탭이 on일경우 -->
		<div class="tabConts prd_detail_cont" id="product_detail" style="display:block;">
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


		<%-- review 리스트 서블릿 호출 --%>
		<c:url var="review_list" value="review_list.credu"></c:url>
		<%-- review 작성 서블릿 호출 --%>
		<c:url var="review_write" value="review_write.credu"></c:url>
		
		<%
			String product_num = request.getParameter("product_num");
		%>
		 
<!-- 리뷰정보 탭 -->
<div class="tabConts prd_detail_cont reviewInfo" id="reviewInfo_detail" style="display:none;">
<!--평균별점집계 start-->
<div class="product_rating_area">
   <div class="inner clrfix">
      
         <div class="grade_img">
            <p class="img_face"><span class="grade grade5"></span><em>최고</em></p>
         </div>
         <div class="star_area">
            <p class="total">총 <em>${requestScope.review_cnt}</em>건의 고객상품평</p>
            <p class="num"><strong>4.6</strong><span>점</span></p>
            <ul class="star_list">
				<li><span class="rating"></span><img src="./아임프롬 머그워트 에센스 160ml _ 올리브영_files/bg_rating_star.png"></li>
                <li><span class="rating"></span><img src="./아임프롬 머그워트 에센스 160ml _ 올리브영_files/bg_rating_star.png"></li>
                <li><span class="rating"></span><img src="./아임프롬 머그워트 에센스 160ml _ 올리브영_files/bg_rating_star.png"></li>
                <li><span class="rating"></span><img src="./아임프롬 머그워트 에센스 160ml _ 올리브영_files/bg_rating_star.png"></li>
                <li><span class="rating" style="width:60%;"></span><img src="./아임프롬 머그워트 에센스 160ml _ 올리브영_files/bg_rating_star.png"></li>
            </ul>
         </div> 
		<div class="graph_area">
			<ul class="graph_list">
				<li>
					<span class="per">70%</span>
					<div class="graph"><span style="height:70%;"></span></div>
					<span class="txt">5점</span>
				</li>
				<li>
					<span class="per">16%</span>
					<div class="graph"><span style="height:16%;"></span></div>
					<span class="txt">4점</span>
				</li>
				<li>
					<span class="per">4%</span>
					<div class="graph"><span style="height:4%;"></span></div>
					<span class="txt">3점</span>
				</li>
				<li>
					<span class="per">3%</span>
					<div class="graph"><span style="height:3%;"></span></div>
					<span class="txt">2점</span>
				</li>
				<li>
					<span class="per">7%</span>
					<div class="graph"><span style="height:7%;"></span></div>
					<span class="txt">1점</span>
				</li>
			</ul>
		</div>                    
         <div class="write_info">
            <dl>
               <dt>상품평을 써보세요.</dt>
               <dd>고객님의 소중한 상품평을 공유하고 <br>최대 CJ ONE 160P도 받아가세요.</dd>
            </dl>
            <p class="alignCenter"><button class="btnInquiry" id="gdasWrite" data-toggle="modal" data-target="#myModal">상품평 쓰기</button></p>
         </div>
   </div>
</div>

<!--평균별점집계 end-->

<!-- 사진탭 start-->

<h3 class="tit_type thum_tit">상품평 이미지</h3>
<div class="review_thum">
	<ul class="inner clrfix">
	<c:forEach var="ReviewAll" items="${requestScope.reviewAlllist}" end="11" varStatus="idx">
		<c:if test="${idx.index != 11}">
		<li>
			<a href="">               
				<span>
					<img src="./asset/image/${ReviewAll.review_img}" class="thum" alt="">
				</span>
			</a>
		</li>
		</c:if>
		<c:if test="${idx.index == 11}">
		<li>
			<a href="" class="more">
				<span>
					<span><em>더보기</em></span>
					<img src="./asset/image/product_sum.jpg" class="thum">
				</span>
			</a>
		</li>
		</c:if>
	</c:forEach>
		
	</ul>
</div>

<!-- 사진탭 end-->


<div class="cate_align_box">
   <div class="align_sort">
      <ul id="gdasSort">
         <li class="on"><a href="">최신순</a></li>
         <li class=""><a href="">도움순</a></li>
         <li class=""><a href="">높은 별점순</a></li>
         <li class=""><a href="">낮은 별점순</a></li>
      </ul>
   </div>
   
</div>
<!-- 필터end -->

<!-- 상품평 리스트 start -->
<div class="review_list_wrap">
	<ul class="inner_list" id="gdasList">
	<c:forEach var="ReviewDTO" items="${requestScope.reviewlist}">
		<li>
		<div class="info">
			<span class="review_point">
				<span class="point" style="font-size: 25px; color: orange;">
					
					<%-- 별점 --%>
					<c:choose>
						
						<%-- if(a == 1){ --%>
						<c:when test="${ReviewDTO.review_star == 1}">
							<td>★☆☆☆☆</td>
						</c:when>
						<%-- if(a == 2){ --%>
						<c:when test="${ReviewDTO.review_star == 2}">
							<td>★★☆☆☆</td>
						</c:when>
						<%-- if(a == 3){ --%>
						<c:when test="${ReviewDTO.review_star == 3}">
							<td>★★★☆☆</td>
						</c:when>
						<%-- if(a == 4){ --%>
						<c:when test="${ReviewDTO.review_star == 4}">
							<td>★★★★☆</td>
						</c:when>
						<%-- if(a == 5){ --%>
						<c:when test="${ReviewDTO.review_star == 5}">
							<td>★★★★★</td>
						</c:when>
						
						
					</c:choose>
				</span>
			</span>
			
			<div class="review_date">         
				<span class="mbrId">${ReviewDTO.id}</span>        
				<span>${ReviewDTO.review_regdate}</span>        
			</div>     
		</div>    
		     
		<div class="review_cont"> 
		
		<div class="review_thum">
			<ul class="inner clrfix">
			<c:forEach var="ReviewAll" items="${requestScope.reviewAlllist}" end="0" varStatus="last">
				<li>
					<a href="">
						<span>
							<img src="./asset/image/${ReviewAll.review_img}" class="thum" alt="">
						</span>
					</a>
				</li>
			</c:forEach>
			</ul>
		</div>
		                        
			<p class="txt_oneline">${ReviewDTO.review_title}</p>             
			<div class="txt_inner">
				${ReviewDTO.review_content}
			</div>
			
			<div class="recom_area">    
					<a type="button" class="btn_recom" onclick="return confirm('추천하시겠습니까?')" href="./product/likeAction.jsp?review_num=${ReviewDTO.review_num}">도움이 돼요 // ${ReviewDTO.review_num} // <span class="num">${ReviewDTO.like_count}</span></a>
			</div>
		</div> 
		</li>
	</c:forEach>
	</ul>
</div>


<div class="pageing">
	<c:set var="i" value="1" />
	<c:set var="j" value="0" />
	<c:set var="startRow" value="${requestScope.startRow}"/>
	<c:set var="product" value="${requestScope.product_num}" />
	<c:forEach begin="0" end="<%=cnt %>" varStatus="idx">
		<c:if test="${idx.index % 15 == 0}">
			<c:choose>
				<c:when test="${startRow==j}"><a href="./ProductDetailAction.pro?product_num=${product}&startRow=${(i-1)*15}" title="Paging" class="on"> ${idx.index % 15 + i} </a></c:when>
				<c:otherwise><a href="./ProductDetailAction.pro?product_num=${product}&startRow=${(i-1)*15}" title="Paging"> ${idx.index % 15 + i} </a></c:otherwise>
			</c:choose>
			<c:set var="i" value="${i+1}"/>
		</c:if>
			<c:set var="j" value="${j+1}"/>
	</c:forEach>
</div>





<!-- Modal -->
  	<div class="modal fade" id="myModal" role="dialog">
    	<div class="modal-dialog modal-lg">
    
      	<!-- Modal content-->
      	<div class="modal-content">
	        <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	        </div>
        
        <div class="modal-body">
          
			<div class="panel-group">
			<div class="panel panel-success" style="margin-top: 10px;">
				<div class="panel-heading">Goods Review</div>
				<div class="panel-body">
					<%-- form --%>
					<form class="form-horizontal" role="form" action="${review_write}" method="post">
						<div class="form-group">
							<label class="control-label col-sm-2">작성자(ID):</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="id" name="id" value="<%=id %>" placeholder="ID">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-2" for="pwd">제목:</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="review_title"
									name="review_title" placeholder="Title">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-2" for="pwd">상품번호:</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="product_num" name="product_num" value="<%=product_num %>" placeholder="상품번호">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-2" for="pwd">내용:</label>
							<div class="col-sm-10">
								<textarea class="form-control" rows="5"	placeholder="review_content" name="review_content" id="review_content"></textarea>
							</div>
						</div>
	
						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-10">
								<div class="radio">
								
									<label class="radio-inline"> <input type="radio" name="review_star" id="review_star" value="1" checked="checked">★☆☆☆☆</label>
									<label class="radio-inline"> <input type="radio" name="review_star" id="review_star" value="2">★★☆☆☆</label>
									<label class="radio-inline"> <input type="radio" name="review_star" id="review_star" value="3">★★★☆☆</label>
									<label class="radio-inline"> <input type="radio" name="review_star" id="review_star" value="4">★★★★☆</label>
									<label class="radio-inline"> <input type="radio" name="review_star" id="review_star" value="5">★★★★★</label>
									
								</div>
							</div>
						</div>
						
<!-- 						<div class="col-sm-10"> -->
<!-- 							<label class="control-label col-sm-2">파일 선택: </label> <input type="file" name="upFile"/><br> -->
<!-- 						</div> -->
						
						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-10">
								<button type="submit" class="btn btn-success">작 성</button>
								<button type="reset" class="btn btn-danger">초기화</button>
							</div>
						</div>
					</form>


				</div>

			</div>
		</div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-info" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>

</div>
</c:if>
<!-- 리뷰정보 탭이 on이면서 startRow 없을때 -->		
	</div>
</div>


<!-- 리뷰정보 탭이 on이면서 startRow 있을때 -->
<c:if test="${requestScope.startRow ne 0}">
		<!-- 상세정보 탭이 on일경우 -->
		<div class="tabConts prd_detail_cont" id="product_detail" style="display:none;">
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


		<%-- review 리스트 서블릿 호출 --%>
		<c:url var="review_list" value="review_list.credu"></c:url>
		<%-- review 작성 서블릿 호출 --%>
		<c:url var="review_write" value="review_write.credu"></c:url>
		
		<%
			String product_num = request.getParameter("product_num");
		%>
		 
<!-- 리뷰정보 탭 -->
<div class="tabConts prd_detail_cont reviewInfo" id="reviewInfo_detail" style="display:block;">
<!--평균별점집계 start-->
<div class="product_rating_area">
   <div class="inner clrfix">
      
         <div class="grade_img">
            <p class="img_face"><span class="grade grade5"></span><em>최고</em></p>
         </div>
         <div class="star_area">
            <p class="total">총 <em>${requestScope.review_cnt}</em>건의 고객상품평</p>
            <p class="num"><strong>4.6</strong><span>점</span></p>
            <ul class="star_list">
				<li><span class="rating"></span><img src="./아임프롬 머그워트 에센스 160ml _ 올리브영_files/bg_rating_star.png"></li>
                <li><span class="rating"></span><img src="./아임프롬 머그워트 에센스 160ml _ 올리브영_files/bg_rating_star.png"></li>
                <li><span class="rating"></span><img src="./아임프롬 머그워트 에센스 160ml _ 올리브영_files/bg_rating_star.png"></li>
                <li><span class="rating"></span><img src="./아임프롬 머그워트 에센스 160ml _ 올리브영_files/bg_rating_star.png"></li>
                <li><span class="rating" style="width:60%;"></span><img src="./아임프롬 머그워트 에센스 160ml _ 올리브영_files/bg_rating_star.png"></li>
            </ul>
         </div> 
		<div class="graph_area">
			<ul class="graph_list">
				<li>
					<span class="per">70%</span>
					<div class="graph"><span style="height:70%;"></span></div>
					<span class="txt">5점</span>
				</li>
				<li>
					<span class="per">16%</span>
					<div class="graph"><span style="height:16%;"></span></div>
					<span class="txt">4점</span>
				</li>
				<li>
					<span class="per">4%</span>
					<div class="graph"><span style="height:4%;"></span></div>
					<span class="txt">3점</span>
				</li>
				<li>
					<span class="per">3%</span>
					<div class="graph"><span style="height:3%;"></span></div>
					<span class="txt">2점</span>
				</li>
				<li>
					<span class="per">7%</span>
					<div class="graph"><span style="height:7%;"></span></div>
					<span class="txt">1점</span>
				</li>
			</ul>
		</div>                    
         <div class="write_info">
            <dl>
               <dt>상품평을 써보세요.</dt>
               <dd>고객님의 소중한 상품평을 공유하고 <br>최대 CJ ONE 160P도 받아가세요.</dd>
            </dl>
            <p class="alignCenter"><button class="btnInquiry" id="gdasWrite" data-toggle="modal" data-target="#myModal">상품평 쓰기</button></p>
         </div>
   </div>
</div>

<!--평균별점집계 end-->

<!-- 사진탭 start-->

<h3 class="tit_type thum_tit">상품평 이미지</h3>
<div class="review_thum">
	<ul class="inner clrfix">
	<c:forEach var="ReviewAll" items="${requestScope.reviewAlllist}" end="11" varStatus="idx">
		<c:if test="${idx.index != 11}">
		<li>
			<a href="">               
				<span>
					<img src="./asset/image/${ReviewAll.review_img}" class="thum" alt="">
				</span>
			</a>
		</li>
		</c:if>
		<c:if test="${idx.index == 11}">
		<li>
			<a href="" class="more">
				<span>
					<span><em>더보기</em></span>
					<img src="./asset/image/product_sum.jpg" class="thum">
				</span>
			</a>
		</li>
		</c:if>
	</c:forEach>
		
	</ul>
</div>

<!-- 사진탭 end-->


<!-- 상품 정렬 조건 영역 -->
<div class="cate_align_box">
	<div class="align_sort"> 
		<form action="./ProductDetailAction.pro" id="frm2" method="get">
			<c:set var="order" value="${requestScope.order}"/>
				<ul>
					<c:choose>
						<c:when test="${order == null}">
							<li class="on"><a onclick="ordersubmit('insert_product');" style="cursor: pointer;">최신순</a></li>
							<li><a onclick="ordersubmit('high_like');" style="cursor: pointer;">도움순</a></li>
							<li><a onclick="ordersubmit('high_star');" style="cursor: pointer;">높은 별점순</a></li>
							<li><a onclick="ordersubmit('low_star');" style="cursor: pointer;">낮은 별점순</a></li>
						</c:when>
						<c:when test="${order eq 'insert_product'}">
							<li class="on"><a onclick="ordersubmit('insert_product');" style="cursor: pointer;">최신순</a></li>
							<li><a onclick="ordersubmit('high_like');" style="cursor: pointer;">도움순</a></li>
							<li><a onclick="ordersubmit('high_star');" style="cursor: pointer;">높은 별점순</a></li>
							<li><a onclick="ordersubmit('low_star');" style="cursor: pointer;">낮은 별점순</a></li>
						</c:when>
						<c:when test="${order eq 'high_like'}">
							<li><a onclick="ordersubmit('insert_product');" style="cursor: pointer;">최신순</a></li>
							<li class="on"><a onclick="ordersubmit('high_like');" style="cursor: pointer;">도움순</a></li>
							<li><a onclick="ordersubmit('high_star');" style="cursor: pointer;">높은 별점순</a></li>
							<li><a onclick="ordersubmit('low_star');" style="cursor: pointer;">낮은 별점순</a></li>
						</c:when>
						<c:when test="${order eq 'high_star'}">
							<li><a onclick="ordersubmit('insert_product');" style="cursor: pointer;">최신순</a></li>
							<li><a onclick="ordersubmit('high_like');" style="cursor: pointer;">도움순</a></li>
							<li class="on"><a onclick="ordersubmit('high_star');" style="cursor: pointer;">높은 별점순</a></li>
							<li><a onclick="ordersubmit('low_star');" style="cursor: pointer;">낮은 별점순</a></li>
						</c:when>
						<c:when test="${order eq 'low_star'}">
							<li><a onclick="ordersubmit('insert_product');" style="cursor: pointer;">최신순</a></li>
							<li><a onclick="ordersubmit('high_like');" style="cursor: pointer;">도움순</a></li>
							<li><a onclick="ordersubmit('high_star');" style="cursor: pointer;">높은 별점순</a></li>
							<li class="on"><a onclick="ordersubmit('low_star');" style="cursor: pointer;">낮은 별점순</a></li>
						</c:when>
				</c:choose>
			</ul>
		</form>
	</div>
</div>
<!--// 상품 정렬 조건 영역 -->  


<!-- 상품평 리스트 start -->
<div class="review_list_wrap">
	<ul class="inner_list" id="gdasList">
	<c:forEach var="ReviewDTO" items="${requestScope.reviewlist}">
		<li>
		<div class="info">
			<span class="review_point">
				<span class="point" style="font-size: 25px; color: orange;">
					
					<%-- 별점 --%>
					<c:choose>
						
						<%-- if(a == 1){ --%>
						<c:when test="${ReviewDTO.review_star == 1}">
							<td>★☆☆☆☆</td>
						</c:when>
						<%-- if(a == 2){ --%>
						<c:when test="${ReviewDTO.review_star == 2}">
							<td>★★☆☆☆</td>
						</c:when>
						<%-- if(a == 3){ --%>
						<c:when test="${ReviewDTO.review_star == 3}">
							<td>★★★☆☆</td>
						</c:when>
						<%-- if(a == 4){ --%>
						<c:when test="${ReviewDTO.review_star == 4}">
							<td>★★★★☆</td>
						</c:when>
						<%-- if(a == 5){ --%>
						<c:when test="${ReviewDTO.review_star == 5}">
							<td>★★★★★</td>
						</c:when>
						
						
					</c:choose>
				</span>
			</span>
			<div class="review_date">         
				<span class="mbrId">${ReviewDTO.id}</span>        
				<span>${ReviewDTO.review_regdate}</span>   
			</div>     
		</div>         
		<div class="review_cont">                         
			<p class="txt_oneline">${ReviewDTO.review_title}</p>             
			<div class="txt_inner">
				${ReviewDTO.review_content}
			</div>
			<div class="recom_area">
				<a type="button" class="btn_recom" onclick="return confirm('추천하시겠습니까?')" href="./product/likeAction.jsp?review_num=${ReviewDTO.review_num}">도움이 돼요 // ${ReviewDTO.review_num} // <span class="num">${ReviewDTO.like_count}</span></a>
			</div>
<!-- 			<button type="button" class="btn_dec" onclick="" style="">신고</button> -->
		</div> 
		</li>
	</c:forEach>
	</ul>
</div>


<div class="pageing">
	<c:set var="i" value="1" />
	<c:set var="j" value="0" />
	<c:set var="startRow" value="${requestScope.startRow}"/>
	<c:set var="product" value="${requestScope.product_num}" />
	<c:forEach begin="0" end="<%=cnt %>" varStatus="idx">
		<c:if test="${idx.index % 15 == 0}">
			<c:choose>
				<c:when test="${startRow==j}"><a href="./ProductDetailAction.pro?product_num=${product}&startRow=${(i-1)*15}" title="Paging" class="on"> ${idx.index % 15 + i} </a></c:when>
				<c:otherwise><a href="./ProductDetailAction.pro?product_num=${product}&startRow=${(i-1)*15}" title="Paging"> ${idx.index % 15 + i} </a></c:otherwise>
			</c:choose>
			<c:set var="i" value="${i+1}"/>
		</c:if>
			<c:set var="j" value="${j+1}"/>
	</c:forEach>
</div>





<!-- Modal -->
  	<div class="modal fade" id="myModal" role="dialog">
    	<div class="modal-dialog modal-lg">
    
      	<!-- Modal content-->
      	<div class="modal-content">
	        <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	        </div>
        
        <div class="modal-body">
          
			<div class="panel-group">
			<div class="panel panel-success" style="margin-top: 10px;">
				<div class="panel-heading">Goods Review</div>
				<div class="panel-body">
					<%-- form --%>
					<form class="form-horizontal" role="form" action="${review_write}" method="post">
						<div class="form-group">
							<label class="control-label col-sm-2">작성자(ID):</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="id" name="id" value="<%=id %>" placeholder="ID">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-2" for="pwd">제목:</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="review_title"
									name="review_title" placeholder="Title">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-2" for="pwd">상품번호:</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="product_num" name="product_num" value="<%=product_num %>" placeholder="상품번호">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-2" for="pwd">내용:</label>
							<div class="col-sm-10">
								<textarea class="form-control" rows="5"	placeholder="review_content" name="review_content" id="review_content"></textarea>
							</div>
						</div>
	
						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-10">
								<div class="radio">
								
									<label class="radio-inline"> <input type="radio" name="review_star" id="review_star" value="1" checked="checked">★☆☆☆☆</label>
									<label class="radio-inline"> <input type="radio" name="review_star" id="review_star" value="2">★★☆☆☆</label>
									<label class="radio-inline"> <input type="radio" name="review_star" id="review_star" value="3">★★★☆☆</label>
									<label class="radio-inline"> <input type="radio" name="review_star" id="review_star" value="4">★★★★☆</label>
									<label class="radio-inline"> <input type="radio" name="review_star" id="review_star" value="5">★★★★★</label>
									
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-10">
								<button type="submit" class="btn btn-success">작 성</button>
								<button type="reset" class="btn btn-danger">초기화</button>
							</div>
						</div>
					</form>


				</div>

			</div>
		</div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-info" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>

</div>
</c:if>
<!-- 리뷰정보 탭이 on이면서 startRow 있을때 -->









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