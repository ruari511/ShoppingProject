<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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



					<div class="title-area">
						<h2 class="tit">상품 Q&amp;A</h2>
					</div>


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
						<caption>상품 Q&amp;A 내역 목록</caption>
						<colgroup>
							<col style="width: 367px;">
							<col style="width: 272px;">
							<col style="width: 150px;">
						</colgroup>
						<thead>
							<tr>
								<th scope="col">상품</th>
								<th scope="col">문의내용</th>
								<th scope="col">답변상태</th>
							</tr>
						</thead>
						<tbody class="qna">



							<tr>
								<td class="nodata" colspan="3">작성하신 상품 Q&amp;A가 없습니다.</td>
							</tr>


						</tbody>
					</table>
					<!-- //내역 -->




					<div class="pageing"></div>


					<script
						src="https://www.oliveyoung.co.kr/pc-static-root/js/mypage/gdsQna.js?dumm=2019080133412"></script>
					<script>
						$(window).ready(function() {
							mypage.gdsQna.list.init();
						});
					</script>

				</div>


			</div>
		</div>


	</div>
</body>
</html>
