<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
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
<script type="text/javascript">
		// 비밀번호 미입력시 경고창
		function checkValue(){
			if(!document.deleteform.password.value){
				alert("비밀번호를 입력하지 않았습니다.");
				return false;
			}
		}
	</script>          
            


<script src="https://www.oliveyoung.co.kr/pc-static-root/js/mypage/mypage.header.js?dumm=2019080833432"></script>
<script>
   $(window).ready(function(){
       mypage.header.init();
   });
</script>  




   <div class="title-area">
      <h2 class="tit">회원탈퇴</h2>
   </div>

   <p class="common3s-text"><strong>회원 탈퇴(이용약관 동의 철회)시 아래 내용을 확인해주세요.</strong></p>

   <ul class="secess-area">
      <li>올리브영 이용약관 동의 철회 시 고객님께서 보유하셨던 쿠폰은 모두 삭제되며, 재가입 시 복원이 불가능합니다.</li>
      <li>올리브영 이용약관 동의 철회 시에는 올리브영 서비스만 이용할 수 없게 되며, CJ ONE 웹사이트를 포함한 다른 CJ ONE 제휴 브랜드의 웹사이트 서비스는 이용하실 수 있습니다.</li>
      <li>올리브영 이용약관 동의 철회 시에도 CJ ONE 멤버십 서비스 및 타 제휴 브랜드의 이용을 위해 회원님의 개인정보 및 거래정보는 CJ ONE 회원 탈퇴 시까지 보존됩니다.</li>
      <li>올리브영 이용약관 동의를 철회한 후에라도 해당 약관에 다시 동의하시면 서비스를 이용할 수 있습니다.</li>
      <li>진행 중인 전자상거래 이용내역(결제/배송/교환/반품 중인 상태)이 있거나 고객상담 및 이용하신 서비스가 완료되지 않은 경우 서비스 철회 하실 수 없습니다.</li>
   </ul>
	
	
	
	<form name="deleteform" method="post" action="./MemberDeleteAction.do"
			onsubmit="return checkValue()">
		
			<table align="center">
				<tr>
					<td>회원 탈퇴를 하실려면 아래에 비밀번호를 입력해주세요</td>
				</tr>
				<tr>
					<td><input type="password" name="password" maxlength="50" border="2"></td>
				</tr>
			</table>
			<br> 
			<input type="button" value="취소" onclick="javascript:window.location='Main.do'">
			<input type="submit" value="탈퇴" /> 
	</form>
	
	
	



         </div>
      </div>
      
   </div>
   

   <script>
      $(document).ready(function() {
          common.gnb.initMypageMenu(); 
      });
   </script>

               <!-- CJ ONE 시스템점검 알림 Alert -->

               <script
                  src="https://www.oliveyoung.co.kr/pc-static-root/js/mypage/coupon.js?dumm=2019080133412"></script>
               <script>
                  $(window).ready(function() {
                     mypage.coupon.list.init();
                  });
               </script>


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
