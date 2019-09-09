<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 현재 페이지에서 JSTL의 core라이브러리에 속한 태그들을 사용 하기 위한 설정
	core라이브러리에 속한 태그는? 접두사 c를 이용한다. 
 --%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>     
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>아이티영 온라인몰</title>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").innerHTML = addr;
                document.getElementById("sample6_address1").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
                document.getElementById("delivery_address").value = "(" + data.zonecode +") " + addr;
                
            }
        }).open();
    }
</script>



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
			document.getElementById("cashReceipt").style.display="list-item";
			document.getElementById("paytype").value = a.value;
			
		}else if(a.value=="card"){
			document.getElementById("buycard").style.display="list-item";
			document.getElementById("buybankbook").style.display="none";
			document.getElementById("cashReceipt").style.display="none";
			document.getElementById("paytype").value = a.value;
		}
		
		
	}
	
	function allcoupon_change(a) {
		var prototal = document.getElementById("prototal").value;
		var coutotal = document.getElementById("coutotal").value;
		var deltotal = document.getElementById("deltotal").value;
		var pointtotal = document.getElementById("pointtotal").value;
		var lastprice = document.getElementById("lastprice").value;
		var totPayAmt_sum_span = document.getElementById("totPayAmt_sum_span");
		
		var percent = a.value.split("-");
		
		coutotal = prototal * percent[1] / 100;
		
		if(coutotal >= percent[2]){
			coutotal = percent[2];
		}
		
		if(prototal>=20000){
			deltotal = 0;
			document.getElementById("deltotal").value = 0;
		}
		
		document.getElementById("coutotal").value = coutotal;
		
		document.getElementById("totDscntAmt_span").innerHTML = coutotal;
		
		totPayAmt_sum_span.innerHTML = lastprice - coutotal - deltotal - pointtotal;
		
		}
	
	function delivery_coupon_change() {
		
		var prototal = document.getElementById("prototal").value;
		var coutotal = document.getElementById("coutotal").value;
		var deltotal = document.getElementById("deltotal").value;
		var pointtotal = document.getElementById("pointtotal").value;
		var lastprice = document.getElementById("lastprice").value;
		var totPayAmt_sum_span = document.getElementById("totPayAmt_sum_span");
		
		if(prototal>=20000){
			deltotal = 0;
			document.getElementById("deltotal").value = 0;
		} else{
			deltotal = 2500;
			document.getElementById("deltotal").value = 2500;
		}
		
		if(document.getElementById("selDelCoupon").selectedIndex == 1){
			document.getElementById("deliverycost").innerHTML = "무료";
			deltotal = 2500;
			document.getElementById("deltotal").value = 2500;
			totPayAmt_sum_span.innerHTML = lastprice - coutotal - deltotal - pointtotal;
		} else{
			document.getElementById("deliverycost").innerHTML = "2500원";
			deltotal = 0;
			document.getElementById("deltotal").value = 0;
			totPayAmt_sum_span.innerHTML = lastprice - coutotal - deltotal - pointtotal;
		}
		
		
	}
	
	// var inpoint = document.getElementById("inpoint").value; //input text태그의 값
	function pointAllIn() {

		var prototal = document.getElementById("prototal").value;
		var coutotal = document.getElementById("coutotal").value;
		var deltotal = document.getElementById("deltotal").value;
		var pointtotal = document.getElementById("pointtotal").value;
		var lastprice = document.getElementById("lastprice").value;
		var totPayAmt_sum_span = document.getElementById("totPayAmt_sum_span");
		
		if(lastprice>=20000){
			deltotal = 0;
			document.getElementById("deltotal").value = 0;
		}
		
		if(pointtotal>=lastprice){
			document.getElementById("inpoint").value = lastprice;
		}
		
		pointtotal = document.getElementById("memberpoint").value;
		
		document.getElementById("pointtotal").value = document.getElementById("memberpoint").value;
		
		document.getElementById("cjonePntAplyAmt_span").innerHTML = pointtotal;
		
		totPayAmt_sum_span.innerHTML = lastprice - coutotal - deltotal - pointtotal;
		document.getElementById("inpoint").value = pointtotal;
		
		
	}
	
	function delivery_message(a) {
		if(a.value==99){
			document.getElementById("mbrMemoCont1").style.display="block";
		}
		
		var delmes_sel = document.getElementById("mbrMemoCont");
		var delmes = delmes_sel.selectedIndex;
		//alert(delmes_sel);
		document.getElementById("delivery_message_2").value = document.getElementById("mbrMemoCont").options[delmes].innerHTML;
	}
	
	
	function card_change(a){
		if(a.value!=0){
			document.getElementById("instMmCnt").removeAttribute("disabled");
		}else{
			document.getElementById("instMmCnt").disabled = true;
		}
	}
	
	function cashTax(a){
		if(a.value==10){
			document.getElementById("solotax").style.display="table-row";
			document.getElementById("solotaxphone").style.display="table-row";
			document.getElementById("licensetax").style.display="none";
		} else if(a.value==20){
			document.getElementById("licensetax").style.display="table-row";
			document.getElementById("solotax").style.display="none";
			document.getElementById("solotaxphone").style.display="none";
		} else{
			document.getElementById("solotax").style.display="none";
			document.getElementById("solotaxphone").style.display="none";
			document.getElementById("licensetax").style.display="none";
		}
	}
	
	function nullCheck() {
		
		var delevery_title = document.getElementById("dlvpNm_new").value;
		var delevery_name = document.getElementById("delivery_name").value;
		var delivery_tel = document.getElementById("delivery_tel").value;
		var delivery_tel1 = document.getElementById("delivery_tel1").value;
		var delivery_tel2 = document.getElementById("delivery_tel2").value;
		var delivery_address = document.getElementById("sample6_postcode").value;
		var paytype = document.getElementById("paytype").value;
		var cardNum = document.getElementById("cardNum").value;
		var acqrCd = document.getElementById("acqrCd").value;
		
		if(delevery_title == ""){
			alert("배송지명을 입력해주세요.");
			document.getElementById("dlvpNm_new").focus();
			return false;
		} else if(delevery_name == ""){
			alert("받는분을 입력해주세요.");
			document.getElementById("delivery_name").focus();
			return false;
		} else if(delivery_tel == ""){
			alert("휴대폰 번호를 입력해주세요.");
			document.getElementById("delivery_tel").focus();
			return false;
		} else if(delivery_tel1 == ""){
			alert("휴대폰 번호를 입력해주세요.");
			document.getElementById("delivery_tel1").focus();
			return false;
		} else if(delivery_tel2 == ""){
			alert("휴대폰 번호를 입력해주세요.");
			document.getElementById("delivery_tel2").focus();
			return false;
		} else if(delivery_address == ""){
			alert("주소를 입력해주세요.");
			document.getElementById("sample6_postcode").focus();
			return false;
		} else if(paytype == "card" && acqrCd == 0){
			alert("카드를 선택해주세요.");
			document.getElementById("acqrCd").focus();
			return false;
		} else if(paytype == "card" && cardNum == ""){
			
			cardOpen();
			
			return false;
		} else if(paytype == "bankbook"){
			
			var fm1 = document.getElementById("fm1");
			fm1.action = "./BuyListInsertBankBook.buy";
			fm1.submit();
			
		} else{
			return true;
		}
	}
	
	function cardOpen() {
		
		var card = document.getElementById("acqrCd").value;
		var card_installment = document.getElementById("instMmCnt").value;
		var buyCard = window.open("./product/buyCard.jsp?card="+card+"&card_installment="+card_installment, "", "width=500, height=250, top=350, left=800");

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
	<jsp:include page="../include/Header.jsp"/>
	<!-- header// -->
	<div id="Container">
		<!-- #Contents -->
		<div id="Contents">
			<!-- title_box -->
			<div class="title_box">
				<h1>주문/결제</h1>
				<ul class="step_list">
					<li><span class="step_num tx_num">1</span> 장바구니</li>
					<li class="on"><span class="step_num tx_num">2</span> 주문/결제</li><!-- 현재단계 li에 클래스 on과 <span class="hide">현재단계</span> 넣어주세요 -->
					<li class="last"><span class="step_num tx_num">3 </span> 주문완료</li>
				</ul>
			</div>
			<!--// title_box -->
			
			<form action="./BuyListInsertCard.buy" id="fm1" method="post" onsubmit="return nullCheck();">
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
					<td><input type="text" id="ordManNm" name="ordername" value="${member.name}" class="inpH28" title="주문자명을 입력해주세요." this="주문자명은" style="width:200px"></td><!-- id와 label for를 맞춰주세요 (임시로 넣어둠) -->
				</tr>
				
				<tr>
					<th scope="row">휴대폰</th>
					<td>
						<input type="hidden" id="orderPhone" name="orderphone" value="${member.phone}">
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
						<input type="hidden" id="orderEmail" name="orderemail" value="${member.email}">
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
				<tr style="">
					<th scope="row">배송지명</th>
					<td class="imp_data">
						<input type="text" id="dlvpNm_new" name="delivery_title" value="" class="inpH28" title="배송지명을 입력해주세요." style="width:200px;">
					</td>
				</tr>
				<!--// 2017-01-18 추가 -->
				<tr style="">
					<th scope="row">받는분</th>
					<td class="imp_data"><!-- 2017-01-18 추가 : 필수입력사항 아이콘 추가 -->
						<input type="text" id="delivery_name" name="delivery_name" value="" class="inpH28" title="받는분 이름을 입력해주세요." style="width:200px">
						<span class="chk_area" onclick="deliverycheck();"><input type="checkbox" id="delivery_check">주문자정보와 동일</span><!-- 2017-01-18 수정 : 위치변경 -->
					</td>
				</tr>
				<tr style="">
					<th scope="row">연락처1</th>
					<td class="imp_data"><!-- 2017-01-18 추가 : 필수입력사항 아이콘 추가 -->
						<select id="delivery_tel" name="delivery_tel" class="selH28" title="연락처1 앞자리를 선택해주세요." style="width:90px">
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
						 - <input type="text" id="delivery_tel1" name="delivery_tel1" value="" class="inpH28" title="연락처1 가운데 자리를 입력해주세요." style="width:90px">
						 - <input type="text" id="delivery_tel2" name="delivery_tel2" value="" class="inpH28" title="연락처1 마지막 4자리를 입력해주세요." style="width:90px">
					     <span class="info_security"><button type="button" class="chk_area">안심번호 서비스 안내</button></span>
					</td>
				</tr>
				<tr style="">
					<th scope="row">주소</th>
					<td class="imp_data"><!-- 2017-01-25 수정 : 클래스 추가 -->
						<input type="text" id="sample6_postcode" name="rmitPostNo" value="" class="inpH28" title="우편번호를 검색해주세요." style="width:90px" readonly="readonly">
						<button type="button" class="btnSmall wGreen w100" id="" onclick="sample6_execDaumPostcode()"><span>우편번호 찾기</span></button>
						<div class="addr_box">
							<!-- 주소 입력 시 보여지는 부분 -->
							<p class="addr_new">
								<span class="tx_addr" id="sample6_address"></span>
								<input type="hidden" id="sample6_address1" name="" value="">
							</p>
							<!--// 주소 입력 시 보여지는 부분 -->
						</div>
						<input type="text" id="sample6_detailAddress" name="delivery_address2" value="" class="inpH28" title="상세주소를 입력해주세요." style="width:500px; display: block;" this="상세 주소는">
						<input type="hidden" id="sample6_extraAddress">
						<!-- 배송주소를 입력받을 hidden태그 -->
						<input type="hidden" id="delivery_address" name="delivery_address" value="">
					</td>
				</tr>
				<tr>
					<th scope="row">택배배송 메시지</th>
					<td>
						<select id="mbrMemoCont" class="selH28" title="택배배송 메시지를 선택해주세요." style="width:350px" onchange="delivery_message(this);">
							<option value="">배송메시지를 선택해주세요.</option>

							<option value="10">부재시 경비실에 맡겨주세요.</option>

							<option value="20">부재시 문앞에 놓아주세요.</option>

							<option value="30">파손의 위험이 있는 상품이오니, 배송 시 주의해주세요.</option>

							<option value="40">배송전에 연락주세요.</option>

							<option value="50">택배함에 넣어주세요.</option>

							<option value="99">배송 메시지 직접입력</option>

						</select>
						<input type="text" id="mbrMemoCont1" name="delivery_message_1" value="" class="inpH28 mgT6" title="배송메시지를 입력해주세요." style="width:700px; display: none;">
						<input type="hidden" name="delivery_message_2" id="delivery_message_2" value="">
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
				<input type="hidden" name="product_num" value="${cartlist.product_num}">
				<input type="hidden" name="product_count" value="${cartlist.product_count}">
				<tr>
					<td colspan="5">
						<div class="tbl_cont_area">
							<div class="tbl_cell w700">
								<div class="prd_info">
									<div class="prd_img">
										<img src="./upload/${cartlist.img_main}" alt="장바구니 상품 임시 이미지">
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
						<input type="hidden" name="cartnum" value="${cartlist.cart_num}"/>
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
							<td id="dlexCouponList_hd">
							<c:set var="coupon" value="${requestScope.cou}" />
							<c:set var="allCheck" value="${requestScope.allCheck}" />
							<c:choose>
								<c:when test="${allCheck == 0}">
									<div style="display:block;">
										<select id="selDelCoupon" class="selH28 mgT5" style="width:300px" disabled="disabled">
											<option>적용할 수 있는 쿠폰이 없습니다.</option>
										</select>
									</div>
								</c:when>
								<c:otherwise>
									<div style="display:block;">
										<select id="selAllCoupon" name="allcouponnum" class="selH28 mgT5" style="width:300px" onchange="allcoupon_change(this);">
											<option value="0-0" selected="selected">쿠폰을 선택해주세요.</option>
											<c:if test="${allCheck != 0}">
											<c:forEach var="couponlist"  items="${requestScope.cou}">
												<c:if test="${couponlist.coupon_type eq '전체금액'}">
   													<option value="${couponlist.coupon_num}-${couponlist.coupon_percent}-${couponlist.coupon_limitmax}">${couponlist.coupon_name}(최대 할인 금액 ${couponlist.coupon_limitmax}원)</option>
												</c:if>
											</c:forEach>
											</c:if>
										</select>
									</div>
								</c:otherwise>
							</c:choose>
							</td>
						</tr>
						<tr>
							<th scope="row">배송비 쿠폰</th>
							<td id="dlexCouponList_hd">
							<c:set var="coupon" value="${requestScope.cou}" />
							<c:set var="delCheck" value="${requestScope.delCheck}" />
							<c:choose>
								<c:when test="${delCheck eq 0}">
									<div id="delmoneycheck" style="display:block;">
										<select id="selDelCoupon" class="selH28 mgT5" style="width:300px" disabled="disabled">
											<option>적용할 수 있는 쿠폰이 없습니다.</option>
										</select>
									</div>
								</c:when>
								<c:when test="${sum >= 20000}">
									<div id="delmoneycheck" style="display:block;">
										<select id="selDelCoupon" class="selH28 mgT5" style="width:300px" disabled="disabled">
											<option>적용할 수 있는 쿠폰이 없습니다.</option>
										</select>
									</div>
								</c:when>
								<c:otherwise>
									<div style="display:block;">
										<select id="selDelCoupon" name="delcouponnum" class="selH28 mgT5" style="width:300px" onchange="delivery_coupon_change(this);">
											<option value="선택안함" selected="selected">쿠폰을 선택해주세요.</option>
											<c:if test="${delCheck != 0}">
											<c:forEach var="couponlist"  items="${requestScope.cou}">
												<c:if test="${couponlist.coupon_type eq '배송비'}">
   													<option value="${couponlist.coupon_num}">${couponlist.coupon_name}</option>
												</c:if>
											</c:forEach>
											</c:if>
										</select>
									</div>
								</c:otherwise>
							</c:choose>
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
										<input type="text" id="inpoint" name="inpoint" class="inpH28" style="width:100px; text-align: right;" value=""> 원 / 
										<span id="cjonePnt_span" class="tx_num colorOrange"><span id="cjonePnt">${member.point}</span>P</span>
										<input type="hidden" id="memberpoint" value="${member.point}">
									</span> 
									<button type="button" class="btnSmall wGray3" id="cjonePnt_btn" onclick="pointAllIn();"><span>전액사용</span></button>
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
							<input type="hidden" id="paytype" name="paytype" value="card">
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
											<input type="hidden" id="cardCouponIndex" value="">
											<select id="acqrCd" name="bank" class="selH28" title="결제하실 카드를 선택해주세요." style="width:200px" onchange="card_change(this);">
												<option value="0">카드를 선택해주세요.</option>

												<option value="BC카드">BC카드</option>

												<option value="하나비자">하나비자</option>

												<option value="우리카드">우리카드</option>

												<option value="신협카드">신협카드</option>

												<option value="수협카드">수협카드</option>

												<option value="전북카드">전북카드</option>

												<option value="씨티카">씨티카드</option>

												<option value="삼성카드">삼성카드</option>

												<option value="신한카드">신한카드</option>

												<option value="광주비자">광주비자</option>

												<option value="제주카드">제주카드</option>

												<option value="현대카드">현대카드</option>

												<option value="롯데카드">롯데카드</option>

												<option value="KB카드">KB카드</option>

												<option value="NH카드">NH카드</option>

												<option value="외환카드">외환카드</option>

											</select>

										</div>
									</td>
								</tr>
								<tr>
									<th scope="row">할부종류</th>
									<td>
										<div>
											<select id="instMmCnt" name="installment" class="selH28" style="width:200px" disabled="">
												<option value="0">일시불</option>
												<option value="2">2개월</option>
												<option value="3">3개월</option>
												<option value="4">4개월</option>
												<option value="5">5개월</option>
												<option value="6">6개월</option>
												<option value="7">7개월</option>
												<option value="8">8개월</option>
												<option value="9">9개월</option>
												<option value="10">10개월</option>
												<option value="11">11개월</option>
												<option value="12">12개월</option>
											</select>
											
										</div>
									</td>
								</tr>
								</tbody>
							</table>
							<input type="hidden" id="cardNum" name="cardNum">	
							<input type="hidden" id="cardDate" name="cardDate">
							<input type="hidden" id="cardCvc" name="cardCvc">
							<input type="hidden" id="cardPass" name="cardPass">						
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
										<select id="crIssuCd" name="crIssuCd" class="selH28" title="현금영수증 신청여부를 선택해주세요." style="width:200px" onchange="cashTax(this);">
											<option value="">신청안함</option>
											<option value="10">개인소득공제용</option>
											<option value="20">사업자지출증빙용</option>
										</select>
									</div>
								</td>
							</tr>
							
							<!-- 개인소득공제용신청 시 -->
							<tr id="solotax" style="display: none;">
								<th scope="row">발급방법</th>
								<td>
									<div>
										<input type="radio" id="crIssuMeanSctCd_3" name="crIssuMeanSctCd" value="3" checked="checked"> <label for="crIssuMeanSctCd_3">휴대폰</label>
										<input type="radio" id="crIssuMeanSctCd_5" name="crIssuMeanSctCd" value="5"> <label for="crIssuMeanSctCd_5">현금영수증카드</label>
									</div>
								</td>
							</tr>
							<!-- 개인소득공제용 [휴대폰] 선택 시 -->
							<tr id="solotaxphone" style="display: none;">
								<th scope="row">휴대폰</th>
								<td>
									<div>
										<select id="dispCashReceiptInfo11" class="selH28" title="현금영수증 휴대폰 앞자리를 선택해주세요." style="width:90px">

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
										 - <input type="text" id="dispCashReceiptInfo12" value="5172" class="inpH28" title="현금영수증 휴대폰 가운데 자리를 입력해주세요." this="현금영수증 휴대폰 가운데 자리는" style="width:90px">
										 - <input type="text" id="dispCashReceiptInfo13" value="8187" class="inpH28" title="현금영수증 휴대폰 마지막 4자리수를 입력해주세요." this="현금영수증 휴대폰 마지막 자리는" style="width:90px">
										 <input type="hidden" id="crPhoneNumber" name="crIssuMeanNo" value="01051728187">
									</div>
								</td>
							</tr>
							<!--//개인소득공제용 [휴대폰] 선택 시 -->
							<!-- 개인소득공제용 [현금영수증카드] 선택 시 -->
							<tr style="display: none;">
								<th scope="row">현금영수증 카드번호</th>
								<td>
									<div>
										<input type="text" id="CashReceipts" name="crIssuMeanNo" class="inpH28" title="현금영수증 카드번호를 입력해주세요." this="현금영수증 카드번호는" style="width:300px">
									</div>
								</td>
							</tr>
							<!--// 개인소득공제용 [현금영수증카드] 선택 시 -->
							<!--// 개인소득공제용신청 시 -->
							
							<!-- 사업자지출증빙용 시 -->
							<tr id="licensetax" style="display: none;">
								<th scope="row">사업자등록번호</th>
								<td>
									<div>
										<input type="hidden" name="crIssuMeanSctCd" value="2">
										<input type="text" id="BusinessNumber" name="crIssuMeanNo" class="inpH28" title="현금영수증 사업자 등록번호를 입력해주세요." this="현금영수증 사업자 등록번호는" style="width:300px"">
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
							<input type="hidden" id="prototal" name="prototal" value="${sum}">
						</li>
						<li>
							<span class="tx_tit">쿠폰할인금액</span><!-- 2017-01-18 수정 : 문구수정 --> 
							<span class="tx_cont colorOrange"><span class="tx_num" id="totDscntAmt_span">0</span>원</span>
							<input type="hidden" id="coutotal" value="0">
						</li>
						<li class="line_top2">
							<span class="tx_tit">총 배송비</span> 
							<c:if test="${sum >= 20000}">
								<span class="tx_cont" id="deliverycost"><span class="tx_num" id="dlexPayAmt_span">무료</span></span>
								<input type="hidden" id="deltotal" name="deltotal" value="2500">
							</c:if>
							<c:if test="${sum < 20000}">
								<span class="tx_cont" id="deliverycost"><span class="tx_num" id="dlexPayAmt_span">2500원</span></span>
								<input type="hidden" id="deltotal" name="deltotal" value="0">
							</c:if>
						</li>
						<li>
							<span class="tx_tit"><span class="tx_num">CJ ONE</span> 포인트</span> 
							<span class="tx_cont colorOrange"><span class="tx_num" id="cjonePntAplyAmt_span">0</span>원</span>
							<input type="hidden" id="pointtotal" value="0">
						</li>
						<li class="total">
							<span class="tx_tit">최종 결제금액</span>
							<c:if test="${sum >= 20000}">
							<span class="tx_cont"><span class="tx_num" id="totPayAmt_sum_span">${sum}</span>원</span>
							<input type="hidden" id="lastprice" name="lastprice" value="${sum}">
							</c:if>
							<c:if test="${sum < 20000}">
							<span class="tx_cont"><span class="tx_num" id="totPayAmt_sum_span">${sum+2500}</span>원</span>
							<input type="hidden" id="lastprice" name="lastprice" value="${sum+2500}">
							</c:if>
						</li>

						<li>
							<button class="btnPayment" id="btnPay" name="btnPay" type="submit">결제하기</button>
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
	<jsp:include page="../include/Footer.jsp"/>
	<!-- footer// -->
	</div>
	</body>
</html>
