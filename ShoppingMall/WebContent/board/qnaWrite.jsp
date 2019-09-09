<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
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
	<script>
		$(window).ready(function(){
			$('#product_select').hide();
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
		    jQuery('#category').change(function() {
		    	var select = $('#category option:selected').val();
		    	if ( select == '20' || select == '40') {
		    		$('#product_select').show();
		    	} else {
		    		$('#product_select').hide();
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
				<li id="tab1on1" class="on"><a href="./qna.bd">1:1문의</a></li>
				<li id="tabNotice"><a href="./notice.bd">공지사항</a></li>
			</ul>
			
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
					
					<tr id="product_select">
						<th scope="col"><label>문의상품</label></th>
						<td>
							<div class="over" style="width:98%;">
							 	<c:if test="${empty buylist }">
									<p>주문내역이 없습니다</p>
								</c:if>
								<c:if test="${!empty buylist}">
									<select id="product_num" name="product_num" style="width:192px;">
											<option value="0" selected>선택하세요</option>
										<c:forEach var="buylist" items="${buylist}">
											<option value="${buylist.product_num }"><span>${buylist.product_name }</span></option>
										</c:forEach>
									</select>
								</c:if>
							</div>
						</td>
					</tr>
					
					<tr class="textarea">
						<th scope="col"><label for="InputTextarea">제목</label></th>
						<td>
							<input type="text" id="subject" name="subject" placeholder="제목을 입력해주세요." style="width:98%;"></input>
						</td>
					</tr>
					<tr>
						<th scope="col"><label for="InputTextarea">내용</label></th>
						<td>
							<textarea id="content" name="content" cols="5" rows="1" placeholder="내용을 입력해주세요." style="width:98%;height:280px;"></textarea>
						</td>
					</tr>
					<input type="submit" value="전송">
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