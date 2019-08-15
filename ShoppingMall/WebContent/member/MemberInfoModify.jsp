<%@page import="net.member.db.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<%
	// MemberInfoAction에서 넘긴 회원정보를 추출한다.
	MemberDTO member=(MemberDTO)request.getAttribute("join");
%>

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
<title>#</title>

<link rel="stylesheet" href="./asset/css/board.css" />
<link rel="stylesheet" href="./asset/css/global.css" />
<link rel="stylesheet" href="./asset/css/contents.css" />
<script type="text/javascript" src="./asset/js/jquery-1.9.1.min.js"></script>

<script language="javascript">
// opener관련 오류가 발생하는 경우 아래 주석을 해지하고, 사용자의 도메인정보를 입력합니다. ("팝업API 호출 소스"도 동일하게 적용시켜야 합니다.)
//document.domain = "abc.go.kr";
function goPopup(){
   // 주소검색을 수행할 팝업 페이지를 호출합니다.
   // 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
   var pop = window.open("./popup/jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
   
   // 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
    //var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
}

function jusoCallBack(roadAddrPart1,addrDetail){
   // 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
   document.form.roadAddrPart1.value = roadAddrPart1;
   document.form.addrDetail.value = addrDetail;
   
}

</script>
<script type="text/javascript" src="./asset/js/slick.min.js"></script>
<script type="text/javascript" src="./asset/js/common.js"></script>
</head>
<body>
	<div id="Wrapper">

		<div id="Container">
			<div id="Contents">

				<jsp:include page="../myPage/mypage_topMenu.jsp" />

				<div class="mypage-conts">
					<script
						src="https://www.oliveyoung.co.kr/pc-static-root/js/mypage/mypage.header.js?dumm=2019080133412"></script>
					<script>
						$(window).ready(function() {
							mypage.header.init();
						});
					</script>


<!-- 입력한 값을 전송하기 위해 form 태그를 사용한다 -->
		<!-- 값(파라미터) 전송은 POST 방식 -->
		<form method="post" action="MemberModifyAction.do" 
				 name="form" onsubmit="return checkValue()">
				
		<fieldset>
				<legend>회원 정보 수정</legend>
				<label>ID</label>
					<input type="text" name="id" value="${id}" maxlength="20" required readonly><br>
				<label>비밀번호</label>
					<input type="password" value="${password}" name="password" id="pass" required><br>
				<label>비밀번호 확인</label>
					<input type="password" value="${password}" name="password2" id="pass2" onblur="join_check('pass2')" required>
					<div class="check_font" id="passMessage"></div>
				<label>이메일</label>
					<input type="email" name="email" value="${email}" id="email" onblur="join_check('email')" required><br>
					<div class="check_font" id="emailMessage"></div>
				<label>주소</label>
					<input type="button" onClick="goPopup();" value="팝업_domainChk"/>
            	<div id="list"></div>
            	<div id="callBackDiv">
            		<input type="text"  style="width:250px;" id="roadAddrPart1" value="${address_main}" name="address_main" class="form-control" style="width:500px;" placeholder="Enter Addr" required="true" readonly="true" /><br>
            		<input type="text"  style="width:250px;" id="addrDetail"  value="${address_detail}" name="address_detail" />
            	</div>
				<label>휴대전화 번호 *</label>
					<select name = "phone1" id="phone1">
		              <option value="010">010</option>
		              <option value="011">011</option>
		              <option value="019">019</option>
		         	</select> - 
		         	<input type = "text" name = "phone2" id="phone2" maxlength="4" size = "5" required/> - 
		          	<input type = "text" name = "phone3" id="phone3" maxlength="4" size = "5" onblur="join_check('check')" required/><br>
		          	<div class="check_font" id="phoneMessage"></div>
				</fieldset>
			<br><br>
			<input type="button" value="취소" onclick="javascript:window.location='Main.do'">
			<input type="submit" value="수정"/>  
		</form>


				</div>
			</div>

		</div>

		<script type="text/javascript"
			src="https://www.oliveyoung.co.kr/pc-static-root/js/mypage/myorder.js?dumm=2019080133412"></script>
		<script type="text/javascript"
			src="https://www.oliveyoung.co.kr/pc-static-root/js/mypage/gdas.js?dumm=2019080133412"></script>
		<script>
			HDC_PATH = $
					.parseJSON('{"00":"http://nexs.cjgls.com/web/service02_01.jsp?slipno=","10":"http://www.hanjinexpress.hanjin.net/customer/plsql/hddcw07.result?wbl_num=","20":"http://www.lotteglogis.com/personalService/tracking/06/tracking_goods_result.jsp?InvNo=","30":"http://nexs.cjgls.com/web/detail.jsp?slipno=","50":"http://service.epost.go.kr/trace.RetrieveRegiPrclDeliv.postal?sid1=","70":"http://www.ilogen.com/d2d/delivery/invoice_search_popup.jsp?viewType=type2&invoiceNum=","91":"http://www.kglogis.co.kr/delivery/delivery_result.jsp?item_no=","92":"http://www.kglogis.co.kr/delivery/delivery_result.jsp?item_no=","93":"http://kdexp.com/basicNewDelivery.kd?barcode=","94":null,"200":"http://service.epost.go.kr/trace.RetrieveEmsRigiTraceList.comm?POST_CODE=","210":"http://www.dhl.co.kr/content/kr/ko/express/tracking.shtml?brand=DHL&AWB="}');

			$(document).ready(function() {
				mypage.orderList.init();
			});
		</script>
		
		
	</div>
</body>	
</html>