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
	
	<link rel="stylesheet" href="./asset/css/board.css"/>
	<link rel="stylesheet" href="./asset/css/global.css"/>
	<link rel="stylesheet" href="./asset/css/contents.css"/>
	<script type="text/javascript" src="./asset/js/jquery-1.9.1.min.js"></script>

	<script type="text/javascript" src="./asset/js/slick.min.js"></script>
	<script type="text/javascript" src="./asset/js/common.js"></script>
</head>
<body>
<%
String id=(String)session.getAttribute("id");
%>
<div id="Wrapper">
	<div id="Container">
		<div id="Contents">	
			<div class="sub_title_area customer">
				<h1>고객센터 <span>무엇을 도와드릴까요?</span></h1>
			</div>
			<ul class="comm1sTabs threeSet customer">
					<li id="tabFaq"><a href="./faq.bd">FAQ</a></li>
				<li id="tab1on1"><a href="./qna.bd">1:1문의</a></li>
				<li id="tabNotice" class="on"><a href="./notice.bd">공지사항</a></li>
			</ul>
			<!-- 
			<form id="sForm" name="sForm">
				<fieldset class="search-faq">
					<legend>FAQ 검색</legend>
					<label for="inqTitNm">FAQ 검색</label>
					<div class="input">
						<input type="text" id="inqTitNm" name="inqTitNm" title="검색어를 입력하세요" placeholder="질문을 검색하세요.">
						<input type="submit" id="searchFaq" value="검색">
					</div>
				</fieldset>
				<input type="hidden" id="faqLrclCd" name="faqLrclCd" value="">
				<input type="hidden" id="faqMdclCd" name="faqMdclCd" value="">
			</form> -->
			
			
			<div id="TabsOpenArea">
			<!-- 공지사항 카테고리  -->
				<div class="area-customer">
					<ul class="comm2sTabs fiveSet pdB30">
						<li>
						<button type="button" onclick="location.href='notice.bd'">전체</button>
						</li>
						<li>
						<button type="button" onclick="location.href='notice.bd?category=10'">일반</button>
						</li>
						<li>
						<button type="button" onclick="location.href='notice.bd?category=20'">매장</button>
						</li>
						<li>
						<button type="button" onclick="location.href='notice.bd?category=30'">이벤트</button>
						</li>
						<li>
						<button type="button" onclick="location.href='notice.bd?category=40'">뷰티테스터</button>
						</li>
					</ul>
				</div>
			<!-- 공지사항 카테고리// -->
				
				<!-- 카테고리 전체  -->
				<div class="TabsConts on"> <!-- 선택됐을때 on  -->
					<ul class="noticeList" id="notice-list">
						</ul><table class="board-list-1s">
						<caption></caption>
						<colgroup>
							<col style="width:9%;">
							<col style="width:79%;">
							<col style="width:12%;"><!-- 2017-03-10 수정 : colgroup 영역 전체 복사+붙여넣기해주세요(각 항목 간격 수정) -->
						</colgroup>
						<thead>
							<tr>
								<th scope="col">번호</th>
								<th scope="col">제목</th>
								<th scope="col">등록일/당첨자 발표일</th>
							</tr>
						</thead>
						<c:forEach var="noticeList" items="${noticeList}" >
						<tbody>
						
						<!-- 공지사항 리스트  -->
						<tr class="notice_fix">
							<td>${noticeList.num }</td><!-- 글번호  -->
							<td class="subject">
									<c:if test="${noticeList.category eq '10' }">
											<strong class="FG01">일반</strong>
									</c:if>
									<c:if test="${noticeList.category eq '20' }">
											<strong class="FG02">매장</strong>
									</c:if>
									<c:if test="${noticeList.category eq '30' }">
											<strong class="FG03">이벤트</strong>
									</c:if>
									<c:if test="${noticeList.category eq '40' }">
											<strong class="FG04">뷰티테스터</strong>
									</c:if>
								<a href="./noticeDetail.bd?num=${noticeList.num }">${noticeList.subject }</a>
							</td> <!-- 글제목  -->
							<td><fmt:formatDate pattern="yyyy-MM-dd" value="${noticeList.reg_date }" /></td><!-- 작성일  -->
						</tr>
						</tbody>
						</c:forEach>
					</table>
				</div>
				
				<!-- 
				<div class="TabsConts">
					일반
				</div>
				<div class="TabsConts">
					매장
				</div>
				<div class="TabsConts">
					이벤트
				</div>
				<div class="TabsConts">
					뷰티테스터
				</div>
				 -->
			</div>
				
						<!-- 페이지번호 -->
		<div id="pageing">
			<c:if test="${pageNo != 0}">
				<c:if test="${pageNo > pageBlock }">
					<a href="./notice.bd?pageNum=${firstPage }"> [첫페이지] </a>
				</c:if>
				<c:if test="${startPage != 1 }">
					<a href="./notice.bd?pageNum=${startPage-pageBlock }"> [이전] </a>
				</c:if>
			
				<c:forEach var="i" begin="${startPage }" end="${endPage }" step="1">
					<c:choose>
						<c:when test="${i eq pageNo }">
							<a href="./notice.bd?pageNum=${i }"><Strong>${i }</Strong></a>
						</c:when>
						<c:otherwise>
							<a href="./notice.bd?pageNum=${i }">${i }</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			
				<c:if test="${pageNo != finalPage}">
					<a href="./notice.bd?pageNum=${startPage+pageBlock}"> [다음] </a>
				</c:if>
				
				<c:if test="${pageNo < finalPage }">
					<a href="./notice.bd?pageNum=${finalPage }"> [마지막페이지]</a>
				</c:if>
			</c:if>
		</div>
				<!-- 페이지번호  -->
		<div>
		
		</div>
		</div>
		<%  
			if(id != null){
			if(id.equals("admin")){
		%>
			<a href="./noticeWrite.bd"> 글쓰기 </a>
		<%} }%>
	</div>
</body>
</html>