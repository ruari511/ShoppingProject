<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
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
	
	<link rel="stylesheet" href="./asset/css/board.css"/>
	<link rel="stylesheet" href="./asset/css/global.css"/>
	<link rel="stylesheet" href="./asset/css/contents.css"/>
	<script type="text/javascript" src="./asset/js/jquery-1.9.1.min.js"></script>

	<script type="text/javascript" src="./asset/js/slick.min.js"></script>
	<script type="text/javascript" src="./asset/js/common.js"></script>
</head>
<body>
<div id="Wrapper">
	<div id="Container">
		<div id="Contents">	
			<div class="sub_title_area customer">
				<h1>고객센터 <span>무엇을 도와드릴까요?</span></h1>
			</div>
			<ul class="comm1sTabs threeSet customer">
					<li id="tabFaq"><a href="./faq.bd">FAQ</a></li>
				<li id="tab1on1"><a href="javascript:common.link.moveQnaList();">1:1문의</a></li>
				<li id="tabNotice" class="on"><a href="./notice.bd">공지사항</a></li>
			</ul>
			<br>
			<table class="board-view-1s mgT40">
				<caption>공지사항 상세보기</caption>
				<colgroup>
					<col style="width:80%;">
					<col style="width:20%;">
				</colgroup>
				<tbody>
					<tr>
						<td>
							<c:if test="${noticeDetail.category eq '10' }">
							<strong class="FG01">일반</strong>
							</c:if>
							<c:if test="${noticeDetail.category eq '20' }">
									<strong class="FG02">매장</strong>
							</c:if>
							<c:if test="${noticeDetail.category eq '30' }">
									<strong class="FG03">이벤트</strong>
							</c:if>
							<c:if test="${noticeDetail.category eq '40' }">
									<strong class="FG04">뷰티테스터</strong>
							</c:if>
							<span class="tit">${noticeDetail.subject }</span>
						</td>
						<td class="data">${noticeDetail.reg_date }</td>
					</tr>
					<tr>
						<td class="textus" colspan="2"><div class="contEditor">
						${noticeDetail.content }
					</div></td>
					</tr>
				</tbody>
			</table>
				
			<ul class="prev-next">
				<c:if test="${empty next }">
				<li>
					<button type="button">다음글</button>
						<a>다음글이 존재하지 않습니다.</a>
				</li>
				</c:if>
				<c:if test="${!empty next }">
				<li onclick="location.href='noticeDetail.bd?num=${next.num}">
					<button type="button">다음글</button>
						<c:if test="${next.category eq '10' }">
						<strong class="FG01">일반</strong>
						</c:if>
						<c:if test="${next.category eq '20' }">
								<strong class="FG02">매장</strong>
						</c:if>
						<c:if test="${next.category eq '30' }">
								<strong class="FG03">이벤트</strong>
						</c:if>
						<c:if test="${next.category eq '40' }">
								<strong class="FG04">뷰티테스터</strong>
						</c:if>
					<a href="./noticeDetail.bd?num=${next.num }">${next.subject }</a>
				</li>
				</c:if>
				
				<c:if test="${empty prev }">
				<li>
					<button type="button">이전글</button>
						<a>이전글이 존재하지 않습니다.</a>
				</li>
				</c:if>
				
				<c:if test="${!empty prev }">
				<li onclick="location.href='noticeDetail.bd?num=${prev.num}'">
					<button type="button">이전글</button>
					<c:if test="${prev.category eq '10' }">
							<strong class="FG01">일반</strong>
						</c:if>
						<c:if test="${prev.category eq '20' }">
							<strong class="FG02">매장</strong>
						</c:if>
						<c:if test="${prev.category eq '30' }">
							<strong class="FG03">이벤트</strong>
						</c:if>
						<c:if test="${prev.category eq '40' }">
							<strong class="FG04">뷰티테스터</strong>
						</c:if>
					<a href="./noticeDetail.bd?num=${prev.num }">${prev.subject }</a>
				</li>
				</c:if>
			</ul>
			
			<div class="area1sButton pdT30">
				<a href="./notice.bd" class="btnGreen">목록보기</a>
			</div>
			<div>
				<a href="./noticeUpdate.bd?num=${noticeDetail.num }">수정하기</a>
			</div>
			<div>
				<a href="./noticeDelete.bd?num=${noticeDetail.num }">삭제하기</a>
			</div>

		</div>
		
	</div>

</body>
</html>