<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 현재 페이지에서 JSTL의 core라이브러리에 속한 태그들을 사용 하기 위한 설정
	core라이브러리에 속한 태그는? 접두사 c를 이용한다. 
 --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
				<h1>주문/결제</h1>
				<ul class="step_list">
					<li><span class="step_num tx_num">1</span> 장바구니</li>
					<li class="on"><span class="hide">현재단계</span><span class="step_num tx_num">2</span> 주문/결제</li><!-- 현재단계 li에 클래스 on과 <span class="hide">현재단계</span> 넣어주세요 -->
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
				<tr>
					<th scope="row">주문자명</th>
					<td><input type="text" id="ordManNm" name="ordManNm" value="박정현" class="inpH28" title="주문자명을 입력해주세요." this="주문자명은" style="width:200px"></td><!-- id와 label for를 맞춰주세요 (임시로 넣어둠) -->
				</tr>
				<tr>
					<th scope="row">휴대폰</th>
					<td>
						<select id="ordManCellSctNo" name="ordManCellSctNo" class="selH28" title="주문자 휴대폰 번호 앞자리를 선택해주세요." style="width:90px">
							<option value="">선택</option>

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
						 - <input type="text" id="ordManCellTxnoNo" name="ordManCellTxnoNo" value="5172" class="inpH28" title="주문자 휴대폰 번호 가운데 자리를 입력해주세요." this="주문자 휴대폰 번호 가운데 자리는" style="width:90px">
						 - <input type="text" id="ordManCellEndNo" name="ordManCellEndNo" value="8187" class="inpH28" title="주문자 휴대폰 번호 마지막 4자리를 입력해주세요." this="주문자 휴대폰 번호 마지막 자리는" style="width:90px">
					</td>
				</tr>
				<tr>
					<th scope="row">이메일</th>
					<td>


						<input type="hidden" id="ordManEmailAddr" name="ordManEmailAddr" value="wjdgus5625@naver.com" title="주문자 이메일 주소를 입력해주세요.">
						<input type="text" id="ordManEmailAddrId" value="wjdgus5625" class="inpH28" title="주문자 이메일 주소를 입력해주세요." this="주문자 이메일 주소는" style="width:120px"> 
						@ <input type="text" id="ordManEmailAddrDmn" value="naver.com" class="inpH28" title="이메일도메인을 입력해주세요." this="이메일도메인은" style="width:120px" disabled="">
						<select id="ordManEmailAddrDmn_select" class="selH28" title="주문자 이메일 주소 도메인을 선택해주세요." style="width:120px">
							<option value="">직접입력</option>

							<option value="hanmir.com">hanmir.com</option>

							<option value="naver.com" selected="selected">naver.com</option>

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
							<!--[오늘드림 구매에서 일반배송으로 주문서 들어왔을때 선택한 배송지 셋팅을 위해서 사용 :jwkim]-->
							<input type="hidden" name="selectDlvSeq" value="">
							<select id="dlvpSelect" name="mbrDlvpSeq" class="selH28" title="배송지를 선택해주세요." style="width:200px" disabled="disabled">


							</select>
						</div>
					</td>
				</tr>
				
				<!-- 2017-01-18 추가 (기존 배송지 선택 시) -->
				
					
					
						<tr type="exist" style="display: none;">
							<th scope="row">배송지명</th>
							<td id="dlvpNm_exist_span"></td>
							<input type="hidden" id="dlvpNm_exist" name="dlvpNm" value="" title="배송지명을 입력해주세요." style="width:200px" this="배송지명은" disabled="disabled">
						</tr>
					
				
				<!--// 2017-01-18 추가 -->
				<tr type="exist" style="display: none;">
					<th scope="row">받는분</th>
					<td class="imp_data"><!-- 2017-01-18 추가 : 필수입력사항 아이콘 추가 -->
						<input type="text" id="rmitNm_exist" name="rmitNm" value="" orgvalue="" class="inpH28" title="받는분 이름을 입력해주세요." style="width:200px" this="받는분 이름은" disabled="disabled">
						<span class="chk_area"><input type="checkbox" id="copyToDlvp_exist" targetid="exist" disabled="disabled"> <label for="copyToDlvp_exist">주문자정보와 동일</label></span><!-- 2017-01-18 수정 : 위치변경 -->
					</td>
				</tr>
				<tr class="sumtr1" type="exist" style="display: none;">
					<th scope="row">연락처1</th>
					<td class="imp_data"><!-- 2017-01-18 추가 : 필수입력사항 아이콘 추가 -->
						<select id="rmitCellSctNo_exist" name="rmitCellSctNo" class="selH28" title="연락처1 앞자리를 선택해주세요." style="width:90px" orgvalue="" disabled="disabled">
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
						 - <input type="text" id="rmitCellTxnoNo_exist" name="rmitCellTxnoNo" value="" orgvalue="" class="inpH28" title="연락처1 가운데 자리를 입력해주세요." this="연락처1 가운데 자리는" style="width:90px" disabled="disabled">
						 - <input type="text" id="rmitCellEndNo_exist" name="rmitCellEndNo" value="" orgvalue="" class="inpH28" title="연락처1 마지막 4자리를 입력해주세요." this="연락처1 마지막 자리는" style="width:90px" disabled="disabled">
						 <!-- <span class="chk_area"><input type="checkbox" id="chkSafe_exist" name="chkSafe" value="123" /> <label for="chkSafe">안심번호 사용</label></span> -->
						 <span class="info_security"><button type="button" data-rel="layer" data-target="securityInfo" class="chk_area">안심번호 서비스 안내</button></span>
					</td>
				</tr>
				<tr class="sumtr2" type="exist" style="display: none;">
					<th scope="row">연락처2</th>
					<td>
						<select id="rmitTelRgnNo_exist" name="rmitTelRgnNo" class="selH28" title="연락처2 앞자리를 선택해주세요." style="width:90px" disabled="disabled">
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
						 - <input type="text" id="rmitTelTxnoNo_exist" name="rmitTelTxnoNo" value="" class="inpH28" title="연락처2 가운데 자리를 입력해주세요." this="연락처2 가운데 자리는" style="width:90px" disabled="disabled">
						 - <input type="text" id="rmitTelEndNo_exist" name="rmitTelEndNo" value="" class="inpH28" title="연락처2 마지막 4자리를 입력해주세요." this="연락처2 마지막 자리는" style="width:90px" disabled="disabled">
					</td>
				</tr>
				<tr type="exist" style="display: none;">
					<th scope="row">주소</th>
					<td class="imp_data"><!-- 2017-01-25 수정 : 클래스 추가 -->
						<input type="text" id="stnmRmitPostNo_exist" name="rmitPostNo" value="" class="inpH28" title="우편번호를 검색해주세요." style="width:90px" readonly="readonly" disabled="disabled">
						<input type="hidden" id="rmitPostNo_exist" name="stnmRmitPostNo" value="" title="우편번호를 검색해주세요." disabled="disabled">
						
							<button type="button" class="btnSmall wGreen w100" id="search-zipcode-pop_exist"><span>우편번호 찾기</span></button>
						
						<div class="addr_box">
							<input type="hidden" id="stnmRmitPostAddr_exist" name="stnmRmitPostAddr" value="" class="inpH28" title="우편번호를 검색해주세요." readonly="readonly" disabled="disabled">
							<input type="hidden" id="rmitBaseAddr_exist" name="rmitPostAddr" value="" class="inpH28" title="우편번호를 검색해주세요." readonly="readonly" disabled="disabled">
							<!-- 주소 입력 시 보여지는 부분 -->
							<p class="addr_new">
								<span class="tx_tit">도로명</span> : 
								<span class="tx_addr" id="stnmPostAddr_exist"> </span><!--  도로명주소를 넣어주세요 -->
							</p>
							<p class="addr_old">
								<span class="tx_tit">지번</span> : 
								<span class="tx_addr" id="baseAddr_exist"> </span><!--  지번주소를 넣어주세요 -->
							</p>
							<!--// 주소 입력 시 보여지는 부분 -->
						</div>
						<input type="text" id="tempRmitDtlAddr_exist" value="" class="inpH28" title="상세주소를 입력해주세요." style="width:500px; display: none;" this="상세 주소는" disabled="disabled">
						<input type="hidden" id="stnmRmitDtlAddr_exist" name="stnmRmitDtlAddr" value="" orgvalue="" class="inpH28" title="상세주소를 입력해주세요." style="width:500px" this="상세 주소는" disabled="disabled">
						<input type="hidden" id="rmitDtlAddr_exist" name="rmitDtlAddr" value="" orgvalue="" class="inpH28" title="상세주소를 입력해주세요." style="width:500px" disabled="disabled">
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
						<input type="text" id="rmitNm_new" name="rmitNm" value="" orgvalue="" class="inpH28" title="받는분 이름을 입력해주세요." style="width:200px" this="받는분 이름은">
						<span class="chk_area"><input type="checkbox" id="copyToDlvp_new" targetid="new"> <label for="copyToDlvp_new">주문자정보와 동일</label></span><!-- 2017-01-18 수정 : 위치변경 -->
					</td>
				</tr>
				<tr type="new" style="">
					<th scope="row">연락처1</th>
					<td class="imp_data"><!-- 2017-01-18 추가 : 필수입력사항 아이콘 추가 -->
						<select id="rmitCellSctNo_new" name="rmitCellSctNo" class="selH28" title="연락처1 앞자리를 선택해주세요." orgvalue="" style="width:90px">
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
						 - <input type="text" id="rmitCellTxnoNo_new" name="rmitCellTxnoNo" value="" orgvalue="" class="inpH28" title="연락처1 가운데 자리를 입력해주세요." this="연락처1 가운데 자리는" style="width:90px">
						 - <input type="text" id="rmitCellEndNo_new" name="rmitCellEndNo" value="" orgvalue="" class="inpH28" title="연락처1 마지막 4자리를 입력해주세요." this="연락처1 마지막 자리는" style="width:90px">
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
			<!-- <h2 class="sub-title2 underline">주문상품정보</h2> --><!-- 2017-01-24 수정 : 해당 타이틀 삭제 -->
			<h2 class="sub-title2">
				올리브영 배송상품
			
				 <em class="gift" id="giftNoti2" style="display: none;">* 증정품은 결제 시 확인하실 수 있습니다.</em>
			
			</h2><!-- 2017-01-24 수정 : 타이틀 마크업 수정 및 클래스명 변경 -->
			<table class="tbl_prd_list">
				<caption>올리브영 배송상품 주문상품 목록</caption>
				<colgroup>
					<col style="width:*">
					<col style="width:110px">
					<col style="width:100px">
					<!--
					2017-01-24 수정 : 삭제 
					<col style="width:120px" />
					-->
					<col style="width:110px">					
				</colgroup>
				<thead>
				<tr>
					<th scope="col">상품정보</th>
					<th scope="col">판매가</th>
					<th scope="col">수량</th>
					<!-- 
					2017-01-24 수정 : 배송정보 삭제
					<th scope="col">배송정보</th>
					-->
					<th scope="col">구매가</th><!-- 2017-01-24 수정 : 문구수정 -->
				</tr>
				</thead>
				<tbody>
				<tr>
					<input type="hidden" name="cartNo" value="70203916">
					<td colspan="5" dispcatno="90000010001" stdcatno="010101" goodsno="A000000102929" itemno="001" entrno="C14488" brndcd="1545" tradeshpcd="1" staffdscntyn="Y"><!-- 2017-01-13 수정 -->
						<div class="tbl_cont_area">
							<div class="tbl_cell w700"><!-- 2017-01-24 수정 : 클래스명 변경 -->
								<div class="prd_info">
									<div class="prd_img">
										<img src="./주문_결제 _ 올리브영_files/A00000010292905ko.jpg" alt="장바구니 상품 임시 이미지" onerror="common.errorImg(this);">
									</div>
									<div class="prd_name">
		
										<span>유세린</span><!-- 2017-01-26 수정 : 브랜드명 분리 -->
										<p>유세린 더모 퓨리파이어 토너 1+1 기획</p>
									</div>
									<p class="prd_opt">
		
									</p>
									<p class="prd_flag">
		
									<span class="icon_flag coupon">쿠폰</span><!-- 13 -->
		
									<span class="icon_flag gift">증정</span><!-- 14 -->
		
									<span class="icon_flag delivery">오늘드림</span><!-- 15 -->
		
									</p>
								</div>
							</div>
							<div class="tbl_cell w110">
								<!-- <span class="org_price"><span class="tx_num" id="normPrc_"></span>원</span> --><!-- 2017-01-24 수정 : 삭제 -->
								<span class="cur_price"><span class="tx_num">26,000</span>원</span>
							</div>
							<div class="tbl_cell w100">1</div>
							<!-- 2017-01-24 수정 : 삭제 
							<div class="tbl_cell w120">
								<p class="prd_delivery">
									<strong>
										무료배송
									</strong> 
									도서·산간 제외
								</p>
							</div>
							-->
							<div class="tbl_cell w110">
		
								<input type="hidden" name="couponList[0].promChk" value="Y">
								<input type="hidden" name="couponList[0].goodsNo" value="A000000102929">
								<input type="hidden" name="couponList[0].itemNo" value="001">
								<input type="hidden" name="couponList[0].promNo" value="C000000013140">
								<input type="hidden" name="couponList[0].promAplySeq" value="">
								<input type="hidden" name="couponList[0].promKndCd" value="C101">
								<input type="hidden" name="couponList[0].entrNo" value="">
								<input type="hidden" name="couponList[0].immedGoods1DcAmt" value="1300">
								<input type="hidden" name="couponList[0].immedOrdQty1" value="1">
		
								<span class="org_price"><span class="tx_num" id="normPrc_A000000102929/001">26,000</span>원</span><!-- 2017-01-24 수정 : 추가 -->
								<span class="pur_price"><span class="tx_num" id="salePrc_A000000102929/001">24,700</span>원</span>
								<input type="hidden" id="orgNormPrc_A000000102929/001" value="26000">
								<input type="hidden" id="orgSalePrc_A000000102929/001" value="24700">
								<input type="hidden" id="imdtDscntAmt_A000000102929/001" value="1300">
							</div>
						</div>
		
					</td>
				</tr>
				<!--// 1+1 행사 상품인 경우 -->
		
				</tbody>
			</table>
		
	
				
			

			<!--// 주문상품정보 -->

			<!-- 증정품 -->


			<input type="hidden" id="giftCount" value="0" orgvalue="0">
			<div id="giftCartNo"></div>
			<!--// 증정품 -->
			
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
							<td colspan="2">
								<div class="bg_area"><!-- 2017-01-18 수정 : 클래스 추가 -->
									<input type="radio" id="autoDiscount" name="Discount_Benefits" value="auto" checked="checked"><label for="autoDiscount">최대 할인 추천받기</label>
									<input type="radio" id="manualDiscount" name="Discount_Benefits" value="manual" class="mgL20"><label for="manualDiscount">혜택 직접 선택하기</label>
									<p class="tx_right tx_discount"><span class="tx_num" id="totCpnAplyAmt">0</span>원</p>
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row">상품별 할인</th>
							<td id="dwnldCouponList">

	
	
								<div>
									<select class="selH28 mgT5" style="width:300px" disabled="disabled">
										<option>적용할 수 있는 쿠폰이 없습니다.</option>
									</select>
									<p class="tx_point_info">즉시할인쿠폰은 상품금액에 자동적용 되어있습니다.</p>
								</div>
	

								<!--// 상품별 할인목록 영역 -->
							</td>
						</tr>
						<tr>
							<th scope="row">주문별 할인</th>
							<td id="paymentCouponList">
								<!-- 주문별 할인목록 영역 -->

	
	
								<div>
									<select class="selH28" style="width:300px" disabled="disabled">
										<option>적용할 수 있는 쿠폰이 없습니다.</option>
									</select>
								</div>
	

								<!--// 주문별 할인목록 영역 -->
							</td>
						</tr>
						<!-- 2017-01-18 수정 : 배송비 할인 영역 변경 -->

						<tr>
							<th scope="row">배송비 쿠폰</th>
							<td id="dlexCouponList_hd">
								<div>
	
		
		
									<select id="selDelCoupon" class="selH28 mgT5" style="width:300px" disabled="disabled">
										<option>적용할 수 있는 쿠폰이 없습니다.</option>
									</select>
		
	
								</div>
							</td>
						</tr>


						<!--// 2017-01-18 수정 : 배송비 할인 영역 변경 -->
						</tbody>
					</table>
					<input type="hidden" id="couponCnt" value="1">
					<!--// 쿠폰할인정보 -->
					
					<!-- 포인트사용 --><!-- 2017-01-18 수정 : 전액사용 버튼이 input 뒤로 위치 변경됨 -->
					<h2 class="sub-title2">포인트/기프트카드사용</h2>
					<table class="tbl_inp_form type2">
						<caption>포인트사용 입력 폼</caption>
						<colgroup>
							<col style="width:170px">
							<col style="width:*">
						</colgroup>
						<input type="hidden" id="lastAplyPntInputName" value="">
						<tbody>
						
						<tr>
							<th scope="row"><button type="button" class="btnGift btnGiftClick" data-rel="layer" data-target="OliveGiftInfo">올리브영 기프트카드</button></th>
							<td>
								<div>
									<span class="inp_point_wrap">
										<input type="text" id="oyGiftCardAplyAmt" name="" class="inpH28 giftCard" title="사용하실 올리브영 기프트카드를 입력해주세요." style="width:100px" this="올리브영 기프트카드는 " minownamt="10" unit="원" unitamt="1" minaplyamt="10" disabled="disabled"> 원 / <span id="oyGiftCardOwn_span" class="tx_num colorOrange"><span id="oyGiftCardAmt">0</span>원</span>
										<input type="hidden" name="oyGiftCardAplyAmt" value="0">
									</span> 
									<button type="button" class="btnSmall wGray2" name="giftCard_btn" id="oyGiftCard_btn"><span>조회</span></button>
									<p class="tx_point_info">올리브영 기프트카드는 1원 단위로 최소 10원 이상 사용하실 수 있습니다.</p>
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row"><button type="button" class="btnGift btnGiftClick" data-rel="layer" data-target="CJGiftInfo"><span class="tx_num">CJ</span> 기프트카드</button></th>
							<td>
								<div>
									<span class="inp_point_wrap">
										<input type="text" id="cjGiftCardAplyAmt" class="inpH28 giftCard" title="사용하실 CJ 기프트카드를 입력해주세요." style="width:100px" this="CJ 기프트카드는 " minownamt="10" unit="원" unitamt="1" minaplyamt="10" disabled="disabled"> 원 / <span id="cjGiftCardAmt_span" class="tx_num colorOrange"><span id="cjGiftCardAmt">0</span>원</span>
										<input type="hidden" name="cjGiftCardAplyAmt" value="0">
									</span> 
									<button type="button" class="btnSmall wGray2" name="giftCard_btn" id="cjGiftCard_btn"><span>조회</span></button>
									<p class="tx_point_info">CJ 기프트카드는 1원 단위로 최소 10원 이상 사용하실 수 있습니다.</p>
								</div>
							</td>
						</tr>
						<!--// 2018-01-05 기프트카드 추가 -->
						<tr>
							<th scope="row"><span class="tx_num">CJ ONE</span> 포인트</th>
							<td>
								<div>
									<span class="inp_point_wrap">
										<input type="text" id="cjonePntAplyAmt" class="inpH28" title="사용하실 CJ ONE 포인트를 입력해주세요." style="width:100px" this="CJ ONE 포인트는 " minownamt="1000" unit="P" unitamt="10" minaplyamt="0" disabled=""> 원 / <span id="cjonePnt_span" class="tx_num colorOrange"><span id="cjonePnt">935</span>P</span>
										<input type="hidden" name="cjonePntAplyAmt" value="0">
									</span> 
									<button type="button" class="btnSmall wGray3" id="cjonePnt_btn" disabled=""><span>전액사용</span></button>
									<p class="tx_point_info">CJ ONE 포인트는 최소 1,000P 이상 보유 시 10P 단위로 사용하실 수 있습니다.</p><!-- //2017-02-24 문구추가// -->
									
								</div>
							</td>
						</tr>

						<tr>
							<th scope="row">예치금</th>
							<td>
								<div>
									<span class="inp_point_wrap">
										<input type="text" id="csmnAplyAmt" class="inpH28" title="사용하실 예치금을 입력해주세요." style="width:100px" this="예치금은 " minownamt="1000" unit="원" unitamt="10" minaplyamt="0" disabled=""> 원 / <span class="tx_num colorOrange"><span id="csmnOwnAmt">0</span>원</span>
										<input type="hidden" name="csmnAplyAmt" value="0">
										<input type="hidden" name="csmnUseYn" value="N">
									</span>
									<button type="button" class="btnSmall wGray3" id="csmnAplyAmt_btn" disabled="">전액사용</button>
 									<p class="tx_point_info">예치금은 최소 1,000원 이상 보유 시 10원 단위로 사용하실 수 있습니다.</p><!-- //2017-02-24 문구추가// -->
								</div>
							</td>
						</tr>
						
						<!-- OK 캐쉬백 -->
						
						<!-- //OK 캐쉬백 --> 
						</tbody>
					</table>
					<!--// 포인트사용 -->
					
					<!-- 결제수단 선택 -->

					<div class="title_wrap" id="payMethod_div">
						<h2 class="sub-title2">결제수단 선택</h2>
						<p class="sub_area"><input type="checkbox" id="savePayMethodYn" name="savePayMethodYn" value="Y" paymeancd="" acqrcd="" instmmcnt="" pntuseyn="" bnkcd="" morcmannm=""> <label for="savePayMethodYn">선택한 결제수단 저장하기</label></p>
					</div>
					<ul class="payment_info_form" id="payMethodList">
						<li class="bg_area"><!-- 2017-01-18 수정 : 클래스 추가 -->
							<span><input type="radio" id="payMethod_11" name="payMethod" value="11" cashreceipt="N" checked="checked"><label for="payMethod_11">신용카드</label></span>
							<span><input type="radio" id="payMethod_21" name="payMethod" value="21" cashreceipt="Y"><label for="payMethod_21">계좌이체</label></span>
							
							
							<span><input type="radio" id="payMethod_61" name="payMethod" value="61" cashreceipt="Y"><label for="payMethod_61">무통장입금</label></span>
							
							
							<span><input type="radio" id="payMethod_22" name="payMethod" value="22" cashreceipt="N"><label for="payMethod_22">휴대폰결제</label></span>
							<!-- 2017-01-18 수정 : 문화상품권/도서상품권 선택 삭제 -->
							<!-- 2017-02-14 수정 : 문화상품권/도서상품권 선택 재추가 --> 
							<span><input type="radio" id="payMethod_23" name="payMethod" value="23" cashreceipt="N"><label for="payMethod_23">문화상품권</label></span>
							<span><input type="radio" id="payMethod_24" name="payMethod" value="24" cashreceipt="Y"><label for="payMethod_24">도서상품권</label></span>
							<!-- 2017-04-18 추가 -->
							<span><input type="radio" id="payMethod_25" name="payMethod" value="25" cashreceipt="N"><label for="payMethod_25">PAYCO</label></span>
							<!-- //2017-04-18 추가 -->
							<span><input type="radio" id="payMethod_26" name="payMethod" value="26" cashreceipt="N"><label for="payMethod_26">카카오페이</label></span>
						</li>
						<!-- 신용카드 선택 시 -->
						<li paymethod="11" style="display: list-item;">							
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
										<div id="cardcoPnt_div">

	
											<p class="tx_info" acqrcd="DIN" pntusestdamt="10000" pntnm="현대카드 M 포인트" salepointflg="S" staffyn="N" style="display: none;">
												<span class="mhy_card">현대카드 M포인트 10% 사용 가능(1만원 이상 결제시 최대 5천 포인트)</span>
											</p>
											<div id="DIN_pntInfoMsg" style="display: none;">
												<p class="tit">사용조건</p>

<ol>
	<li>1만원 이상 결제시 사용 가능</li>
	<li>결제금액의 10% 사용 가능</li>
	<li>법인/체크/선불/기프트/CJ임직원카드 제외</li>
	<li>결제 건당 5,000 M포인트 한도</li>
	<li>10%에 대한 M포인트 부족 시 보유 포인트만큼 차감</li>
	<li>페이코/카카오페이 등 간편결제수단 적용시 사용 불가</li>
</ol>

<p class="tit">포인트 결제 후 부분취소 및 사용 포인트 조회 문의</p>

<ol>
	<li>포인트 환불정책 및 사용 포인트 조회는 현대카드 고객센터로 문의 부탁 드립니다.</li>
	<li>현대카드 고객센터 : 1577-6000</li>
</ol>

											</div>
	

										</div>
									</td>
								</tr>
								<tr>
									<th scope="row">할부종류</th>
									<td>
										<div>
											<select id="instMmCnt" name="instMmCnt" class="selH28" style="width:200px" disabled="">
												<option value="00">일시불</option>
												<option value="02" targetid="nint2MmYn">2개월</option>
												<option value="03" targetid="nint3MmYn">3개월</option>
												<option value="04" targetid="nint4MmYn">4개월</option>
												<option value="05" targetid="nint5MmYn">5개월</option>
												<option value="06" targetid="nint6MmYn">6개월</option>
												<option value="07" targetid="nint7MmYn">7개월</option>
												<option value="08" targetid="nint8MmYn">8개월</option>
												<option value="09" targetid="nint9MmYn">9개월</option>
												<option value="10" targetid="nint10MmYn">10개월</option>
												<option value="11" targetid="nint11MmYn">11개월</option>
												<option value="12" targetid="nint12MmYn">12개월</option>
											</select>
											
										</div>
									</td>
									<input type="hidden" name="aplyNintInstYn" value="N">
								</tr>
								<tr id="pntUseYn_tr" style="display:none;">
									<th scope="row">카드포인트</th>
									<td>
										<div>
											<input type="checkbox" id="pntUseYn" name="pntUseYn" value="Y"> <label for="pntUseYn" id="cardcoPntNm"></label>
											<button type="button" class="mh_btn" data-rel="layer" data-target="mHPointInfo">사용안내</button>
										</div>
									</td>
								</tr>
								<!-- 2017-01-18 추가 : 카드 결제 안내 추가 -->
								<tr>
									<td colspan="2">
										<ul class="info_dot_list type2">

	
		
			
				
					
						<li>The CJ&nbsp;KB 카드 제휴 할인은 국민앱카드 최신버전에서만 지원됩니다. 꼭 최신버전으로&nbsp;업데이트해주세요.</li>
					
				
					
				
			
		
	

											<li id="cardDscnt_N_li" style="display: none;"><strong>청구할인 대상이 아닌 상품이 포함되어 있거나 결제금액이 청구할인 대상 금액보다 적어 청구할인 적용이 불가합니다.</strong></li>
											<li id="cardDscnt_Y1_li" style="display: none;">법인/체크/기프트 카드는 청구할인 대상에서 제외될 수 있습니다.</li>
											<li id="cardDscnt_Y2_li" style="display: none;">일 최대 청구할인 한도에 따라 청구할인 예상금액은 달라질 수 있습니다.</li>
											<li>신용/체크카드 결제금액이 30만원 이상인 경우 공인인증서가 필요합니다.</li>
										</ul>
									</td>
								</tr>
								<!--// 2017-01-18 추가 : 카드 결제 안내 추가 -->												
								<!-- 
								2017-01-18 수정 : 할부혜택 삭제
								<tr>
									<th scope="row">할부혜택</th>
									<td>
										<div>
											<dl class="info_dot_list type2">
												<dt>무이자할부 안내</dt>
												<dd><span>신한카드</span> <span>5만원이상</span> 2,3,4,5,6,12개월</dd>
												<dd><span>KB국민카드</span> <span>5만원이상</span> 2,3,4,5,6,12개월</dd>
												<dd><span>삼성카드</span> <span>5만원이상</span> 2,3,4,5,6,12개월</dd>
												<dd><span>현대카드</span> <span>5만원이상</span> 2,3,4,5,6,12개월</dd>
												<dd><span>KB국민카드</span> <span>5만원이상</span> 2,3,4,5,6,12개월</dd>
												<dd><span>신한카드</span> <span>5만원이상</span> 2,3,4,5,6,12개월</dd>
												<dd><span>신한카드</span> <span>5만원이상</span> 2,3,4,5,6,12개월</dd>
												<dd><span>KB국민카드</span> <span>5만원이상</span> 2,3,4,5,6,12개월</dd>
												<dd><span>신한카드</span> <span>5만원이상</span> 2,3,4,5,6,12개월</dd>
											</dl>
											<p class="tx_info mgT15">* 법인카드/체크카드는 할부 적용제외</p>
										</div>
									</td>
								</tr>
								-->
								</tbody>
							</table>							
						</li>
						<!--// 신용카드 선택 시 -->
						<!-- 무통장입금 선택 시 -->
						<li paymethod="61" style="display: none;">							
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
											<select id="VirDepositBank" name="cjBnkCd" class="selH28" title="은행를 선택해주세요." style="width:300px" disabled="disabled">

												<option value="003" targetid="03">기업</option>

												<option value="004" targetid="06">국민</option>

												<option value="007" targetid="07">수협</option>

												<option value="011" targetid="11">농협</option>

												<option value="020" targetid="20">우리</option>

												<option value="031" targetid="31">대구</option>

												<option value="032" targetid="32">부산</option>

												<option value="039" targetid="39">경남</option>

												<option value="071" targetid="71">우체국</option>

												<option value="081" targetid="81">하나</option>

												<option value="088" targetid="88">신한</option>

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
								<!--
								2017-01-18 수정 : 무통장 입금 시 휴대폰정보 입력 영역 삭제 
								<tr>
									<th scope="row">휴대폰</th>
									<td>
										<div>
											<select name=""  class="selH28" title="휴대폰 이동통신번호를 선택해주세요." style="width:90px">
												<option value="">010</option>
												<option value="">011</option>
												<option value="">016</option>
												<option value="">019</option>
											</select>
											 - <input type="text" name="" value="1234" class="inpH28" title="휴대폰 두번째자리를 입력해주세요." style="width:90px" />
											 - <input type="text" name="" value="5678" class="inpH28" title="휴대폰 마지막자리를 입력해주세요." style="width:90px" />
										</div>
									</td>
								</tr>
								 -->
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
						<!-- 계좌이체 선택 시 -->
						<li paymethod="21" style="display: none;">							
							<table class="tbl_inp_form no_line">
								<caption>계좌이체 안내</caption>
								<colgroup>
									<col style="width:170px">
									<col style="width:*">
								</colgroup>
								<tbody>
								<tr>
									<th scope="row">결제안내</th>
									<td>
										<div>
											<!-- 2017-01-18 수정 : 버튼 삭제 및 하단 문구 수정 -->
											<ul class="info_dot_list type2">

												<li>계좌이체로 결제 완료시 본인 계좌에서 즉시 이체 처리됩니다.</li>
												<li>실시간 계좌이체는 은행별 이용시간이 다를 수 있습니다.</li>
											</ul>
											<!--
											<p class="mgT10"><button class="btnSmall wGray w100"><span>은행별 이용시간</span></button></p>
											 -->
										</div>
									</td>
								</tr>
								</tbody>
							</table>
						</li>
						<!--// 계좌이체 선택 시 -->
						<!-- 휴대폰결제 선택 시 -->
						<li paymethod="22" style="display: none;">							
							<table class="tbl_inp_form no_line">
								<caption>휴대폰결제 안내</caption>
								<colgroup>
									<col style="width:170px">
									<col style="width:*">
								</colgroup>
								<tbody>
								<tr>
									<th scope="row">결제안내</th>
									<td>
										<div>
											<ul class="info_dot_list type2">

												<li>휴대폰 결제는 50만원까지 결제가 가능합니다.</li>
												<li>한도문의는 모빌리언스(1600-0523), 다날(1566-3355)로 문의주시기 바랍니다.</li><!-- 2017-01-18 수정 : 문구수정 -->
											</ul>
										</div>
									</td>
								</tr>
								</tbody>
							</table>							
						</li>
						<!--// 휴대폰결제 선택 시 -->
						<!-- 문화상품권(컬쳐캐쉬) 선택 시 -->
						<li paymethod="23" style="display: none;">
							<div class="other_cash_box">
								<!-- 조회 전 -->
								<div class="cash_inquiry_area" id="cultureLandBeforeLogin">
									<p>보유하신 컬쳐캐쉬(문화상품권) 내역 조회 후 사용이 가능합니다.</p>
									<button class="btnSmall wGray2" type="button" data-rel="layer" data-target="cultureLandLoginPop" id="cultureLandLoginPop_btn">조회</button>
								</div>
								<!--// 조회 전 -->
								<!-- 조회 후 -->
								<div class="cash_inquiry_area" id="cultureLandAfterLogin" style="display: none;">
									<input type="hidden" id="cultureLandOwnCash" value="" disabled="disabled">
									<p>고객님의 보유하신 컬쳐캐쉬는 <span class="cash_price"><span class="tx_num" id="cultureLandOwnCash_span"></span>원</span>입니다.</p>
									<p class="tx_info">최종 결제금액을 확인하신 후, [결제하기] 버튼을 클릭하시면 결제가 완료됩니다.</p>									
									<button class="btnSmall wGray2" type="button" id="cultureLandInquire_btn">다시 조회</button>
								</div>
								<!--// 조회 후 -->
								<ul class="info_dot_list type2">

									<li>문화상품권을 컬쳐캐쉬로 충전 후 사용하실 수 있습니다.</li>
									<li>컬쳐캐쉬 충전 및 사용내역, 현금영수증은 컬쳐랜드 홈페이지에서 확인하실 수 있습니다.</li>
									<li>컬쳐캐쉬는 결제금액 전액으로만 사용이 가능합니다.</li>
								</ul>
							</div>					
						</li>
						<!--// 문화상품권(컬쳐캐쉬) 선택 시 -->
						<!-- 도서상품권(북앤라이프 캐쉬) 선택 시 -->
						<li paymethod="24" style="display: none;">
							<div class="other_cash_box">
								<!-- 조회 전 -->
								<div class="cash_inquiry_area" id="bookAndLifeBeforeLogin">
									<p>보유하신 북앤라이프 캐쉬(도서상품권) 내역 조회 후 사용이 가능합니다.</p>
									<button class="btnSmall wGray2" type="button" data-rel="layer" data-target="bookAndLifeLoginPop" id="bookAndLifeLoginPop_btn">조회</button>
								</div>
								<!--// 조회 전 -->
								<!-- 조회 후 -->
								<div class="cash_inquiry_area" id="bookAndLifeAfterLogin" style="display: none;">
									<input type="hidden" id="bookAndLifeOwnCash" value="" disabled="disabled">
									<p>
										고객님의 보유하신 북앤라이프 캐쉬는 <span class="cash_price"><span class="tx_num" id="bookAndLifeOwnCash_span"></span>원</span>입니다.
									</p>									
									<p class="tx_info">최종 결제금액을 확인하신 후, [결제하기] 버튼을 클릭하시면 결제가 완료됩니다.</p>
									<button class="btnSmall wGray2" type="button" id="bookAndLifeInquire_btn">다시 조회</button>
								</div>
								<!--// 조회 후 -->
								<ul class="info_dot_list type2">

									<li>도서상품권을 북앤라이프 캐쉬로 충전 후 사용하실 수 있습니다.</li>
									<li>북앤라이프 캐쉬 충전 및 사용내역은 북앤라이프 홈페이지에서 확인하실 수 있습니다.</li>
									<li>북앤라이프 캐쉬는 결제금액 전액으로만 사용이 가능합니다.</li>
								</ul>
							</div>
						</li>
						<!--// 도서상품권(북앤라이프 캐쉬) 선택 시 -->
						
						<!-- PAYCO 선택 시 2017-04-18 -->
						<li paymethod="25" style="display: none;">
							<div class="other_cash_box">
								<ul class="info_dot_list type2">

									<li>PAYCO는 NHN엔터테인먼트에서 제공하는 안전한 간편결제 서비스로 올리브영몰에서는 신용카드 결제가 가능합니다.</li>
									<li>신용카드 등록 시 휴대폰과 카드명의자가 동일해야합니다. (모든 신용/체크카드 가능)</li>
									<li>PAYCO로 결제 시, 제휴카드 할인(CJ카드, 임직원할인 포함)이 적용되지 않습니다.</li>
									<li>무이자할부는 PAYCO 결제창에서 확인하실 수 있습니다.</li>
								</ul>
							</div>
						</li>
						<!-- //PAYCO 선택 시 2017-04-18 -->
						<!-- KAKAOPAY 선택 시 2017-12-13 -->
						<li paymethod="26" style="display: none;">
							<div class="other_kakao_box">
								<ul class="info_dot_list type3">

	
		
			
				
					
						<p>카카오페이는 주식회사 카카오페이에서 제공하는 안전한 간편결제 서비스로 올리브영몰에서는 신용카드 결제가 가능합니다. </p><p>무이자할부는 카카오페이 모바일 결제창에서 선택하실 수 있습니다. </p><p>휴대폰과 카드명의자가 동일해야 결제 가능합니다.</p><p>카카오페이로 결제 시, 제휴카드 할인/적립(CJ카드, 임직원할인 포함)이 적용되지 않습니다.</p><p>결제 증빙내역은 카카오페이 홈페이지에서 확인 가능합니다.(카카오페이 홈 &gt; 설정 &gt; 결제내역)</p><p>카카오페이 고객센터 : 1644-7405</p>
					
				
			
		
	

								</ul>
							</div>
						</li>
						<!-- //KAKAOPAY 선택 시 2017-12-13 -->
						
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
							<span class="tx_cont"><span class="tx_num">24,700</span>원</span>
							<input type="hidden" name="goodsAmt" value="26000">
						</li>
						<li>
							<span class="tx_tit">쿠폰할인금액</span><!-- 2017-01-18 수정 : 문구수정 --> 
							<span class="tx_cont colorOrange"><span class="tx_num" id="totDscntAmt_span">0</span>원</span>
							<input type="hidden" name="descentAmt" value="1300">
							<input type="hidden" id="imdtDscntAmt" value="1300">
						</li>
						
						<li class="line_top2">
							<span class="tx_tit">총 배송비 <button type="button" class="btnSmall wGray" data-rel="layer" data-target="deliveryInfo" id="dlexAmtPopLayer_btn"><span>상세보기</span></button></span> 
							<span class="tx_cont"><span class="tx_num" id="dlexPayAmt_span">0</span>원</span>
							<input type="hidden" name="dlexPayAmt" value="0">
						</li>
						<li id="oyGiftCardAplyAmt_li" style="display: none;">
							<span class="tx_tit">올리브영 기프트카드</span> 
							<span class="tx_cont colorOrange"><span class="tx_num" id="oyGiftCardAplyAmt_span">0</span>원</span>
						</li>
						<li id="cjGiftCardAplyAmt_li" style="display: none;">
							<span class="tx_tit">CJ 기프트카드</span> 
							<span class="tx_cont colorOrange"><span class="tx_num" id="cjGiftCardAplyAmt_span">0</span>원</span>
						</li>
						<li>
							<span class="tx_tit"><span class="tx_num">CJ ONE</span> 포인트</span> 
							<span class="tx_cont colorOrange"><span class="tx_num" id="cjonePntAplyAmt_span">0</span>원</span>
						</li>
						<!-- 임직원일 경우 -->
						<li id="cafeteriaPntAplyAmt_li" style="display: none;">
							<span class="tx_tit">카페테리아 포인트</span> 
							<span class="tx_cont colorOrange"><span class="tx_num c" id="cafeteriaPntAplyAmt_span">0</span>원</span>
						</li>
						<!--// 임직원일 경우 -->
						<li id="csmnAplyAmt_li" style="display: none;">
							<span class="tx_tit">예치금</span> 
							<span class="tx_cont colorOrange"><span class="tx_num" id="csmnAplyAmt_span">0</span>원</span>
						</li>
						<li id="culturelandGiftAplyAmt_li" style="display: none;">
							<span class="tx_tit">컬쳐캐쉬</span> 
							<span class="tx_cont colorOrange"><span class="tx_num" id="culturelandGiftAplyAmt_span">0</span>원</span>
						</li>
						<li id="bookGiftAplyAmt_li" style="display: none;">
							<span class="tx_tit">북앤라이프캐쉬</span> 
							<span class="tx_cont colorOrange"><span class="tx_num" id="bookGiftAplyAmt_span">0</span>원</span>
						</li>
						<li class="total">
							<span class="tx_tit">최종 결제금액</span> 
							<span class="tx_cont"><span class="tx_num" id="totPayAmt_sum_span">24,700</span>원</span>
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
						<ul class="other_agree_cont">
							<li>
								<p class="tx_tit">주문 상품정보에 대한 동의</p>
								<p class="tx_cont2"><input type="checkbox" id="agree_1" name="agreeChk" value="" title="주문 상품정보 및 결제대행 서비스 이용약관에 동의해주세요."> <label for="agree_1">주문하실 상품, 가격, 배송정보, 할인내역등을 최종 확인하였으며, 구매에 동의합니다. <br>(전상거래법 제8조 제2항)</label></p> 
							</li>
							<li>
								<p class="tx_tit">결제대행 서비스 이용약관 동의</p>
								<p class="tx_cont">
									<input type="checkbox" id="agree_2_1" name="agreeChk" value="" title="전자금융거래 기본약관에 동의해주세요."> <label for="agree_2_1">전자금융거래 기본약관</label> 
									<button type="button" class="btnSmall wGray" onclick="javascript:forder.orderForm.openPopup(&#39;https://pay.cjsystems.co.kr/NewPayment/Apply/PGApply.htm&#39;,&#39;agree&#39;,400,500);"><span>약관보기</span></button>
								</p>
								<p class="tx_cont">
									<input type="checkbox" id="agree_2_2" name="agreeChk" value="" title="개인정보 수집 및 이용약관에 동의해주세요."> <label for="agree_2_2">개인정보 수집 및 이용 동의</label> 
									<button type="button" class="btnSmall wGray" onclick="javascript:forder.orderForm.openPopup(&#39;https://pay.cjsystems.co.kr/newpayment/apply/IDCollectApplyForOlive.htm&#39;,&#39;agree&#39;,400,500);"><span>약관보기</span></button>
								</p>
								<p class="tx_cont">
									<input type="checkbox" id="agree_2_3" name="agreeChk" value="" title="개인정보 제공 및 위탁약관에 동의해주세요."> <label for="agree_2_3">개인정보 제공 및 위탁 동의</label> 
									<button type="button" class="btnSmall wGray" onclick="javascript:forder.orderForm.openPopup(&#39;https://pay.cjsystems.co.kr/newpayment/apply/IDProvideApplyForOlive.htm&#39;,&#39;agree&#39;,400,500);"><span>약관보기</span></button>
								</p>
							</li>
						</ul>"WebContent/asset/css/buy.css"
					</div>
				</div>
				
			</div>
			<!--// 쿠폰 및 포인트, 결제수단, 결제정보 -->
			</form>

		</div>
		<!-- //#Contents -->
	</div>
	<!-- //#Container -->
<script type="text/javascript" src="./주문_결제 _ 올리브영_files/goods.js.다운로드" charset="utf-8"></script>
<script type="text/javascript" src="./주문_결제 _ 올리브영_files/order.js.다운로드"></script>
<script type="text/javascript">
$(document).ready(function() {

	// 페이지 만료 체크
    var checkExpire = function() {
        var state = window.history.state;
        
        // 결제 후 뒤로가기로 접근한 경우
        if(!!state && !!state.isExpire) {
            alert("이용이 만료된 페이지입니다.");
            document.location.replace(state.redirectUrl);
            return false;
            
        // url직접입력으로 접근한 경우
        } else if(false) {
            alert("정상적인 접근이 아닙니다.");
            document.location.replace(_baseUrl + "main/main.do");
            return false;
        }
       	return true;
    };
    
    // 페이지 만료 체크
    if(checkExpire()){
    	forder.orderForm.init();
		$(window).load(function() {
		    //최대할인 추천 세팅
		    forder.orderForm.coupon.autoSetCoupon(); 
		});
    }
    
    // 데이터 스토리 바인딩 20180905
    var wlogObjs = [
     	// 결제버튼
        {"selector" : "#btnPay", "wlogId" : "pay_button"}, 
        
        // 올리브영기프트카드
        {"selector" : ".btnGiftClick[data-target='OliveGiftInfo']", "wlogId" : "oygift_search"},
        {"selector" : "#oyGiftCard_btn", "wlogId" : "oygift_button"},
        {"selector" : "#oyGiftCardAplyAmt", "wlogId" : "oygift_input"},
        
        // CJ기프트카드
        {"selector" : ".btnGiftClick[data-target='CJGiftInfo']", "wlogId" : "cjgift_search"},
        {"selector" : "#cjGiftCard_btn", "wlogId" : "cjgift_button"},
        {"selector" : "#cjGiftCardAplyAmt", "wlogId" : "cjgift_input"},
        
        // CJONE 포인트
        {"selector" : "#cjonePnt_btn", "wlogId" : "cjone_button"},
        {"selector" : "#cjonePntAplyAmt", "wlogId" : "cjone_input"},
        
        // 카페테리아
        {"selector" : "#cafeteriaPnt_btn", "wlogId" : "cafe_button"},
        {"selector" : "#cafeteriaPntAplyAmt", "wlogId" : "cafe_input"},
        
        // 예치금
        {"selector" : "#csmnAplyAmt_btn", "wlogId" : "csmn_button"},
        {"selector" : "#csmnAplyAmt", "wlogId" : "csmn_input"},
        
        // 주결제수단
        {"selector" : "#payMethod_11", "wlogId" : "card_radio"}, // 신용카드
        {"selector" : "#payMethod_21", "wlogId" : "account_radio"}, // 계좌이체
        {"selector" : "#payMethod_61", "wlogId" : "cash_radio"}, // 무통장입금
        {"selector" : "#payMethod_22", "wlogId" : "mobile_radio"}, // 휴대폰결제
        {"selector" : "#payMethod_23", "wlogId" : "culture_radio"}, // 문화상품권
        {"selector" : "#payMethod_24", "wlogId" : "book_radio"}, // 도서상품권
        {"selector" : "#payMethod_25", "wlogId" : "payco_radio"}, // 페이코
        {"selector" : "#payMethod_26", "wlogId" : "kakao_radio"}  // 카카오페이
        
    ];
    
    $.each(wlogObjs, function(idx, wlogObj){
        $(wlogObj.selector).click(function(){common.wlog(wlogObj.wlogId);});
        
    });
    
});

</script>

<!-- 올리브영 기프트카드 팝업 -->
<div class="layer_pop_wrap w680" id="OliveGiftInfo" style="">
	<div class="layer_cont cjGiftcard">
		<h2 class="gift_title">나의 올리브영 기프트카드 <span class="total">총 <em class="tx_num" id="oyGiftQty">0</em>장</span></h2>
		<!--  -->
		<div class="gift_inner">
			<p class="total_price"><em class="tx_num" id="oyGiftAmt">0</em>원</p>
			<p class="link_div">
				<a href="https://www.cjone.com/cjmweb/cash/cashreg.do" class="link_01" target="_blank">기프트카드 등록</a>
				<a href="https://www.cjone.com/cjmweb/cash/cashmain.do" class="link_02" target="_blank"> 내 기프트카드 상세보기</a>
			</p>
			<div class="info_div">
				<ol>
					<li>CJ 기프트카드/ 올리브영 기프트카드만 사용이 가능합니다.</li>
					<li>기프트카드의 유효기간은 5년입니다.</li>
					<li>기프트카드의 잔액 환불은 최종 충전 후 합계 잔액의 60%이상을 사용한 경우에 한하여 신청이 가능합니다.</li>
					<li>기프트카드 관련 문의는 나이스정보통신 1644-9760,  올리브네트웍스 1577-8888로 연락주세요.<br>
						(상담시간 평일 09:00 - 18:00 / 토, 일, 공휴일 휴무)<br><br>
						<a href="http://www.ennice.co.kr/nonUser/refundVoucher.do#noback" class="link_03" target="_blank">환불신청하기</a>
					</li>
				</ol>
			</div>
		</div>
		<!--//  -->
		<button class="layer_close">창 닫기</button>
	</div>	
</div>
<!--// 올리브영 기프트카드 팝업 -->

<!-- CJ 기프트카드 팝업 -->
<div class="layer_pop_wrap w680" id="CJGiftInfo" style="">
	<div class="layer_cont cjGiftcard">
		<h2 class="gift_title">나의 <span class="tx_num">CJ</span> 기프트카드 <span class="total">총 <em class="tx_num" id="cjGiftQty">0</em>장</span></h2>
		<!--  -->
		<div class="gift_inner">
			<p class="total_price"><em class="tx_num" id="cjGiftAmt">0</em>원</p>
			<p class="link_div">
				<a href="https://www.cjone.com/cjmweb/cash/cashreg.do" class="link_01" target="_blank">기프트카드 등록</a>
				<a href="https://www.cjone.com/cjmweb/cash/cashmain.do" class="link_02" target="_blank"> 내 기프트카드 상세보기</a>
			</p>
			<div class="info_div">
				<ol>
					<li>CJ 기프트카드/ 올리브영 기프트카드만 사용이 가능합니다.</li>
					<li>기프트카드의 유효기간은 5년입니다.</li>
					<li>기프트카드의 잔액 환불은 최종 충전 후 합계 잔액의 60%이상을 사용한 경우에 한하여 신청이 가능합니다.</li>
					<li>기프트카드 관련 문의는 나이스정보통신 1644-9760,  올리브네트웍스 1577-8888로 연락주세요.<br>
						(상담시간 평일 09:00 - 18:00 / 토, 일, 공휴일 휴무)<br><br>
						<a href="http://www.ennice.co.kr/nonUser/refundVoucher.do#noback" class="link_03" target="_blank">환불신청하기</a>
					</li>
				</ol>
			</div>
		</div>
		<!--//  -->
		<button class="layer_close">창 닫기</button>
	</div>
</div>
<!--// CJ 기프트카드 팝업 -->

<!-- 안심번호 서비스 안내 팝업 -->
<div class="layer_pop_wrap w680" id="securityInfo" style="">
	<div class="layer_cont">
		<h2 class="layer_title">안심번호 서비스 안내</h2>
		<!-- 스크롤 영역 -->
		<div class="security_info">
			올리브영 고객님의 개인정보보호를 위해 상품 주문시 고객님의 휴대폰 및 전화번호를 1회성 임시번호<br>
			(050X-XXX-XXX)로 변환하여 사용하는 서비스입니다.<br>
			협력사 / 택배사에 050X 안심번호가 전달되므로 만일에 발생할 수 있는 개인정보 유출을 사전에<br>
			차단할 수 있습니다.<br>
			<br>
			단, 택배사를 통해서 배송되는 상품에 한해 서비스가 제공됩니다.<br>
			(일부 택배사의 경우 택배사 사정으로 서비스 지원이 불가할 수 있습니다.)
		</div>
		<!--// 스크롤 영역 -->
		<button class="layer_close">창 닫기</button>
	</div>	
</div>
<!--// 안심번호 서비스 안내 팝업 -->


<!-- 컬쳐랜드 로그인 팝업 -->
<div class="layer_pop_wrap w490" id="cultureLandLoginPop" style="">
	<div class="layer_cont">
		<h2 class="layer_title">컬쳐랜드 로그인</h2>
		<div class="loginArea">
			<div class="loginForm">
				<ul>
					<li>
						<input type="text" id="cultureLandLoginId" value="" title="아이디를 입력해 주세요." placeholder="아이디">
					</li>
					<li>
						<input type="password" id="cultureLandLoginPw" value="" title="비밀번호를 입력해 주세요." placeholder="비밀번호">
					</li>
				</ul>
				<div class="btnArea">
					<button type="button" class="btnGreen" id="cultureLandLogin_btn">로그인</button>
				</div>
				<div class="linkChk">
					<div class="link">
						<a href="https://www.cultureland.co.kr/customer/finduser/findID_main.asp" target="_blank">아이디 찾기</a>
						<a href="https://www.cultureland.co.kr/customer/finduser/findPW_main.asp" target="_blank">비밀번호 찾기</a>
					</div>
				</div>
				<p class="tx_login_info mgT10">컬쳐캐쉬를 사용하기 위해서는 컬쳐랜드 로그인이 필요합니다.</p>
			</div>			
		</div>
				
		<button type="button" class="layer_close" id="cultureLandLoginPop_close">창 닫기</button>
	</div>	
</div>
<!--// 컬쳐랜드 로그인 팝업 -->

<!-- 전자금융거래 기본약관 팝업 -->
<div class="layer_pop_wrap w490" id="bookAndLifeLoginPop" style="">
	<div class="layer_cont">
		<h2 class="layer_title">북앤라이프 로그인</h2>
		<div class="loginArea">
			<div class="loginForm">
				<ul>
					<li>
						<input type="text" id="bookAndLifeLoginId" value="" title="아이디를 입력해 주세요." placeholder="아이디">
					</li>
					<li>
						<input type="password" id="bookAndLifeLoginPw" value="" title="비밀번호를 입력해 주세요." placeholder="비밀번호">
					</li>
				</ul>
				<div class="btnArea">
					<button type="button" class="btnGreen" id="bookAndLifeLogin_btn">로그인</button>
				</div>
				<div class="linkChk">
					<div class="link">
						<a href="https://www.booknlife.com/hp/findId.do" target="_blank">아이디/비밀번호 찾기</a>
					</div>
				</div>
				<p class="tx_login_info mgT10">북앤라이프 캐쉬를 사용하기 위해서는 북앤라이프 로그인이 필요합니다.</p><!-- 2017-01-18 수정 : <br />삭제 -->
			</div>			
		</div>
				
		<button type="button" class="layer_close" id="bookAndLifeLoginPop_close">창 닫기</button>
	</div>	
</div>
<!--// 전자금융거래 기본약관 팝업 -->

<!-- 현대카드 M포인트 사용안내 팝업 -->
<div class="layer_pop_wrap w650" id="mHPointInfo" style="">
	<div class="layer_cont">
		<h2 class="layer_title" id="pntInfoMsgLayerTitle"></h2>
		<div class="mhy_point" id="pntInfoMsgLayer"></div>
		<button type="button" class="layer_close">창 닫기</button>
	</div>	
</div>
<!--// 현대카드 M포인트 사용안내 팝업 -->

<!-- 배송비 상세정보 안내 팝업 -->
<div class="layer_pop_wrap w410" id="deliveryInfo" style="">
	<div class="layer_cont" id="getDlexDtlPopAjax">

   



























		<h2 class="layer_title">배송비 상세정보</h2>
		
		<!-- 스크롤 영역 -->
		<div class="layer_scroll_box type2 mgT20">
			


			<h3 class="layer_sub_title">올리브영 배송상품</h3>
			<ul class="delivery_info_list" id="hdDlexList">
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
			
			
				
			
		
		
		
		
		
		
			
				
				
					
				<li type="base" entrno="0" dlexcpnyn="N">
					<div>
						<span class="tx_tit">일반상품 배송비</span> 
						<input type="hidden" name="dlexAmt" value="0" orgvalue="0" targetid="0_0" disabled="disabled">
						<span class="tx_cont">
							<span class="tx_num" id="dlexAmt_hd_base">0</span>원
						</span>
					</div>
				
					<div class="add_cont">
						<span class="tx_tit">기본 배송비</span> 
						<span class="tx_cont">
							<span class="tx_num" id="0_0">0</span>원
				    
				    	
				    		
							
				    	
				    	
					
						</span>
						
					</div>
					
				
					
					
				
				
				</li>
				
			
			
			
		
		
			
		
		
				<li class="total">
					<div>
						<span class="tx_tit">총 배송비</span>
						<span class="tx_cont">
							<span class="tx_num" id="totDlexAmt_hd_span">0</span>원
							<br>
							<span type="coupon" entrno="0" style="display: none;">(무료배송 쿠폰/도서산간배송비 적용 제외)</span>
						</span>
					</div>
				</li>
			</ul>
			<!--// 올리브영 배송상품 배송비 목록 -->



		</div>
		<!--// 스크롤 영역 -->
		
		<div class="total_delivery_price">
			<span class="tx_tit">합계</span> 
			<span class="tx_cont"><span class="tx_num" id="totDlexAmt_span">0</span>원</span>
		</div>
		<input type="hidden" id="totDlexAmt_hd" value="0">
		<input type="hidden" id="totDlexAmt_entr" value="0">
		<input type="hidden" id="totDlexAmt" value="0">
		<button class="layer_close">창 닫기</button>




</div>	
</div>
<!--// 배송비 상세정보 안내 팝업 -->

<!-- 전자금융거래 기본약관 팝업 -->
<div class="layer_pop_wrap w650" id="eCommerceTerm">
	<div class="layer_cont">
		<h2 class="layer_title">전자금융거래 기본약관</h2>
		
		<div class="term_scroll_box">
		<!-- 약관내용이 들어갑니다. -->
		</div>
		<div class="layer_btn_area">
			<button type="button" class="btnMedium fullGreen"><span>확인</span></button>
		</div>
		<button type="button" class="layer_close">창 닫기</button>
	</div>	
</div>
<!--// 전자금융거래 기본약관 팝업 -->
<!-- 개인정보 수집 및 이용동의 팝업 -->
<div class="layer_pop_wrap w650" id="personalTerm">
	<div class="layer_cont">
		<h2 class="layer_title">개인정보 수집 및 이용동의</h2>
		
		<div class="term_scroll_box">
		<!-- 약관내용이 들어갑니다. -->
		</div>
		<div class="layer_btn_area">
			<button type="button" class="btnMedium fullGreen"><span>확인</span></button>
		</div>
		<button type="button" class="layer_close">창 닫기</button>
	</div>	
</div>
<!--// 개인정보 수집 및 이용동의 팝업 -->
<!-- 개인정보 제공 및 위탁동의 팝업 -->
<div class="layer_pop_wrap w650" id="provideTerm">
	<div class="layer_cont">
		<h2 class="layer_title">개인정보 제공 및 위탁동의</h2>
		
		<div class="term_scroll_box">
		<!-- 약관내용이 들어갑니다. -->
		</div>
		<div class="layer_btn_area">
			<button type="button" class="btnMedium fullGreen"><span>확인</span></button>
		</div>
		<button type="button" class="layer_close">창 닫기</button>
	</div>	
</div>
<!--// 개인정보 제공 및 위탁동의 팝업 -->
<!-- 증정품 팝업 -->
<div class="layer_pop_wrap" id="PresentPopup" style="width:700px;margin-left:-350px;">
	<div class="layer_cont">
		<div class="pad30">
			<h2 class="layer_title">증정품 확인</h2>
			<!-- 스크롤 영역 -->
			<div class="layer_scroll_box type2">
				<div class="PresentPopup" id="getGiftListAjax">

   











<!-- 필수 증정품 -->

				<div class="order_title">
					<span class="tx_order_info">구매조건에 따라 아래 증정품을 받으실 수 있습니다.</span>
				</div>
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
			
			
			
			
				
			
			
			
			
			
			
			
		
		
			
			
				
			
			
			
		
				<div class="sub-title-basket">
					<p>유세린 제품 1개 이상 구매시</p>
				</div>
				<ul class="gift_list">
		
			
			
			
					<li>
						<div for="G000000002917" class="gift_box">
							<input type="radio" id="G000000002917" class="input-radio" name="G000000002917" dupprstpsbyn="Y" goodsno="F000000126817" aeevtno="G000000002917" drtpuryn="" prstqty="0" style="display: none;" disabled="disabled">
							<span class="img">
								<img src="./주문_결제 _ 올리브영_files/img_default_gift.png" alt="증정품 이미지">
			
								<span>일시품절</span>
			
							</span>
							유세린 전구매고객 엘라스티시티 나이트 크림 5ml*3 증정
							<div class="qty"><em class="tit">수량</em><em>1</em>개</div>
						
					</div></li>
		
				</ul>
	

<!-- //필수 증정품 -->
<!-- 선택 증정품 -->

<!-- //선택 증정품 -->
				<input type="hidden" id="giftCnt" value="1">
				<input type="hidden" id="giftYn" value="N">




</div>
			</div>
			<!--// 스크롤 영역 -->
			<div class="order_btn_area">
				<button class="btnGray" id="btnClose">이전</button> <button class="btnGreen" id="btnSubmit">확인</button>
			</div>
		</div>
		<dl class="info_dot_list">
			<dt>이용안내</dt>
			<dd>증정품은 최종 결제금액 기준으로 제공됩니다.</dd>
			<dd>본 행사는 온라인몰 단독 행사로 매장 행사와 상이할 수 있습니다.</dd>
			<dd>증정품은 판매 상품과 별개로 한정 운영되며 조기 소진될 수 있습니다.</dd>
			<dd>고객님의 정확한 증정품 내역은 주문 후 '주문상세내역'에서 확인해주세요.</dd>
			<dd>반품 시 증정품도 함께 반품해주셔야 합니다.</dd>
		</dl>
		<button class="layer_close">창 닫기</button>
	</div>
</div>
<!-- //증정품 팝업 -->

<!--// 당일배송 서비스 안내 -->


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