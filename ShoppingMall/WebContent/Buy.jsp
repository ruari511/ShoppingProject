<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 현재 페이지에서 JSTL의 core라이브러리에 속한 태그들을 사용 하기 위한 설정
	core라이브러리에 속한 태그는? 접두사 c를 이용한다. 
 --%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

	window.onload = function (){
		
		var email = document.getElementById("orderEmail").value;
		var split_email = email.split("@");
		
		var orderEmail_sel = document.getElementById("orderEmail_sel"); //이메일 뒷부분 select태그
		var orderEmail_op; //이메일 뒷부분 인덱스 값 저장 변수
		
		for(var i=0; i<orderEmail_sel.options.length; i++){
			if(split_email[1] == orderEmail_sel.options[i].value){
				orderEmail_op = i;
			}
		}
		if(orderEmail_op == null){
			orderEmail_op = 1;
			document.getElementById("orderEmail_2").value = orderEmail_sel.options[orderEmail_op].value;
		} else {
			orderEmail_sel.selectedIndex = orderEmail_op;
			document.getElementById("orderEmail_2").value = orderEmail_sel.options[orderEmail_op].value;
		}
		
		document.getElementById("orderEmail_1").value = split_email[0];
		document.getElementById("orderEmail_2").value = split_email[1];
		
		var phone = document.getElementById("orderPhone").value;
		var split_phone = phone.split("-");
		
		var orderPhone_1 = document.getElementById("orderPhone_1"); //핸드폰 앞자리 select태그
		var orderPhone_1_sel; //핸드폰 번호 앞자리와 같은 value를 가진 option태그 인덱스 값 변수
		
		for(var i=0; i<orderPhone_1.options.length; i++){
			if(split_phone[0] == orderPhone_1.options[i].value){
				orderPhone_1_sel = i;
			}
		}
		//orderPhone_1_sel의 option태그를 selected함
		orderPhone_1.selectedIndex = orderPhone_1_sel; //
		
		document.getElementById("orderPhone_2").value = split_phone[1];
		document.getElementById("orderPhone_3").value = split_phone[2];

	}
	
	function email_change() {
		var obj = document.getElementById("orderEmail_sel");
		
		if(obj.value==1){
			document.getElementById("orderEmail_2").value = "";
			document.getElementById("orderEmail_2").readOnly = false;
		} else{
			document.getElementById("orderEmail_2").value = obj.value;
			document.getElementById("orderEmail_2").readOnly = true;
		}
	}
	
	function deliverycheck(){
		var delivery_check = document.getElementById("delivery_check");
		var delivery_tel = document.getElementById("delivery_tel");
		if(delivery_check.checked==true){
			
			delivery_tel.value = document.getElementById("orderPhone_1").value; //주문자 정보 핸드폰번호 앞자리 배송지정보 핸드폰번호 앞자리로 들고오기
			document.getElementById("delivery_name").value = document.getElementById("ordManNm").value;
			document.getElementById("delivery_tel1").value = document.getElementById("orderPhone_2").value;
			document.getElementById("delivery_tel2").value = document.getElementById("orderPhone_3").value;
			
		} else{
			delivery_tel.value = delivery_tel.options[0].value;
			document.getElementById("delivery_name").value = "";
			document.getElementById("delivery_tel1").value = "";
			document.getElementById("delivery_tel2").value = "";
		} 
	}
	
	function radiocheck(a) {
		
		if(a.value=="bankbook"){
			document.getElementById("buycard").style.display="none";
			document.getElementById("buybankbook").style.display="list-item";
		}else if(a.value=="card"){
			document.getElementById("buycard").style.display="list-item";
			document.getElementById("buybankbook").style.display="none";
		}
	}

</script>
<link rel="stylesheet" href="./asset/css/global.css"/> 
<link rel="stylesheet" href="./asset/css/buy.css"/> 
	<script type="text/javascript" src="./asset/js/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="./asset/js/slick.min.js"></script>
	<script type="text/javascript" src="./asset/js/common.js"></script>
</head>
<body>
<div id="Wrapper">
<div id="skip_navi"><a href="#Container">본문바로가기</a></div>
	
	<!-- header -->
	<jsp:include page="./include/Header.jsp"/>
	<!-- header// -->
	<div id="Container">
		<!-- #Contents -->
		<div id="Contents">
			<!-- title_box -->
			<div class="title_box">
			<button onclick="spit_test()">test</button>
				<h1>주문/결제</h1>
				<ul class="step_list">
					<li><span class="step_num tx_num">1</span> 장바구니</li>
					<li class="on"><span class="step_num tx_num">2</span> 주문/결제</li><!-- 현재단계 li에 클래스 on과 <span class="hide">현재단계</span> 넣어주세요 -->
					<li class="last"><span class="step_num tx_num">3 </span> 주문완료</li>
				</ul>
			</div>
			<!--// title_box -->
			
			<form name="orderForm" id="orderForm">
			<input type="hidden" id="quickYn" name="quickYn" value="N">	
			<input type="hidden" id="quickInfoYn" name="quickInfoYn" value="N">			
			<input type="hidden" id="ocbValidChk" name="ocbValidChk" value="N">
			<!-- 주문자 정보 -->
			<h2 class="sub-title2 mgT20">주문자정보</h2><!-- 2017-02-21 수정 : mgT20 클래스 추가 -->
			<table class="tbl_inp_form">
				<caption></caption>
				<colgroup>
					<col style="width:170px">
					<col style="width:*">
				</colgroup>
				<tbody>
				<c:set var="member" value="${requestScope.m}" />
				<tr>
					<th scope="row">주문자명</th>
					<td><input type="text" id="ordManNm" name="ordManNm" value="${member.name}" class="inpH28" title="주문자명을 입력해주세요." this="주문자명은" style="width:200px"></td><!-- id와 label for를 맞춰주세요 (임시로 넣어둠) -->
				</tr>
				
				<tr>
					<th scope="row">휴대폰</th>
					<td>
						<input type="hidden" id="orderPhone" value="${member.phone_tel}">
						<select id="orderPhone_1" name="ordManCellSctNo" class="selH28" title="주문자 휴대폰 번호 앞자리를 선택해주세요." style="width:90px">
							<option value="1">선택</option>

							<option value="010">010</option>

							<option value="011">011</option>

							<option value="016">016</option>

							<option value="017">017</option>

							<option value="018">018</option>

							<option value="019">019</option>

							<option value="02">02</option>

							<option value="031">031</option>

							<option value="032">032</option>

							<option value="033">033</option>

							<option value="041">041</option>

							<option value="042">042</option>

							<option value="043">043</option>

							<option value="044">044</option>

							<option value="051">051</option>

							<option value="052">052</option>

							<option value="053">053</option>

							<option value="054">054</option>

							<option value="055">055</option>

							<option value="061">061</option>

							<option value="062">062</option>

							<option value="063">063</option>

							<option value="064">064</option>

							<option value="070">070</option>

							<option value="080">080</option>

							<option value="0130">0130</option>

							<option value="0303">0303</option>

							<option value="0502">0502</option>

							<option value="0503">0503</option>

							<option value="0504">0504</option>

							<option value="0505">0505</option>

							<option value="0506">0506</option>

							<option value="0507">0507</option>

						</select>
						 - <input type="text" id="orderPhone_2" name="ordManCellTxnoNo" value="" class="inpH28" title="주문자 휴대폰 번호 가운데 자리를 입력해주세요." this="주문자 휴대폰 번호 가운데 자리는" style="width:90px">
						 - <input type="text" id="orderPhone_3" name="ordManCellEndNo" value="" class="inpH28" title="주문자 휴대폰 번호 마지막 4자리를 입력해주세요." this="주문자 휴대폰 번호 마지막 자리는" style="width:90px">
					</td>
				</tr>
				<tr>
					<th scope="row">이메일</th>
					<td>
						<input type="hidden" id="orderEmail" name="ordManEmailAddr" value="${member.email}">
						<input type="text" id="orderEmail_1" value="" class="inpH28" style="width:120px"> 
						@ <input type="text" id="orderEmail_2" value="" class="inpH28" style="width:120px">
						<select id="orderEmail_sel" class="selH28" onchange="email_change();" style="width:120px">
							<option value="1">직접입력</option>

							<option value="hanmir.com">hanmir.com</option>

							<option value="naver.com">naver.com</option>

							<option value="hanmail.net">hanmail.net</option>

							<option value="nate.com">nate.com</option>

							<option value="yahoo.co.kr">yahoo.co.kr</option>

							<option value="gmail.com">gmail.com</option>

							<option value="hotmail.com">hotmail.com</option>

							<option value="empal.com">empal.com</option>

							<option value="paran.com">paran.com</option>

							<option value="lycos.co.kr">lycos.co.kr</option>

							<option value="freechal.com">freechal.com</option>

							<option value="hanafos.com">hanafos.com</option>

							<option value="korea.com">korea.com</option>

							<option value="dreamwiz.com">dreamwiz.com</option>

						</select>
					</td>
				</tr>
				</tbody>
			</table>
			<!--// 주문자 정보 -->
			
			<!-- 배송지 정보 -->
			<div class="title_wrap">
				<h2 class="sub-title2">배송지정보</h2>
				<p class="sub_area"><input type="checkbox" id="setBaseDlvpYn" name="baseDlvpYn" value="Y" onclick="return false;"> <label for="setBaseDlvpYn">기본 배송지 설정</label></p>
			</div>
			<table class="tbl_inp_form important" id="dlvpInfo"><!-- 2017-01-18 클래스 추가 -->
				<caption></caption>
				<colgroup>
					<col style="width:170px">
					<col style="width:*">
				</colgroup>
				<tbody>
				<tr>
					<th scope="row">배송지선택</th>
					<td>
						<span class="chk_area mgzero"><input type="radio" id="btn_dlvp_exist" name="inpAddrSel" value="" targetid="exist" disabled=""><label for="btn_dlvp_exist">기존 배송지</label></span>
						<span class="chk_area"><input type="radio" id="btn_dlvp_new" name="inpAddrSel" value="" targetid="new"><label for="btn_dlvp_new">신규 배송지</label></span>
						
						<div class="hide_box" id="dlvpSelect_div"><!-- 기존 배송지 라디오 선택 시 show 클래스 붙여주세요 -->
							<input type="hidden" name="selectDlvSeq" value="">
							<select id="dlvpSelect" name="mbrDlvpSeq" class="selH28" title="배송지를 선택해주세요." style="width:200px" disabled="disabled">

							</select>
						</div>
					</td>
				</tr>
				
				<!-- 2017-01-18 추가 (신규 배송지 선택 시) -->
				<tr type="new" style="">
					<th scope="row">배송지명</th>
					<td class="imp_data">
						<input type="text" id="dlvpNm_new" name="dlvpNm" value="" class="inpH28" title="배송지명을 입력해주세요." style="width:200px;" this="배송지명은">
					</td>
				</tr>
				<!--// 2017-01-18 추가 -->
				<tr type="new" style="">
					<th scope="row">받는분</th>
					<td class="imp_data"><!-- 2017-01-18 추가 : 필수입력사항 아이콘 추가 -->
						<input type="text" id="delivery_name" name="rmitNm" value="" class="inpH28" title="받는분 이름을 입력해주세요." style="width:200px" this="받는분 이름은">
						<span class="chk_area"><input type="checkbox" id="delivery_check" onclick="deliverycheck();" > <label for="copyToDlvp_new">주문자정보와 동일</label></span><!-- 2017-01-18 수정 : 위치변경 -->
					</td>
				</tr>
				<tr type="new" style="">
					<th scope="row">연락처1</th>
					<td class="imp_data"><!-- 2017-01-18 추가 : 필수입력사항 아이콘 추가 -->
						<select id="delivery_tel" name="rmitCellSctNo" class="selH28" title="연락처1 앞자리를 선택해주세요." style="width:90px">
							<option value="">선택</option>

							<option value="010">010</option>

							<option value="011">011</option>

							<option value="016">016</option>

							<option value="017">017</option>

							<option value="018">018</option>

							<option value="019">019</option>

							<option value="02">02</option>

							<option value="031">031</option>

							<option value="032">032</option>

							<option value="033">033</option>

							<option value="041">041</option>

							<option value="042">042</option>

							<option value="043">043</option>

							<option value="044">044</option>

							<option value="051">051</option>

							<option value="052">052</option>

							<option value="053">053</option>

							<option value="054">054</option>

							<option value="055">055</option>

							<option value="061">061</option>

							<option value="062">062</option>

							<option value="063">063</option>

							<option value="064">064</option>

							<option value="070">070</option>

							<option value="080">080</option>

							<option value="0130">0130</option>

							<option value="0303">0303</option>

							<option value="0502">0502</option>

							<option value="0503">0503</option>

							<option value="0504">0504</option>

							<option value="0505">0505</option>

							<option value="0506">0506</option>

							<option value="0507">0507</option>

						</select>
						 - <input type="text" id="delivery_tel1" name="rmitCellTxnoNo" value="" orgvalue="" class="inpH28" title="연락처1 가운데 자리를 입력해주세요." this="연락처1 가운데 자리는" style="width:90px">
						 - <input type="text" id="delivery_tel2" name="rmitCellEndNo" value="" orgvalue="" class="inpH28" title="연락처1 마지막 4자리를 입력해주세요." this="연락처1 마지막 자리는" style="width:90px">
						 <!-- <span class="chk_area"><input type="checkbox" id="chkSafe_new" name="chkSafe" value="456" /> <label for="chkSafe">안심번호 사용</label></span> --> 
					     <span class="info_security"><button type="button" data-rel="layer" data-target="securityInfo" class="chk_area">안심번호 서비스 안내</button></span>
					</td>
				</tr>
				<tr type="new" style="">
					<th scope="row">연락처2</th>
					<td>
						<select id="rmitTelRgnNo_new" name="rmitTelRgnNo" class="selH28" title="연락처2 앞자리를 선택해주세요." style="width:90px">
							<option value="">선택</option>

							<option value="010">010</option>

							<option value="011">011</option>

							<option value="016">016</option>

							<option value="017">017</option>

							<option value="018">018</option>

							<option value="019">019</option>

							<option value="02">02</option>

							<option value="031">031</option>

							<option value="032">032</option>

							<option value="033">033</option>

							<option value="041">041</option>

							<option value="042">042</option>

							<option value="043">043</option>

							<option value="044">044</option>

							<option value="051">051</option>

							<option value="052">052</option>

							<option value="053">053</option>

							<option value="054">054</option>

							<option value="055">055</option>

							<option value="061">061</option>

							<option value="062">062</option>

							<option value="063">063</option>

							<option value="064">064</option>

							<option value="070">070</option>

							<option value="080">080</option>

							<option value="0130">0130</option>

							<option value="0303">0303</option>

							<option value="0502">0502</option>

							<option value="0503">0503</option>

							<option value="0504">0504</option>

							<option value="0505">0505</option>

							<option value="0506">0506</option>

							<option value="0507">0507</option>

						</select>
						 - <input type="text" id="rmitTelTxnoNo_new" name="rmitTelTxnoNo" value="" class="inpH28" title="연락처2 가운데 자리를 입력해주세요." this="연락처2 가운데 자리는" style="width:90px">
						 - <input type="text" id="rmitTelEndNo_new" name="rmitTelEndNo" value="" class="inpH28" title="연락처2 마지막 4자리를 입력해주세요." this="연락처2 마지막 자리는" style="width:90px">
					</td>
				</tr>
				<tr type="new" style="">
					<th scope="row">주소</th>
					<td class="imp_data"><!-- 2017-01-25 수정 : 클래스 추가 -->
						<input type="text" id="stnmRmitPostNo_new" name="rmitPostNo" value="" class="inpH28" title="우편번호를 검색해주세요." style="width:90px" readonly="readonly">
						<input type="hidden" id="rmitPostNo_new" name="stnmRmitPostNo" value="" title="우편번호를 검색해주세요.">
						<button type="button" class="btnSmall wGreen w100" id="search-zipcode-pop_new"><span>우편번호 찾기</span></button>
						<div class="addr_box">
							<input type="hidden" id="stnmRmitPostAddr_new" name="stnmRmitPostAddr" value="" class="inpH28" title="우편번호를 검색해주세요." readonly="readonly">
							<input type="hidden" id="rmitBaseAddr_new" name="rmitPostAddr" value="" class="inpH28" title="우편번호를 검색해주세요." readonly="readonly">
							<!-- 주소 입력 시 보여지는 부분 -->
							<p class="addr_new">
								<span class="tx_tit">도로명</span> : 
								<span class="tx_addr" id="stnmPostAddr_new"></span><!--  도로명주소를 넣어주세요 -->
							</p>
							<p class="addr_old">
								<span class="tx_tit">지번</span> : 
								<span class="tx_addr" id="baseAddr_new"></span><!--  지번주소를 넣어주세요 -->
							</p>
							<!--// 주소 입력 시 보여지는 부분 -->
						</div>
						<input type="text" id="tempRmitDtlAddr_new" value="" class="inpH28" title="상세주소를 입력해주세요." style="width:500px; display: none;" this="상세 주소는">
						<input type="hidden" id="stnmRmitDtlAddr_new" name="stnmRmitDtlAddr" value="" class="inpH28" title="상세주소를 입력해주세요." style="width:500px" this="상세 주소는">
						<input type="hidden" id="rmitDtlAddr_new" name="rmitDtlAddr" value="" class="inpH28" title="상세주소를 입력해주세요." style="width:500px">
					</td>
				</tr>
				<tr>
					<th scope="row">택배배송 메시지</th>
					<td>
						<select id="mbrMemoCont" class="selH28" title="택배배송 메시지를 선택해주세요." style="width:350px">
							<option value="">배송메시지를 선택해주세요.</option>

							<option value="10">부재시 경비실에 맡겨주세요.</option>

							<option value="20">부재시 문앞에 놓아주세요.</option>

							<option value="30">파손의 위험이 있는 상품이오니,  배송 시 주의해주세요.</option>

							<option value="40">배송전에 연락주세요.</option>

							<option value="50">택배함에 넣어주세요.</option>

							<option value="99">배송 메시지 직접입력</option>

						</select>
						<input type="text" name="mbrMemoCont" value="" class="inpH28 mgT6" title="배송메시지를 입력해주세요." style="width:700px; display: none;">
					</td>
				</tr>
				</tbody>
			</table>
			<!--// 배송지 정보 -->
			
			<!-- 주문상품정보 -->
			<h2 class="sub-title2">올리브영 배송상품</h2>
			<table class="tbl_prd_list">
				<caption>올리브영 배송상품 주문상품 목록</caption>
				<colgroup>
					<col style="width:*">
					<col style="width:110px">
					<col style="width:100px">
					<col style="width:110px">					
				</colgroup>
				<thead>
				<tr>
					<th scope="col">상품정보</th>
					<th scope="col">판매가</th>
					<th scope="col">수량</th>
					<th scope="col">구매가</th><!-- 2017-01-24 수정 : 문구수정 -->
				</tr>
				</thead>
				<tbody>
				<c:forEach var="cartlist"  items="${requestScope.v}">
				<c:set var="sum" value="${sum = sum + (cartlist.product_price-cartlist.discount)*cartlist.product_count}"/>
				<tr>
					<td colspan="5">
						<div class="tbl_cont_area">
							<div class="tbl_cell w700">
								<div class="prd_info">
									<div class="prd_img">
										<img src="" alt="장바구니 상품 임시 이미지">
									</div>
									<div class="prd_name">
		
										<span>${cartlist.brand}</span><!-- 2017-01-26 수정 : 브랜드명 분리 -->
										<p>${cartlist.product_name}</p>
									</div>
								</div>
							</div>
							<div class="tbl_cell w110">
								<span class="cur_price"><span class="tx_num">${cartlist.product_price}</span>원</span>
							</div>
							<div class="tbl_cell w100">${cartlist.product_count}</div>
							<div class="tbl_cell w110">
								<span class="org_price"><span class="tx_num">${cartlist.product_price*cartlist.product_count}</span>원</span><!-- 2017-01-24 수정 : 추가 -->
								<span class="pur_price"><span class="tx_num">${(cartlist.product_price-cartlist.discount)*cartlist.product_count}</span>원</span>
							</div>
						</div>
		
					</td>
				</tr>
				</c:forEach>
				</tbody>
			</table>
			<!--// 주문상품정보 -->
			<!-- 쿠폰 및 포인트, 결제수단, 결제정보 -->
			<div class="order_payment_box">
				<div class="left_area">
					<!-- 쿠폰할인정보 -->
					<h2 class="sub-title2">쿠폰할인정보</h2>
					<table class="tbl_inp_form type2">
						<caption>쿠폰할인정보 입력 폼</caption>
						<colgroup>
							<col style="width:170px">
							<col style="width:*">
						</colgroup>
						<tbody>
						<tr>
							<th scope="row">쿠폰 할인</th>
							<td id="dwnldCouponList">
							<!-- if문 넣어서 쿠폰이 없을 경우 뜨게하고 아니면 option에 user_coupon 테이블에서 쿠폰목록 뿌려주기 -->	
								<div style="display:block;">
									<select class="selH28 mgT5" style="width:300px" disabled="disabled">
										<option>적용할 수 있는 쿠폰이 없습니다.</option>
									</select>
									<p class="tx_point_info">즉시할인쿠폰은 상품금액에 자동적용 되어있습니다.</p>
								</div>
								<div style="display:none;">
									<select class="selH28 mgT5" style="width:300px;">
										<option>적용할 수 있는 쿠폰이 없습니다.</option>
									</select>
									<p class="tx_point_info">즉시할인쿠폰은 상품금액에 자동적용 되어있습니다.</p>
								</div>
							<!-- if문 넣어서 쿠폰이 없을 경우 뜨게하고 아니면 option에 user_coupon 테이블에서 쿠폰목록 뿌려주기 -->		
							</td>
						</tr>
						<tr>
							<th scope="row">배송비 쿠폰</th>
							<td id="dlexCouponList_hd">
							
						<!-- if문 넣어서 쿠폰이 없을 경우 뜨게하고 아니면 option에 user_coupon 테이블에서 쿠폰목록 뿌려주기 -->	
								<div style="display:block;">
									<select id="selDelCoupon" class="selH28 mgT5" style="width:300px" disabled="disabled">
										<option>적용할 수 있는 쿠폰이 없습니다.</option>
									</select>
								</div>
								<div style="display:none;">
									<select id="selDelCoupon" class="selH28 mgT5" style="width:300px" disabled="disabled">
										<option>적용할 수 있는 쿠폰이 없습니다.</option>
									</select>
								</div>
						<!-- if문 넣어서 쿠폰이 없을 경우 뜨게하고 아니면 option에 user_coupon 테이블에서 쿠폰목록 뿌려주기 -->			
							</td>
						</tr>
						</tbody>
					</table>
					<input type="hidden" id="couponCnt" value="1">
					<!--// 쿠폰할인정보 -->
					
					<h2 class="sub-title2">포인트/기프트카드사용</h2>
					<table class="tbl_inp_form type2">
						<caption>포인트사용 입력 폼</caption>
						<colgroup>
							<col style="width:170px">
							<col style="width:*">
						</colgroup>
						<tbody>
						<tr>
							<th scope="row"><span class="tx_num">CJ ONE</span> 포인트</th>
							<td>
								<div>
									<span class="inp_point_wrap">
										<input type="text" id="cjonePntAplyAmt" class="inpH28" style="width:100px"> 원 / 
										<span id="cjonePnt_span" class="tx_num colorOrange"><span id="cjonePnt">${member.point}</span>P</span>
										<input type="hidden" name="cjonePntAplyAmt" value="0">
									</span> 
									<button type="button" class="btnSmall wGray3" id="cjonePnt_btn" disabled=""><span>전액사용</span></button>
									<p class="tx_point_info">CJ ONE 포인트는 최소 1,000P 이상 보유 시 10P 단위로 사용하실 수 있습니다.</p>
									
								</div>
							</td>
						</tr>
						</tbody>
					</table>
					<!--// 포인트사용 -->
					
					<!-- 결제수단 선택 -->

					<div class="title_wrap" id="payMethod_div">
						<h2 class="sub-title2">결제수단 선택</h2>
					</div>
					<ul class="payment_info_form" id="payMethodList">
						<li class="bg_area"><!-- 2017-01-18 수정 : 클래스 추가 -->
							<span><input type="radio" id="payMethod_11" name="payMethod" value="card" checked="checked" onclick="radiocheck(this);"><label for="payMethod_11">신용카드</label></span>
							<span><input type="radio" id="payMethod_61" name="payMethod" value="bankbook" onclick="radiocheck(this);"><label for="payMethod_61">무통장입금</label></span>
							<span><input type="radio" id="payMethod_21" name="payMethod" value="21"><label for="payMethod_21">계좌이체</label></span>
							
							<span><input type="radio" id="payMethod_22" name="payMethod" value="22"><label for="payMethod_22">휴대폰결제</label></span>
							<!-- 2017-01-18 수정 : 문화상품권/도서상품권 선택 삭제 -->
							<!-- 2017-02-14 수정 : 문화상품권/도서상품권 선택 재추가 --> 
							<span><input type="radio" id="payMethod_23" name="payMethod" value="23"><label for="payMethod_23">문화상품권</label></span>
							<span><input type="radio" id="payMethod_24" name="payMethod" value="24"><label for="payMethod_24">도서상품권</label></span>
							<!-- 2017-04-18 추가 -->
							<span><input type="radio" id="payMethod_25" name="payMethod" value="25"><label for="payMethod_25">PAYCO</label></span>
							<!-- //2017-04-18 추가 -->
							<span><input type="radio" id="payMethod_26" name="payMethod" value="26"><label for="payMethod_26">카카오페이</label></span>
						</li>
						<!-- 신용카드 선택 시 -->
						<li value="11" style="display: list-item;" id="buycard">							
							<table class="tbl_inp_form no_line">
								<caption>카드 결제정보 입력 폼</caption>
								<colgroup>
									<col style="width:170px">
									<col style="width:*">
								</colgroup>
								<tbody>
								<tr>
									<th scope="row">카드종류</th>
									<td>
										<div id="cardDscnt_div">
											<input type="hidden" id="cardCouponIndex" value="" acqrcd="" orgacqrcd="">
											<select id="acqrCd" name="acqrCd" class="selH28" title="결제하실 카드를 선택해주세요." style="width:200px">
												<option value="">카드를 선택해주세요.</option>

												<option value="BCC">BC카드</option>

												<option value="HNB">하나비자</option>

												<option value="PHB">우리카드</option>

												<option value="SYH">신협카드</option>

												<option value="NFF">수협카드</option>

												<option value="CBB">전북카드</option>

												<option value="CIT">씨티카드</option>

												<option value="WIN">삼성카드</option>

												<option value="LGC">신한카드</option>

												<option value="KJB">광주비자</option>

												<option value="CJB">제주카드</option>

												<option value="DIN">현대카드</option>

												<option value="AMX">롯데카드</option>

												<option value="CNB">KB카드</option>

												<option value="NLC">NH카드</option>

												<option value="KEB">외환카드</option>

											</select>

										</div>
									</td>
								</tr>
								<tr>
									<th scope="row">할부종류</th>
									<td>
										<div>
											<select id="instMmCnt" name="instMmCnt" class="selH28" style="width:200px" disabled="">
												<option value="00">일시불</option>
												<option value="02">2개월</option>
												<option value="03">3개월</option>
												<option value="04">4개월</option>
												<option value="05">5개월</option>
												<option value="06">6개월</option>
												<option value="07">7개월</option>
												<option value="08">8개월</option>
												<option value="09">9개월</option>
												<option value="10">10개월</option>
												<option value="11">11개월</option>
												<option value="12">12개월</option>
											</select>
											
										</div>
									</td>
								</tr>
								</tbody>
							</table>							
						</li>
						<!--// 신용카드 선택 시 -->
						<!-- 무통장입금 선택 시 -->
						<li value="61" style="display: none;" id="buybankbook">							
							<table class="tbl_inp_form no_line">
								<caption>무통장입금 입력 안내</caption>
								<colgroup>
									<col style="width:170px">
									<col style="width:*">
								</colgroup>
								<tbody>
								<tr>
									<th scope="row">은행명</th>
									<td>
										<div>
											<select id="VirDepositBank" name="cjBnkCd" class="selH28" title="은행를 선택해주세요." style="width:300px">

												<option value="003">기업</option>

												<option value="004">국민</option>

												<option value="007">수협</option>

												<option value="011">농협</option>

												<option value="020">우리</option>

												<option value="031">대구</option>

												<option value="032">부산</option>

												<option value="039">경남</option>

												<option value="071">우체국</option>

												<option value="081">하나</option>

												<option value="088">신한</option>

											</select>
											<select name="bnkCd" style="display: none;" disabled="disabled">

													<option value="02">산업</option>

													<option value="03">기업</option>

													<option value="05">외환</option>

													<option value="06">국민</option>

													<option value="07">수협</option>

													<option value="11">농협</option>

													<option value="20">우리</option>

													<option value="23">SC제일</option>

													<option value="27">씨티</option>

													<option value="31">대구</option>

													<option value="32">부산</option>

													<option value="34">광주</option>

													<option value="35">제주</option>

													<option value="37">전북</option>

													<option value="39">경남</option>

													<option value="45">새마을금고</option>

													<option value="48">신협</option>

													<option value="71">우체국</option>

													<option value="81">하나</option>

													<option value="88">신한</option>

											</select>
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row">입금기한</th>
									<td>
										<div>
											2019.08.09
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row">입금자명</th>
									<td>
										<div>
											<input type="text" id="NameDepositor" name="morcManNm" value="박정현" class="inpH28" title="입금자명을 입력해주세요." style="width:200px" disabled="disabled">
										</div>
									</td>
								</tr>
								<!-- 2017-01-18 추가 : 무통장입금 결제안내 문구 추가 -->
								<tr>
									<td colspan="2">
										<ul class="info_dot_list type2">
						<li>은행별로 입금가능시간이 다를 수 있습니다.</li>

											<li>주문일 기준 다음날(24시간 이내)까지 입금이 되지 않으면 주문 취소 처리됩니다.</li>
										</ul>
									</td>
								</tr>
								<!--// 2017-01-18 추가 : 무통장입금 결제안내 문구 추가 -->
								</tbody>
							</table>							
						</li>
						<!--// 무통장입금 선택 시 -->
					</ul>
					
					<!-- 현금영수증 신청 -->
					<div class="" id="cashReceipt" style="display: none;">
						<h2 class="sub-title2">현금영수증 신청</h2>
						<table class="tbl_inp_form type2" id="receipt_table">
							<caption>현금영수증 신청 입력 폼</caption>
							<colgroup>
								<col style="width:170px">
								<col style="width:*">
							</colgroup>
							<tbody>
							<tr>
								<th scope="row">현금영수증</th>
								<td>
									<div>
										<select id="crIssuCd" name="crIssuCd" class="selH28" title="현금영수증 신청여부를 선택해주세요." style="width:200px" disabled="">
											<option value="">신청안함</option>
											<option value="10">개인소득공제용</option>
											<option value="20">사업자지출증빙용</option>
										</select>
									</div>
								</td>
							</tr>
							
							<!-- 개인소득공제용신청 시 -->
							<tr crissucd="10" style="display: none;">
								<th scope="row">발급방법</th>
								<td>
									<div>
										<input type="radio" id="crIssuMeanSctCd_3" name="crIssuMeanSctCd" value="3" checked="checked" disabled=""> <label for="crIssuMeanSctCd_3">휴대폰</label>
										<input type="radio" id="crIssuMeanSctCd_5" name="crIssuMeanSctCd" value="5" disabled=""> <label for="crIssuMeanSctCd_5">현금영수증카드</label>
									</div>
								</td>
							</tr>
							<!-- 개인소득공제용 [휴대폰] 선택 시 -->
							<tr crissucd="10" crissumeansctcd="3" style="display: none;">
								<th scope="row">휴대폰</th>
								<td>
									<div>
										<select id="dispCashReceiptInfo11" class="selH28" title="현금영수증 휴대폰 앞자리를 선택해주세요." style="width:90px" disabled="">

													<option value="010" selected="selected">010</option>

													<option value="011">011</option>

													<option value="016">016</option>

													<option value="017">017</option>

													<option value="018">018</option>

													<option value="019">019</option>

													<option value="02">02</option>

													<option value="031">031</option>

													<option value="032">032</option>

													<option value="033">033</option>

													<option value="041">041</option>

													<option value="042">042</option>

													<option value="043">043</option>

													<option value="044">044</option>

													<option value="051">051</option>

													<option value="052">052</option>

													<option value="053">053</option>

													<option value="054">054</option>

													<option value="055">055</option>

													<option value="061">061</option>

													<option value="062">062</option>

													<option value="063">063</option>

													<option value="064">064</option>

													<option value="070">070</option>

													<option value="080">080</option>

													<option value="0130">0130</option>

													<option value="0303">0303</option>

													<option value="0502">0502</option>

													<option value="0503">0503</option>

													<option value="0504">0504</option>

													<option value="0505">0505</option>

													<option value="0506">0506</option>

													<option value="0507">0507</option>

												</select>
										 - <input type="text" id="dispCashReceiptInfo12" value="5172" class="inpH28" title="현금영수증 휴대폰 가운데 자리를 입력해주세요." this="현금영수증 휴대폰 가운데 자리는" style="width:90px" disabled="">
										 - <input type="text" id="dispCashReceiptInfo13" value="8187" class="inpH28" title="현금영수증 휴대폰 마지막 4자리수를 입력해주세요." this="현금영수증 휴대폰 마지막 자리는" style="width:90px" disabled="">
										 <input type="hidden" id="crPhoneNumber" name="crIssuMeanNo" value="01051728187" disabled="">
									</div>
								</td>
							</tr>
							<!--//개인소득공제용 [휴대폰] 선택 시 -->
							<!-- 개인소득공제용 [현금영수증카드] 선택 시 -->
							<tr crissucd="10" crissumeansctcd="5" style="display: none;">
								<th scope="row">현금영수증 카드번호</th>
								<td>
									<div>
										<input type="text" id="CashReceipts" name="crIssuMeanNo" class="inpH28" title="현금영수증 카드번호를 입력해주세요." this="현금영수증 카드번호는" style="width:300px" disabled="">
									</div>
								</td>
							</tr>
							<!--// 개인소득공제용 [현금영수증카드] 선택 시 -->
							<!--// 개인소득공제용신청 시 -->
							
							<!-- 사업자지출증빙용 시 -->
							<tr crissucd="20" style="display: none;">
								<th scope="row">사업자등록번호</th>
								<td>
									<div>
										<input type="hidden" name="crIssuMeanSctCd" value="2" disabled="">
										<input type="text" id="BusinessNumber" name="crIssuMeanNo" class="inpH28" title="현금영수증 사업자 등록번호를 입력해주세요." this="현금영수증 사업자 등록번호는" style="width:300px" disabled="">
									</div>
								</td>
							</tr>
							<!--// 사업자지출증빙용 시 -->
							</tbody>
						</table>
						<!--// 현금영수증 신청 -->
					</div>
				</div>
				<div class="right_area">
					<!-- 최종 결제정보 -->
					<h2 class="sub-title2">최종 결제정보</h2>
					<!--// 최종 결제정보 -->
					<ul class="total_payment_box">
						<li>
							<span class="tx_tit">총 상품금액</span> 
							<span class="tx_cont"><span class="tx_num">${sum}</span>원</span>
							<input type="hidden" name="goodsAmt" value="26000">
						</li>
						<li>
							<span class="tx_tit">쿠폰할인금액</span><!-- 2017-01-18 수정 : 문구수정 --> 
							<span class="tx_cont colorOrange"><span class="tx_num" id="totDscntAmt_span">500</span>원</span>
							<input type="hidden" name="descentAmt" value="1300">
							<input type="hidden" id="imdtDscntAmt" value="1300">
						</li>
						
						<li class="line_top2">
							<span class="tx_tit">총 배송비 <button type="button" class="btnSmall wGray" data-rel="layer" data-target="deliveryInfo" id="dlexAmtPopLayer_btn"><span>상세보기</span></button></span> 
							<span class="tx_cont"><span class="tx_num" id="dlexPayAmt_span">0</span>원</span>
							<input type="hidden" name="dlexPayAmt" value="0">
						</li>
						<li>
							<span class="tx_tit"><span class="tx_num">CJ ONE</span> 포인트</span> 
							<span class="tx_cont colorOrange"><span class="tx_num" id="cjonePntAplyAmt_span">0</span>원</span>
						</li>
						<li class="total">
							<span class="tx_tit">최종 결제금액</span> 
							<span class="tx_cont"><span class="tx_num" id="totPayAmt_sum_span">${sum-500}</span>원</span>
							<input type="hidden" name="remainAmt" value="24700">
							<input type="hidden" name="ordPayAmt" value="24700">
							<input type="hidden" name="goodsNm" value="유세린 더모 퓨리파이어 토너 1+1 기획">
						</li>

						<li>
							<button class="btnPayment" id="btnPay" name="btnPay" type="button">결제하기<em id="giftNoti3" style="display: none;">(증정품은 결제 시 확인 가능합니다)</em> <em id="giftNotiQuick" style="display: none;">(오늘드림으로 주문 시 온라인 단독 <br>증정품이 제공되지 않습니다.)</em> </button>
							<input type="hidden" id="tempOrdNo" value="">
						</li>
					</ul>
					
					<div class="agree_payment_box" id="agreeList">
						<div class="all_agree_cont">
							<p>주문 상품정보 및 결제대행 서비스 이용약관에 모두 동의하십니까?</p><!-- 2017-01-18 수정 : 문구수정 --> 
							<input type="checkbox" id="agree_all" name="TrrmsCheck1ed" value=""> <label for="agree_all">모두 동의</label>
							<button type="button" class="btnDetailAgree" id="btnDetailAgree">주문상품 및 결제대행 서비스 이용약관 자세히 보기 열기/닫기</button>
						</div>
					</div>
				</div>
				
			</div>
			<!--// 쿠폰 및 포인트, 결제수단, 결제정보 -->
			</form>

		</div>
		<!-- //#Contents -->
	</div>
	<!-- //#Container -->

	<!-- 2017-02-23 수정 : TOP 바로가기 버튼 추가 -->
	<div id="directTop" style="display: block;">
		<button><span></span>TOP</button>
	</div>
	<!-- footer -->
	<jsp:include page="./include/Footer.jsp"/>
	<!-- footer// -->
	</div>
	</body>
</html>