<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    --%>
<!DOCTYPE html>

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
<title>#</title>

<link rel="stylesheet" href="../asset/css/board.css" />
<link rel="stylesheet" href="../asset/css/global.css" />
<link rel="stylesheet" href="../asset/css/contents.css" />
<script type="text/javascript" src="../asset/js/jquery-1.9.1.min.js"></script>

<script type="text/javascript" src="../asset/js/slick.min.js"></script>
<script type="text/javascript" src="../asset/js/common.js"></script>
<script>
	$(window).ready(function() {
		$('#cancel_reason_text').hide();
		jQuery('#cancel_reason').change(function() {
			var select = $('#cancel_reason option:selected').val();
			if (select == '4') {
				$('#cancel_reason_text').show();
			} else {
				$('#cancel_reason_text').hide();
			}
		});
	});
</script>
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


					<form name="cancelForm" id="cancel-form">

						<h3 class="sub-title3">취소상품정보</h3>

						<table class="board-list-2s">
							<caption>배송상품</caption>
							
						<colgroup>
							<col style="width:40px;">
							<col style="width:*;">
							<col style="width:110px;">
							<col style="width:110px;">
							<col style="width:110px;">
						</colgroup>
						<thead>
							<tr>
								<th scope="col" colspan="2">상품명</th>
								<th scope="co;">판매가</th>
								<th scope="col">수량</th>
								<th scope="col">구매가</th>
							</tr>
						</thead>
							<tbody class="history3">
								<c:forEach var="buylist" items="${buylist}" varStatus="status">
									<tr>
										<td><input type="checkbox" name="cancel_CheckBox""></td>
										<td class="subject">
											<div class="area">
												<a class="thum"
													href="ProductDetailAction.pro?product_num=${buylist.product_num }">
													<img src="./asset/image/${buylist.img_main }">
												</a>
												<div class="textus" style="width: 68%;">
													<a class=""
														href="ProductDetailAction.do?product_num=${buylist.product_num }">
														<span class="tit">${buylist.product_name }</span> <%-- <span class="txt">${buylist.product_subname }</span> --%>
													</a>
												</div>
											</div>
										</td>
										<td class="colorBlack"><strong>${buylist.product_price - buylist.product_sale_price}</strong>
											원</td> <!-- 판매가  -->
										<td>${buylist.buy_count}</td>
										<td class="colorOrange"><strong>${(buylist.product_price - buylist.product_sale_price - buylist.point)* buylist.buy_count }</strong>
											원</td> <!-- 구매가  -->
							<!-- 총 주문 금액 -->
							<c:set var="total_price" value="${total_price + (buylist.product_price - buylist.product_sale_price) * buylist.buy_count }"/>
							<!-- 총 배송료 -->
							<c:set var="total_delivery" value="${total_delivery + delivery_cost}"/>
							<!--  -->
							<c:set var="total_coupon" value="${total_coupon + (buylist.all_coupon_num * 100) }" />
							<!-- 총 포인트 할인금액  -->
							<c:set var="total_point" value="${total_sale + buylist.point}"/>

										<%-- <td class="bgnone">
							${buylist.delivery_result }
							<!-- 총 배송료 -->
							<c:set var="total_delivery" value="${total_delivery + delivery_cost}"/>
							<!--  -->
							<c:set var="total_coupon" value="${total_coupon + (buylist.all_coupon_num * 100) }" />
							<!-- 총 포인트 할인금액  -->
							<c:set var="total_point" value="${total_sale + buylist.point}"/>
							</td> --%>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<script>
						var rowData = new Array();
						var tdArr = new Array();
						var checkbox = $("input[name=cancel_CheckBox]:checked");
						
						// 체크된 체크박스 값을 가져온다
						checkbox.each(function(i) {
							
							// 체크된 체크박스 값을 가져온다
							checkbox.each(function(i) {
					
								// checkbox.parent() : checkbox의 부모는 <td>이다.
								// checkbox.parent().parent() : <td>의 부모이므로 <tr>이다.
								var tr = checkbox.parent().parent().eq(i);
								var td = tr.children();
								
								// 체크된 row의 모든 값을 배열에 담는다.
								rowData.push(tr.text());
								
								// td.eq(0)은 체크박스 이므로  td.eq(1)의 값부터 가져온다.
								var no = td.eq(1).text()+", "
								var userid = td.eq(2).text()+", ";
								var name = td.eq(3).text()+", ";
								var email = td.eq(4).text()+", ";
								
								// 가져온 값을 배열에 담는다.
								tdArr.push(no);
								tdArr.push(userid);
								tdArr.push(name);
								tdArr.push(email);
								
								//console.log("no : " + no);
								//console.log("userid : " + userid);
								//console.log("name : " + name);
								//console.log("email : " + email);
								
							});
							
						});
						</script>

						<h3 class="sub-title3">취소사유 선택</h3>
						<table class="board-write-2s view">
							<caption></caption>
							<colgroup>
								<col style="width: 25%;">
								<col style="width: 75%;">
							</colgroup>
							<tbody>
								<tr class="addr">
									<th scope="row"><label for="NameBank">사유</label></th>
									<td class="star"><select id="cancel_reason"
										name="cancel_reason" title="사유를 선택해주세요." style="width: 200px;">
											<option select="selected">사유를 선택해주세요</option>
											<option value="1">고객단순변심</option>
											<option value="2">주문오류</option>
											<option value="3">배송지연</option>
											<option value="4">직접입력</option>
									</select>
										<div id="cancel_reason_text">
											<textarea name="cancel_reason_text" cols="5" rows="1"
												placeholder="내용을 입력하세요 (50자)"
												style="width: 95%; height: 70px;"></textarea>
										</div>
									</td>
								</tr>
							</tbody>
						</table>

						<h3 class="sub-title3">환불내역</h3>
						
				<div class="price-conts" id="refund-list">
					<ul class="list ">
						<li>
							<dl>
								<dt>취소 금액</dt>
								<c:set var="total" value="${total + total_price + total_delivery}"/>
								<dd>
									<c:out value="${total}" /><em>원</em>
								</dd>
							</dl>
							<ul>
								<li>
									<span class="txt">취소 상품금액</span>
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
							<strong>환불 예정 금액</strong>
							<span><c:out value="${total - total_coupon - total_point }"/><em>원</em></span>
						</div>

							<div class="area1sButton mgT20">
								<a href="./mypage.mp" class="btnGray">이전</a>
								<a href="./mypage_BuyCancel.mp" class="btnGreen">신청</a>
							</div>
					</div>
				</div>
				</div>
				</div>
			</div>
			</div>
			</div>
</body>
</html>
