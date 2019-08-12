<%@page import="member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<%
	//MemberInfoAction에서 넘긴 회원정보를 추출한다.
	MemberDTO member=(MemberDTO)request.getAttribute("id");
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

<link rel="stylesheet" href="../asset/css/board.css" />
<link rel="stylesheet" href="../asset/css/global.css" />
<link rel="stylesheet" href="../asset/css/contents.css" />
<script type="text/javascript" src="../asset/js/jquery-1.9.1.min.js"></script>

<script type="text/javascript" src="../asset/js/slick.min.js"></script>
<script type="text/javascript" src="../asset/js/common.js"></script>
</head>
<body>
<div id="Wrapper">


	<jsp:include page="../myPage/mypage_topMenu.jsp" />

	<!-- 회원정보 수정 -->
	<!-- 입력한 값을 전송하기 위해 form 태그를 사용한다 -->
	<!-- 값(파라미터) 전송은 POST 방식 -->
		<form action="MemberModifyAction.do" method="post" name="form">
		
		<fieldset>
		<legend>회원 수정 정보</legend>
		<label>아이디 : </label>
			
		</fieldset>
	
		
		</form>

			<!-- 회원정보 수정끝 -->
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
		
		

</body>	
</html>