<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="./asset/css/global.css"/> 
	<link rel="stylesheet" href="./asset/css/buyComplete.css"/> 
	<script type="text/javascript" src="./asset/js/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="./asset/js/slick.min.js"></script>
	<script type="text/javascript" src="./asset/js/common.js"></script>
</head>
<body>
<div id="Wrapper">
	<div id="skip_navi"><a href="https://www.oliveyoung.co.kr/store/order/getOrderComplete.do#Container">본문바로가기</a></div>
	
	<!-- header -->
	<jsp:include page="../include/Header.jsp"/>
	<!-- header// -->

	<!-- #Container -->
	<div id="Container">
		<!-- #Contents -->
		<div id="Contents">
			<!-- title_box -->
			<div class="title_box">
				<h1>주문완료</h1>
				<ul class="step_list">
					<li><span class="step_num tx_num">1</span> 장바구니</li>
					<li><span class="step_num tx_num">2</span> 주문/결제</li>
					<li class="last on"><span class="step_num tx_num">3</span>주문완료</li>
				</ul>
			</div>
			<!--// title_box -->
			
			<c:set var="bcDTO" value="${requestScope.bcDTO}"/>
			<c:if test="${bcDTO == null}">
			<c:set var="member" value="${requestScope.buylist}" />
			<div class="order_end_box"><!-- 2017-01-20 수정 : div 추가 -->
				<!-- 무통장 입금 결제 시 -->
				<div class="order_title">
					<p>주문접수가 <span>완료</span>되었습니다.</p>
					<p class="tx_sub_cont">입금이 완료되면 주문이 정상적으로 처리됩니다.</p>
					<span class="tx_order_info">주문번호 : <strong class="tx_num">Y1908091247119</strong></span>
				</div>
				<!--// 무통장 입금 결제 시 -->
				<div class="inner_box">
					<h2 class="sub-title2">입금계좌정보</h2>
					<!-- 무통장 입금 결제 시 -->
					<table class="tbl_data_view type2">
						<caption>입금계좌정보 안내</caption>
						<colgroup>
							<col style="width:170px">
							<col style="width:*">
						</colgroup>
						<tbody>
						<tr>
							<th scope="row">입금하실 금액</th>
							<td><span class="tx_price"><span class="tx_num">${requestScope.totalprice-requestScope.totalsaleprice+requestScope.delivery_cost}</span>원</span></td>
						</tr>
						<tr>
							<th scope="row">입금은행</th>
							<td>농협</td>
						</tr>
						<tr>
							<th scope="row">입금계좌</th>
							<td> 3560439203333(예금주 박정현)</td>
						</tr>
						<tr>
							<th scope="row">입금기한</th>
							<td>${requestScope.buyday} &nbsp;12시까지</td>
						</tr>
						</tbody>
					</table>
				<!--// 무통장 입금 결제 시 -->
					<!-- 결제정보 -->
					<h2 class="sub-title2">결제정보</h2>
					<table class="tbl_data_view">
						<caption>결제정보 안내</caption>
						<colgroup>
							<col style="width:170px">
							<col style="width:*">
						</colgroup>
						<tbody>
						<tr>
							<th scope="row">총상품금액</th>
							<td><span class="tx_num">${requestScope.totalprice}</span>원</td>
						</tr>
						<tr>
							<th scope="row">총할인금액</th>
							<td>
								<span class="tx_price"><span class="tx_num">${requestScope.totalsaleprice}</span>원</span>
							</td>
						</tr>
						<tr>
							<th scope="row">총배송비</th>
							<td><span class="tx_num">${requestScope.delivery_cost}</span>원</td>
						</tr>
						<tr class="last_tot_price">
							<th scope="row">최종 결제금액</th>
							<td>
								<span class="tx_price"><span class="tx_num">${requestScope.totalprice-requestScope.totalsaleprice+requestScope.delivery_cost}</span>원</span>
								<p>무통장입금</p>
							</td>
						</tr>
						</tbody>
					</table>
				</div>
				<div class="inner_box">					
					<!-- 배송정보 -->
					<h2 class="sub-title2">배송정보</h2>
					<table class="tbl_data_view type2">
						<caption>배송정보 안내</caption>
						<colgroup>
							<col style="width:170px">
							<col style="width:*">
						</colgroup>
						<tbody>
						<tr>
							<th scope="row">받는분</th>
							<td>${member.delivery_name}</td>
						</tr>
						<tr>
							<th scope="row">연락처1</th>
							<td>${member.delivery_mtel}</td>
						</tr>
						<tr>
							<th scope="row">주소</th>
							<td>
								<p>${member.delivery_address}</p>
							</td>
						</tr>
						</tbody>
					</table>
					<!--// 배송정보 -->
				</div>
				<div class="order_btn_area">
					<button class="btnGreenW" onclick="location.href='Main.jsp'">쇼핑계속</button>
					<button class="btnGreen" onclick="location.href='mypage.mypage'">주문내역조회</button>
				</div>
			</div>
			</c:if>
			
			<c:if test="${bcDTO != null}">
			<div class="order_end_box">
			<c:set var="member" value="${requestScope.buylist}" />
				<!-- 카드 결제 시 -->
				<div class="order_title">
					<p>결제가 <span>성공</span>하였습니다.</p>
					<span class="tx_order_info">주문번호 : <strong class="tx_num">Y1908091247119</strong></span>
				</div>
				<!--// 카드 결제 시 -->
				<div class="inner_box">
					<h2 class="sub-title2">결제정보</h2>
					<!-- 카드 결제 시 -->
					<table class="tbl_data_view type2">
						<caption>카드결제정보 안내</caption>
						<colgroup>
							<col style="width:170px">
							<col style="width:*">
						</colgroup>
						<tbody>
						<tr>
							<th scope="row">결제은행</th>
							<td>${bcDTO.bank}</td>
						</tr>
						<tr>
							<th scope="row">카드번호</th>
							<td>${bcDTO.cardNum}</td>
						</tr>
						<tr>
							<th scope="row">할부개월</th>
							<c:if test="${bcDTO.installment == 0}">
								<td>일시불</td>
							</c:if>
							<c:if test="${bcDTO.installment != 0}">
								<td>${bcDTO.installment}개월</td>
							</c:if>
						</tr>
						</tbody>
					</table>
					<h2 class="sub-title2">결제정보</h2>
					<table class="tbl_data_view">
						<caption>결제정보 안내</caption>
						<colgroup>
							<col style="width:170px">
							<col style="width:*">
						</colgroup>
						<tbody>
						<tr>
							<th scope="row">총상품금액</th>
							<td><span class="tx_num">${requestScope.totalprice}</span>원</td>
						</tr>
						<tr>
							<th scope="row">총할인금액</th>
							<td>
								<span class="tx_price"><span class="tx_num">${requestScope.totalsaleprice}</span>원</span>
							</td>
						</tr>
						<tr>
							<th scope="row">총배송비</th>
							<td><span class="tx_num">${requestScope.delivery_cost}</span>원</td>
						</tr>
						<tr class="last_tot_price">
							<th scope="row">최종 결제금액</th>
							<td>
								<span class="tx_price"><span class="tx_num">${requestScope.totalprice-requestScope.totalsaleprice+requestScope.delivery_cost}</span>원</span>
								<p>카드결제</p>
							</td>
						</tr>
						</tbody>
					</table>
				</div>
				<div class="inner_box">					
					<!-- 배송정보 -->
					<h2 class="sub-title2">배송정보</h2>
					<table class="tbl_data_view type2">
						<caption>배송정보 안내</caption>
						<colgroup>
							<col style="width:170px">
							<col style="width:*">
						</colgroup>
						<tbody>
						<tr>
							<th scope="row">받는분</th>
							<td>${member.delivery_name}</td>
						</tr>
						<tr>
							<th scope="row">연락처1</th>
							<td>${member.delivery_mtel}</td>
						</tr>
						<tr>
							<th scope="row">주소</th>
							<td>
								<p>${member.delivery_address}</p>
							</td>
						</tr>
						</tbody>
					</table>
					<!--// 배송정보 -->
				</div>
				<div class="order_btn_area">
					<button class="btnGreenW" onclick="location.href='Main.jsp'">쇼핑계속</button>
					<button class="btnGreen" onclick="location.href='mypage.mypage'">주문내역조회</button>
				</div>
				
				
			</div>
			</c:if>
			
		</div>
		<!-- //#Contents -->
	</div>
	<!-- //#Container -->
<!-- RecoBell Script End -->

	<!-- 2017-02-23 수정 : TOP 바로가기 버튼 추가 -->
	<div id="directTop" style="display: block;">
		<button><span></span>TOP</button>
	</div>
	<!--// 2017-02-23 수정 : TOP 바로가기 버튼 추가 -->
	
	<!-- footer -->
	<jsp:include page="../include/Footer.jsp"/>
	<!-- footer// -->
</div>

</body>
</html>