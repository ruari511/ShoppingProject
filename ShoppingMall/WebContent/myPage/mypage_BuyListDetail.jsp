<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%-- <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    --%>
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
					});
				</script>


				<div class="title-area linezero">
					<h2 class="tit">주문상세 정보</h2>
				</div>

				<ul class="infor-data">
					<li>
						<span>주문일자&nbsp;&nbsp;:</span>
						<strong><%-- <fmt:formatDate pattern="yyyy-MM-dd" value="${buylist[0].buydate }" /> --%>${buylist[0].buydate }</strong>
					</li>
					<li>
						<span>주문번호&nbsp;&nbsp;:</span>
						<strong>${buylist[0].buynum }</strong>
					</li>
				</ul>

				<h3 class="sub-title3">배송상품</h3>
				
					<table class="board-list-2s">
					<caption>배송상품</caption>
					<colgroup>
						<col style="width: %;">
						<col style="width: 130px;">
						<col style="width: 8%;">
						<col style="width: 130px;">
						<col style="width: 110px;">
					</colgroup>
					<thead>
						<tr>
							<th scope="col">상품명</th>
							<th scope="col">판매가</th>
							<th scope="col">수량</th>
							<th scope="col">구매가</th>
							<th scope="col">진행현황</th>
						</tr>
					</thead>
					<tbody class="history3">
						<c:forEach var="buylist" items="${buylist}" varStatus="status">
						<tr>
							<td class="subject">
								<div class="area">
									<a class="thum" href="ProductDetailAction.do?product_num=${buylist.product_num }">
										<img src="./asset/image/${buylist.img_main }">
									</a>
									<div class="textus" style="width: 68%;">
										<a class="" href="ProductDetailAction.do?product_num=${buylist.product_num }">
											<span class="tit">${buylist.product_name }</span>
											<%-- <span class="txt">${buylist.product_subname }</span> --%>
										</a>
									</div>
								</div>
							</td>
							<td class="colorBlack"><strong>${buylist.product_price - buylist.product_sale_price}</strong> 원</td>
							<td>${buylist.buy_count}</td>
							<td class="colorOrange"><strong>${(buylist.product_price - buylist.product_sale_price - buylist.point)* buylist.buy_count }</strong> 원</td>
							<!-- 총 주문 금액 -->
							<c:set var="total_price" value="${total_price + (buylist.product_price - buylist.product_sale_price) * buylist.buy_count }"/>
							<td class="bgnone">
							${buylist.delivery_result }
							<!-- 총 배송료 -->
							<c:set var="total_delivery" value="${total_delivery + delivery_cost}"/>
							<!--  -->
							<c:set var="total_coupon" value="${total_coupon + (buylist.all_coupon_num * 100) }" />
							<!-- 총 포인트 할인금액  -->
							<c:set var="total_point" value="${total_sale + buylist.point}"/>
							
					<!-- 	
							<span class="color1sSize">
							처리일시<br>2019.08.09 
							</span>
					 -->
					<!--
						 	<button type="button" class="BtnDelete"
							data-ord-no="Y1908091253822" data-ord-goods-seq="3"
							data-cnsl-ord-proc-seq="0" data-ord-dtl-sct-cd="20"
							data-chg-accp-sct-cd="" data-total-ord-goods-seq="3"
							onclick="mypage.orderDetail.showCancelCausInfo(this); return false;">자세히
							보기</button>
					 -->
							</td>
						</tr>
						</c:forEach>
					</tbody>
				</table> 
				<div class="area-over mgT20">
					<h3 class="sub-title3">배송지 정보</h3>
				</div>
				<table class="board-write-2s view">
					<caption>배송지 정보 보기</caption>
					<colgroup>
						<col style="width: 20%;">
						<col style="width: 30%;">
						<col style="width: 20%;">
						<col style="width: 30%;">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">받는분</th>
							<td colspan="3">${buylist[0].delivery_name }</td>
						</tr>
						<tr>
							<th scope="row">연락처1</th>
							<td colspan="3">${buylist[0].delivery_mtel}</td>
						</tr>
						<tr class="addr">
							<th scope="row">주소</th>
							<td colspan="3">
								<span class="data">${buylist[0].delivery_address}</span>
							</td>
						</tr>
					</tbody>
				</table>
				<h3 class="sub-title3">결제 정보</h3>

				<div class="price-conts">
					<ul class="list ">
						<li>
							<dl>
								<dt>주문금액</dt>
								<c:set var="total" value="${total + total_price + total_delivery}"/>
								<dd>
									<c:out value="${total}" /><em>원</em>
								</dd>
							</dl>
							<ul>
								<li>
									<span class="txt">총 상품금액</span>
									<span class="won">
										<c:out value="${total_price }" /><em>원</em>
									</span>
								</li>
								<li>
									<span class="txt">총 배송비</span>
									<span class="won">
										<c:out value="${total_delivery }"/><em>원</em>
									</span>
								</li>
							</ul>
						</li>
						<li>
							<dl>
								<dt>쿠폰할인금액</dt>
								<dd>
									<c:out value="${total_coupon}" /><em>원</em>
								</dd>
							</dl>
							<ul>
							</ul>
						</li>
						<li>
							<dl>
								<dt>포인트 및 기타결제</dt>
								<dd>
									<c:out value="${total_point}" /><em>원</em>
								</dd>
							</dl>
							<ul>
							</ul>
						</li>
					</ul>
					<div class="price-sum">
						<div>
							<strong>총 결제금액</strong>
							<span><c:out value="${total - total_coupon - total_point }"/><em>원</em></span>
						</div>
						<!-- <span class="txt">미입금취소</span> -->
					</div>
				</div>
				
				</div>
				<script type="text/javascript"
						src="https://www.oliveyoung.co.kr/pc-static-root/js/mypage/myorder.js?dumm=2019080133412"></script>
					<script type="text/javascript"
						src="https://www.oliveyoung.co.kr/pc-static-root/js/mypage/gdas.js?dumm=2019080133412"></script>
					<script>
		HDC_PATH = $.parseJSON('{"00":"http://nexs.cjgls.com/web/service02_01.jsp?slipno=","10":"http://www.hanjinexpress.hanjin.net/customer/plsql/hddcw07.result?wbl_num=","20":"http://www.lotteglogis.com/personalService/tracking/06/tracking_goods_result.jsp?InvNo=","30":"http://nexs.cjgls.com/web/detail.jsp?slipno=","50":"http://service.epost.go.kr/trace.RetrieveRegiPrclDeliv.postal?sid1=","70":"http://www.ilogen.com/d2d/delivery/invoice_search_popup.jsp?viewType=type2&invoiceNum=","91":"http://www.kglogis.co.kr/delivery/delivery_result.jsp?item_no=","92":"http://www.kglogis.co.kr/delivery/delivery_result.jsp?item_no=","93":"http://kdexp.com/basicNewDelivery.kd?barcode=","94":null,"200":"http://service.epost.go.kr/trace.RetrieveEmsRigiTraceList.comm?POST_CODE=","210":"http://www.dhl.co.kr/content/kr/ko/express/tracking.shtml?brand=DHL&AWB="}');
		
		$(document).ready(function(){
		    mypage.orderList.init();
		});
		</script>

				</div>
			</div>
				
			</div>
			
		
			<script>
				$(document).ready(function() {
				    common.gnb.initMypageMenu(); 
				});
			</script>	
			
	
	</div> 
</body>
</html>
