<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="./asset/css/global.css"/> 
<link rel="stylesheet" href="./asset/css/ProductSelect.css"/> 
<title>Insert title here</title>
<script type="text/javascript">
	
	function brandOnOff(){
		var check = document.getElementById("brandOnOffCheck").value;
		if(check == "off"){
			document.getElementById("brandOnOff").className="search_box brand on"
			document.getElementById("brandOnOffCheck").value="on";
		}else{
			document.getElementById("brandOnOff").className="search_box brand"
			document.getElementById("brandOnOffCheck").value="off";
		}
	}
	
	function cateOnOff(){
		var check = document.getElementById("cateOnOffCheck").value;
		if(check == "off"){
			document.getElementById("cateOnOff").className="search_box cate on"
			document.getElementById("cateOnOffCheck").value="on";
			document.getElementById("catelist").className="list show";
		}else{
			document.getElementById("cateOnOff").className="search_box cate"
			document.getElementById("cateOnOffCheck").value="off";
			document.getElementById("catelist").className="list";
		}
	}
	
	function subcateOnOff(){
		var check = document.getElementById("subcateOnOffCheck").value;
		if(check == "off"){
			document.getElementById("subcateOnOff").className="search_box subcate on"
			document.getElementById("subcateOnOffCheck").value="on";
			document.getElementById("subcatelist").className="list show";
		}else{
			document.getElementById("subcateOnOff").className="search_box subcate"
			document.getElementById("subcateOnOffCheck").value="off";
			document.getElementById("subcatelist").className="list";
		}
	}
	
	
	function attBoxOnOff(){
		var check = document.getElementById("attBoxOnOffCheck").value;
		if(check == "off"){
			document.getElementById("attBoxOnOff").className="search_box attBox on"
			document.getElementById("attBoxOnOffCheck").value="on";
		}else{
			document.getElementById("attBoxOnOff").className="search_box attBox"
			document.getElementById("attBoxOnOffCheck").value="off";
		}
	}
	
	$(function(){
		var flag = true;
		$('#cateBtn').each(function(index,items){
			$('#cateBtn').click(function(){
				if(flag==true){
					$('.list').addClass('show');
					flag = false;
				} else{
					$('.list').removeClass('show');
					$('#firstlist').addClass('show');
					flag = true;
				}
				});
			});
		});
	$(function(){
		var flag = true;
		if($('#subcateOnOffCheck').val() == 'on'){
			flag = false;
		}
		$('#subcateBtn').each(function(index,items){
			$('#subcateBtn').click(function(){
				if(flag==true){
					$('.sublist').addClass('show');
					$('#subcateOnOff').css('height', '109px');
					$('#subcateOnOff .inner').css('height', '108px');
					flag = false;
				} else{
					$('.sublist').removeClass('show');
					$('#subfirstlist').addClass('show');
					$('#subcateOnOff').css('height', '55px');
					$('#subcateOnOff .inner').css('height', '54px');
					flag = true;
				}
				});
			});
		});
	
	function checksubmit() {
		var frm = document.getElementById("frm");
		frm.submit();
	}
	
	function pricesubmit() {
		var frm1 = document.getElementById("frm1");
		frm1.submit();
	}
	
	function ordersubmit(a) {
		document.getElementById("order").value = a;
		var frm2 = document.getElementById("frm2");
		frm2.submit();
	}
	
</script>
</head>
<body>

<!-- header -->
<jsp:include page="./include/Header.jsp"/>
<!-- header// -->
	<c:set var="PATH" value="./upload/" />
<!-- #Container -->
	<c:set var="productList" value="${requestScope.productList}" />
	<c:set var="count" value="${requestScope.count}" />
	<c:set var="query" value="${requestScope.query}" />
	<c:set var="low" value="${requestScope.low}" />
	<c:set var="high" value="${requestScope.high}" />
	<div id="Container">
		<!-- #Contents -->
		<div id="Contents">
			<!-- 검색어오류 영역 추가 (2017-01-13 추가)  -->
			<div class="searchResultArea"> 
				<p class="resultTxt"><strong>${query}</strong>검색결과 (전체 <span>${count}개</span>의 상품)					
				</p>
				<div class="searchWrap">
					<input type="text" title="결과 내 검색창" placeholder="결과 내 검색" id="reChk">
					<input type="submit" value="검색" title="검색" onclick="return reSearch()">
				</div>
			</div>
			
			<c:if test="${count == 0}">
			<div class="search_no_data">		<!--realQuery-->
				<p>검색하신 <strong> ${query}</strong>에 대한 <strong>검색</strong> 결과가 없습니다.</p>
				<div class="usage-guide">
					<p>다시 검색해 보세요</p>
					<ul>
						<li>검색어의 철자가 정확한지 확인해보세요.</li>
						<li>한글을 영어로 혹은 영어를 한글로 입력했는지 확인해보세요.</li>
						<li>검색어의 띄어쓰기를 다르게 해보세요.</li>
					</ul>
				</div>
			</div>
			</c:if>
			<c:if test="${count > 0}">
			<!-- 상품 속성 정보 검색 서비스 개선 -->
			<div class="detailSearch new">
			<!-- 카테고리 -->
			<c:if test="${cate != null}">
			<div class="search_box cate on" id="cateOnOff">
				<c:set var="cate" value="${requestScope.cate }"/>
				<c:set var="categorylength" value="${requestScope.category }"/>
				<c:set var="high" value="${requestScope.high}"/>
				<c:set var="low" value="${requestScope.low}"/>
				<div class="inner">
					<h4 class="tit_th">카테고리
					<c:if test="${fn:length(categorylength) >= 4}">
						<button id="cateBtn" class="btnMore" onclick="cateOnOff();">열기/닫기</button>
					</c:if>
					</h4><!-- 버튼은 6개 이상만 노출 --><!-- 카테고리는 서브 텝 존재로 구조가 다름 -->
					<input type="hidden" id="cateOnOffCheck" value="on">
					
					<c:forEach var="category" items="${requestScope.category}" varStatus="idx">
						<c:choose>
						<c:when test="${idx.index < 4}">
							<c:if test="${idx.index % 4 == 0}">
								<ul class="list show" id="firstlist">
								<c:if test="${cate == category}">
									<li><a href="./ProductSelectAction.pro?query=${query}&startrow=0&cate=${category}" class="on" onclick="">${category}<span></span></a></li>
								</c:if>
								<c:if test="${cate != category}">
									<li><a href="./ProductSelectAction.pro?query=${query}&startrow=0&cate=${category}" onclick="">${category}<span></span></a></li>
								</c:if>
							</c:if>
							<c:if test="${idx.index % 4 == 1}">
								<c:if test="${cate == category}">
									<li><a href="./ProductSelectAction.pro?query=${query}&startrow=0&cate=${category}" class="on" onclick="">${category}<span></span></a></li>
								</c:if>
								<c:if test="${cate != category}">
									<li><a href="./ProductSelectAction.pro?query=${query}&startrow=0&cate=${category}" onclick="">${category}<span></span></a></li>
								</c:if>
							</c:if>
							<c:if test="${idx.index % 4 == 2}">
								<c:if test="${cate == category}">
									<li><a href="./ProductSelectAction.pro?query=${query}&startrow=0&cate=${category}" class="on" onclick="">${category}<span></span></a></li>
								</c:if>
								<c:if test="${cate != category}">
									<li><a href="./ProductSelectAction.pro?query=${query}&startrow=0&cate=${category}" onclick="">${category}<span></span></a></li>
								</c:if>
							</c:if>
							<c:if test="${idx.index % 4 == 3}">
								<c:if test="${cate == category}">
									<li><a href="./ProductSelectAction.pro?query=${query}&startrow=0&cate=${category}" class="on" onclick="">${category}<span></span></a></li>
								</c:if>
								<c:if test="${cate != category}">
									<li><a href="./ProductSelectAction.pro?query=${query}&startrow=0&cate=${category}" onclick="">${category}<span></span></a></li>
								</c:if>
								</ul>
							</c:if>
						</c:when>
						<c:otherwise>
							<c:if test="${idx.index % 4 == 0}">
								<ul class="list show">	
									<c:if test="${cate == category}">
									<li><a href="./ProductSelectAction.pro?query=${query}&startrow=0&cate=${category}" class="on" onclick="">${category}<span></span></a></li>
								</c:if>
								<c:if test="${cate != category}">
									<li><a href="./ProductSelectAction.pro?query=${query}&startrow=0&cate=${category}" onclick="">${category}<span></span></a></li>
								</c:if>
							</c:if>
							<c:if test="${idx.index % 4 == 1}">
								<c:if test="${cate == category}">
									<li><a href="./ProductSelectAction.pro?query=${query}&startrow=0&cate=${category}" class="on" onclick="">${category}<span></span></a></li>
								</c:if>
								<c:if test="${cate != category}">
									<li><a href="./ProductSelectAction.pro?query=${query}&startrow=0&cate=${category}" onclick="">${category}<span></span></a></li>
								</c:if>
							</c:if>
							<c:if test="${idx.index % 4 == 2}">
								<c:if test="${cate == category}">
									<li><a href="./ProductSelectAction.pro?query=${query}&startrow=0&cate=${category}" class="on" onclick="">${category}<span></span></a></li>
								</c:if>
								<c:if test="${cate != category}">
									<li><a href="./ProductSelectAction.pro?query=${query}&startrow=0&cate=${category}" onclick="">${category}<span></span></a></li>
								</c:if>
							</c:if>
							<c:if test="${idx.index % 4 == 3}">
								<c:if test="${cate == category}">
									<li><a href="./ProductSelectAction.pro?query=${query}&startrow=0&cate=${category}" class="on" onclick="">${category}<span></span></a></li>
								</c:if>
								<c:if test="${cate != category}">
									<li><a href="./ProductSelectAction.pro?query=${query}&startrow=0&cate=${category}" onclick="">${category}<span></span></a></li>
								</c:if>
								</ul>
							</c:if>
						</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:if test="${fn:length(category) <= 4}"></ul></c:if>
				</div>
			</div>	
			</c:if>
			
			<c:if test="${cate == null}">
			<div class="search_box cate" id="cateOnOff">
				<c:set var="cate" value="${requestScope.cate }"/>
				<c:set var="categorylength" value="${requestScope.category }"/>
				<div class="inner">
					<h4 class="tit_th">카테고리
					<c:if test="${fn:length(categorylength) >= 4}">
						<button id="cateBtn" class="btnMore" onclick="cateOnOff();">열기/닫기</button>
					</c:if>
					</h4><!-- 버튼은 6개 이상만 노출 --><!-- 카테고리는 서브 텝 존재로 구조가 다름 -->
					<input type="hidden" id="cateOnOffCheck" value="off">
					
					<c:forEach var="category" items="${requestScope.category}" varStatus="idx">
						<c:choose>
						<c:when test="${idx.index < 4}">
							<c:if test="${idx.index % 4 == 0}">
							<ul class="list show" id="firstlist">	
								<c:if test="${cate == category}">
									<li><a href="./ProductSelectAction.pro?query=${query}&startrow=0&cate=${category}" class="on" onclick="">${category}<span></span></a></li>
								</c:if>
								<c:if test="${cate != category}">
									<li><a href="./ProductSelectAction.pro?query=${query}&startrow=0&cate=${category}" onclick="">${category}<span></span></a></li>
								</c:if>
							</c:if>
							<c:if test="${idx.index % 4 == 1}">
								<c:if test="${cate == category}">
									<li><a href="./ProductSelectAction.pro?query=${query}&startrow=0&cate=${category}" class="on" onclick="">${category}<span></span></a></li>
								</c:if>
								<c:if test="${cate != category}">
									<li><a href="./ProductSelectAction.pro?query=${query}&startrow=0&cate=${category}" onclick="">${category}<span></span></a></li>
								</c:if>
							</c:if>
							<c:if test="${idx.index % 4 == 2}">
								<c:if test="${cate == category}">
									<li><a href="./ProductSelectAction.pro?query=${query}&startrow=0&cate=${category}" class="on" onclick="">${category}<span></span></a></li>
								</c:if>
								<c:if test="${cate != category}">
									<li><a href="./ProductSelectAction.pro?query=${query}&startrow=0&cate=${category}" onclick="">${category}<span></span></a></li>
								</c:if>
							</c:if>
							<c:if test="${idx.index % 4 == 3}">
								<c:if test="${cate == category}">
									<li><a href="./ProductSelectAction.pro?query=${query}&startrow=0&cate=${category}" class="on" onclick="">${category}<span></span></a></li>
								</c:if>
								<c:if test="${cate != category}">
									<li><a href="./ProductSelectAction.pro?query=${query}&startrow=0&cate=${category}" onclick="">${category}<span></span></a></li>
								</c:if>
								</ul>
							</c:if>
						</c:when>
						<c:otherwise>
							<c:if test="${idx.index % 4 == 0}">
								<ul class="list ">	
									<c:if test="${cate == category}">
									<li><a href="./ProductSelectAction.pro?query=${query}&startrow=0&cate=${category}" class="on" onclick="">${category}<span></span></a></li>
								</c:if>
								<c:if test="${cate != category}">
									<li><a href="./ProductSelectAction.pro?query=${query}&startrow=0&cate=${category}" onclick="">${category}<span></span></a></li>
								</c:if>
							</c:if>
							<c:if test="${idx.index % 4 == 1}">
								<c:if test="${cate == category}">
									<li><a href="./ProductSelectAction.pro?query=${query}&startrow=0&cate=${category}" class="on" onclick="">${category}<span></span></a></li>
								</c:if>
								<c:if test="${cate != category}">
									<li><a href="./ProductSelectAction.pro?query=${query}&startrow=0&cate=${category}" onclick="">${category}<span></span></a></li>
								</c:if>
							</c:if>
							<c:if test="${idx.index % 4 == 2}">
								<c:if test="${cate == category}">
									<li><a href="./ProductSelectAction.pro?query=${query}&startrow=0&cate=${category}" class="on" onclick="">${category}<span></span></a></li>
								</c:if>
								<c:if test="${cate != category}">
									<li><a href="./ProductSelectAction.pro?query=${query}&startrow=0&cate=${category}" onclick="">${category}<span></span></a></li>
								</c:if>
							</c:if>
							<c:if test="${idx.index % 4 == 3}">
								<c:if test="${cate == category}">
									<li><a href="./ProductSelectAction.pro?query=${query}&startrow=0&cate=${category}" class="on" onclick="">${category}<span></span></a></li>
								</c:if>
								<c:if test="${cate != category}">
									<li><a href="./ProductSelectAction.pro?query=${query}&startrow=0&cate=${category}" onclick="">${category}<span></span></a></li>
								</c:if>
								</ul>
							</c:if>
						</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:if test="${fn:length(category) <= 4}"></ul></c:if>
				</div>
			</div>	
			</c:if>
											
			<!-- //카테고리 -->
			<!-- 서브카테고리 -->
			<c:set var="subcate" value="${requestScope.subcategory}"/>
			<c:set var="subcategorylength" value="${requestScope.subcategory}"/>
			
			<c:if test="${subcate != null}">
			
			<c:set var="subcategorylength" value="${requestScope.subcategory}"/>
			<c:set var="subcate" value="${requestScope.subcate}"/>
			
			<c:if test="${subcate == null}">
				<div class="search_box subcate" id="subcateOnOff" style="display:block;">
				<div class="inner">
					<h4 class="tit_th">서브카테고리
					<c:if test="${fn:length(subcategorylength) >= 4}">
						<button id="subcateBtn" class="btnMore" onclick="subcateOnOff();">열기/닫기</button>
					</c:if>
					</h4><!-- 버튼은 6개 이상만 노출 --><!-- 카테고리는 서브 텝 존재로 구조가 다름 -->
					<input type="hidden" id="subcateOnOffCheck" value="off">
					<c:forEach var="subcategory" items="${requestScope.subcategory}" varStatus="idx">
						<c:choose>
						<c:when test="${idx.index < 4}">
							<c:if test="${idx.index % 4 == 0}">
								<ul class="sublist show" id="subfirstlist">	
									<li><a href="./ProductSelectAction.pro?query=${query}&startrow=0&cate=${cate}&subcate=${subcategory}" id="category_10000010001" onclick="">${subcategory}<span></span></a></li>
							</c:if>
							<c:if test="${idx.index % 4 == 1}">
								<li><a href="./ProductSelectAction.pro?query=${query}&startrow=0&cate=${cate}&subcate=${subcategory}" id="category_10000010001" onclick="">${subcategory}<span></span></a></li>
							</c:if>
							<c:if test="${idx.index % 4 == 2}">
								<li><a href="./ProductSelectAction.pro?query=${query}&startrow=0&cate=${cate}&subcate=${subcategory}" id="category_10000010001" onclick="">${subcategory}<span></span></a></li>
							</c:if>
							<c:if test="${idx.index % 4 == 3}">
								<li><a href="./ProductSelectAction.pro?query=${query}&startrow=0&cate=${cate}&subcate=${subcategory}" id="category_10000010001" onclick="">${subcategory}<span></span></a></li>
								</ul>
							</c:if>
						</c:when>
						<c:otherwise>
							<c:if test="${idx.index % 4 == 0}">
								<ul class="sublist ">	
									<li><a href="./ProductSelectAction.pro?query=${query}&startrow=0&cate=${cate}&subcate=${subcategory}" id="category_10000010001" onclick="">${subcategory}<span></span></a></li>
							</c:if>
							<c:if test="${idx.index % 4 == 1}">
								<li><a href="./ProductSelectAction.pro?query=${query}&startrow=0&cate=${cate}&subcate=${subcategory}" id="category_10000010001" onclick="">${subcategory}<span></span></a></li>
							</c:if>
							<c:if test="${idx.index % 4 == 2}">
								<li><a href="./ProductSelectAction.pro?query=${query}&startrow=0&cate=${cate}&subcate=${subcategory}" id="category_10000010001" onclick="">${subcategory}<span></span></a></li>
							</c:if>
							<c:if test="${idx.index % 4 == 3}">
								<li><a href="./ProductSelectAction.pro?query=${query}&startrow=0&cate=${cate}&subcate=${subcategory}" id="category_10000010001" onclick="">${subcategory}<span></span></a></li>
								</ul>
							</c:if>
						</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:if test="${fn:length(subcategory) <= 4}"></ul></c:if>
				</div>
			</div>	
			</c:if>
			
			<c:if test="${subcate != null}">
			<div class="search_box subcate on" id="subcateOnOff" style="display:block; height: 109px;">
				<div class="inner" style="height: 108px;">
					<h4 class="tit_th">서브카테고리
					<c:if test="${fn:length(subcategorylength) >= 4}">
						<button id="subcateBtn" class="btnMore" onclick="subcateOnOff();">열기/닫기</button>
					</c:if>
					</h4><!-- 버튼은 6개 이상만 노출 --><!-- 카테고리는 서브 텝 존재로 구조가 다름 -->
					<input type="hidden" id="subcateOnOffCheck" value="on">
					<c:forEach var="subcategory" items="${requestScope.subcategory}" varStatus="idx">
						<c:choose>
						<c:when test="${idx.index < 4}">
							<c:if test="${idx.index % 4 == 0}">
								<ul class="sublist show" id="subfirstlist">	
								<c:if test="${subcate != subcategory}">
									<li><a href="./ProductSelectAction.pro?query=${query}&startrow=0&cate=${cate}&subcate=${subcategory}" onclick="">${subcategory}<span></span></a></li>
								</c:if>
								<c:if test="${subcate == subcategory}">
									<li><a href="./ProductSelectAction.pro?query=${query}&startrow=0&cate=${cate}&subcate=${subcategory}" class="on" onclick="">${subcategory}<span></span></a></li>
								</c:if>
							</c:if>
							<c:if test="${idx.index % 4 == 1}">
								<c:if test="${subcate != subcategory}">
									<li><a href="./ProductSelectAction.pro?query=${query}&startrow=0&cate=${cate}&subcate=${subcategory}" onclick="">${subcategory}<span></span></a></li>
								</c:if>
								<c:if test="${subcate == subcategory}">
									<li><a href="./ProductSelectAction.pro?query=${query}&startrow=0&cate=${cate}&subcate=${subcategory}" class="on" onclick="">${subcategory}<span></span></a></li>
								</c:if>
							</c:if>
							<c:if test="${idx.index % 4 == 2}">
								<c:if test="${subcate != subcategory}">
									<li><a href="./ProductSelectAction.pro?query=${query}&startrow=0&cate=${cate}&subcate=${subcategory}" onclick="">${subcategory}<span></span></a></li>
								</c:if>
								<c:if test="${subcate == subcategory}">
									<li><a href="./ProductSelectAction.pro?query=${query}&startrow=0&cate=${cate}&subcate=${subcategory}&" class="on" onclick="">${subcategory}<span></span></a></li>
								</c:if>
							</c:if>
							<c:if test="${idx.index % 4 == 3}">
								<c:if test="${subcate != subcategory}">
									<li><a href="./ProductSelectAction.pro?query=${query}&startrow=0&cate=${cate}&subcate=${subcategory}" onclick="">${subcategory}<span></span></a></li>
								</c:if>
								<c:if test="${subcate == subcategory}">
									<li><a href="./ProductSelectAction.pro?query=${query}&startrow=0&cate=${cate}&subcate=${subcategory}" class="on" onclick="">${subcategory}<span></span></a></li>
								</c:if>
								</ul>
							</c:if>
						</c:when>
						<c:otherwise>
							<c:if test="${idx.index % 4 == 0}">
								<ul class="sublist show">	
									<c:if test="${subcate != subcategory}">
									<li><a href="./ProductSelectAction.pro?query=${query}&startrow=0&cate=${cate}&subcate=${subcategory}" onclick="">${subcategory}<span></span></a></li>
								</c:if>
								<c:if test="${subcate == subcategory}">
									<li><a href="./ProductSelectAction.pro?query=${query}&startrow=0&cate=${cate}&subcate=${subcategory}" class="on" onclick="">${subcategory}<span></span></a></li>
								</c:if>
							</c:if>
							<c:if test="${idx.index % 4 == 1}">
								<c:if test="${subcate != subcategory}">
									<li><a href="./ProductSelectAction.pro?query=${query}&startrow=0&cate=${cate}&subcate=${subcategory}" onclick="">${subcategory}<span></span></a></li>
								</c:if>
								<c:if test="${subcate == subcategory}">
									<li><a href="./ProductSelectAction.pro?query=${query}&startrow=0&cate=${cate}&subcate=${subcategory}" class="on" onclick="">${subcategory}<span></span></a></li>
								</c:if>
							</c:if>
							<c:if test="${idx.index % 4 == 2}">
								<c:if test="${subcate != subcategory}">
									<li><a href="./ProductSelectAction.pro?query=${query}&startrow=0&cate=${cate}&subcate=${subcategory}" onclick="">${subcategory}<span></span></a></li>
								</c:if>
								<c:if test="${subcate == subcategory}">
									<li><a href="./ProductSelectAction.pro?query=${query}&startrow=0&cate=${cate}&subcate=${subcategory}" class="on" onclick="">${subcategory}<span></span></a></li>
								</c:if>
							</c:if>
							<c:if test="${idx.index % 4 == 3}">
								<c:if test="${subcate != subcategory}">
									<li><a href="./ProductSelectAction.pro?query=${query}&startrow=0&cate=${cate}&subcate=${subcategory}" onclick="">${subcategory}<span></span></a></li>
								</c:if>
								<c:if test="${subcate == subcategory}">
									<li><a href="./ProductSelectAction.pro?query=${query}&startrow=0&cate=${cate}&subcate=${subcategory}" class="on" onclick="">${subcategory}<span></span></a></li>
								</c:if>
								</ul>
							</c:if>
						</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:if test="${fn:length(subcategory) <= 4}"></ul></c:if>
				</div>
			</div>	
			</c:if>
			
			</c:if>							
				<!-- //서브카테고리 -->
			<c:if test="${requestScope.checkbrand != null}">
			<c:set var="brandlength" value="${requestScope.brand}"/>
			<div class="search_box brand" id="brandOnOff">
				<div class="inner">
					<h4 class="tit_th">브랜드
					<c:if test="${fn:length(brandlength) >= 6}">
						<button class="btnMore" onclick="brandOnOff();">열기/닫기</button>
					</c:if>
					</h4>
					<input type="hidden" id="brandOnOffCheck" value="off">
					<form action="./ProductSelectAction.pro" id="frm" method="get">
					<input type="hidden" name="query" value="${query}">
					<input type="hidden" name="cate" value="${cate}">
					<input type="hidden" name="subcate" value="${subcate}">
					<input type="hidden" name="startrow" value="0">
					<input type="hidden" name="low_price" value="${low}">
					<input type="hidden" name="high_price" value="${high}">
					<ul class="list scrbar">
					<% 
						int i=0; 
					%>
					<c:set var="break" value="false" />
					<c:forEach var="brand" items="${requestScope.brand}" varStatus="idx">
						<li>
							<input type="checkbox" id="brand<%=i %>" name="brand_check" value="${brand}" onclick="checksubmit();">
							<label for="brand<%=i %>" onclick="checksubmit();">${brand}</label>
						</li>
					<c:forEach var="checkbrand" items="${requestScope.checkbrand}" varStatus="idx">
						<c:if test="${brand == checkbrand}">
							<script type="text/javascript">
								document.getElementById("brand<%=i%>").checked=true;
							</script>
						</c:if>
					</c:forEach>
					<% i++; %>	
					</c:forEach>
					</ul>
					</form>
					</div>
				</div><!-- //브랜드 -->
				</c:if>
				
			<c:if test="${requestScope.checkbrand == null}">
			<c:set var="brandlength" value="${requestScope.brand}"/>
			<div class="search_box brand" id="brandOnOff">
				<div class="inner">
					<h4 class="tit_th">브랜드
					<c:if test="${fn:length(brandlength) >= 6}">
						<button class="btnMore" onclick="brandOnOff();">열기/닫기</button>
					</c:if>
					</h4>
					<input type="hidden" id="brandOnOffCheck" value="off">
					<form action="./ProductSelectAction.pro" id="frm" method="get">
					<input type="hidden" name="query" value="${query}">
					<input type="hidden" name="cate" value="${cate}">
					<input type="hidden" name="subcate" value="${subcate}">
					<input type="hidden" name="startrow" value="0">
					<input type="hidden" name="low_price" value="${low}">
					<input type="hidden" name="high_price" value="${high}">
					<ul class="list scrbar">
					<c:set var="i" value="0"/>
					<c:forEach var="brand" items="${requestScope.brand}" varStatus="idx">
						<li>
							<input type="checkbox" id="brand${idx.index}" name="brand_check" value="${brand}" onclick="checksubmit();">
							<label for="brand${idx.index}" onclick="checksubmit();">${brand}</label>
						</li>
					</c:forEach>
					</ul>
					</form>
					</div>
				</div><!-- //브랜드 -->
				</c:if>
				
				<!-- //카테고리 -->
		<div class="search_box">
			<div class="inner">
				<h4 class="tit_th">가격대</h4>
				<div class="priceSearch">
				<form action="./ProductSelectAction.pro" id="frm1" method="get">
					<input type="hidden" name="query" value="${query}">
					<input type="hidden" name="cate" value="${cate}">
					<input type="hidden" name="subcate" value="${subcate}">
					<input type="hidden" name="startrow" value="0">
					
					<c:forEach var="brand" items="${requestScope.brand}" varStatus="idx">
					<c:forEach var="checkbrand" items="${requestScope.checkbrand}" varStatus="idx">
						<c:if test="${brand == checkbrand}">
							<input type="hidden" name="brand_check" value="${brand}">
						</c:if>
					</c:forEach>
					</c:forEach>
					
					<input type="text" id="low_price" name="low_price" placeholder="최저가" value="${low}" title=""><span>~</span>
					<input type="text" id="high_price" name="high_price" placeholder="최고가" value="${high}" title="">
					<input type="button" id="price_button" value="가격대 적용" title="가격대 적용" onclick="pricesubmit();">
				</form>
				</div>
			</div>
		</div><!-- //가격대 -->
	</div>
			<!-- // 상품 속성 정보 검색 서비스 개선 -->
			<!-- 원래꺼 -->
				<p class="cate_info_tx">전체
				 <span>
				${count}</span>개의 상품이 등록되어 있습니다.</p>
			<!-- bFirstSearch -->
			<!-- 상품 정렬 조건 영역 -->
			<div class="cate_align_box">
				<div class="align_sort"> 
				<form action="./ProductSelectAction.pro" id="frm2" method="get">
					<input type="hidden" name="query" value="${query}">
					<input type="hidden" name="cate" value="${cate}">
					<input type="hidden" name="subcate" value="${subcate}">
					<input type="hidden" name="startrow" value="0">
					<input type="hidden" name="low_price" value="${low}">
					<input type="hidden" name="high_price" value="${high}">
					
					<c:forEach var="brand" items="${requestScope.brand}" varStatus="idx">
					<c:forEach var="checkbrand" items="${requestScope.checkbrand}" varStatus="idx">
						<c:if test="${brand == checkbrand}">
							<input type="hidden" name="brand_check" value="${brand}">
						</c:if>
					</c:forEach>
					</c:forEach>
					<c:set var="order" value="${requestScope.order}"/>
					<ul>
					<c:choose>
						<c:when test="${order == null}">
							<li class="on"><a onclick="ordersubmit('price_count');" style="cursor: pointer;">인기순</a></li>
							<li><a onclick="ordersubmit('insert_product');" style="cursor: pointer;">최근등록순</a></li>
							<li><a onclick="ordersubmit('low_price');" style="cursor: pointer;">낮은 가격순</a></li>
							<li><a onclick="ordersubmit('high_price');" style="cursor: pointer;">높은 가격순</a></li>
						</c:when>
						<c:when test="${order eq 'price_count'}">
							<li class="on"><a onclick="ordersubmit('price_count');" style="cursor: pointer;">인기순</a></li>
							<li><a onclick="ordersubmit('insert_product');" style="cursor: pointer;">최근등록순</a></li>
							<li><a onclick="ordersubmit('low_price');" style="cursor: pointer;">낮은 가격순</a></li>
							<li><a onclick="ordersubmit('high_price');" style="cursor: pointer;">높은 가격순</a></li>
						</c:when>
						<c:when test="${order eq 'high_price'}">
							<li><a onclick="ordersubmit('price_count');" style="cursor: pointer;">인기순</a></li>
							<li><a onclick="ordersubmit('insert_product');" style="cursor: pointer;">최근등록순</a></li>
							<li><a onclick="ordersubmit('low_price');" style="cursor: pointer;">낮은 가격순</a></li>
							<li class="on"><a onclick="ordersubmit('high_price');" style="cursor: pointer;">높은 가격순</a></li>
						</c:when>
						<c:when test="${order eq 'low_price'}">
							<li><a onclick="ordersubmit('price_count');" style="cursor: pointer;">인기순</a></li>
							<li><a onclick="ordersubmit('insert_product');" style="cursor: pointer;">최근등록순</a></li>
							<li class="on"><a onclick="ordersubmit('low_price');" style="cursor: pointer;">낮은 가격순</a></li>
							<li><a onclick="ordersubmit('high_price');" style="cursor: pointer;">높은 가격순</a></li>
						</c:when>
						<c:when test="${order eq 'insert_product'}">
							<li><a onclick="ordersubmit('price_count');" style="cursor: pointer;">인기순</a></li>
							<li class="on"><a onclick="ordersubmit('insert_product');" style="cursor: pointer;">최근등록순</a></li>
							<li><a onclick="ordersubmit('low_price');" style="cursor: pointer;">낮은 가격순</a></li>
							<li><a onclick="ordersubmit('high_price');" style="cursor: pointer;">높은 가격순</a></li>
						</c:when>
					</c:choose>
					</ul>
					<input type="hidden" name="order" id="order" value="price_count">
				</form>
				</div>
				<div class="type_sort" style="float: right;">
					<button class="btn_thumb active">컬럼형식으로 보기</button>
					<button class="btn_list">리스트형식으로 보기</button>
				</div> 
			</div>
			<!--// 상품 정렬 조건 영역 -->  
			
			<!-- 카테고리 상품 리스트 --> 
			<!-- 컬럼형 리스트 -->
		<c:forEach var="productList" items="${requestScope.productList}" varStatus="idx">
			<c:choose>
				<c:when test="${idx.index % 4 == 0}">
					<ul id="w_cate_prd_list" class="cate_prd_list"><!-- 1단형일 경우 클래스 list_type 추가 -->
					<li class="flag">
						<div class="prd_info ">
						<!-- 이미지 영역 -->
						<a href="ProductDetailAction.pro?product_num=${productList.product_num}" class="prd_thumb">
							<img src="${PATH}${productList.img_main}" alt="이미지 썸네일">
						</a>
						<!--// 이미지 영역 -->
						<!-- 상품명 -->
						<div class="prd_name">
							<a href="ProductDetailAction.pro?product_num=${productList.product_num}">
								<span class="tx_brand">${productList.brand}</span>
								<p class="tx_name">${productList.product_name}</p>
							</a>							
						</div>
						<!--// 상품명  -->
						<!-- 상품가격 영역 -->
						<p class="prd_price">
							<span class="tx_org"><span class="tx_num">${productList.product_price}</span>원</span>
							<span class="tx_cur"><span class="tx_num">${productList.product_price-productList.product_sale_price}</span>원</span>
						</p>
						<!--// 상품가격 영역 -->
						</div>
					</li>
				</c:when>
				<c:when test="${idx.index % 4 == 1}">
					<li class="flag">
						<div class="prd_info ">
						<!-- 이미지 영역 -->
						<a href="ProductDetailAction.pro?product_num=${productList.product_num}" class="prd_thumb">
							<img src="${PATH}${productList.img_main}" alt="이미지 썸네일">
						</a>
						<!--// 이미지 영역 -->
						<!-- 상품명 -->
						<div class="prd_name">
							<a href="ProductDetailAction.pro?product_num=${productList.product_num}">
								<span class="tx_brand">${productList.brand}</span>
								<p class="tx_name">${productList.product_name}</p>
							</a>							
						</div>
						<!--// 상품명  -->
						<!-- 상품가격 영역 -->
						<p class="prd_price">
							<span class="tx_org"><span class="tx_num">${productList.product_price}</span>원</span>
							<span class="tx_cur"><span class="tx_num">${productList.product_price-productList.product_sale_price}</span>원</span>
						</p>
						<!--// 상품가격 영역 -->
						</div>
					</li>
				</c:when>
				<c:when test="${idx.index % 4 == 2}">
					<li class="flag">
						<div class="prd_info ">
						<!-- 이미지 영역 -->
						<a href="ProductDetailAction.pro?product_num=${productList.product_num}" class="prd_thumb">
							<img src="${PATH}${productList.img_main}" alt="이미지 썸네일">
						</a>
						<!--// 이미지 영역 -->
						<!-- 상품명 -->
						<div class="prd_name">
							<a href="ProductDetailAction.pro?product_num=${productList.product_num}">
								<span class="tx_brand">${productList.brand}</span>
								<p class="tx_name">${productList.product_name}</p>
							</a>							
						</div>
						<!--// 상품명  -->
						<!-- 상품가격 영역 -->
						<p class="prd_price">
							<span class="tx_org"><span class="tx_num">${productList.product_price}</span>원</span>
							<span class="tx_cur"><span class="tx_num">${productList.product_price-productList.product_sale_price}</span>원</span>
						</p>
						<!--// 상품가격 영역 -->
						</div>
					</li>
				</c:when>
				<c:when test="${idx.index % 4 == 3}">
					<li class="flag">
						<div class="prd_info ">
						<!-- 이미지 영역 -->
						<a href="ProductDetailAction.pro?product_num=${productList.product_num}" class="prd_thumb">
							<img src="${PATH}${productList.img_main}" alt="이미지 썸네일">
						</a>
						<!--// 이미지 영역 -->
						<!-- 상품명 -->
						<div class="prd_name">
							<a href="ProductDetailAction.pro?product_num=${productList.product_num}">
								<span class="tx_brand">${productList.brand}</span>
								<p class="tx_name">${productList.product_name}</p>
							</a>							
						</div>
						<!--// 상품명  -->
						<!-- 상품가격 영역 -->
						<p class="prd_price">
							<span class="tx_org"><span class="tx_num">${productList.product_price}</span>원</span>
							<span class="tx_cur"><span class="tx_num">${productList.product_price-productList.product_sale_price}</span>원</span>
						</p>
						<!--// 상품가격 영역 -->
						</div>
					</li>
					</ul>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:if test="${fn:length(productList)%4 != 0}"></ul></c:if>
			<!--// 컬럼형 리스트 -->
			<!--// 카테고리 상품 리스트 -->
			<!-- pageing start -->
			<!--<div class="pageing">
				<strong title="현재 페이지">1</strong><a href="" onclick="" title="Paging"> 2 </a><a href="" onclick="" title="Paging"> 3 </a><a href="" onclick="" title="Paging"> 4 </a><a href="" onclick="" title="Paging"> 5 </a><a href="" onclick="" title="Paging"> 6 </a><a href="" onclick="" title="Paging"> 7 </a><a href="" onclick="" title="Paging"> 8 </a><a href="" onclick="" title="Paging"> 9 </a><a href="" onclick="" title="Paging"> 10 </a><a class="next" href="" onclick="" title="Next Page">다음 페이지</a>
			-->
			<div class="pageing">
				<c:set var="i" value="1" />
				<c:set var="j" value="0" />
				<c:set var="startrow" value="${requestScope.startrow}"/>
				<c:set var="brand" value="${requestScope.pagebrandquery}"/>
				<c:forEach begin="0" end="${count}" varStatus="idx">
					<c:if test="${idx.index % 24 == 0}">
						<c:choose>
							<c:when test="${startrow==j}"><a href="./ProductSelectAction.pro?query=${query}&startrow=${(i-1)*24}&cate=${cate}&subcate=${subcate}${brand}&low_price=${low}&high_price=${high}" title="Paging" class="on"> ${idx.index%24+i} </a></c:when>
							<c:otherwise><a href="./ProductSelectAction.pro?query=${query}&startrow=${(i-1)*24}&cate=${cate}&subcate=${subcate}${brand}&low_price=${low}&high_price=${high}" title="Paging"> ${idx.index%24+i} </a></c:otherwise>
						</c:choose>
						<c:set var="i" value="${i+1}"/>
					</c:if>
					<c:set var="j" value="${j+1}"/>
				</c:forEach>
			</div>
			</c:if>
			<!-- //pageing end -->			
		<!-- </div> -->
		
		</div>
		<!-- //#Contents -->
	</div>
	<!-- //#Container -->

	<!-- 2017-02-23 수정 : TOP 바로가기 버튼 추가 -->
	<div id="directTop" style="display: block;">
		<button><span></span>TOP</button>
	</div>
	<!--// 2017-02-23 수정 : TOP 바로가기 버튼 추가 -->
	
	<!-- #Footer -->
	<jsp:include page="./include/Footer.jsp"/>
	<!-- //#Footer -->
</body>
</html>