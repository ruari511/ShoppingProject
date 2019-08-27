<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- 현재 페이지에서 JSTL의 core라이브러리에 속한 태그들을 사용 하기 위한 설정
	core라이브러리에 속한 태그는? 접두사 c를 이용한다. 
 --%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html>
<head>
<meta charset="utf-8">
<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<meta http-equiv="Content-Script-Type" content="text/javascript">
<meta http-equiv="Content-Style-Type" content="text/css">
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
<meta name="format-detection" content="telephone=no">
<meta property="og:title" content="공식 온라인몰">
<meta property="og:url" content="main.html">
<meta property="og:image" content="">
<meta property="og:description" content="">
<title>#</title>

<link rel="stylesheet" href="../asset/css/board.css" />
<link rel="stylesheet" href="../asset/css/global.css" />
<link rel="stylesheet" href="../asset/css/contents.css" />
<script type="text/javascript" src="../asset/js/jquery-1.9.1.min.js"></script>

<script type="text/javascript" src="../asset/js/slick.min.js"></script>
<script type="text/javascript" src="../asset/js/common.js"></script>
</head>
<body>
	<div id="Wrapper">

		<div id="Container">
			<div id="Contents">

				<jsp:include page="mypage_topMenu.jsp" />

				<div class="mypage-conts">
					<script
						src="https://www.oliveyoung.co.kr/pc-static-root/js/mypage/mypage.header.js?dumm=2019080133412"></script>
					<script>
						$(window).ready(function() {
							mypage.header.init();
						});
					</script>



					<div class="title-area linezero">
						<h2 class="tit">쿠폰</h2>
					</div>
					<ul class="coupon-go">
						<li>
							<p>
								쿠폰존에서 다운받을 수 있는<br>쿠폰을 한눈에 확인하세요.
							</p> <a href="./Coupon.cp" id="goCouponZon" name="goCouponZon">쿠폰존 바로가기</a>
						</li>
						<li>
							<p>
								보유하고 계시는<br>쿠폰번호를 등록하세요.
							</p> <a href="javascript:;" id="getCouponLPop" name="getCouponLPop">쿠폰등록하기</a>
						</li>
					</ul>


					<div class="comm1sTabConts show">
						<div class="area-over">
							<button type="button" class="ButtonCoupon right"
								id="getCouponDescInfoLPop" name="getCouponDescInfoLPop">쿠폰안내</button>
						</div>

						<!-- 쿠폰 상품 목록 -->
						<table class="board-list-2s">
							<caption>재입고 상품 목록</caption>
							<colgroup>
								<col style="width: 25%;">
								<col style="width: 45%;">
								<col style="width: 15%;">
								<col style="width: 15%;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col">혜택</th>
									<th scope="col">쿠폰명</th>
									<th scope="col">쿠폰사용조건</th>
									<th scope="col">사용기간</th>
								</tr>
							</thead>
							<tbody id="onCpnList" name="onCpnList">
								<c:set var="coupon" value="${requestScope.cou}"/>
								<c:choose>
									<c:when test="${coupon eq null}">
									<tr>
										<td colspan="4"> 사용 가능한 쿠폰이 없습니다.</td>
									</tr>
									</c:when>
									<c:otherwise>
										<c:forEach var="couponlist" items="${requestScope.cou}">
										<tr>
											<td><span class="coupon-inner percent"> ${couponlist.coupon_percent} %</span></td>
											<td class="subject">${couponlist.coupon_name}</td>
											<td class="colorGrey"><span class="price"> 최대 <span class="price"><fmt:formatNumber value="${couponlist.coupon_limitmax}" pattern="###,###" /></span>원</td>
											<td class="colorGrey">
												<fmt:formatDate value="${couponlist.start_date}" pattern="yyyy.MM.dd"/> 
												<br> ~ <br>
												<fmt:formatDate value="${couponlist.last_date}" pattern="yyyy.MM.dd"/>
											</td>
										</tr>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
						<div class="usage-guide">
							<h2 class="stit">이용안내</h2>
							<ul>
								<li>발급받으신 (사이트이름)에서 사용하시는 경우 다운로드 후 주문/결제 시 적용하실 수 있습니다.</li>
								<li>사용기간이 만료되거나 사용한 쿠폰은 보유 목록에서 자동으로 삭제됩니다.</li>
								<li>주문/취소 시 이용기간이 남아 있는 쿠폰인 경우 재발급됩니다.</li>
							</ul>
						</div>
					</div>

					<!-- CJ ONE 시스템점검 알림 Alert -->

					<script
						src="https://www.oliveyoung.co.kr/pc-static-root/js/mypage/coupon.js?dumm=2019080133412"></script>
					<script>
						$(window).ready(function() {
							mypage.coupon.list.init();
						});
					</script>


				</div>
			</div>

		</div>

		<script type="text/javascript"
			src="https://www.oliveyoung.co.kr/pc-static-root/js/mypage/myorder.js?dumm=2019080133412"></script>
		<script type="text/javascript"
			src="https://www.oliveyoung.co.kr/pc-static-root/js/mypage/gdas.js?dumm=2019080133412"></script>
		<script>
			HDC_PATH = $
					.parseJSON('{"00":"http://nexs.cjgls.com/web/service02_01.jsp?slipno=","10":"http://www.hanjinexpress.hanjin.net/customer/plsql/hddcw07.result?wbl_num=","20":"http://www.lotteglogis.com/personalService/tracking/06/tracking_goods_result.jsp?InvNo=","30":"http://nexs.cjgls.com/web/detail.jsp?slipno=","50":"http://service.epost.go.kr/trace.RetrieveRegiPrclDeliv.postal?sid1=","70":"http://www.ilogen.com/d2d/delivery/invoice_search_popup.jsp?viewType=type2&invoiceNum=","91":"http://www.kglogis.co.kr/delivery/delivery_result.jsp?item_no=","92":"http://www.kglogis.co.kr/delivery/delivery_result.jsp?item_no=","93":"http://kdexp.com/basicNewDelivery.kd?barcode=","94":null,"200":"http://service.epost.go.kr/trace.RetrieveEmsRigiTraceList.comm?POST_CODE=","210":"http://www.dhl.co.kr/content/kr/ko/express/tracking.shtml?brand=DHL&AWB="}');

			$(document).ready(function() {
				mypage.orderList.init();
			});
		</script>
		
	</div>
</body>	
</html>
