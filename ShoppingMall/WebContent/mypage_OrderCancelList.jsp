<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<title>#</title>

<link rel="stylesheet" href="./asset/css/board.css" />
<link rel="stylesheet" href="./asset/css/global.css" />
<link rel="stylesheet" href="./asset/css/contents.css" />
<script type="text/javascript" src="./asset/js/jquery-1.9.1.min.js"></script>

<script type="text/javascript" src="./asset/js/slick.min.js"></script>
<script type="text/javascript" src="./asset/js/common.js"></script>
</head>
<body>
	<div id="Wrapper">
		<jsp:include page="./include/Header.jsp" />

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





					<div class="title-area">
						<h2 class="tit">취소/반품/교환 내역</h2>
					</div>



					<fieldset class="search-period">
						<legend></legend>
						<ul class="select-month">
							<li class="on"><button type="button" data-month="-1">1개월</button></li>
							<li><button type="button" data-month="-3">3개월</button></li>
							<li><button type="button" data-month="-6">6개월</button></li>
							<li><button type="button" data-month="-12">12개월</button></li>
						</ul>
						<div class="select-range">
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
						</div>
						<button type="button" class="btnLookup" id="do-search-period">조회</button>
					</fieldset>
					<script type="text/javascript"
						src="https://www.oliveyoung.co.kr/pc-static-root/js/common/searchPeriod.js?dumm=2019080133412"></script>
					<script>
						START_DATE = '';
						END_DATE = '';

						$(document).ready(function() {
							SearchPeriod.init();
						});
					</script>

					<table class="board-list-2s mgT20">
						<caption>취소&반품&교환 내역 목록</caption>
						<colgroup>
							<col style="width: 16%;">
							<col style="width: %;">
							<col style="width: 130px;">
							<col style="width: 8%;">
							<col style="width: 110px;">
						</colgroup>
						<thead>
							<tr>
								<th scope="col">주문번호</th>
								<th scope="col">상품</th>
								<th scope="col">구매가</th>
								<th scope="col">수량</th>
								<th scope="col">상태</th>
							</tr>
						</thead>



						<tbody class="history">
							<tr>
								<td colspan="5" class="nodata">기간 내 취소/반품/교환 내역이 없습니다</td>
							</tr>
						</tbody>


					</table>






					<script type="text/javascript"
						src="https://www.oliveyoung.co.kr/pc-static-root/js/mypage/myorder.js?dumm=2019080133412"></script>
					<script>
						$(document).ready(function() {
							mypage.orderCancelList.init();
						});
					</script>

				</div>


			</div>
		</div>

		<jsp:include page="./include/Footer.jsp" />

	</div>
</body>
</html>