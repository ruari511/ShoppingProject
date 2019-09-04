<%@page import="java.util.List"%>
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
	<script>
		$(window).ready(function(){
			/* $('#TabsOpenArea').find('.comm2sTabs > li ').on('click', function(){
	            var idx = $(this).index();
	            alert(idx);
	            $('#TabsOpenArea').find('.comm2sTabs > li').removeClass('on').eq(idx).addClass('on');
	        }); */
		    $('.list-customer .tit').click(function(e){
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
				<li id="tabFaq" class="on"><a href="./faq.bd">FAQ</a></li>
				<li id="tab1on1"><a href="javascript:common.link.moveQnaList();">1:1문의</a></li>
				<li id="tabNotice"><a href="./notice.bd">공지사항</a></li>
			</ul>
			
			<form id="sForm" name="sForm" action="./faq.bd" method="POST">
				<fieldset class="search-faq">
					<legend>FAQ 검색</legend>
					<label for="inqTitNm">FAQ 검색</label>
					<div class="input">
						<input type="text" name="search" title="검색어를 입력하세요" placeholder="질문을 검색하세요.">
						<input type="submit" value="검색">
					</div>
				</fieldset>
			</form>
			
			<div id="TabsOpenArea">
			<!-- 카테고리  -->
				<div class="area-customer">
					<ul class="comm2sTabs iconTab">
					<!-- 컨트롤러에서 data-cd 값을 받아와 해당하는 값에 맞는 리스트를 뿌려줌 -->
						<li><button type="button" class="icon_tab01" onclick="location.href ='faq.bd<c:if test="${search != null}">?search=${search} </c:if>'">전체</button>
						</li>
						<!-- <li data-cd="40"><button type="button" class="icon_tab02">회원/멤버십</button> 카테고리2 
							<ul class="twoTabs">
								<li><button type="button">전체</button></li>	카테고리2_1
								<li data-cd="01"><button type="button">회원 가입/탈퇴</button></li>	카테고리2_2
								<li data-cd="02"><button type="button">로그인</button></li>
								<li data-cd="03"><button type="button">회원정보 변경</button></li>
								<li data-cd="05"><button type="button">올리브영 멤버십</button></li>
							</ul>
						</li> -->
						<li>
							<button type="button" class="icon_tab02" onclick="location.href ='faq.bd?category=10<c:if test="${search != null}">&search=${search} </c:if>'">회원/멤버십</button>
						</li>
						<li>
							<button type="button" class="icon_tab03" onclick="location.href ='faq.bd?category=20<c:if test="${search != null}">&search=${search} </c:if>'">주문/결제</button>
						</li>
						
						<li>
							<button type="button" class="icon_tab04" onclick="location.href ='faq.bd?category=30<c:if test="${search != null}">&search=${search} </c:if>'">배송</button>
						</li>
						
						<li>
							<button type="button" class="icon_tab05" onclick="location.href ='faq.bd?category=40<c:if test="${search != null}">&search=${search} </c:if>'">교환/반품/환불</button>
						</li>
	
						<li>
							<button type="button" class="icon_tab06" onclick="location.href ='faq.bd?category=50<c:if test="${search != null}">&search=${search} </c:if>'">이벤트</button>
						</li>
						
						<li>
							<button type="button" class="icon_tab07" onclick="location.href ='faq.bd?category=60<c:if test="${search != null}">&search=${search} </c:if>'">기타</button>
						</li>
					</ul>
				</div>
				
				<div class="TabsConts on"> <!-- 선택됐을때 on  -->
					<div class="list-customer">
						<ul>
							<!-- 반복  -->
							<c:forEach var="faqList" items="${faqList}">
							<input type="hidden" name="num" value="${faqList.num }">
							<li>
								<p class="tit">
									<c:if test="${faqList.category eq '10'}">
										<strong>회원/멤버십</strong>
									</c:if>
									<c:if test="${faqList.category eq '20' }">
										<strong>주문/결제</strong>
									</c:if>
									<c:if test="${faqList.category eq '30' }">
										<strong>배송</strong>
									</c:if>
									<c:if test="${faqList.category eq '40' }">
										<strong>교환/반품/환불</strong>
									</c:if>
									<c:if test="${faqList.category eq '50' }">
										<strong>이벤트</strong>
									</c:if>
									<c:if test="${faqList.category eq '60' }">
										<strong>기타</strong>
									</c:if>
									${faqList.subject}<!-- qna 제목  --></p>
									<ul class="conts">
										<li class="question">
											<p class="pdzero"></p>
											<p>${faqList.content}<!-- qna 내용  --></p>
											<p></p>
											<!-- admin일때  -->
											<div align="right">
												<a href="./faqUpdate.bd?num=${faqList.num }"> 수정 </a>
												<a href="./faqDelete.bd?num=${faqList.num }"> 삭제 </a>
											</div>
											<!-- admin일때//  -->
										</li>
									</ul>
								</li>
							</c:forEach>
						</ul>
					</div>
				</div>
				
				<!-- 페이지번호 -->
		<div id="pageing">
			<c:if test="${pageNo != 0}">
				<c:if test="${pageNo > pageBlock }">
					<a href="./faq.bd?pageNum=${firstPage }"> [첫페이지] </a>
				</c:if>
				<c:if test="${startPage != 1 }">
					<a href="./faq.bd?pageNum=${startPage-pageBlock }"> [이전] </a>
				</c:if>
			
				<c:forEach var="i" begin="${startPage }" end="${endPage }" step="1">
					<c:choose>
						<c:when test="${i eq pageNo }">
							<a href="./faq.bd?pageNum=${i }"><Strong>${i }</Strong></a>
						</c:when>
						<c:otherwise>
							<a href="./faq.bd?pageNum=${i }">${i }</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			
				<c:if test="${pageNo != finalPage}">
					<a href="./faq.bd?pageNum=${startPage+pageBlock}"> [다음] </a>
				</c:if>
				
				<c:if test="${pageNo < finalPage }">
					<a href="./faq.bd?pageNum=${finalPage }"> [마지막페이지]</a>
				</c:if>
			</c:if>
		</div>
				<!-- 페이지번호  -->
		</div>
	</div>
	
	
</body>
</html>