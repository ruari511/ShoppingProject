<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
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
	<title> # </title>
	
	<link rel="stylesheet" href="./asset/css/board.css"/>
	<link rel="stylesheet" href="./asset/css/global.css"/>
	<link rel="stylesheet" href="./asset/css/contents.css"/>
	<script type="text/javascript" src="./asset/js/jquery-1.9.1.min.js"></script>

	<script type="text/javascript" src="./asset/js/slick.min.js"></script>
	<script type="text/javascript" src="./asset/js/common.js"></script>
	<script type="text/javascript">
	$(window).ready(function(){
		var dataMonth = $('#dataMonth').val();
		if(dataMonth == null || dataMonth == '-1'){
			$('.select-month > li ').eq(0).addClass('on');
		}else if(dataMonth == '-3'){
			$('.select-month > li ').eq(1).addClass('on');
		}else if(dataMonth == '-6'){
			$('.select-month > li ').eq(2).addClass('on');
		}else if(dataMonth == '-12'){
			$('.select-month > li ').eq(3).addClass('on');
		}
	});
	
	<%

	String id = (String)session.getAttribute("id");
	if(id == null){
%>
	location.href="./login.do";
<%		
	}
%>
		$(window).ready(function(){
			/* $('#TabsOpenArea').find('.comm2sTabs > li ').on('click', function(){
	            var idx = $(this).index();
	            alert(idx);
	            $('#TabsOpenArea').find('.comm2sTabs > li').removeClass('on').eq(idx).addClass('on');
	        }); */
		    $('.list-customer .stit').click(function(e){
	            e.preventDefault();
	            if($(this).parents('li').hasClass('open')){
	                $(this).parents('li').removeClass('open');
	            }else{
	                $(this).parents('li').addClass('open').siblings().removeClass('open');
	            }
	        });
		}); 
	</script>
	

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
				<li id="tab1on1"  class="on"><a href="./qna.bd">1:1문의</a></li>
				<li id="tabNotice"><a href="./notice.bd">공지사항</a></li>
			</ul>
			
			<fieldset class="search-period">
			<c:set var="dataMonth" value="${requestScope.dataMonth}" />
					<input type="hidden" id="dataMonth" value="${requestScope.dataMonth}"> 
						<legend></legend>
						<ul class="select-month">
							<li><button type="button"  onclick="location.href ='qna.bd?data_month=-1'">1개월</button></li>
							<li><button type="button"  onclick="location.href ='qna.bd?data_month=-3'">3개월</button></li>
							<li><button type="button"  onclick="location.href ='qna.bd?data_month=-6'">6개월</button></li>
							<li><button type="button"  onclick="location.href ='qna.bd?data_month=-12'">12개월</button></li>
						</ul>
			</fieldset>
			
				<div class="TabsConts on">
					<div class="list-customer onenone">
							<c:if test="${empty qnaList}">
							<ul>
								<li class="nodata">등록하신 1:1 문의가 없습니다.</li>
							</ul>
							</c:if>
							<c:if test="${!empty qnaList}">
							<c:forEach  var="qnaList" items="${qnaList }">
						<ul>
							<li>
								<c:if test="${qnaList.re_result eq '0' }">	
									<p class="stit">
										<strong>답변대기</strong> 
								</c:if>
								<c:if test="${qnaList.re_result eq '1' }">
										<p class="stit complete">
											<strong>답변완료</strong>
								</c:if>
									${qnaList.subject } 
									<span class="data"><fmt:formatDate pattern="yyyy-MM-dd" value="${qnaList.reg_date }" /></span>
								</p>
									<ul class="conts">
										<li class="question">
											<strong>문의</strong>
 											<c:if test="${qnaList.product_num != '0'}">${qnaList.product_name }</c:if>
											<p style="white-space:pre;">${qnaList.content }</p>
										</li>
									<c:if test="${qnaList.re_result eq '1' }">
										<li class="answer">
											<strong style="color:#969937">
												답변완료
												<span class="answer_date"><fmt:formatDate pattern="yyyy-MM-dd" value="${qnaList.re_reg_date }" /></span>
											</strong>
											<p  style="white-space:pre;">${qnaList.reply }</p>
										</li>
									</c:if>
									<% 	if(id != null){
										if(id.equals("admin")){
									%>
										<c:if test="${qnaList.re_result eq '0'}">
											<form action="./BoardQnaReplyAction.bd" method="get">
											<li class="conts">
												<strong style="color:#969937">답변</strong>
												<input type="hidden" name="num" value="${qnaList.num }">
												<textarea id="reply" name="reply" cols="5" rows="1" placeholder="답변을 입력하세요" style="width:98%;height:280px;"></textarea>
											</li>
											<input type="submit" value="답변하기">
											</form>
										</c:if>
									<%} 
										}
									%>
									</ul>
							</li>
						</ul>
							</c:forEach>
							</c:if>
					</div>
				</div>


	<div class="pageing">
			<c:if test="${pageNo != 0}">
				<%-- <c:if test="${pageNo > pageBlock }">
					<a href="./qna.bd?pageNum=${firstPage }"> [첫페이지] </a>
				</c:if> --%>
				<c:if test="${startPage != 1 }">
					<a class="prev"href="./qna.bd?pageNum=${startPage-pageBlock }"> [이전] </a>
				</c:if>
			
				<c:forEach var="i" begin="${startPage }" end="${endPage }" step="1">
					<c:choose>
						<c:when test="${i eq pageNo }">
								<Strong>${i }</Strong>
						</c:when>
						<c:otherwise>
							<a href="./qna.bd?pageNum=${i }">${i }</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			
				<c:if test="${endPage < finalPage}">
					<a class="next" href="./qna.bd?pageNum=${startPage+pageBlock}"> [다음] </a>
				</c:if>
				
				<%-- <c:if test="${pageNo < finalPage }">
					<a href="./qna.bd?pageNum=${finalPage }"> [마지막페이지]</a>
				</c:if> --%>
			</c:if>
		</div>
			<%if(id != null){ %>
			<div align="center" style="padding-top: 10px;">
				<a href="./qnaWrite.bd"> 1:1 문의하기 </a>
			</div>
			<%} %>
		</div>
	</div>
	
	
</body>
</html>