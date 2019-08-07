<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<div id="Header">
		<div class="top_util">
			<ul class="menu_list">
				
				<li class="join"><a href="#">회원가입</a></li>
				<li class="login"><a href="#">로그인</a></li>
				<li class="cart"><a href="Cart.jsp">장바구니<span id="cartToCnt"></span></a></li>

				<li class="order"><a href="#">주문배송</a></li>
				<li class="customer"><a href="#">고객센터</a></li>
				<li class="store"><a href="#">매장안내</a></li>
			</ul>
		</div>
		<div class="header_inner">
			<h1><a href="Main.jsp"><img src="./asset/image/logo.png" alt="###" /></a></h1>
			<div class="search_box" id="w_search_box">
			<input type="text" id="query" name="" value="" class="inp_placeholder"/>
			<input type="hidden" name="chkButton" id="chkButton" value="" />		
				<button id="searchSubmit">검색</button>
			</div>
			<!--// 검색영역 -->
			<ul class="mymenu_area">
				<li class="store ">
					<a href="#" class="mymenu_layer" title="관심 매장소식 자세히보기 열기/닫기">관심 매장소식</a>
					<div class="alim_box">
						<p class="store_desc"><span>로그인</span>하시면 자주가는 매장을 <br />관심 매장으로 설정 할 수 있습니다.</p>
						<button class="mymenu_btn" onClick="javascript:common.link.moveLoginPage();">로그인</button>
					</div>
				</li>
				<li class="recent">
					<a href="javascript:;" class="mymenu_layer" title="최근 본 상품 자세히보기 열기/닫기">최근 본 상품</a>
					<div class="recent_prd_box" style="min-height:510px;">
						<p class="recent_tit">전체 <span>0</span>개
						
						<div class="no_data" style="display:none;">
							최근 본 상품이 없습니다.
						</div>
					</div>
				</li>
			</ul>
		</div>
		</div>
		
		<div id="Gnb" class="main">
		<div id="gnbWrap">
			<a href="#" id="btnGnbOpen">전체 카테고리</a>
			<!-- 전체 카테고리 레이어 -->
			<div class="layer_all_menu" id="gnbAllMenu">  <!--active-->
				<ul class="all_menu_wrap">
					<li>
						<h2>일</h2>
						<div class="sub_menu_box">
							<p class="sub_depth"><a href="#">1</a></p>
							<ul>
								<li><a href="#">1-1</a></li>
								<li><a href="#">1-2</a></li>
							</ul>
							<p class="sub_depth"><a href="#">2</a></p>
							<ul>
								<li><a href="#">2-1</a></li>
								<li><a href="#">2-2</a></li>
							</ul>
							<p class="sub_depth"><a href="#">3</a></p>
							<ul>
								<li><a href="#">3-1</a></li>
								<li><a href="#">3-2</a></li>
							</ul>
						</div>
					</li>
					<li>
						<h2>이</h2>
						<div class="sub_menu_box">
							<p class="sub_depth"><a href="#">1</a></p>
							<ul>
								<li><a href="#">1-1</a></li>
								<li><a href="#">1-2</a></li>
							</ul>
							<p class="sub_depth"><a href="#">2</a></p>
							<ul>
								<li><a href="#">2-1</a></li>
								<li><a href="#">2-2</a></li>
							</ul>
							<p class="sub_depth"><a href="#">3</a></p>
							<ul>
								<li><a href="#">3-1</a></li>
								<li><a href="#">3-2</a></li>
							</ul>
						</div>
					</li>
					<li>
						<h2>삼</h2>
						<div class="sub_menu_box">
							<p class="sub_depth"><a href="#">1</a></p>
							<ul>
								<li><a href="#">1-1</a></li>
								<li><a href="#">1-2</a></li>
							</ul>
							<p class="sub_depth"><a href="#">2</a></p>
							<ul>
								<li><a href="#">2-1</a></li>
								<li><a href="#">2-2</a></li>
							</ul>
							<p class="sub_depth"><a href="#">3</a></p>
							<ul>
								<li><a href="#">3-1</a></li>
								<li><a href="#">3-2</a></li>
							</ul>
						</div>
					</li>
				</ul>
				<button id="btnGnbClose">전체 카테고리 창 닫기</button>
			</div>	
			<!--// 전체 카테고리 레이어 -->
			<ul class="gnb_menu_list">
					<li><a href="#"><span>1</span></a></li>	
					<li><a href="#"><span>2</span></a></li>
					<li><a href="#"><span>3</span></a></li>
					<li><a href="#"><span>4</span></a></li>
					<li><a href="#"><span>5</span></a></li>
					<li><a href="#"><span>6</span></a></li>
					<li><a href="#"><span>7</span></a></li>
					<li><a href="#"><span>8</span></a></li>
					<li><a href="#"><span>9</span></a></li>
					<li><a href="#"><span>0</span></a></li>
			</ul>
		</div>
	</div>
	
</body>
</html>