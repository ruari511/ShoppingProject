<%@page import="net.member.db.MemberDAO"%>
<%@page import="net.member.db.MemberDTO"%>
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
<%
	//MemberInfoAction에서 넘긴 회원정보를 추출한다.
	MemberDTO member=(MemberDTO)request.getAttribute("id");

%>
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
		<form method="post" action="MemberModifyAction.do" name="form" onsubmit="return checkValue()">
				
		<div>
		<%-- <c:set var="token" value="${memberInfo.phone}" />
		<c:forTokens var="list" items="${token}" delims="-">
		${list }<br>
		</c:forTokens> --%>
				<h3 class="join_title">
				<label for="id">아이디</label>
				</h3>
					<input type="text" name="id" class="join" id="id" value="${id}" onblur="join_check('check')" readonly/>
					<div class="check_font" id="idMessage"></div>
				</div>

				<div>
				<h3 class="join_title">
				<label for="pass">비밀번호</label>
				</h3>
					<input type="password" name="password" class="join" id="pass" required><br>
				</div>
				
				
				<div>
				<h3 class="join_title">
				<label for="pass2">비밀번호 확인</label>
				</h3>
					<input type="password" name="password2" class="join" id="pass2" onblur="join_check('pass2')" required>
					<div class="check_font" id="passMessage"></div>
				</div>

				
				<div>
				<h3 class="join_title">
				<label for="name">이름</label>
				</h3>
					<input type="text" name="name" class="join" id="name" value="${memberInfo.name}" onblur="join_check('name')" required readonly>
					<div class="check_font" id="nameMessage"></div>
				</div>
				
				<div>
				<h3 class="join_title">
				<label for="birth">생년월일</label>
				</h3>
					<input type="text" name="birth_date" class="join" id="birth" value="${memberInfo.birth_date}" onblur="join_check('birth')" required readonly>
					<div class="check_font" id="birthMessage"></div>
				</div>
				
				<div>
				<h3 class="join_title">
				<label for="email">이메일</label>
				</h3>
					<input type="email" name="email" class="join" id="email" value="${memberInfo.email}" onblur="join_check('email')" required><br>
					<div class="check_font" id="emailMessage"></div>
				</div>
				
				<div>
				<h3 class="join_title">
				<label onClick="goPopup();">주소</label>
				</h3>
            	<div id="callBackDiv">
            		<div class="ad"><input type="text" class="join" id="roadAddrPart1" name="address_main" value="${memberInfo.address_main}" class="form-control" placeholder="Enter Addr" required="true" readonly="true" />
            		<input type="button" onClick="goPopup();" value="주소 찾기" class="adbtn"/></div><br>
            		<input type="text" class="join" id="addrDetail" name="address_detail" value="${memberInfo.address_detail}" /><br>
            	</div>
            	</div>
            	
				<div>	
				<h3 class="join_title">
				<label for="phone2">휴대전화 번호 *</label>
				</h3>
				<!-- <span class="sp" >
					<select name = "phone1" id="phone1"  class="join" >
		              <option value="010">010</option>
		              <option value="011">011</option>
		              <option value="019">019</option>
		         	</select> - 
		         	<input type = "text" name = "phone2" id="phone2" maxlength="4" size = "5" required/> - 
		          	<input type = "text" name = "phone3" id="phone3" maxlength="4" size = "5" onblur="join_check('check')" required/><br>
		        </span> -->
		        <input type ="text" name = "phone" value="${memberInfo.phone}" id="phone" size = "15" required/> - 
		          	<div class="check_font" id="phoneMessage"></div>
				</div>
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
<script type="text/javascript">
	function join_check(aa){
		var _id = $("#id").val();
		
		var _pass = $("#pass").val();
		var _pass2 = $("#pass2").val();
		
		var _name = $("#name").val();
		var chkName= /^[가-힣]{2,4}$/;
		
		var _email = $("#email").val();
		var chkEmail = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
		
		var _phone = $("#phone1").val()+"-"+$("#phone2").val()+"-"+$("#phone3").val()
		
		var now = new Date();
		var yearNow = now.getFullYear();
		var _birth = $("#birth").val();
		
		if(aa == 'check'){
			// ajax 아이디 중복 체크
			$.ajax(
					{
						url:"http://localhost:8090/ShoppingMall/Check",
						type:"post",
						async:false,
						data:{id:_id, phone:_phone},
						dataType:"text",
						success:function(data,textStatus){
							// 아이디 체크
							if(data == 23 ){ // 폰번호 중복 x
								$("#phoneMessage").text("이미 가입된 번호입니다.");
								$("#phoneMessage").css("color","red");
								$(".submit").attr("disabled",true);
							}else if(data == 24 ){ // 아이디 중복 x, 폰번호 중복 x
								$("#phoneMessage").text("");
								$(".submit").attr("disabled",false);
							}	
						},
						error:function(request,status,error){ //작업중 오류가 발생했을 경우에 수행할 작업을 설정 합니다.
							alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리

					 }
				}); // ajax 메소드 끝
		}else if(aa == 'pass2'){
			// 비밀번호 체크
			alert(_pass + "///" + _pass2);
			if(_pass != _pass2 ){
				$("#passMessage").text("비밀번호가 일치하지 않습니다.");
				$("#passMessage").css("color","red");
				$(".submit").attr("disabled",true);
			}else if(_pass.length < 4 || _pass2.length < 4){
				$("#passMessage").text("비밀번호 4자리 이상 입력해주세요");
				$("#passMessage").css("color","red");
				$(".submit").attr("disabled",true);
			}else{ 
				$("#passMessage").text("비밀번호가 일치합니다.");
				$("#passMessage").css("color","blue");
				$(".submit").attr("disabled",false);
			}
		}else if(aa == "email"){
			if(!chkEmail.test(_email)){
				$("#emailMessage").text("메일을 정확히 입력해주세요");
				$("#emailMessage").css("color","red");
				$(".submit").attr("disabled",true);
			}else{
				$("#emailMessage").text("");
				$(".submit").attr("disabled",false);
			}
		
		}
	}
</script>
</html>