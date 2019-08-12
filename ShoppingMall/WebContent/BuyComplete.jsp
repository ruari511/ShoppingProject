<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<jsp:include page="./include/Header.jsp"/>
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
			<div class="order_end_box"><!-- 2017-01-20 수정 : div 추가 -->
				<!-- 무통장 입금 결제 시 -->
				<div class="order_title">
					<p>주문접수가 <span>완료</span>되었습니다.</p>
					<p class="tx_sub_cont">입금이 완료되면 주문이 정상적으로 처리됩니다.</p>
					<span class="tx_order_info">주문번호 : <strong class="tx_num">Y1908091247119</strong></span>
				</div>
				<!--// 무통장 입금 결제 시 -->
			
			
		
				<div class="inner_box"><!-- 2017-01-20 수정 : div 추가 -->
					<!-- 2017-01-20 추가 : 무통장입금 결제 선택 시 -->
		
					<h2 class="sub-title2">입금계좌정보</h2>
					<!-- 무통장 입금 결제 시 -->
					<table class="tbl_data_view type2"><!--  2017-02-21 수정 : type2 클래스 추가 -->
						<caption>입금계좌정보 안내</caption>
						<colgroup>
							<col style="width:170px">
							<col style="width:*">
						</colgroup>
						<tbody>
						<tr>
							<th scope="row">입금하실 금액</th>
							<td><span class="tx_price"><span class="tx_num">24,700</span>원</span></td>
						</tr>
						<tr>
							<th scope="row">입금은행</th>
							<td>농협</td>
						</tr>
						<tr>
							<th scope="row">입금계좌</th>
							<td> 79012760775643(예금주 씨제이올리브네트웍스)</td>
						</tr>
						<tr>
							<th scope="row">입금기한</th>
							<td>2019.08.10 12시까지</td>
						</tr>
						</tbody>
					</table>
				<!--// 무통장 입금 결제 시 -->
		
					<!--// 2017-01-20 추가 : 무통장입금 결제 선택 시 -->
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
							<th scope="row">총상품금액</th><!-- 2017-01-20 수정 : 총상품금액, 총배송비, 총 할인금액 추가 -->
							<td><span class="tx_num">24,700</span>원</td>
						</tr>
						<tr>
							<th scope="row">총할인금액</th>
							<td>
		
								<span class="tx_price"><span class="tx_num">0</span>원</span>
		
		
							</td>
						</tr>
						<tr>
							<th scope="row">총배송비</th>
							<td><span class="tx_num">0</span>원</td>
						</tr>
						<!-- 기타 보조결제수단 -->
		
						<!--// 기타 보조결제수단 -->

						<!-- 2017-01-20 수정 : 임직원추가할인 및 The CJ 카드 추가 할인 영역 추가 -->
		
		
						<!--// 2017-01-20 수정 : 임직원추가할인 및 The CJ 카드 추가 할인 영역 추가 -->
						
						<!-- 2017-01-20 수정 : 최종 결제금액 영역 추가  -->
						<tr class="last_tot_price">
							<th scope="row">최종 결제금액</th>
							<td>
								<span class="tx_price"><span class="tx_num">24,700</span>원</span>
		
			
			
			
						<!-- 무통장입금 시 -->
								<p>무통장입금</p>
						<!--// 무통장입금 시 -->
							</td>
						</tr>
						<!--// 2017-01-20 수정 : 최종 결제금액 영역 추가 -->
						</tbody>
					</table>
					<!--// 결제정보 -->
				</div>
				
				<div class="inner_box">					
					<!-- 배송정보 -->
					<h2 class="sub-title2">배송정보</h2>
					<table class="tbl_data_view type2"><!-- 2017-01-20 수정 : type2 클래스 추가 -->
						<caption>배송정보 안내</caption>
						<colgroup>
							<col style="width:170px">
							<col style="width:*">
						</colgroup>
						<tbody>
						<tr>
							<th scope="row">받는분</th>
							<td>박정현</td>
						</tr>
						<tr>
							<th scope="row">연락처1</th>
							<td>010-5172-8187</td>
						</tr>
		
						<tr>
							<th scope="row">주소</th>
							<td>
								<p>도로명 주소 : 경기도 고양시 덕양구 고골길 123 123123</p>
								<p class="colorGrey">지번주소 : 경기도 고양시 덕양구 관산동 630-2 123123</p>
							</td>
						</tr>
						</tbody>
					</table>
					<!--// 배송정보 -->
				</div>
		
				<div class="order_btn_area">
					<button class="btnGreenW" onclick="location.href=&#39;https://www.oliveyoung.co.kr/store/index.do&#39;;">쇼핑계속</button>
					<button class="btnGreen" onclick="location.href=&#39;https://www.oliveyoung.co.kr/store/mypage/getOrderDetail.do?ordNo=Y1908091247119&#39;;">주문내역조회</button>
				</div>
	
	
	


			</div>
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
	<jsp:include page="./include/Footer.jsp"/>
	<!-- footer// -->
</div>

</body>
</html>