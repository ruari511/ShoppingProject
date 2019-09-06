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
				<li id="tab1on1"><a href="./qna.bd">1:1문의</a></li>
				<li id="tabNotice"><a href="./notice.bd">공지사항</a></li>
			</ul>
			
			<fieldset class="search-period">
						<legend></legend>
						<ul class="select-month">
							<li><button type="button"  onclick="location.href ='mypage.mp?data_month=-1'">1개월</button></li>
							<li><button type="button"  onclick="location.href ='mypage.mp?data_month=-3'">3개월</button></li>
							<li><button type="button"  onclick="location.href ='mypage.mp?data_month=-6'">6개월</button></li>
							<li><button type="button"  onclick="location.href ='mypage.mp?data_month=-12'">12개월</button></li>
						</ul>
					</fieldset>
				<div class="list-customer onenone">
			<table class="board-write-1s mgT40">
			<caption>1:1 문의 등록</caption>
			<colgroup>
				<col style="width:25%;">
				<col style="width:75%;">
			</colgroup>
			<tbody>
				<form id="cnslRegForm" action="./BoardQnaWriteAction.bd" method="POST">
					<tr>
						<th scope="col"><label for="TypeInquiry">문의유형</label></th>
						<td>
							<select id="category" name="category" title="문의유형 항목을 선택하세요" style="width:192px;">
								<option selected="selected">선택해주세요</option>
								<option value="10" >회원/멤버십</option>
								<option value="20" >주문/결제</option>
								<option value="30" >배송</option>
								<option value="40" >교환/반품/환불</option>
								<option value="50" >이벤트</option>
								<option value="60" >기타</option>
							</select>
						</td>
					</tr>
					<tr id="cnslGoodsSelect">
					
						<th scope="col"><label for="goodsInquiry">문의상품</label></th>
						<td>
							<div class="over" style="width:98%;">
								<div class="input-delete" style="width:84%;">
									<input type="text" id="goodsInquiry" title="문의상품을 선택해 주세요" placeholder="문의상품을 선택해 주세요" readonly="readonly">
									<button type="button" class="ButtonDelete" onClick="javascript:counsel.reg.goodsDel();">삭제</button>
								</div>
								<input type="button" class="ButtonSubmit" onClick="javascript:counsel.reg.openCnslGoodsList('open');return false;" value="문의상품 선택">
							</div>
						</td>
					</tr>
					
					<tr class="textarea">
						<th scope="col"><label for="InputTextarea">제목</label></th>
						<td>
							<input type="text" id="subject" name="subject" placeholder="제목을 입력해주세요.(200자 이내)" style="width:98%;"></input>
						</td>
					</tr>
					<tr>
						<th scope="col"><label for="InputTextarea">내용</label></th>
						<td>
							<textarea id="content" name="content" cols="5" rows="1" placeholder="내용을 입력해주세요.(2000자 이내)" style="width:98%;height:280px;"></textarea>
						</td>
					</tr>
					<input type="submit" value="전송">
					<!-- <tr class="notice">
						<th scope="col">답변등록 알림(선택)</th>
						<td>
							<ul>
								<li>
									<input type="checkbox" id="NoticeSms" value="Y" name="smsRcvYn" class="chkSmall" checked="checked"><label for="NoticeSms">SMS</label>
									<select title="통신사를 선택하세요" id="rgnNoSelect" class="sms" name="cellSctNo" style="width:122px;" disabled="disabled">
										<option selected="selected">010</option>
										<option>011</option>
										<option>016</option>
										<option>017</option>
										<option>018</option>
										<option>019</option>
										<option>0130</option>
										<option>0303</option>
										<option>0502</option>
										<option>0504</option>
										<option>0505</option>
										<option>0506</option>
									</select>
									<input type="hidden" id="cellSctNo" value="010"/>
									<span class="des">-</span>
									<input type="tel" class="sms" name="cellTxnoNo" value="6478" title="휴대폰 가운데 4자리를 입력하세요" maxlength="4" disabled="disabled" placeholder="0000" style="width:122px;">
									<span class="des">-</span>
									<input type="tel" class="sms" name="cellEndNo" value="0023" title="휴대폰 마지막 4자리를 입력하세요" maxlength="4" disabled="disabled" placeholder="0000" style="width:122px;">
								</li>
								<li>
									<input type="checkbox" id="NoticeEmail" name="emailRcvYn" value="Y" class="chkSmall"><label for="NoticeEmail">E-mail</label>
									<input type="text" title="아이디를 입력하세요" class="email" name="emailAddr1" placeholder="아이디를 입력하세요" style="width:152px;ime-mode:disabled;" disabled="disabled">
									<span class="des">@</span>
									<input type="text" class="email" name="emailAddr2" title="직접 입력 하세요" placeholder="직접 입력 하세요" style="width:140px;ime-mode:disabled;" disabled="disabled">
									<input type="hidden" name="emailAddr" value="ghost0023@nate.com"/>
									<select title="도메인 주소를 선택하세요." class="email" style="width:122px;"  id="emailAddrSelect" disabled="disabled">
										<option value="-1" selected="selected">직접입력</option>
										<option value="hanmail.net">hanmail.net</option>
										<option value="naver.com">naver.com</option>
										<option value="nate.com">nate.com</option>
										<option value="hotmail.com">hotmail.com</option>
										<option value="yahoo.co.kr">yahoo.co.kr</option>
										<option value="paran.com">paran.com</option>
										<option value="empal.com">empal.com</option>
										<option value="gmail.com">gmail.com</option>
										<option value="dreamwiz.com">dreamwiz.com</option>
										<option value="korea.com">korea.com</option>
										<option value="lycos.co.kr">lycos.co.kr</option>
										<option value="hanafos.com">hanafos.com</option>
										<option value="daum.net">daum.net</option>
										<option value="chol.com">chol.com</option>
										<option value="feechal.com">feechal.com</option>
									</select>
								</li>
							</ul>
						</td>
					</tr> -->
				</form>
			</tbody>
		</table>
		<!-- //등록 게시판 -->
		
	
	</div>
		<!-- //#Contents -->
</div>

					
	
		</div>
	</div>
	
	
</body>
</html>