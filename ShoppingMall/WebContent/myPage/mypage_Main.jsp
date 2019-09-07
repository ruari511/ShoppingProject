<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="Content-Script-Type" content="text/javascript">
	<meta http-equiv="Content-Style-Type" content="text/css">
	<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
	<meta name="format-detection" content="telephone=no">
	<meta property="og:title" content="공식 온라인몰">
	<meta property="og:url" content="main.html">
	<meta property="og:image" content="">
	<meta property="og:description" content="">
	<title> # </title>
	
	<link rel="stylesheet" href="../asset/css/board.css"/>
	<link rel="stylesheet" href="../asset/css/global.css"/>
	<link rel="stylesheet" href="../asset/css/contents.css"/>
	<script type="text/javascript" src="../asset/js/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="../asset/js/slick.min.js"></script>
	<script type="text/javascript" src="../asset/js/common.js"></script>
	<script type="text/javascript">
	$(window).ready(function(){
			$('.select-month > li ').eq(0).addClass('on');
			
			
			$('.search-period').find('.select-month > li ').on('click', function(){
				check_idx = $(this).index();
  				$('.serarch-period').find('.select-month > li').removeClass('on').eq(idx).addClass('on');
    		});
		});
	
	</script>
</head>
<body>
<div id="Wrapper">
	
	<div id="Container">
		<div id="Contents">	
			<jsp:include page="mypage_topMenu.jsp"/>	
				<div class="mypage-conts">
					<script src="https://www.oliveyoung.co.kr/pc-static-root/js/mypage/mypage.header.js?dumm=2019080133412"></script>
					<script>
						$(window).ready(function(){
						    mypage.header.init();
					</script>
					
					<!-- 마이페이지 Inner -->
					<div class="title-area">
						<h2 class="tit">주문/배송 조회</h2>
					</div>
					<!-- <ul class="mypage-step">
						<li>
							<em></em>
							<span>주문접수</span>
						</li>
						<li>
							<em>0</em>
							<span>결제완료</span>
						</li>
						<li>
							<em>0</em>
							<span>상품준비중</span>
						</li>
						<li>
							<em>0</em>
							<span>배송중</span>
						</li>
						<li>
							<em>0</em>
							<span>배송완료</span>
						</li>
					</ul> -->

					<fieldset class="search-period">
						<legend></legend>
						<ul class="select-month">
							<li><button type="button"  onclick="location.href ='mypage.mp?data_month=-1'">1개월</button></li>
							<li><button type="button"  onclick="location.href ='mypage.mp?data_month=-3'">3개월</button></li>
							<li><button type="button"  onclick="location.href ='mypage.mp?data_month=-6'">6개월</button></li>
							<li><button type="button"  onclick="location.href ='mypage.mp?data_month=-12'">12개월</button></li>
						</ul>
						<!-- <div class="select-range">
							<select id="cal-start-year" title="년도를 선택하세요"
								style="width: 76px;">
								<option value="2012">2012</option>
								<option value="2013">2013</option>
								<option value="2014">2014</option>
								<option value="2015">2015</option>
								<option value="2016">2016</option>
								<option value="2017">2017</option>
								<option value="2018">2018</option>
								<option value="2019">2019</option>
								<option value="2020">2020</option>
							</select> <label for="cal-start-year">년</label> <select
								id="cal-start-month" title="달월을 선택하세요" style="width: 60px;">
								<option value="01">1</option>
								<option value="02">2</option>
								<option value="03">3</option>
								<option value="04">4</option>
								<option value="05">5</option>
								<option value="06">6</option>
								<option value="07">7</option>
								<option value="08">8</option>
								<option value="09">9</option>
								<option value="10">10</option>
								<option value="11">11</option>
								<option value="12">12</option>
							</select> <label for="cal-start-month">월</label> <select
								id="cal-start-day" title="날일을 선택하세요" style="width: 60px;">
							</select> <label for="cal-start-day">일</label> <span class="des">~</span>
							<select id="cal-end-year" title="년도를 선택하세요" style="width: 76px;">
								<option value="2012">2012</option>
								<option value="2013">2013</option>
								<option value="2014">2014</option>
								<option value="2015">2015</option>
								<option value="2016">2016</option>
								<option value="2017">2017</option>
								<option value="2018">2018</option>
								<option value="2019">2019</option>
								<option value="2020">2020</option>
							</select> <label for="cal-end-year">년</label> <select id="cal-end-month"
								title="달월을 선택하세요" style="width: 60px;">
								<option value="01">1</option>
								<option value="02">2</option>
								<option value="03">3</option>
								<option value="04">4</option>
								<option value="05">5</option>
								<option value="06">6</option>
								<option value="07">7</option>
								<option value="08">8</option>
								<option value="09">9</option>
								<option value="10">10</option>
								<option value="11">11</option>
								<option value="12">12</option>
							</select> <label for="cal-end-month">월</label> <select id="cal-end-day"
								title="날일을 선택하세요" style="width: 60px;">
							</select> <label for="cal-end-day">일</label>
						</div> -->
					<!--<button type="button" class="btnLookup" id="do-search-period">조회</button> -->
					</fieldset>
					<br>
					
					<table class="board-list-2s mgT20">
						<caption>주문&amp;배송&amp;내역 목록</caption>
						<colgroup>
							<col style="width: 16%;">
							<col style="width: %;">
							<col style="width: 8%;">
							<col style="width: 130px;">
							<col style="width: 110px;">
						</colgroup>
						<thead>
							<tr>	
								<th scope="col">주문일자</th>
								<th scope="col">상품</th>
								<th scope="col">수량</th>
								<th scope="col">주문금액</th>
								<th scope="col">상태</th>
							</tr>
						</thead>
						<tbody class="history">
							<c:if test="${empty buylist }">
								<tr>
									<td colspan="5" class="nodata">기간 내 주문내역이 없습니다</td>
								</tr>
							</c:if>
							<c:if test="${!empty buylist}">
								<c:forEach var="buylist" items="${buylist}">
										<tr>
											<td class="gubun">
											    <span style="display: inline-block; font-weight: bold;">
											    	${buylist.buydate }
											    </span><!-- 주문일  -->
												<span class="color1s">${buylist.buynum }</span><!-- 주문번호  -->
											    <a class="btnDetail" href="mypage_BuyListDetail.mp?buynum=${buylist.buynum }">주문상세보기</a> 
											</td>
											<td class="subject">
												<div class="area">
													<a class="thum" href="ProductDetailAction.do?product_num=${buylist.product_num }"> <!-- 제품상세페이지 이동  -->
														<img src="./upload/${buylist.img_main }"> <!-- 제품이미지 정보 -->
													</a>
													<div class="textus">
														<a class="" href="ProductDetailAction.do?product_num=${buylist.product_num }">
															<span class="tit">${buylist.product_name }</span> <!-- 제품 제목  -->
															<%-- <span class="txt">${product.product_sub_name }</span> --%> <!-- 제품 부제목  -->
														</a>
													</div>
												</div>
											</td>
											<td class="">${buylist.buy_count }</td> <!-- 제품 구매 수량 -->
											<td class="colorOrange">${(buylist.product_price - buylist.product_sale_price) * buylist.buy_count }원</td> <!-- 총 구매가  -->
											<td>
												<strong>${buylist.delivery_result }</strong>
												<!-- c:if test="{buylist.delivery_result == 1" 배송완료 -->
												<!-- <button type="button" class="BtnDelete mgT5">...</button>
												<button type="button" class="BtnDelete mgT5">상품평쓰기</button>
												<button type="button" class="BtnDelete mgT5" id="btnDelete">교환신청</button>
												<button type="button" class="BtnDelete mgT5" id="btnDelete">반품신청</button> -->
											</td>
									</tr>	
								</c:forEach>
							</c:if>
						</tbody>
					</table>

		
		
			<script>
			$(window).load(function () {
				/* 주문번호 병합 */
				$(".gubun").each(function () {
				    var rows = $(".gubun:contains('" + $(this).text() + "')");
				    if (rows.length > 1) {
				        rows.eq(0).attr("rowspan", rows.length);
				        rows.not(":eq(0)").remove(); 
				    } 
				});
	        });
			</script>

				</div>
			</div>
				
			</div>
			
		
			<script>
				$(document).ready(function(){
				    common.gnb.initMypageMenu(); 
				};
			</script>	
			</div>
	
</body>
</html>
