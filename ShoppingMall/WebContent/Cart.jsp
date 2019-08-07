<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./asset/css/global.css"/> 
<link rel="stylesheet" href="./asset/css/cart.css"/> 
	<script type="text/javascript" src="./asset/js/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="./asset/js/slick.min.js"></script>
	<script type="text/javascript" src="./asset/js/common.js"></script>
</head>
<body>

<div id="Wrapper">
	<div id="skip_navi"><a href="#Container">본문바로가기</a></div>
	
	<!-- header -->
	<jsp:include page="../include/Header.jsp"/>
	<!-- header// -->
					
	<div id="Container">
		<div id="Contents">
		
			<!-- title_box -->
			<div class="title_box">
				<h1>장바구니 
				<span class="tx_num">1</span>
				</h1>
				<ul class="step_list">
					<li class="on"><span class="step_num tx_num">1</span> 장바구니</li><!-- 현재단계 li에 클래스 on과 <span class="hide">현재단계</span> 넣어주세요 -->
					<li><span class="step_num tx_num">2</span> 주문/결제</li>
					<li class="last"><span class="step_num tx_num">3 </span> 주문완료</li>
				</ul>
			</div>
			<!--// title_box -->
			
			<!-- membership_box -->
			<div class="membership_box  iconGrade4">		 
				<p class="tx_grade_info"><strong>박정현</strong>님의 멤버십 등급은 <span class="grade">Baby Olive</span>입니다. </p>
				<ul class="membership_info_list">
					<li><a href="https://www.oliveyoung.co.kr/store/mypage/getMembershipInfo.do" class="grade_benefit"><span>등급혜택</span></a></li>
					<li><a href="https://www.oliveyoung.co.kr/store/mypage/getCJOnePointInfo.do"><strong><span class="tx_num">CJ ONE</span> 포인트</strong> 
					<span class="own_point">
							<span class="tx_num">935</span>P
					</span></a></li>
					<li><a href="https://www.oliveyoung.co.kr/store/mypage/getCouponList.do"><strong>할인쿠폰</strong> <span class="own_point"><span class="tx_num">0</span>개</span></a></li>
					<li><a href="https://www.oliveyoung.co.kr/store/mypage/getDepositList.do"><strong>예치금</strong> <span class="own_point"><span class="tx_num">0</span>원</span></a></li>
				</ul>
			</div>
			<!--// membership_box -->
			
			
			<!--     /////////////////////////////           직 배 송 상 품 리 스 트         //////////////////////////////////    -->
			
			<!-- 올리브영 배송상품 -->			
			<h2 class="sub-title2">
				
					
					
						올리브영 배송상품
					
				
			</h2>			
			<table class="tbl_prd_list tableFix">
				<caption>올리브영 배송상품 장바구니 목록</caption>
				<colgroup>
					<col style="width:40px">
					<col style="width:*">
					<col style="width:110px">
					<col style="width:100px">
					<col style="width:110px">					
					<col style="width:120px"><!-- 2017-01-13 수정 -->
					<col style="width:150px">
				</colgroup>
				<thead>
				<tr>
					<th scope="col"><input type="checkbox" checked="" id="inp_allRe1" name="" value="" title="올리브영 배송상품 전체 선택"></th>
					<th scope="col">상품정보</th>
					<th scope="col">판매가</th>
					<th scope="col">수량</th>
					<th scope="col">구매가</th>					
					<th scope="col">배송정보</th>
					<th scope="col">선택</th>					
				</tr>
				</thead>
				<tbody>				
				<!-- 1+1 행사 상품인 경우 -->
					<!-- 판매종료이거나일시품절 -->
					
					<!-- 판매종료 -->
					
					<!-- 일시품절 -->
					
					<!-- 증정품은 제외 -->
						<tr soldoutyn="N" cno="70203916" goodsno="A000000102929" itemno="001" lgcgoodsno="8806322106152" oripno="" pno="" promkndcd="" rsvsaleyn="N" drtpuryn="N" dispcatno="90000010001" buycondstrtqtyamt="" getcondstrtqtyamt="" pkggoodsno="" quickyn="N" strno="">
						
						<input type="hidden" id="soldout_yn" name="soldout_yn" value="N">
						<td colspan="7">			
							<div class="tbl_cont_area">		
							<!-- 쿠폰할인 : 즉시할인,상품할인 쿠폰 할인가 적용 -->
							<input type="hidden" id="saleCpnDcPrc" name="saleCpnDcPrc" value="24700">
							<input type="hidden" id="goodsCpnYn" name="goodsCpnYn" value="Y">
<script type="text/javascript">
cartItem = {};
cartItem.orgSalePrc = parseInt("26000");
cartItem.salePrc = parseInt("26000");
cartItem.normPrc = parseInt("0");
cartItem.goodsNo = "A000000102929";
cartItem.goodsNm = "유세린 더모 퓨리파이어 토너 1+1 기획";
cartItem.cartNo =  "70203916";
cartItem.promNo =  "";
cartItem.thnlPathNm = "10/0000/0010/A00000010292905ko.jpg?l=ko";
cartItem.onlBrndNm = "유세린";
cartItem.itemNo = "001";
cartItem.itemNm = "";

cartItem.ordQty = parseInt("1");
cartItem.ordPsbMinQty = parseInt("1");
cartItem.ordPsbMaxQty = parseInt("999");
cartItem.cpnDcAmt = parseInt("1300");
cartItem.dlexFreeYn = "N";
cartItem.dlexFreeStdAmt = parseInt("20000");
cartItem.dlexCostTpCd = "10";
cartItem.saleCpnDcPrc = parseInt("24700");
cartItem.dlexAmt = parseInt("2500");
cartItem.goodsCpnYn = "Y";

cartItem.sumPkgYn = "Y";
cartItem.pkgGoodsNo = "";
</script>
								<div class="tbl_cell w40">
									<input type="checkbox" saleprc="26000" orgsaleprc="26000" cpndcamt="1300" ordqty="1" stockqty="195" checked="checked" id="inp_prd_chk1" name="s_checkbox1" soldoutyn="N" value="0" class="chkSmall" title="[유세린 더모 퓨리파이어 토너 1+1 기획] 선택">
									<input type="hidden" name="s_cart_no" value="70203916">
									<input type="hidden" name="s_prom_no" value="">
									<input type="hidden" name="s_buy_cond_strt_qty_amt" value="">
									<input type="hidden" name="s_disp_cat_no" value="90000010001">
									<input type="hidden" name="s_goods_no" value="A000000102929">
									<input type="hidden" name="s_item_no" value="001">
									<input type="hidden" name="s_cpn_dc_amt" value="1300">
									<input type="hidden" name="s_org_sale_prc" value="26000">
									<input type="hidden" name="s_sale_prc" value="26000">
									<input type="hidden" name="s_drt_pur_yn" value="N">
									<input type="hidden" name="s_dlex_polc_no" value="1">
									<input type="hidden" name="s_trade_shp_cd" value="1">
									<input type="hidden" name="s_entr_no" value="C14488">
									<input type="hidden" name="s_sum_pkg_yn" value="Y">
									<input type="hidden" name="s_whsg_expc_dt" value="">
									<input type="hidden" name="s_dlex_free_yn" value="N">
								</div>
								<div class="tbl_cell w390">
									<div class="prd_info">
												<a class="prd_img" href="javascript:common.link.moveGoodsDetail(&#39;A000000102929&#39;,&#39;&#39;);">	
											<img data-original="https://image.oliveyoung.co.kr/uploads/images/goods/220/10/0000/0010/A00000010292905ko.jpg?l=ko" class="completed-seq-lazyload" alt="상품이미지" onerror="common.errorImg(this);" src="./장바구니 _ 올리브영_files/A00000010292905ko(1).jpg">
										</a>
										<!-- 
											셀링포인트영역 셋팅시작
											프로모션시작일자,프로모션종료일자가있거나 셀링텍스트가 잇으면 해당영역보여줌.
										-->
												<a class="prd_name" href="javascript:common.link.moveGoodsDetail(&#39;A000000102929&#39;,&#39;&#39;);">
										<span class="tx_sale_info">
										</span><!-- 브랜드명 및 할인정보 -->
											<span id="brandNm">유세린 </span>
											<p id="goodsNm">유세린 더모 퓨리파이어 토너 1+1 기획</p>
										</a>
										<p class="prd_opt">
										</p>
										<p class="prd_flag">
											<span class="icon_flag coupon">쿠폰</span><!-- 13 -->
											<span class="icon_flag gift">증정</span><!-- 14 -->
											<span class="icon_flag delivery">오늘드림</span><!-- 16 -->
										</p>
									</div>
								</div>
								<div class="tbl_cell w110">
									<span class="cur_price"><span class="tx_num">26,000</span>원</span>
								</div>
								<div class="tbl_cell w100">
									<div class="prd_cnt">
											<select class="amount" name="s_amount" prdtp="1" prdcnt="0" ordpsbminqty="1" ordpsbmaxqty="999" qtyaddunit="1" ordqty="1" title="상품 수량 선택">
															<option value="1" selected="">1</option>
															<option value="2">2</option>
															<option value="3">3</option>
															<option value="4">4</option>
															<option value="5">5</option>
															<option value="6">6</option>
															<option value="7">7</option>
															<option value="8">8</option>
															<option value="9">9</option>
															<option value="10">10</option>
												<option value="10+">10+</option>
											</select>	
									</div>
											<button type="button" class="btnSmall wGray" style="display: none;" name="btnQtyMod"><span>변경</span></button>
								</div>
								<div class="tbl_cell w110">
										<span class="org_price">
											<span class="tx_num">26,000</span>원
										</span>
										<span class="pur_price"><span class="tx_num">24,700</span>원</span>
								
								</div>
								<!-- 2017-01-13 수정 -->
								<div class="tbl_cell w120  "><!-- 합배송, 배송 예정 class / sum   delay추가 하기 -->
								
								
									<p class="prd_delivery">
									<strong id="deliStrongText">
															무료배송
										<span class="ex">도서·산간 제외</span>	
									
									</strong>
									
									</p>
								
								</div>
								<!--// 2017-01-13 수정 -->
								
								<!-- 쇼핑찜 설정 -->
								<div class="tbl_cell w150">
									<div class="btn_group">
											<button type="button" class="btnSmall wGreen" name="btn_buy"><span>바로구매</span></button>
										<button type="button" class="btnSmall wGray zzim " name="btnZzim" zim-on-off="" data-ref-goodsno="A000000102929"><span>쇼핑찜</span></button><button type="button" class="btnSmall wGray delete" name="btnDelete"><span>삭제</span></button><!-- 버튼 공간(스페이스바)없이 붙여주세요. -->
									</div>
								</div>
								</div>
									</td>
								</tr>
<script type="text/javascript">
cartInfoList.push(cartItem);
cartTenInfoList.push(cartItem);
</script>
					
				
				
				</tbody>
			</table>
			<!--// 올리브영 배송상품 -->
			<!-- 올리브영 배송상품 결제금액 -->
			<div class="basket_price_info">
				<div class="btn_area">
					<button type="button" class="btnSmall wGray type2" id="partDelBtn1" name="partDelBtn"><span>선택상품 삭제</span></button> 
					<button type="button" class="btnSmall wGray type2" id="soldOutDelBtn1" name="soldOutDelBtn"><span>품절상품 삭제</span></button>
				</div>
				<div class="sum_price">총 판매가 <span class="tx_num">26,000</span>원 <span class="tx_sign minus">-</span> 총 할인금액 <span class="tx_num">1,300</span>원 <span class="tx_sign plus">+</span> 배송비 <span class="tx_num">0</span>원 <span class="tx_sign equal">=</span> <span class="tx_total_price">총 결제금액 <span class="tx_price"><span class="tx_num">24,700</span>원</span></span></div>
			</div>
			<!--// 올리브영 배송상품 결제금액 -->
		</div>
	</div>









	<!-- footer -->
	<jsp:include page="../include/Footer.jsp"/>
	<!-- footer// -->
</div>
</body>
</html>