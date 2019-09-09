<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
	.cardSection{
		width: 100%;
		height: 40px;
		background-color: #8fffba;
    	margin-top: 8px;
	}
	span{
		width: 70px;
		float: left;
		margin-left: 15px;
		padding: 8px;
	}
	.cardIn{
		width: 300px;
		float: right;
		margin-right: 30px;
		padding: 4px;
	}
	button {
		width: 100%;
   		padding: 17px 0 15px;
	   	margin: 10px 0;
	    border-radius: 5px;
    	font-size: 18px;
    	color: #fff;
    	background: #199468;
    	line-height: 18px;
	}
	input{
		height: 25px;
	}

</style>
<title>카드결제창</title>
<script type="text/javascript">
	
	
	function ain11() {
		
		var cardNum = document.getElementById("cardNum1").value + "-" + document.getElementById("cardNum2").value + "-" + document.getElementById("cardNum3").value + "-" + document.getElementById("cardNum4").value;
		var cardDate = document.getElementById("cardDate1").value + "/" + document.getElementById("cardDate2").value;
		var cardCvc = document.getElementById("cardCvc").value;
		var cardPass = document.getElementById("cardPass").value;
		
		opener.document.getElementById("cardNum").value = cardNum;
		opener.document.getElementById("cardDate").value = cardDate;
		opener.document.getElementById("cardCvc").value = cardCvc;
		opener.document.getElementById("cardPass").value = cardPass;
		
		opener.document.getElementById("btnPay").click();
/* 	    window.opener.name = "parentPage"; // 부모창의 이름 설정

	    document.Bform.target = "parentPage"; // 타켓을 부모창으로 설정

	    document.Bform.action = "./BuyListInsert.buy";  //부모창에 호출될 url 
		
	    document.Bform.submit(); */

	    self.close();
	}

</script>
</head>
<body>
<form name="Bform" onsubmit="ain11();" method="post">
<input type="hidden" id="success" value="0">
<div class="cardSection">
	<span>카드번호</span>
	<div class="cardIn">
		<input type="text" id= "cardNum1" name="cardNum1" maxlength="4" size="5">-<input type="text" id= "cardNum2" name="cardNum2" maxlength="4" size="5">-
		<input type="text" id= "cardNum3" name="cardNum3" maxlength="4" size="5">-<input type="password" id= "cardNum4" name="cardNum4" maxlength="4" size="5">
	</div>
</div>
<div class="cardSection">
	<span>유효기간 </span>
	<div class="cardIn">
		<input type="text" id= "cardDate1" name="cardDate1" maxlength="2" style="width:50px;">월<input type="text" id= "cardDate2" name="cardDate2" maxlength="2" style="width:50px;">년
	</div>
</div>
<div class="cardSection">
	<span>cvc번호</span>
	<div class="cardIn">
		<input type="password" id= "cardCvc" name="cardCvc" maxlength="3" size="4" style="width:70px;">
	</div>
</div>
<div class="cardSection">
	<span>비밀번호</span>
	<div class="cardIn">
		<input type="password" id= "cardPass" name="cardPass" maxlength="4" size="5" style="width:100px;">
	</div>
</div>
<button type="submit">결제하기</button>
</form>
</body>
</html>