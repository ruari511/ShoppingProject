<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
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


	<link rel="stylesheet" href="./asset/css/global.css"/> 
	<script type="text/javascript" src="./asset/js/jquery-1.9.1.min.js"></script>

	<script type="text/javascript" src="./asset/js/slick.min.js"></script>
	<script type="text/javascript" src="./asset/js/common.js"></script>
</head>
<body>

<div id="Wrapper">
	<div id="skip_navi"><a href="#Container">본문바로가기</a></div>
	<div id="Header">
		<div class="top_util">
			<ul class="menu_list">
				
				<li class="join"><a href="#">회원가입</a></li>
				<li class="login"><a href="#">로그인</a></li>
				<li class="cart"><a href="#">장바구니<span id="cartToCnt"></span></a></li>

				<li class="order"><a href="javascript:common.link.moveOrderList();">주문배송</a></li>
				<li class="customer"><a href="javascript:common.link.moveCounselMain();">고객센터</a></li>
				<li class="store"><a href="javascript:common.link.moveStoreMain();">매장안내</a></li>
			</ul>
		</div>
		<div class="header_inner">
			<h1><a href="#" style="background:red"; ><img src="#" alt="###" /></a></h1>
			<div class="search_box" id="w_search_box">
			<input type="text" id="query" name="" value="" class="inp_placeholder"/>
				
	<input type="hidden" name="chkButton" 	 		id="chkButton" 		value="" />		
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
						<h2>뷰티</h2>
						<div class="sub_menu_box">
							<p class="sub_depth"><a href="#" data-ref-dispCatNo="10000010001">스킨케어</a></p>
							<ul>
								<li><a href="#" data-ref-dispCatNo="100000100010004">더모 코스메틱</a></li>
							</ul>
							<p class="sub_depth"><a href="javascript:void(0);" data-ref-dispCatNo="10000010002">메이크업</a></p>
							<ul>
								<li><a href="#" data-ref-dispCatNo="100000100020007">아이메이크업</a></li>
							</ul>
					</li>
					<li>
						<h2>헬스&푸드</h2>
						<div class="sub_menu_box">
							<p class="sub_depth"><a href="javascript:void(0);" data-ref-dispCatNo="10000020003">건강/위생용품</a></p>
							<ul>
								<li><a href="javascript:common.link.moveCategory('100000200030005')" data-ref-dispCatNo="100000200030005">스팟패치/의료용품</a></li>
							</ul>
							<p class="sub_depth"><a href="javascript:void(0);" data-ref-dispCatNo="10000020001">건강식품</a></p>
							<ul>
								<li><a href="javascript:common.link.moveCategory('100000200010005')" data-ref-dispCatNo="100000200010005">일반건강식품</a></li>
							</ul>
						</div>
					</li>
					<li>
						<h2>라이프</h2>
						<div class="sub_menu_box">
							<p class="sub_depth"><a href="javascript:void(0);" data-ref-dispCatNo="10000030003">반려동물</a></p>
							<ul>
								<li><a href="javascript:common.link.moveCategory('100000300030004')" data-ref-dispCatNo="100000300030004">고양이 용품</a></li>
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

	<div id="Container">
			123456789
	</div>

	<!-- #Footer -->
	<div id="Footer">
		<div class="oneConts">
			<div class="conts">
				<ul class="list-menu">
					<li><a class="brandstory" href="#">회사소개</a></li>
					<li><a class="recruit" href="#">채용안내</a></li>
					<li><a class="prvsuser" href="#">가맹점 개설문의</a></li>
					<li><a class="cjoyp" href="#" target="_blank">상품입점 및 제휴문의</a></li>
					<li><a class="cyberAudit" href="#">사이버 감사실</a></li>
					<li><a class="faqList" href="#">고객센터</a></li>
				</ul>
			</div>
		</div>
		<div class="twoConts">
			<div class="conts">
				<ul class="list-area">
					<li>
						<p class="logo"><a href="javascript:common.link.moveMainHome();"><img src="../../../image.oliveyoung.co.kr/pc-static-root/image/footer/foot_logo.png" alt="OLIVEYOUNG"></a></p>
						<h2>네트웍스 주식회사</h2>
						<p>대표이사 : ### | 사업자등록번호 : 123-45-78910</p>
						<p>주소 : (12345) 서울특별시 ##구 ####로 ##, ##층 <br>(###, ##시티)</p>
						<p>통신판매업신고번호 : 2017-####-####</p>
						
					</li>
					<li>
						<ul class="list-link">
							<li><a href="#">이용약관</a><a href="javascript:common.link.moveLegalPage();">법적고지</a></li>
							<li><a href="#">개인정보처리방침</a></li>
							<li><a href="#">청소년보호방침</a></li>
							<li><a href="#">영상정보처리기기운영/관리방침</a></li>
							<li><a href="#">이메일무단수집거부</a></li>
						</ul>
					</li>
					<li>
						<h2>#서비스</h2>
						<p>
							고객님은 안전거래를 위해 모든거래 결제시<br>저희 쇼핑몰에서 가입한 LG U+ 전자 결제의<br>매매보호(에스크로) 서비스를 이용하실 수<br>있습니다.<br>
							<a class="link" href="javascript:common.link.openLGUPEscrow();">서비스 가입사실 확인 &gt;</a>
						</p>
					</li>
				</ul>
			</div>
		</div>
		<div class="fourConts">
			<div class="conts">
				<ol>
					<li class="isms">정보보호 관리체계 ISMS 인증획득
						<span class="bar">인증범위 : 온라인쇼핑몰운영(올리브영)</span>
						<span class="bar">유효기간 : 2017.12.27 - 2020.12.26</span>
					</li>
					<li class="ncsi">2017~2018 국가고객만족도 NCSI 헬스앤뷰티전문점 부분 2년 연속 1위​</li>
				</ol>
			</div>
		</div>
		<div class="threeConts">
			<div class="conts">
				<p class="copyright">Copyright ⓒ 2017 CJ #. All Rights Reserved.</p>
				<div class="sns">
					<h2># # #</h2>
					<a class="facebook" href="#" title="페이지 이동" target="_blank"><img src="../../../image.oliveyoung.co.kr/pc-static-root/image/footer/%40facebook.gif" alt="페이스북"></a>
					<a class="twitter" href="#" title="페이지 이동" target="_blank"><img src="../../../image.oliveyoung.co.kr/pc-static-root/image/footer/%40twitter.gif" alt="트위터"></a>
					<a class="kakao" href="#" title="페이지 이동" ><img src="../../../image.oliveyoung.co.kr/pc-static-root/image/footer/%40kakaotalk.gif" alt="카카오톡"></a>
					<a class="cafe" href="#" title="페이지 이동" target="_blank"><img src="../../../image.oliveyoung.co.kr/pc-static-root/image/footer/%40oliveyo.gif" alt="올리브영"></a>
					<a class="insta" href="#" title="페이지 이동" target="_blank"><img src="../../../image.oliveyoung.co.kr/pc-static-root/image/footer/%40instagram.gif" alt="인스타그램"></a>
				</div>
			</div>
		</div>
	</div>
	<!-- //#Footer -->
</div>
