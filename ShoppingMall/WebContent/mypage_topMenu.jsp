<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<script type="text/javascript" src="./asset/js/common.js"></script>
</head>
<body>
	
	<!-- 마이페이지 탑 -->
	<div class="mypage-head iconGrade4">
		<h1 class="tit"><a href="https://www.oliveyoung.co.kr/store/mypage/myPageMain.do">마이페이지</a>PAGE</h1>
		<p class="text">(이름)님의 멤버십 등급은 <span>(등급)</span>입니다.</p>
		<ul class="infor execu">
			<li>
				<ul>
					<li id="memberShipInfo" onclick="">
						<a href="javascript:;" >등급혜택</a>
					</li>
				</ul>
			</li>
			<li id="cjOnePoingInfo" onclick="">
				<span class="tit">포인트</span>
				<a class="num" href="javascript:;" >0<em class="unit">P</em></a>
			</li>
			<li id="couponList" onclick="">
				<span class="tit">쿠폰</span>
				<a class="num" href="javascript:;" >0<em class="unit">개</em></a>
			</li>

		</ul>
	</div>
	<!-- 마이페이지 탑 -->
			
	<!-- 마이페이지 왼측 메뉴바 -->
	<div class="mypage-ix">
		<div class="mypage-lnb">
			<ul>
				<li><h2>마이 쇼핑</h2>
					<ul class="first">
						<li class="subMenu"><a href="javascript:;" myMenuId="0101">주문/배송 조회</a></li>
						<li class="subMenu"><a href="mypage_OrderCancelList.jsp" myMenuId="0102">취소/반품/교환 내역</a></li>
						<li class="subMenu"><a href="Cart.jsp" myMenuId="0201">장바구니</a></li>
					</ul>
					<ul>
						<li class="subMenu"><a href="mypage_PointInfo.jsp" myMenuId="0301">포인트</a></li>
						<li class="subMenu"><a href="mypage_coupon.jsp" myMenuId="0302">쿠폰</a></li>
					</ul>
				</li>
				<li><h2>마이 활동</h2>
					<ul>
						<li class="subMenu"><a href="mypage_Review.jsp" myMenuId="0402">상품평</a></li>
						<li class="subMenu"><a href="mypage_GoodsQnaList.jsp" myMenuId="0403">상품Q&amp;A내역</a></li>
					</ul>
				</li>
				<li><h2>마이 정보</h2>
					<ul>
						<li class="subMenu"><a href="MemberInfoModify.jsp" myMenuId="0501">회원정보 수정</a></li>
						<li class="subMenu"><a href="MemberOut.jsp" myMenuId="0504">회원탈퇴</a></li>
					</ul>
				</li>
			</ul>
		</div>
		<!-- 마이페이지 왼측 메뉴바 -->
		<!-- //마이페이지 SUB 메뉴 -->

		<!-- //마이페이지 SUB -->
		<script src="https://www.oliveyoung.co.kr/pc-static-root/js/mypage/mypage.side.js?dumm=2019080133412"></script>
		<script>
			$(window).ready(function(){
			    mypage.side.init();
			});
		</script>
	
</body>
</html>