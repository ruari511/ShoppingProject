<%@page import="net.product.db.ProductDTO"%>
<%@page import="net.cart.db.CartDAO"%>
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
<link rel="stylesheet" href="./asset/css/global.css"/> 
<link rel="stylesheet" href="./asset/css/cart.css"/> 
	<script type="text/javascript" src="./asset/js/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="./asset/js/slick.min.js"></script>
	<script type="text/javascript" src="./asset/js/common.js"></script>
<%int num = Integer.parseInt(request.getParameter("num")); %>
<script>

	window.onload = function(){
	
	check();
		
	var productcount = document.getElementsByName("productcount");
	var productsel = document.getElementsByName("s_amount");
	var product_op;
	
	for(var i=0; i<productcount.length; i++){
		for(var j=0; j<productsel[i].options.length; j++){
			if(productcount[i].value == productsel[i].options[j].value){
				product_op = j;
			}
		}
		productsel[i].selectedIndex = product_op;
	}
}
	
	function check() {
		var num = <%=num%>;
		if(num==1){
			alert("수량 변경 실패");
		} else if(num==2){
			alert("수량 변경 완료");
		} else if(num==3){
			alert("삭제 실패");
		} else if(num==4){
			alert("삭제 완료");
		}
		
	}
	
	function count_change(a, idx) {
		
		document.getElementsByName("updatecount")[idx].value = a.value;
	}


function checkAll(bool) {
 var all_input = document.getElementsByTagName("input");
 for(var i=0;i<all_input.length;i++) {
  if(all_input[i].type == "checkbox")
   all_input[i].checked = bool;
 }
 
}

function updateCart(idx) {
	
	var updatecount = document.getElementsByName("updatecount")[idx].value;
	
	var updatecartnum = document.getElementsByName("updatecartnum")[idx].value;
	
	location.href="CartUpdateController.do?cart_num=" + updatecartnum + "&count=" + updatecount;
}

function deleteCart(idx) {
	
	var updatecartnum = document.getElementsByName("updatecartnum")[idx].value;
	
	location.href="CartDeleteController.do?cart_num=" + updatecartnum;
}
	
</script>
</head>
<body>
<div id="Wrapper">
	<div id="skip_navi"><a href="#Container">본문바로가기</a></div>
	
	<!-- header -->
	<jsp:include page="./include/Header.jsp"/>
	<!-- header// -->
					
	<div id="Container">
		<div id="Contents">
			<!-- title_box -->
			<div class="title_box">
				<h1>장바구니<span class="tx_num">1</span></h1>
				<ul class="step_list">
					<li class="on"><span class="step_num tx_num">1</span> 장바구니</li>
					<li><span class="step_num tx_num">2</span> 주문/결제</li>
					<li class="last"><span class="step_num tx_num">3 </span> 주문완료</li>
				</ul>
			</div>
			<!--// title_box -->
			<c:set var="member" value="${requestScope.m}" />
			<!-- membership_box -->
			<div class="membership_box  iconGrade4">		 
				<p class="tx_grade_info"><strong>${member.name}</strong>님의 멤버십 등급은 <span class="grade">${member.grade}</span>입니다. </p>
				<ul class="membership_info_list">
					<li><a class="grade_benefit"><span>등급혜택</span></a></li>
					<li><a><strong>포인트</strong> 
					<span class="own_point"><span class="tx_num">${member.point}</span>P</span></a></li>
					<li><a><strong>할인쿠폰</strong> <span class="own_point"><span class="tx_num">0</span>개</span></a></li>
					<li><a><strong>예치금</strong> <span class="own_point"><span class="tx_num">0</span>원</span></a></li>
				</ul>
			</div>
			<h2 class="sub-title2">
						올리브영 배송상품
			</h2>	
			<form action="CartBuyController.do" method="post">		
			<table class="tbl_prd_list tableFix">
				<caption>올리브영 배송상품 장바구니 목록</caption>
				<colgroup>
					<col style="width:40px">
					<col style="width:*">
					<col style="width:110px">
					<col style="width:100px">
					<col style="width:110px">					
					<col style="width:120px">
					<col style="width:150px">
				</colgroup>
				<thead>
				<tr>
					<th scope="col"><input type="checkbox" checked="checked" onclick="checkAll(this.checked)"></th>
					<th scope="col">상품정보</th>
					<th scope="col">판매가</th>
					<th scope="col">수량</th>
					<th scope="col">구매가</th>					
					<th scope="col">배송정보</th>
					<th scope="col">선택</th>					
				</tr>
				</thead>
				<tbody>
<c:forEach var="cartlist"  items="${requestScope.v}" varStatus="idx">
	<c:set var="sum" value="${sum = sum + cartlist.product_price*cartlist.product_count}"/>
	<c:set var="discount" value="${discount = discount + cartlist.discount*cartlist.product_count}" />
	<fmt:parseNumber var= "pages" integerOnly= "true" value= "${discount}" />
	<fmt:parseNumber var= "dis" integerOnly= "true" value= "${cartlist.discount*cartlist.product_count}" />
	<input type="hidden" name="productcount" value="${cartlist.product_count}" />
	<tr>
		<td colspan="7">
			<div class="tbl_cont_area">		
				<div class="tbl_cell w40">
					<input type="checkbox" checked="checked" name="cart" class="chkSmall" value="${cartlist.cart_num}">
				</div>	
				<div class="tbl_cell w390">
					<div class="prd_info">
						<a class="prd_img" href="">	<img class="completed-seq-lazyload" src=""></a>
						<a class="prd_name" href="">
							<span id="brandNm">${cartlist.brand}</span>
							<p>${cartlist.product_name}</p>
						</a>
					</div>
				</div>
				<div class="tbl_cell w110">
					<span class="cur_price"><span class="tx_num">${cartlist.product_price}</span>원</span>
				</div>
				<div class="tbl_cell w100">
					<div class="prd_cnt">
						<select class="amount" name="s_amount" id="productsel" onchange="count_change(this, ${idx.index});">
							<option value="1">1</option>
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
					<input type="hidden" name="updatecount" value="${cartlist.product_count}">
					<input type="hidden" name="updatecartnum" value="${cartlist.cart_num}">
					<button type="button" class="btnSmall wGray" name="btnQtyMod" onclick="updateCart(${idx.index})"><span>변경</span></button>
				</div>
				<div class="tbl_cell w110">
					<span class="org_price">
					<span class="tx_num">${cartlist.product_price*cartlist.product_count}</span>원
					</span>
					<span class="pur_price"><span class="tx_num">${cartlist.product_price*cartlist.product_count-dis}</span>원</span>
				</div>
				<div class="tbl_cell w120  ">
					<p class="prd_delivery">
						<strong id="deliStrongText">배송료1000</strong>
					</p>
				</div>
				<div class="tbl_cell w150">
					<div class="btn_group">
						<button type="button" class="btnSmall wGreen" name="btn_buy"><span>바로구매</span></button>
						<button type="button" class="btnSmall wGray delete" name="btnDelete" onclick="deleteCart(${idx.index})"><span>삭제</span></button><!-- 버튼 공간(스페이스바)없이 붙여주세요. -->
					</div>
				</div>				
			</div>
		</td>
	</tr>	
	
</c:forEach>
</tbody>
</table>
		
			<!--// 올리브영 배송상품 -->
			<!-- 올리브영 배송상품 결제금액 -->
			<div class="basket_price_info">
				<div class="btn_area">
					<button type="button" class="btnSmall wGray type2" id="partDelBtn1" name="partDelBtn"><span>선택상품 삭제</span></button> 
					<button type="button" class="btnSmall wGray type2" id="soldOutDelBtn1" name="soldOutDelBtn"><span>품절상품 삭제</span></button>
				</div>
				<div class="sum_price">
				총 판매가 <span class="tx_num">${sum}</span>원 <span class="tx_sign minus">-</span>
				 총 할인금액 <span class="tx_num">${pages}</span>원 <span class="tx_sign plus">+</span>
				  배송비 <span class="tx_num">0</span>원 <span class="tx_sign equal">=</span> <span class="tx_total_price">
				  총 결제금액 <span class="tx_price"><span class="tx_num">${sum-pages}</span>원</span></span>
				  </div>
			</div>
			<!--// 올리브영 배송상품 결제금액 -->

			<div class="total_price_info">
				<div class="detail_price">
					<p>총 판매가<span><span class="tx_num">${sum}</span>원</span></p>
					<span class="tx_sign2 minus">-</span>
					<p class="tx_sale">총 할인금액<span><span class="tx_num">${pages}</span>원</span></p>
					<span class="tx_sign2 plus">+</span>
					<p>배송비 <span><span class="tx_num">0</span>원</span></p>
				</div>
				<div class="sum_price">
					<span class="tx_text">배송비는 쿠폰할인금액에 따라 변경될 수 있습니다.</span>
					총 결제예상금액 <span class="tx_price"><span class="tx_num">${sum-pages}</span>원</span>
				</div>	
			</div>
		
			<div class="order_btn_area order_cart">
				<button type="submit" class="btnOrangeW" name="partOrderBtn">선택주문</button>
				<button type="button" class="btnOrange" name="allOrderBtn" onclick="location.href='CartAllBuyController.do'">전체주문</button>
			</div>
			</form>
		</div>
	</div>

	<!-- footer -->
	<jsp:include page="./include/Footer.jsp"/>
	<!-- footer// -->
</div>
</body>
</html>
