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
						<h2 class="tit">상품평</h2>
					</div>

					<ul class="comm1sTabs mgzero">
						<li class="on"><a href="javascript:void(0);">작성한 상품평</a></li>
					</ul>

					<fieldset class="search-period">
						<legend></legend>
						<ul class="select-month">
							<li class="on"><button type="button" data-month="-1">1개월</button></li>
							<li><button type="button" data-month="-3">3개월</button></li>
							<li><button type="button" data-month="-6">6개월</button></li>
							<li><button type="button" data-month="-12">12개월</button></li>
						</ul>
						<div class="select-range">
							<select id="cal-start-year" title="년도를 선택하세요" style="width: 76px;">

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



					<table class="board-list-2s mgT20 new">
						<caption>상품평 목록</caption>
						<colgroup>
							<col style="width: 50%;">
							<col style="width: 40%;">
							<col style="width: 10%;">
						</colgroup>
						<thead>
							<tr>
								<th scope="col">상품</th>
								<th scope="col" colspan="2">상품평</th>
							</tr>
						</thead>
						<tbody>

							<tr>
								<td class="nodata" colspan="2">작성 상품평이 없습니다.</td>
							</tr>


						</tbody>
					</table>

					<div class="usage-guide">
						<h2 class="stit">이용안내</h2>
						<ul>
							<li>상품평의 저작권은 올리브영에 있으며, 모두 공개를 원칙으로 합니다.</li>
							<li>상품평에 적합하지 않은 내용, 미풍양속을 해치는 내용 등은 통보 없이 삭제될 수 있으며 상품평 삭제시
								지급된 포인트가 회수됩니다.</li>
							<li>명예훼손, 저작권, 초상권의 권리 침해 및 음란게시물은 관련 법률에 의해 제재를 받을 수 있습니다.</li>
							<li>이미지는 10MB 이하의 png, gif, jpg 파일만 등록 가능하며 최대 10개까지 등록
								가능합니다.</li>
						</ul>
					</div>
					<form id="frmGdasList" name="frmGdasList">
						<input type="hidden" id="goodsNo" name="goodsNo" value="">
						<input type="hidden" id="ordNo" name="ordNo" value="">
					</form>
					<script type="text/javascript"
						src="https://www.oliveyoung.co.kr/pc-static-root/js/mypage/gdas.js?dumm=2019080133412"></script>
					<script>
						$(document).ready(function() {
							mypage.gdasCompleteList.init();
						});
					</script>

				</div>


			</div>
		</div>


	</div>
</body>
</html>