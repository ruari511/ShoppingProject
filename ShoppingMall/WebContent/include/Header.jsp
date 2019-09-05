<%@page import="net.cart.db.CartDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<script type="text/javascript" src="./asset/js/common.js"></script>
<script type="text/javascript">
$(window).scroll(function() {
    if ($(this).scrollTop() > 500) {
        $('#top_btn').fadeIn();
    } else {
        $('#top_btn').fadeOut();
    }
});

</script>
</head>

<body>
	
	<div id="Header">
		<div class="top_util">
			<form action="#" method="post">
			<ul class="menu_list">
				<%
				// [로그인 처리시... session값 이동 경로]
			
				//세션id값 전달받기 
				String id=(String)session.getAttribute("id");

				//세션값 없음  -> MemberFrontController서블릿에.. 로그인 | 회원가입 처리 요청  
				if(id==null){
					%>                  
						<li class="login"><a href="./login.do">로그인</a></li>
						<li class="join"><a href="./join.do">회원가입</a></li>	
					<%
				}else{//세션값이 있으면 -> MemberFrontController서블릿에.. 로그아웃 | 회원가입 처리 요청
					CartDAO cdao = new CartDAO();
					int cartCount = cdao.CartCount(id);
					%>
					<li class="logout"><%=id %>님 <a href="./logout.do">로그아웃</a></li>
					<%
					if(id.equals("admin")){
					%>
						<li><a href="./adminMenu.ad">관리자 메뉴</a></li>
					<%		
					}else{
					%>
						<li class="cart"><a href="./CartListAction.buy">장바구니<span id="cartToCnt"></span></a></li>
						<li class="mypage"><a href="./mypage.mp">마이페이지</a></li>
						<li class="order"><a href="#">주문배송</a></li>
					<%
					}
					%>
				<%
				}
				%>
				<li class="customer"><a href="#">고객센터</a></li>
				
				<li class="store"><a href="./MemberDelet.me">매장안내</a></li>
			</ul>
			</form>
		</div>
		<div class="header_inner">
		<form action="./ProductSelectAction.pro" method="post">
			<input type="hidden" name="startrow" value="0">
			<h1><a href="./Main.do"><img src="./asset/image/logo.png" alt="###" /></a></h1>
			<div class="search_box" id="w_search_box">
				<input type="text" id="query" name="query" value="" class="inp_placeholder" style="width: 270px;"/>
				<button id="searchSubmit">검색</button>
			</div>
		</form>
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
						<h2>뷰티</h2>
						<div class="sub_menu_box">
							<p class="sub_depth"><a href="#">스킨케어</a></p>
							<ul>
								<li><a href="#">페이셜케어</a></li>
								<li><a href="#">마스크팩</a></li>
								<li><a href="#">클렌징</a></li>
								<li><a href="#">선케어</a></li>
								<li><a href="#">더모 코스메틱</a></li>
							</ul>
							
							<p class="sub_depth"><a href="#">메이크업</a></p>
							<ul>
								<li><a href="#">베이스</a></li>
								<li><a href="#">네일케어</a></li>
								<li><a href="#">립메이크업</a></li>
								<li><a href="#">아이메이크업</a></li>
							</ul>
							
							<p class="sub_depth"><a href="#">바디케어</a></p>
							<ul>
								<li><a href="#">로션/크림</a></li>
								<li><a href="#">워시/스크럽</a></li>
								<li><a href="#">미스트/오일</a></li>
								<li><a href="#">핸드/풋</a></li>
								<li><a href="#">립케어</a></li>
								<li><a href="#">데오/제모</a></li>
							</ul>
						</div>
							
						<div class="sub_menu_box">
							<p class="sub_depth"><a href="#">헤어케어</a></p>
							<ul>
								<li><a href="#">샴푸/린스</a></li>
								<li><a href="#">트리트먼트/팩</a></li>
								<li><a href="#">스타일링/에센스</a></li>
								<li><a href="#">염모/펌/코팅</a></li>
								<li><a href="#">헤어기기</a></li>
							</ul>
							<p class="sub_depth"><a href="#">향수/디퓨저</a></p>
							<ul>
								<li><a href="#">여성향수</a></li>
								<li><a href="#">남성향수</a></li>
								<li><a href="#">캔들/디퓨저</a></li>
							</ul>
							<p class="sub_depth"><a href="#">미용소품</a></p>
							<ul>
								<li><a href="#">얼굴소품</a></li>
								<li><a href="#">헤어소품</a></li>
								<li><a href="#">네일소품</a></li>
								<li><a href="#">미용가전</a></li>
								<li><a href="#">기타소품</a></li>
							</ul>							
						</div>
							
						<div class="sub_menu_box">
							<p class="sub_depth"><a href="#">남성</a></p>
							<ul>
								<li><a href="#">스킨케어</a></li>
								<li><a href="#">바디케어</a></li>
								<li><a href="#">헤어케어</a></li>
								<li><a href="#">메이크업</a></li>
								<li><a href="#">향수/탈취</a></li>
								<li><a href="#">쉐이빙/잡화</a></li>
							</ul>
						</div>							
					</li>
					
					<li>
						<h2>헬스&푸드</h2>
						<div class="sub_menu_box">
							<p class="sub_depth"><a href="#">건강/위생용품</a></p>
							<ul>
								<li><a href="#">덴탈케어</a></li>
								<li><a href="#">아이케어</a></li>
								<li><a href="#">여성/위생용품</a></li>
								<li><a href="#">마사지/교정/헬스용품</a></li>
								<li><a href="#">스팟패치/의료용품</a></li>
							</ul>
							<p class="sub_depth"><a href="#">건강식품</a></p>
							<ul>
								<li><a href="#">영양보충제</a></li>
								<li><a href="#">다이어트/헬스</a></li>
								<li><a href="#">건강음료/기타</a></li>
								<li><a href="#">일반건강식품</a></li>
							</ul>
							<p class="sub_depth"><a href="#">일반식품</a></p>
							<ul>
								<li><a href="#">과자/초콜릿/캔디</a></li>
								<li><a href="#">간편편의식/냉장/냉동</a></li>
								<li><a href="#">라면/통조림/소스류</a></li>
								<li><a href="#">생수/음료</a></li>
								<li><a href="#">차/커피</a></li>
								<li><a href="#">유제품/두유/우유</a></li>
								<li><a href="#">선물세트</a></li>	
							</ul>
						</div>
					</li>
					<li>
						<h2>라이프</h2>
						<div class="sub_menu_box">
							<p class="sub_depth"><a href="#">반려동물</a></p>
							<ul>
								<li><a href="#">강아지 식품</a></li>
								<li><a href="#">강아지 용품</a></li>
								<li><a href="#">고양이 식품</a></li>
								<li><a href="#">고양이 용품</a></li>
							</ul>
							<p class="sub_depth"><a href="#">베이비</a></p>
							<ul>
								<li><a href="#">스킨/바디케어</a></li>
								<li><a href="#">기저귀/물티슈</a></li>
								<li><a href="#">유아용품</a></li>
								<li><a href="#">분유/이유식/간식</a></li>
							</ul>
							<p class="sub_depth"><a href="#">잡화</a></p>
							<ul>
								<li><a href="#">방향/탈취</a></li>
								<li><a href="#">세제/물티슈/휴지</a></li>
								<li><a href="#">패션용품</a></li>
								<li><a href="#">문구/사무용품</a></li>
								<li><a href="#">음향/통신기기</a></li>
								<li><a href="#">가전/디저털</a></li>
								
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
					<li><a href="./Coupon.cp"><span>쿠폰존</span></a></li>
			</ul>
		</div>
	</div>
	
	
	<a id="top_btn" href="#">TOP</a>
	
</body>
<!-- <script type="text/javascript">
	function adminMenu() {
		location.href="./adminMenu.ad";
	}
</script> -->
</html>
