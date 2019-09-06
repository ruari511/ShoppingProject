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
	
<body>

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
			
			<table class="board-write-1s mgT40">
			<caption>1:1 문의 등록</caption>
			<colgroup>
				<col style="width:25%;">
				<col style="width:75%;">
			</colgroup>
			<tbody>
				<form id="" action="./faqUpdateAction.bd" method="POST">
					<tr>
						<th scope="col"><label for="TypeInquiry">FAQ유형</label></th>
						<td>
							<select id="category" name="category" title="문의유형 항목을 선택하세요" style="width:192px;">
								<option>선택해주세요</option>
								<option value="10" <c:if test="${faq.category eq '10'}"> selected </c:if>>회원/멤버십</option>
								<option value="20" <c:if test="${faq.category eq '20' }"> selected </c:if>>주문/결제</option>
								<option value="30" <c:if test="${faq.category eq '30' }"> selected </c:if>>배송</option>
								<option value="40" <c:if test="${faq.category eq '40' }"> selected </c:if>>교환/반품/환불</option>
								<option value="50" <c:if test="${faq.category eq '50' }"> selected </c:if>>이벤트</option>
								<option value="60" <c:if test="${faq.category eq '60' }"> selected </c:if>>기타</option>
							</select>
						</td>
					</tr>
					<tr class="textarea">
						<th scope="col"><label for="InputTextarea">제목</label></th>
						<td>
							<input type="text" id="subject" name="subject" placeholder="제목을 입력해주세요.(2000자 이내)" style="width:98%;" value="${faq.subject }"></input>
						</td>
					</tr>
					<tr>
						<th scope="col"><label for="InputTextarea">내용</label></th>
						<td>
							<textarea id="content" name="content" cols="5" rows="1" placeholder="내용을 입력해주세요.(2000자 이내)" style="width:98%;height:280px;">${faq.content }</textarea>
						</td>
					</tr>
					<input type="hidden" name="num" value="${faq.num }">
					<button type="submit">수정</button>
				</form>
			</tbody>
		</table>
				<!-- 페이지번호  -->
		</div>
	</div>
	
	
</body>
</html>