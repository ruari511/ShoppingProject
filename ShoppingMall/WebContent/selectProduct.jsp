<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="./asset/css/global.css"/> 
<link rel="stylesheet" href="./asset/css/selectProduct.css"/> 
<title>Insert title here</title>
</head>
<body>


<!-- header -->
<jsp:include page="./include/Header.jsp"/>
<!-- header// -->




<!-- #Container -->
	<div id="Container">
		<!-- #Contents -->
		<div id="Contents">
			<!-- 검색어오류 영역 추가 (2017-01-13 추가)  -->
			<div class="searchResultArea"> 
				<p class="resultTxt"><strong>로션</strong>검색결과 (전체 <span>364개</span>의 상품)					
				</p>
				<div class="searchWrap">
					<div class="check_today">
						<input type="checkbox" id="check_view" name="check_view" class="chkSmall" value="" onclick="javascript:quickOnclick();">
						<label for="check_view">오늘드림 상품만 보기</label>
					</div>
					<input type="text" title="결과 내 검색창" placeholder="결과 내 검색" id="reChk">
					<input type="submit" value="검색" title="검색" onclick="return reSearch()">
				</div>
			</div>
			<!--// 검색어오류 영역 추가 -->
			<script>recommend('로션');</script>		
			<!-- 연관검색어 -->			
			<div class="relatedSearch" style="display:none;">
				<div class="tit"><span>연관검색어</span></div>
				<div class="link" id="recommend">
				</div>
				<button class="btn_more">더보기</button>
			</div>			
			<!-- //연관검색어 -->
			<!-- 상품 속성 정보 검색 서비스 개선 -->
			<div class="detailSearch new">
			    <!-- 카테고리 -->
				<div class="search_box cate">
				<div class="inner">
					<h4 class="tit_th">카테고리<button class="btnMore">열기/닫기</button></h4><!-- 버튼은 6개 이상만 노출 --><!-- 카테고리는 서브 텝 존재로 구조가 다름 -->
					<ul class="list show">	
						<li>
							<a href="http://www.oliveyoung.co.kr/store/search/getSearchMain.do?query=%EB%A1%9C%EC%85%98#none" id="category_10000010001" value="10000010001" onclick="javascript:CateOnclick(&#39;10000010001&#39;,&#39;스킨케어&#39;)">스킨케어<span></span></a><!-- 대카 클릭시 클래스 on -->
							<!-- // 2017-01-16 중카 영역이동 div subCate 안으로  // -->
						</li>
						<li>
							<a href="http://www.oliveyoung.co.kr/store/search/getSearchMain.do?query=%EB%A1%9C%EC%85%98#none" id="category_10000010003" value="10000010003" onclick="javascript:CateOnclick(&#39;10000010003&#39;,&#39;바디케어&#39;)">바디케어<span></span></a><!-- 대카 클릭시 클래스 on -->
							<!-- // 2017-01-16 중카 영역이동 div subCate 안으로  // -->
						</li>
						<li>
							<a href="http://www.oliveyoung.co.kr/store/search/getSearchMain.do?query=%EB%A1%9C%EC%85%98#none" id="category_10000010007" value="10000010007" onclick="javascript:CateOnclick(&#39;10000010007&#39;,&#39;남성&#39;)">남성<span></span></a><!-- 대카 클릭시 클래스 on -->
							<!-- // 2017-01-16 중카 영역이동 div subCate 안으로  // -->
						</li>
						<li>
							<a href="http://www.oliveyoung.co.kr/store/search/getSearchMain.do?query=%EB%A1%9C%EC%85%98#none" id="category_10000030004" value="10000030004" onclick="javascript:CateOnclick(&#39;10000030004&#39;,&#39;베이비&#39;)">베이비<span></span></a><!-- 대카 클릭시 클래스 on -->
							<!-- // 2017-01-16 중카 영역이동 div subCate 안으로  // -->
						</li>
						<li>
							<a href="http://www.oliveyoung.co.kr/store/search/getSearchMain.do?query=%EB%A1%9C%EC%85%98#none" id="category_10000010004" value="10000010004" onclick="javascript:CateOnclick(&#39;10000010004&#39;,&#39;헤어케어&#39;)">헤어케어<span></span></a><!-- 대카 클릭시 클래스 on -->
							<!-- // 2017-01-16 중카 영역이동 div subCate 안으로  // -->
						</li>
					</ul>
					<div class="list_subbox " style="display:none;">
						<ul class="clrfix " style="display:none;">
							<li> <a href="http://www.oliveyoung.co.kr/store/search/getSearchMain.do?query=%EB%A1%9C%EC%85%98#none" id="category_100000100010001" value="100000100010001" onclick="javascript:CateOnclick2(&#39;100000100010001&#39;,&#39;페이셜케어&#39;)">페이셜케어<span></span></a></li><!-- 대카 클릭시 클래스 on -->
   							<li> <a href="http://www.oliveyoung.co.kr/store/search/getSearchMain.do?query=%EB%A1%9C%EC%85%98#none" id="category_100000100010004" value="100000100010004" onclick="javascript:CateOnclick2(&#39;100000100010004&#39;,&#39;더모 코스메틱&#39;)">더모 코스메틱<span></span></a></li><!-- 대카 클릭시 클래스 on -->
   							<li> <a href="http://www.oliveyoung.co.kr/store/search/getSearchMain.do?query=%EB%A1%9C%EC%85%98#none" id="category_100000100010007" value="100000100010007" onclick="javascript:CateOnclick2(&#39;100000100010007&#39;,&#39;선케어&#39;)">선케어<span></span></a></li><!-- 대카 클릭시 클래스 on -->
   							<li> <a href="http://www.oliveyoung.co.kr/store/search/getSearchMain.do?query=%EB%A1%9C%EC%85%98#none" id="category_100000100010006" value="100000100010006" onclick="javascript:CateOnclick2(&#39;100000100010006&#39;,&#39;클렌징&#39;)">클렌징<span></span></a></li><!-- 대카 클릭시 클래스 on -->
						</ul>
						<ul class="clrfix " style="display:none;">
   							<li> <a href="http://www.oliveyoung.co.kr/store/search/getSearchMain.do?query=%EB%A1%9C%EC%85%98#none" id="category_100000100030004" value="100000100030004" onclick="javascript:CateOnclick2(&#39;100000100030004&#39;,&#39;로션/크림&#39;)">로션/크림<span></span></a></li><!-- 대카 클릭시 클래스 on -->
   							<li> <a href="http://www.oliveyoung.co.kr/store/search/getSearchMain.do?query=%EB%A1%9C%EC%85%98#none" id="category_100000100030005" value="100000100030005" onclick="javascript:CateOnclick2(&#39;100000100030005&#39;,&#39;워시/스크럽&#39;)">워시/스크럽<span></span></a></li><!-- 대카 클릭시 클래스 on -->
   							<li> <a href="http://www.oliveyoung.co.kr/store/search/getSearchMain.do?query=%EB%A1%9C%EC%85%98#none" id="category_100000100030007" value="100000100030007" onclick="javascript:CateOnclick2(&#39;100000100030007&#39;,&#39;핸드/풋&#39;)">핸드/풋<span></span></a></li><!-- 대카 클릭시 클래스 on -->
   							<li> <a href="http://www.oliveyoung.co.kr/store/search/getSearchMain.do?query=%EB%A1%9C%EC%85%98#none" id="category_100000100030009" value="100000100030009" onclick="javascript:CateOnclick2(&#39;100000100030009&#39;,&#39;데오/제모&#39;)">데오/제모<span></span></a></li><!-- 대카 클릭시 클래스 on -->
   							<li> <a href="http://www.oliveyoung.co.kr/store/search/getSearchMain.do?query=%EB%A1%9C%EC%85%98#none" id="category_100000100030006" value="100000100030006" onclick="javascript:CateOnclick2(&#39;100000100030006&#39;,&#39;미스트/오일&#39;)">미스트/오일<span></span></a></li><!-- 대카 클릭시 클래스 on -->
						</ul>
						<ul class="clrfix " style="display:none;">
							<li> <a href="http://www.oliveyoung.co.kr/store/search/getSearchMain.do?query=%EB%A1%9C%EC%85%98#none" id="category_100000100070001" value="100000100070001" onclick="javascript:CateOnclick2(&#39;100000100070001&#39;,&#39;스킨케어&#39;)">스킨케어<span></span></a></li><!-- 대카 클릭시 클래스 on -->
   							<li> <a href="http://www.oliveyoung.co.kr/store/search/getSearchMain.do?query=%EB%A1%9C%EC%85%98#none" id="category_100000100070002" value="100000100070002" onclick="javascript:CateOnclick2(&#39;100000100070002&#39;,&#39;바디케어&#39;)">바디케어<span></span></a></li><!-- 대카 클릭시 클래스 on -->
   							<li> <a href="http://www.oliveyoung.co.kr/store/search/getSearchMain.do?query=%EB%A1%9C%EC%85%98#none" id="category_100000100070006" value="100000100070006" onclick="javascript:CateOnclick2(&#39;100000100070006&#39;,&#39;쉐이빙/잡화&#39;)">쉐이빙/잡화<span></span></a></li><!-- 대카 클릭시 클래스 on -->
   							<li> <a href="http://www.oliveyoung.co.kr/store/search/getSearchMain.do?query=%EB%A1%9C%EC%85%98#none" id="category_100000100070004" value="100000100070004" onclick="javascript:CateOnclick2(&#39;100000100070004&#39;,&#39;메이크업&#39;)">메이크업<span></span></a></li><!-- 대카 클릭시 클래스 on -->
						</ul>
						<ul class="clrfix " style="display:none;">
   							<li> <a href="http://www.oliveyoung.co.kr/store/search/getSearchMain.do?query=%EB%A1%9C%EC%85%98#none" id="category_100000300040001" value="100000300040001" onclick="javascript:CateOnclick2(&#39;100000300040001&#39;,&#39;스킨/바디케어&#39;)">스킨/바디케어<span></span></a></li><!-- 대카 클릭시 클래스 on -->
						</ul>
						<ul class="clrfix " style="display:none;">
   							<li> <a href="http://www.oliveyoung.co.kr/store/search/getSearchMain.do?query=%EB%A1%9C%EC%85%98#none" id="category_100000100040006" value="100000100040006" onclick="javascript:CateOnclick2(&#39;100000100040006&#39;,&#39;스타일링/에센스&#39;)">스타일링/에센스<span></span></a></li><!-- 대카 클릭시 클래스 on -->
   							<li> <a href="http://www.oliveyoung.co.kr/store/search/getSearchMain.do?query=%EB%A1%9C%EC%85%98#none" id="category_100000100040008" value="100000100040008" onclick="javascript:CateOnclick2(&#39;100000100040008&#39;,&#39;샴푸/린스&#39;)">샴푸/린스<span></span></a></li><!-- 대카 클릭시 클래스 on -->
						</ul>
					</div>
					<ul class="list ">	<!-- cateId.equals("") -->
						<li>
							<a href="http://www.oliveyoung.co.kr/store/search/getSearchMain.do?query=%EB%A1%9C%EC%85%98#none" id="category_10000020003" value="10000020003" onclick="javascript:CateOnclick(&#39;10000020003&#39;,&#39;건강/위생용품&#39;)">건강/위생용품<span></span></a><!-- 대카 클릭시 클래스 on -->
							<!-- // 2017-01-16 중카 영역이동 div subCate 안으로  // -->
						</li>
						<li>
							<a href="http://www.oliveyoung.co.kr/store/search/getSearchMain.do?query=%EB%A1%9C%EC%85%98#none" id="category_10000010005" value="10000010005" onclick="javascript:CateOnclick(&#39;10000010005&#39;,&#39;향수/디퓨저&#39;)">향수/디퓨저<span></span></a><!-- 대카 클릭시 클래스 on -->
						</li>
						<li>
							<a href="http://www.oliveyoung.co.kr/store/search/getSearchMain.do?query=%EB%A1%9C%EC%85%98#none" id="category_10000010002" value="10000010002" onclick="javascript:CateOnclick(&#39;10000010002&#39;,&#39;메이크업&#39;)">메이크업<span></span></a><!-- 대카 클릭시 클래스 on -->
						</li>
						<li>
							<a href="http://www.oliveyoung.co.kr/store/search/getSearchMain.do?query=%EB%A1%9C%EC%85%98#none" id="category_10000010006" value="10000010006" onclick="javascript:CateOnclick(&#39;10000010006&#39;,&#39;미용소품&#39;)">미용소품<span></span></a><!-- 대카 클릭시 클래스 on -->
						</li>
						<li>
							<a href="http://www.oliveyoung.co.kr/store/search/getSearchMain.do?query=%EB%A1%9C%EC%85%98#none" id="category_10000030003" value="10000030003" onclick="javascript:CateOnclick(&#39;10000030003&#39;,&#39;반려동물&#39;)">반려동물<span></span></a><!-- 대카 클릭시 클래스 on -->
						</li>
					</ul>
					<div class="list_subbox " style="display:none;">
						<ul class="clrfix " style="display:none;">
   							<li> <a href="http://www.oliveyoung.co.kr/store/search/getSearchMain.do?query=%EB%A1%9C%EC%85%98#none" id="category_100000200030005" value="100000200030005" onclick="javascript:CateOnclick2(&#39;100000200030005&#39;,&#39;스팟패치/의료용품&#39;)">스팟패치/의료용품<span></span></a></li><!-- 대카 클릭시 클래스 on -->
						</ul>
						<ul class="clrfix " style="display:none;">
   							<li> <a href="http://www.oliveyoung.co.kr/store/search/getSearchMain.do?query=%EB%A1%9C%EC%85%98#none" id="category_100000100050003" value="100000100050003" onclick="javascript:CateOnclick2(&#39;100000100050003&#39;,&#39;여성향수&#39;)">여성향수<span></span></a></li><!-- 대카 클릭시 클래스 on -->
						</ul>
						<ul class="clrfix " style="display:none;">
   							<li> <a href="http://www.oliveyoung.co.kr/store/search/getSearchMain.do?query=%EB%A1%9C%EC%85%98#none" id="category_100000100020001" value="100000100020001" onclick="javascript:CateOnclick2(&#39;100000100020001&#39;,&#39;베이스&#39;)">베이스<span></span></a></li><!-- 대카 클릭시 클래스 on -->
						</ul>
						<ul class="clrfix " style="display:none;">
   							<li> <a href="http://www.oliveyoung.co.kr/store/search/getSearchMain.do?query=%EB%A1%9C%EC%85%98#none" id="category_100000100060005" value="100000100060005" onclick="javascript:CateOnclick2(&#39;100000100060005&#39;,&#39;기타소품&#39;)">기타소품<span></span></a></li><!-- 대카 클릭시 클래스 on -->
						</ul>
						<ul class="clrfix " style="display:none;">
   							<li> <a href="http://www.oliveyoung.co.kr/store/search/getSearchMain.do?query=%EB%A1%9C%EC%85%98#none" id="category_100000300030002" value="100000300030002" onclick="javascript:CateOnclick2(&#39;100000300030002&#39;,&#39;강아지 용품&#39;)">강아지 용품<span></span></a></li><!-- 대카 클릭시 클래스 on -->
						</ul>
					</div>
			<!-- //1카테고리 종료 -->	
				</div>
			</div>								
				<!-- //카테고리 -->
			<div class="search_box brand">
				<div class="inner">
					<h4 class="tit_th">브랜드<button class="btnMore">열기/닫기</button></h4>
					<ul class="list scrbar">	
						<li><input type="checkbox" id="inpChk1_A000451" name="brand_check" value="A000451" onclick="javascript:brandOnclick(&#39;A000451&#39;);"><label for="inpChk1_A000451">바이오더마</label></li>
						<li><input type="checkbox" id="inpChk1_A000003" name="brand_check" value="A000003" onclick="javascript:brandOnclick(&#39;A000003&#39;);"><label for="inpChk1_A000003">아벤느</label></li>
						<li><input type="checkbox" id="inpChk1_A000517" name="brand_check" value="A000517" onclick="javascript:brandOnclick(&#39;A000517&#39;);"><label for="inpChk1_A000517">하다라보</label></li>
						<li><input type="checkbox" id="inpChk1_A001468" name="brand_check" value="A001468" onclick="javascript:brandOnclick(&#39;A001468&#39;);"><label for="inpChk1_A001468">오스트레일리안골드</label></li>
						<li><input type="checkbox" id="inpChk1_A001641" name="brand_check" value="A001641" onclick="javascript:brandOnclick(&#39;A001641&#39;);"><label for="inpChk1_A001641">크리니크</label></li>
						<li><input type="checkbox" id="inpChk1_A000565" name="brand_check" value="A000565" onclick="javascript:brandOnclick(&#39;A000565&#39;);"><label for="inpChk1_A000565">세타필</label></li>
						<li><input type="checkbox" id="inpChk1_A000044" name="brand_check" value="A000044" onclick="javascript:brandOnclick(&#39;A000044&#39;);"><label for="inpChk1_A000044">뉴트로지나</label></li>
						<li><input type="checkbox" id="inpChk1_A000426" name="brand_check" value="A000426" onclick="javascript:brandOnclick(&#39;A000426&#39;);"><label for="inpChk1_A000426">닥터자르트</label></li>
						<li><input type="checkbox" id="inpChk1_A000859" name="brand_check" value="A000859" onclick="javascript:brandOnclick(&#39;A000859&#39;);"><label for="inpChk1_A000859">랩시리즈</label></li>
						<li><input type="checkbox" id="inpChk1_A000290" name="brand_check" value="A000290" onclick="javascript:brandOnclick(&#39;A000290&#39;);"><label for="inpChk1_A000290">아비노</label></li>
						<li><input type="checkbox" id="inpChk1_A000204" name="brand_check" value="A000204" onclick="javascript:brandOnclick(&#39;A000204&#39;);"><label for="inpChk1_A000204">존슨즈</label></li>
						<li><input type="checkbox" id="inpChk1_A002481" name="brand_check" value="A002481" onclick="javascript:brandOnclick(&#39;A002481&#39;);"><label for="inpChk1_A002481">헤지스 맨 룰429</label></li>
						<li><input type="checkbox" id="inpChk1_A000049" name="brand_check" value="A000049" onclick="javascript:brandOnclick(&#39;A000049&#39;);"><label for="inpChk1_A000049">니베아</label></li>
						<li><input type="checkbox" id="inpChk1_A000288" name="brand_check" value="A000288" onclick="javascript:brandOnclick(&#39;A000288&#39;);"><label for="inpChk1_A000288">엠도씨</label></li>
						<li><input type="checkbox" id="inpChk1_A000968" name="brand_check" value="A000968" onclick="javascript:brandOnclick(&#39;A000968&#39;);"><label for="inpChk1_A000968">일리윤</label></li>
						<li><input type="checkbox" id="inpChk1_A002294" name="brand_check" value="A002294" onclick="javascript:brandOnclick(&#39;A002294&#39;);"><label for="inpChk1_A002294">필로소피</label></li>
						<li><input type="checkbox" id="inpChk1_A002789" name="brand_check" value="A002789" onclick="javascript:brandOnclick(&#39;A002789&#39;);"><label for="inpChk1_A002789">더바디샵</label></li>
						<li><input type="checkbox" id="inpChk1_A002513" name="brand_check" value="A002513" onclick="javascript:brandOnclick(&#39;A002513&#39;);"><label for="inpChk1_A002513">록시땅</label></li>
						<li><input type="checkbox" id="inpChk1_A000985" name="brand_check" value="A000985" onclick="javascript:brandOnclick(&#39;A000985&#39;);"><label for="inpChk1_A000985">더마비</label></li>
						<li><input type="checkbox" id="inpChk1_A002630" name="brand_check" value="A002630" onclick="javascript:brandOnclick(&#39;A002630&#39;);"><label for="inpChk1_A002630">러쉬</label></li>
						<li><input type="checkbox" id="inpChk1_A001601" name="brand_check" value="A001601" onclick="javascript:brandOnclick(&#39;A001601&#39;);"><label for="inpChk1_A001601">닥터틸즈</label></li>
						<li><input type="checkbox" id="inpChk1_A000866" name="brand_check" value="A000866" onclick="javascript:brandOnclick(&#39;A000866&#39;);"><label for="inpChk1_A000866">더블유드레스룸</label></li>
						<li><input type="checkbox" id="inpChk1_A001034" name="brand_check" value="A001034" onclick="javascript:brandOnclick(&#39;A001034&#39;);"><label for="inpChk1_A001034">더블하트</label></li>
						<li><input type="checkbox" id="inpChk1_A001218" name="brand_check" value="A001218" onclick="javascript:brandOnclick(&#39;A001218&#39;);"><label for="inpChk1_A001218">더프트앤도프트</label></li>
						<li><input type="checkbox" id="inpChk1_A000791" name="brand_check" value="A000791" onclick="javascript:brandOnclick(&#39;A000791&#39;);"><label for="inpChk1_A000791">디티알티</label></li>
						<li><input type="checkbox" id="inpChk1_A000954" name="brand_check" value="A000954" onclick="javascript:brandOnclick(&#39;A000954&#39;);"><label for="inpChk1_A000954">라로슈포제</label></li>
						<li><input type="checkbox" id="inpChk1_A001306" name="brand_check" value="A001306" onclick="javascript:brandOnclick(&#39;A001306&#39;);"><label for="inpChk1_A001306">라운드어라운드</label></li>
						<li><input type="checkbox" id="inpChk1_A001722" name="brand_check" value="A001722" onclick="javascript:brandOnclick(&#39;A001722&#39;);"><label for="inpChk1_A001722">로벡틴</label></li>
						<li><input type="checkbox" id="inpChk1_A000888" name="brand_check" value="A000888" onclick="javascript:brandOnclick(&#39;A000888&#39;);"><label for="inpChk1_A000888">바디판타지</label></li>
						<li><input type="checkbox" id="inpChk1_A000774" name="brand_check" value="A000774" onclick="javascript:brandOnclick(&#39;A000774&#39;);"><label for="inpChk1_A000774">불독</label></li>
						<li><input type="checkbox" id="inpChk1_A000883" name="brand_check" value="A000883" onclick="javascript:brandOnclick(&#39;A000883&#39;);"><label for="inpChk1_A000883">아토팜</label></li>
						<li><input type="checkbox" id="inpChk1_A000828" name="brand_check" value="A000828" onclick="javascript:brandOnclick(&#39;A000828&#39;);"><label for="inpChk1_A000828">우르오스</label></li>
						<li><input type="checkbox" id="inpChk1_A001775" name="brand_check" value="A001775" onclick="javascript:brandOnclick(&#39;A001775&#39;);"><label for="inpChk1_A001775">쿤달</label></li>
						<li><input type="checkbox" id="inpChk1_A001444" name="brand_check" value="A001444" onclick="javascript:brandOnclick(&#39;A001444&#39;);"><label for="inpChk1_A001444">클로란</label></li>
						<li><input type="checkbox" id="inpChk1_A001127" name="brand_check" value="A001127" onclick="javascript:brandOnclick(&#39;A001127&#39;);"><label for="inpChk1_A001127">트리헛</label></li>
						<li><input type="checkbox" id="inpChk1_A001424" name="brand_check" value="A001424" onclick="javascript:brandOnclick(&#39;A001424&#39;);"><label for="inpChk1_A001424">궁중비책</label></li>
						<li><input type="checkbox" id="inpChk1_A000397" name="brand_check" value="A000397" onclick="javascript:brandOnclick(&#39;A000397&#39;);"><label for="inpChk1_A000397">그린핑거</label></li>
						<li><input type="checkbox" id="inpChk1_A000486" name="brand_check" value="A000486" onclick="javascript:brandOnclick(&#39;A000486&#39;);"><label for="inpChk1_A000486">눅스</label></li>
						<li><input type="checkbox" id="inpChk1_A000447" name="brand_check" value="A000447" onclick="javascript:brandOnclick(&#39;A000447&#39;);"><label for="inpChk1_A000447">닥터브로너스</label></li>
						<li><input type="checkbox" id="inpChk1_A000786" name="brand_check" value="A000786" onclick="javascript:brandOnclick(&#39;A000786&#39;);"><label for="inpChk1_A000786">무스텔라</label></li>
						<li><input type="checkbox" id="inpChk1_A002545" name="brand_check" value="A002545" onclick="javascript:brandOnclick(&#39;A002545&#39;);"><label for="inpChk1_A002545">버블티</label></li>
						<li><input type="checkbox" id="inpChk1_A000471" name="brand_check" value="A000471" onclick="javascript:brandOnclick(&#39;A000471&#39;);"><label for="inpChk1_A000471">버츠비</label></li>
						<li><input type="checkbox" id="inpChk1_A000093" name="brand_check" value="A000093" onclick="javascript:brandOnclick(&#39;A000093&#39;);"><label for="inpChk1_A000093">보닌</label></li>
						<li><input type="checkbox" id="inpChk1_A000143" name="brand_check" value="A000143" onclick="javascript:brandOnclick(&#39;A000143&#39;);"><label for="inpChk1_A000143">세인트이브스</label></li>
						<li><input type="checkbox" id="inpChk1_A001642" name="brand_check" value="A001642" onclick="javascript:brandOnclick(&#39;A001642&#39;);"><label for="inpChk1_A001642">오리진스</label></li>
						<li><input type="checkbox" id="inpChk1_A000615" name="brand_check" value="A000615" onclick="javascript:brandOnclick(&#39;A000615&#39;);"><label for="inpChk1_A000615">온더바디</label></li>
						<li><input type="checkbox" id="inpChk1_A000697" name="brand_check" value="A000697" onclick="javascript:brandOnclick(&#39;A000697&#39;);"><label for="inpChk1_A000697">유세린</label></li>
						<li><input type="checkbox" id="inpChk1_A001042" name="brand_check" value="A001042" onclick="javascript:brandOnclick(&#39;A001042&#39;);"><label for="inpChk1_A001042">캐스키드슨</label></li>
						<li><input type="checkbox" id="inpChk1_A000065" name="brand_check" value="A000065" onclick="javascript:brandOnclick(&#39;A000065&#39;);"><label for="inpChk1_A000065">해피바스</label></li>
						<li><input type="checkbox" id="inpChk1_A000033" name="brand_check" value="A000033" onclick="javascript:brandOnclick(&#39;A000033&#39;);"><label for="inpChk1_A000033">겐조</label></li>
						<li><input type="checkbox" id="inpChk1_A001316" name="brand_check" value="A001316" onclick="javascript:brandOnclick(&#39;A001316&#39;);"><label for="inpChk1_A001316">다슈</label></li>
						<li><input type="checkbox" id="inpChk1_A000014" name="brand_check" value="A000014" onclick="javascript:brandOnclick(&#39;A000014&#39;);"><label for="inpChk1_A000014">라끄베르</label></li>
						<li><input type="checkbox" id="inpChk1_A002699" name="brand_check" value="A002699" onclick="javascript:brandOnclick(&#39;A002699&#39;);"><label for="inpChk1_A002699">라마린</label></li>
						<li><input type="checkbox" id="inpChk1_A001328" name="brand_check" value="A001328" onclick="javascript:brandOnclick(&#39;A001328&#39;);"><label for="inpChk1_A001328">라우쉬</label></li>
						<li><input type="checkbox" id="inpChk1_A000084" name="brand_check" value="A000084" onclick="javascript:brandOnclick(&#39;A000084&#39;);"><label for="inpChk1_A000084">로레알 파리</label></li>
						<li><input type="checkbox" id="inpChk1_A000129" name="brand_check" value="A000129" onclick="javascript:brandOnclick(&#39;A000129&#39;);"><label for="inpChk1_A000129">린든리브즈</label></li>
						<li><input type="checkbox" id="inpChk1_A001924" name="brand_check" value="A001924" onclick="javascript:brandOnclick(&#39;A001924&#39;);"><label for="inpChk1_A001924">마녀공장</label></li>
						<li><input type="checkbox" id="inpChk1_A000059" name="brand_check" value="A000059" onclick="javascript:brandOnclick(&#39;A000059&#39;);"><label for="inpChk1_A000059">바세린</label></li>
						<li><input type="checkbox" id="inpChk1_A002148" name="brand_check" value="A002148" onclick="javascript:brandOnclick(&#39;A002148&#39;);"><label for="inpChk1_A002148">셀라피</label></li>
						<li><input type="checkbox" id="inpChk1_A000137" name="brand_check" value="A000137" onclick="javascript:brandOnclick(&#39;A000137&#39;);"><label for="inpChk1_A000137">수려한</label></li>
						<li><input type="checkbox" id="inpChk1_A002474" name="brand_check" value="A002474" onclick="javascript:brandOnclick(&#39;A002474&#39;);"><label for="inpChk1_A002474">에스트라</label></li>
						<li><input type="checkbox" id="inpChk1_A001663" name="brand_check" value="A001663" onclick="javascript:brandOnclick(&#39;A001663&#39;);"><label for="inpChk1_A001663">에이비씨덤</label></li>
						<li><input type="checkbox" id="inpChk1_A000419" name="brand_check" value="A000419" onclick="javascript:brandOnclick(&#39;A000419&#39;);"><label for="inpChk1_A000419">유리아쥬</label></li>
						<li><input type="checkbox" id="inpChk1_A000929" name="brand_check" value="A000929" onclick="javascript:brandOnclick(&#39;A000929&#39;);"><label for="inpChk1_A000929">이브로쉐</label></li>
						<li><input type="checkbox" id="inpChk1_A002508" name="brand_check" value="A002508" onclick="javascript:brandOnclick(&#39;A002508&#39;);"><label for="inpChk1_A002508">케어허</label></li>
						<li><input type="checkbox" id="inpChk1_A001465" name="brand_check" value="A001465" onclick="javascript:brandOnclick(&#39;A001465&#39;);"><label for="inpChk1_A001465">코스알엑스</label></li>
						<li><input type="checkbox" id="inpChk1_A000662" name="brand_check" value="A000662" onclick="javascript:brandOnclick(&#39;A000662&#39;);"><label for="inpChk1_A000662">티지 베드헤드</label></li>
						<li><input type="checkbox" id="inpChk1_A001510" name="brand_check" value="A001510" onclick="javascript:brandOnclick(&#39;A001510&#39;);"><label for="inpChk1_A001510">플레이보이</label></li>
						<li><input type="checkbox" id="inpChk1_A000729" name="brand_check" value="A000729" onclick="javascript:brandOnclick(&#39;A000729&#39;);"><label for="inpChk1_A000729">피지오겔</label></li>
						<li><input type="checkbox" id="inpChk1_A002502" name="brand_check" value="A002502" onclick="javascript:brandOnclick(&#39;A002502&#39;);"><label for="inpChk1_A002502">필리밀리</label></li>
						<li><input type="checkbox" id="inpChk1_A002344" name="brand_check" value="A002344" onclick="javascript:brandOnclick(&#39;A002344&#39;);"><label for="inpChk1_A002344">BT21</label></li>
						<li><input type="checkbox" id="inpChk1_A000030" name="brand_check" value="A000030" onclick="javascript:brandOnclick(&#39;A000030&#39;);"><label for="inpChk1_A000030">갸스비</label></li>
						<li><input type="checkbox" id="inpChk1_A000815" name="brand_check" value="A000815" onclick="javascript:brandOnclick(&#39;A000815&#39;);"><label for="inpChk1_A000815">나츄리에</label></li>
						<li><input type="checkbox" id="inpChk1_A000908" name="brand_check" value="A000908" onclick="javascript:brandOnclick(&#39;A000908&#39;);"><label for="inpChk1_A000908">닥터아토</label></li>
						<li><input type="checkbox" id="inpChk1_A001158" name="brand_check" value="A001158" onclick="javascript:brandOnclick(&#39;A001158&#39;);"><label for="inpChk1_A001158">더레미디</label></li>
						<li><input type="checkbox" id="inpChk1_A001933" name="brand_check" value="A001933" onclick="javascript:brandOnclick(&#39;A001933&#39;);"><label for="inpChk1_A001933">라미나로프</label></li>
						<li><input type="checkbox" id="inpChk1_A001504" name="brand_check" value="A001504" onclick="javascript:brandOnclick(&#39;A001504&#39;);"><label for="inpChk1_A001504">라바</label></li>
						<li><input type="checkbox" id="inpChk1_A002756" name="brand_check" value="A002756" onclick="javascript:brandOnclick(&#39;A002756&#39;);"><label for="inpChk1_A002756">라운드랩</label></li>
						<li><input type="checkbox" id="inpChk1_A001730" name="brand_check" value="A001730" onclick="javascript:brandOnclick(&#39;A001730&#39;);"><label for="inpChk1_A001730">리리코스 마린에너지</label></li>
						<li><input type="checkbox" id="inpChk1_A002738" name="brand_check" value="A002738" onclick="javascript:brandOnclick(&#39;A002738&#39;);"><label for="inpChk1_A002738">리바이포유</label></li>
						<li><input type="checkbox" id="inpChk1_A000031" name="brand_check" value="A000031" onclick="javascript:brandOnclick(&#39;A000031&#39;);"><label for="inpChk1_A000031">마몽드</label></li>
						<li><input type="checkbox" id="inpChk1_A000004" name="brand_check" value="A000004" onclick="javascript:brandOnclick(&#39;A000004&#39;);"><label for="inpChk1_A000004">마쉐리</label></li>
						<li><input type="checkbox" id="inpChk1_A002696" name="brand_check" value="A002696" onclick="javascript:brandOnclick(&#39;A002696&#39;);"><label for="inpChk1_A002696">맥</label></li>
						<li><input type="checkbox" id="inpChk1_A002306" name="brand_check" value="A002306" onclick="javascript:brandOnclick(&#39;A002306&#39;);"><label for="inpChk1_A002306">메르필</label></li>
						<li><input type="checkbox" id="inpChk1_A001811" name="brand_check" value="A001811" onclick="javascript:brandOnclick(&#39;A001811&#39;);"><label for="inpChk1_A001811">모모타니</label></li>
						<li><input type="checkbox" id="inpChk1_A001680" name="brand_check" value="A001680" onclick="javascript:brandOnclick(&#39;A001680&#39;);"><label for="inpChk1_A001680">미프</label></li>
						<li><input type="checkbox" id="inpChk1_A000860" name="brand_check" value="A000860" onclick="javascript:brandOnclick(&#39;A000860&#39;);"><label for="inpChk1_A000860">바디네이처</label></li>
						<li><input type="checkbox" id="inpChk1_A002749" name="brand_check" value="A002749" onclick="javascript:brandOnclick(&#39;A002749&#39;);"><label for="inpChk1_A002749">베이지츄</label></li>
						<li><input type="checkbox" id="inpChk1_A000897" name="brand_check" value="A000897" onclick="javascript:brandOnclick(&#39;A000897&#39;);"><label for="inpChk1_A000897">보타닉힐보</label></li>
						<li><input type="checkbox" id="inpChk1_A001643" name="brand_check" value="A001643" onclick="javascript:brandOnclick(&#39;A001643&#39;);"><label for="inpChk1_A001643">보타닉힐보 아이디얼포맨</label></li>
						<li><input type="checkbox" id="inpChk1_A001675" name="brand_check" value="A001675" onclick="javascript:brandOnclick(&#39;A001675&#39;);"><label for="inpChk1_A001675">뷰티포뮬라</label></li>
						<li><input type="checkbox" id="inpChk1_A002417" name="brand_check" value="A002417" onclick="javascript:brandOnclick(&#39;A002417&#39;);"><label for="inpChk1_A002417">블랙몬스터</label></li>
						<li><input type="checkbox" id="inpChk1_A000420" name="brand_check" value="A000420" onclick="javascript:brandOnclick(&#39;A000420&#39;);"><label for="inpChk1_A000420">비쉬</label></li>
						<li><input type="checkbox" id="inpChk1_A002222" name="brand_check" value="A002222" onclick="javascript:brandOnclick(&#39;A002222&#39;);"><label for="inpChk1_A002222">비욘드</label></li>
						<li><input type="checkbox" id="inpChk1_A000576" name="brand_check" value="A000576" onclick="javascript:brandOnclick(&#39;A000576&#39;);"><label for="inpChk1_A000576">비욘드 옴므</label></li>
						<li><input type="checkbox" id="inpChk1_A000134" name="brand_check" value="A000134" onclick="javascript:brandOnclick(&#39;A000134&#39;);"><label for="inpChk1_A000134">세바메드</label></li>
						<li><input type="checkbox" id="inpChk1_A002678" name="brand_check" value="A002678" onclick="javascript:brandOnclick(&#39;A002678&#39;);"><label for="inpChk1_A002678">셀비엔</label></li>
						<li><input type="checkbox" id="inpChk1_A000036" name="brand_check" value="A000036" onclick="javascript:brandOnclick(&#39;A000036&#39;);"><label for="inpChk1_A000036">식물나라</label></li>
						<li><input type="checkbox" id="inpChk1_A000275" name="brand_check" value="A000275" onclick="javascript:brandOnclick(&#39;A000275&#39;);"><label for="inpChk1_A000275">싸이닉</label></li>
						<li><input type="checkbox" id="inpChk1_A000278" name="brand_check" value="A000278" onclick="javascript:brandOnclick(&#39;A000278&#39;);"><label for="inpChk1_A000278">아넷사</label></li>
						<li><input type="checkbox" id="inpChk1_A000754" name="brand_check" value="A000754" onclick="javascript:brandOnclick(&#39;A000754&#39;);"><label for="inpChk1_A000754">아로마티카</label></li>
						<li><input type="checkbox" id="inpChk1_A000415" name="brand_check" value="A000415" onclick="javascript:brandOnclick(&#39;A000415&#39;);"><label for="inpChk1_A000415">아크네스</label></li>
						<li><input type="checkbox" id="inpChk1_A000188" name="brand_check" value="A000188" onclick="javascript:brandOnclick(&#39;A000188&#39;);"><label for="inpChk1_A000188">아트릭스</label></li>
						<li><input type="checkbox" id="inpChk1_A000034" name="brand_check" value="A000034" onclick="javascript:brandOnclick(&#39;A000034&#39;);"><label for="inpChk1_A000034">안나수이</label></li>
					</ul>
					</div>
				</div><!-- //브랜드 -->
				<!-- //카테고리 -->
		<div class="search_box attBox">
			
			<div class="tooltip" id="tooltip">
					<p class="txt">NEW</p>
					<button type="button" class="toolClose"><span class="blind"></span></button>
				</div>


			<div class="inner ">
					<h4 class="tit_th">제형<button class="btnMore">열기/닫기</button></h4>
					<ul class="list scrbar">
						<li><input type="checkbox" id="inpChk1_68fb5e6665b2dbfd620460c2971008ea" name="attr_check0" value="68fb5e6665b2dbfd620460c2971008ea" onclick="javascript:attrOnclick(0);"><label for="inpChk1_68fb5e6665b2dbfd620460c2971008ea">크림/로션</label></li>  
						<li><input type="checkbox" id="inpChk1_1ceab9c793694e6ffe96b9d72642aa6f" name="attr_check0" value="1ceab9c793694e6ffe96b9d72642aa6f" onclick="javascript:attrOnclick(0);"><label for="inpChk1_1ceab9c793694e6ffe96b9d72642aa6f">밀크</label></li>  
						<li><input type="checkbox" id="inpChk1_1a168dbb039e32b676d1945183670650" name="attr_check0" value="1a168dbb039e32b676d1945183670650" onclick="javascript:attrOnclick(0);"><label for="inpChk1_1a168dbb039e32b676d1945183670650">리퀴드</label></li>  
						<li><input type="checkbox" id="inpChk1_18e386fcca6b2010d16c276d8284e926" name="attr_check0" value="18e386fcca6b2010d16c276d8284e926" onclick="javascript:attrOnclick(0);"><label for="inpChk1_18e386fcca6b2010d16c276d8284e926">겔/젤</label></li>  
						<li><input type="checkbox" id="inpChk1_41efb1311e502a67f044b933ac03f89d" name="attr_check0" value="41efb1311e502a67f044b933ac03f89d" onclick="javascript:attrOnclick(0);"><label for="inpChk1_41efb1311e502a67f044b933ac03f89d">오일스프레이</label></li>  
						<li><input type="checkbox" id="inpChk1_a04e7065506d31f272b2fa4a0df7c6af" name="attr_check0" value="a04e7065506d31f272b2fa4a0df7c6af" onclick="javascript:attrOnclick(0);"><label for="inpChk1_a04e7065506d31f272b2fa4a0df7c6af">밤</label></li>  
						
		    
						<li><input type="checkbox" id="inpChk1_6cc50a364cf6c0231a9584d71569f5c1" name="attr_check0" value="6cc50a364cf6c0231a9584d71569f5c1" onclick="javascript:attrOnclick(0);"><label for="inpChk1_6cc50a364cf6c0231a9584d71569f5c1">스틱</label></li>  
						
		    
						<li><input type="checkbox" id="inpChk1_55eed05306531ec0bd7f4410deb175e0" name="attr_check0" value="55eed05306531ec0bd7f4410deb175e0" onclick="javascript:attrOnclick(0);"><label for="inpChk1_55eed05306531ec0bd7f4410deb175e0">오일</label></li>  
						

					</ul>
			</div>	
			<div class="inner depth">
					<h4 class="tit_th">기능</h4>
					<ul class="list scrbar">
			

		    
						<li><input type="checkbox" id="inpChk1_0a1612d03ef74641bef50f65c96b1464" name="attr_check1" value="0a1612d03ef74641bef50f65c96b1464" onclick="javascript:attrOnclick(1);"><label for="inpChk1_0a1612d03ef74641bef50f65c96b1464">보습/수분</label></li>  
						
		    
						<li><input type="checkbox" id="inpChk1_2cc3669fd205b9060542e1829b4a6322" name="attr_check1" value="2cc3669fd205b9060542e1829b4a6322" onclick="javascript:attrOnclick(1);"><label for="inpChk1_2cc3669fd205b9060542e1829b4a6322">진정</label></li>  
						
		    
						<li><input type="checkbox" id="inpChk1_dbcd34f2e88e8e4928d909ab66941cb8" name="attr_check1" value="dbcd34f2e88e8e4928d909ab66941cb8" onclick="javascript:attrOnclick(1);"><label for="inpChk1_dbcd34f2e88e8e4928d909ab66941cb8">영양</label></li>  
						
		    
						<li><input type="checkbox" id="inpChk1_317d4cb557aabead19b17e6f2371b9f4" name="attr_check1" value="317d4cb557aabead19b17e6f2371b9f4" onclick="javascript:attrOnclick(1);"><label for="inpChk1_317d4cb557aabead19b17e6f2371b9f4">트러블케어</label></li>  
						
		    
						<li><input type="checkbox" id="inpChk1_ffc8bbdcb17f35b8dac6842fe72c36e7" name="attr_check1" value="ffc8bbdcb17f35b8dac6842fe72c36e7" onclick="javascript:attrOnclick(1);"><label for="inpChk1_ffc8bbdcb17f35b8dac6842fe72c36e7">딥클렌징</label></li>  
						
		    
						<li><input type="checkbox" id="inpChk1_6e6c07c2b4dec85fe08211933dec9f90" name="attr_check1" value="6e6c07c2b4dec85fe08211933dec9f90" onclick="javascript:attrOnclick(1);"><label for="inpChk1_6e6c07c2b4dec85fe08211933dec9f90">모공</label></li>  
						
		    
						<li><input type="checkbox" id="inpChk1_dc9c7ff030c659cc79800bd715d32aa4" name="attr_check1" value="dc9c7ff030c659cc79800bd715d32aa4" onclick="javascript:attrOnclick(1);"><label for="inpChk1_dc9c7ff030c659cc79800bd715d32aa4">두피케어</label></li>  
						
		    
						<li><input type="checkbox" id="inpChk1_05987bf53089305d99118e3c0bbe561a" name="attr_check1" value="05987bf53089305d99118e3c0bbe561a" onclick="javascript:attrOnclick(1);"><label for="inpChk1_05987bf53089305d99118e3c0bbe561a">모발손상케어</label></li>  
						
		    
						<li><input type="checkbox" id="inpChk1_82a5a6f51e2ee1939548dbc7f006e6b3" name="attr_check1" value="82a5a6f51e2ee1939548dbc7f006e6b3" onclick="javascript:attrOnclick(1);"><label for="inpChk1_82a5a6f51e2ee1939548dbc7f006e6b3">온열</label></li>  
						
		    
						<li><input type="checkbox" id="inpChk1_4bfdcfcf3ff9c01f05a8c2927802ded2" name="attr_check1" value="4bfdcfcf3ff9c01f05a8c2927802ded2" onclick="javascript:attrOnclick(1);"><label for="inpChk1_4bfdcfcf3ff9c01f05a8c2927802ded2">미백/주름개선</label></li>  
						

					</ul>
			</div>	


			<div class="inner depth">
					<h4 class="tit_th">용기</h4>
					<ul class="list scrbar">
						<li><input type="checkbox" id="inpChk1_f7ed304605a53b77e55162a4934df6b2" name="attr_check2" value="f7ed304605a53b77e55162a4934df6b2" onclick="javascript:attrOnclick(2);"><label for="inpChk1_f7ed304605a53b77e55162a4934df6b2">펌프</label></li>  
						
		    
						<li><input type="checkbox" id="inpChk1_153524e02d4abbe1228b31342f33fb14" name="attr_check2" value="153524e02d4abbe1228b31342f33fb14" onclick="javascript:attrOnclick(2);"><label for="inpChk1_153524e02d4abbe1228b31342f33fb14">튜브</label></li>  
						
		    
						<li><input type="checkbox" id="inpChk1_e70cf8b24a8f601db55f257dbf8c4787" name="attr_check2" value="e70cf8b24a8f601db55f257dbf8c4787" onclick="javascript:attrOnclick(2);"><label for="inpChk1_e70cf8b24a8f601db55f257dbf8c4787">일반</label></li>  
						
		    
						<li><input type="checkbox" id="inpChk1_9c3fe408f9fe3ae586e272541fd12605" name="attr_check2" value="9c3fe408f9fe3ae586e272541fd12605" onclick="javascript:attrOnclick(2);"><label for="inpChk1_9c3fe408f9fe3ae586e272541fd12605">미스트</label></li>  
						
		    
						<li><input type="checkbox" id="inpChk1_17534ca1ff2effa221b4bb85de4c9c9c" name="attr_check2" value="17534ca1ff2effa221b4bb85de4c9c9c" onclick="javascript:attrOnclick(2);"><label for="inpChk1_17534ca1ff2effa221b4bb85de4c9c9c">스프레이</label></li>  
						
		    
						<li><input type="checkbox" id="inpChk1_b110412892cdccebc61044aa1cd19b88" name="attr_check2" value="b110412892cdccebc61044aa1cd19b88" onclick="javascript:attrOnclick(2);"><label for="inpChk1_b110412892cdccebc61044aa1cd19b88">자(Jar)</label></li>  
						

					</ul>
			</div>	


			<div class="inner depth">
					<h4 class="tit_th">용량</h4>
					<ul class="list scrbar">
			

		    
						<li><input type="checkbox" id="inpChk1_2a2f3b8c0a2cb20416b5a5414931d3fc" name="attr_check3" value="2a2f3b8c0a2cb20416b5a5414931d3fc" onclick="javascript:attrOnclick(3);"><label for="inpChk1_2a2f3b8c0a2cb20416b5a5414931d3fc">500ml 미만</label></li>  
						
		    
						<li><input type="checkbox" id="inpChk1_6b246f042eebbbcb637d885cfcdaa56a" name="attr_check3" value="6b246f042eebbbcb637d885cfcdaa56a" onclick="javascript:attrOnclick(3);"><label for="inpChk1_6b246f042eebbbcb637d885cfcdaa56a">300ml 미만</label></li>  
						
		    
						<li><input type="checkbox" id="inpChk1_a52863cf85358365882129ea67b615aa" name="attr_check3" value="a52863cf85358365882129ea67b615aa" onclick="javascript:attrOnclick(3);"><label for="inpChk1_a52863cf85358365882129ea67b615aa">500ml 이상</label></li>  
						
		    
						<li><input type="checkbox" id="inpChk1_684a865d4017b610a8545019b70516f7" name="attr_check3" value="684a865d4017b610a8545019b70516f7" onclick="javascript:attrOnclick(3);"><label for="inpChk1_684a865d4017b610a8545019b70516f7">100ml 미만</label></li>  
						
		    
						<li><input type="checkbox" id="inpChk1_872d3e1f7a3ce51b399494f9e1d1b658" name="attr_check3" value="872d3e1f7a3ce51b399494f9e1d1b658" onclick="javascript:attrOnclick(3);"><label for="inpChk1_872d3e1f7a3ce51b399494f9e1d1b658">50ml 미만</label></li>  
						
		    
						<li><input type="checkbox" id="inpChk1_f019d05a34a59203046fed27df63964e" name="attr_check3" value="f019d05a34a59203046fed27df63964e" onclick="javascript:attrOnclick(3);"><label for="inpChk1_f019d05a34a59203046fed27df63964e">100ml 이상</label></li>  
						
		    
						<li><input type="checkbox" id="inpChk1_7deedd94f93854a06a022fe1d318a8e3" name="attr_check3" value="7deedd94f93854a06a022fe1d318a8e3" onclick="javascript:attrOnclick(3);"><label for="inpChk1_7deedd94f93854a06a022fe1d318a8e3">50g 미만</label></li>  
						
		    
						<li><input type="checkbox" id="inpChk1_6c573359c5e47174f87dae507c85269f" name="attr_check3" value="6c573359c5e47174f87dae507c85269f" onclick="javascript:attrOnclick(3);"><label for="inpChk1_6c573359c5e47174f87dae507c85269f">50g 이상</label></li>  
						

					</ul>
			</div>	


			<div class="inner depth">
					<h4 class="tit_th">향</h4>
					<ul class="list scrbar">
			

		    
						<li><input type="checkbox" id="inpChk1_5fc4256acafaa9d5b9aba41b7d2aec97" name="attr_check4" value="5fc4256acafaa9d5b9aba41b7d2aec97" onclick="javascript:attrOnclick(4);"><label for="inpChk1_5fc4256acafaa9d5b9aba41b7d2aec97">블랜딩/컨셉</label></li>  
						
		    
						<li><input type="checkbox" id="inpChk1_e1259293d11c7f61821a6bebf8d388fa" name="attr_check4" value="e1259293d11c7f61821a6bebf8d388fa" onclick="javascript:attrOnclick(4);"><label for="inpChk1_e1259293d11c7f61821a6bebf8d388fa">없음</label></li>  
						
		    
						<li><input type="checkbox" id="inpChk1_b447739859443d1df5bdfdc466758331" name="attr_check4" value="b447739859443d1df5bdfdc466758331" onclick="javascript:attrOnclick(4);"><label for="inpChk1_b447739859443d1df5bdfdc466758331">꽃</label></li>  
						
		    
						<li><input type="checkbox" id="inpChk1_c94422401276b4ecf199aa544abb3b1b" name="attr_check4" value="c94422401276b4ecf199aa544abb3b1b" onclick="javascript:attrOnclick(4);"><label for="inpChk1_c94422401276b4ecf199aa544abb3b1b">과일/채소</label></li>  
						
		    
						<li><input type="checkbox" id="inpChk1_223b0fb61f49f40db41412c6b697010f" name="attr_check4" value="223b0fb61f49f40db41412c6b697010f" onclick="javascript:attrOnclick(4);"><label for="inpChk1_223b0fb61f49f40db41412c6b697010f">민트/차</label></li>  
						
		    
						<li><input type="checkbox" id="inpChk1_843f026d5ee8add5c5c88bd0eb1149cf" name="attr_check4" value="843f026d5ee8add5c5c88bd0eb1149cf" onclick="javascript:attrOnclick(4);"><label for="inpChk1_843f026d5ee8add5c5c88bd0eb1149cf">비누/코튼</label></li>  
						
		    
						<li><input type="checkbox" id="inpChk1_810fae64628cf69d58cc3871203cbd50" name="attr_check4" value="810fae64628cf69d58cc3871203cbd50" onclick="javascript:attrOnclick(4);"><label for="inpChk1_810fae64628cf69d58cc3871203cbd50">너트/곡물/우디</label></li>  
						

					</ul>
			</div>	

		</div><!-- //속성항목 -->
	
					 					 
				<!-- //카테고리 -->
						

				<div class="search_box benefit">
					<div class="inner">
						<h4 class="tit_th">혜택<button class="btnMore">열기/닫기</button></h4>
						<ul class="list scrbar">
						
	

							<li><input type="checkbox" id="inpChk18" name="" value="BenefitAll" onclick="javascript:benefitAllclick();">
									<label for="inpChk18">전체</label><span></span></li>
							<li><input type="checkbox" id="inpChk19" name="benefit_check" value="CPN_YN" onclick="javascript:benefitOnclick(&#39;CPN_YN&#39;);"><label for="inpChk19">쿠폰상품</label></li>
							<li><input type="checkbox" id="inpChk20" name="benefit_check" value="DSCNT_YN" onclick="javascript:benefitOnclick(&#39;DSCNT_YN&#39;);">
								<label for="inpChk20">세일상품</label></li>
								<li>
									<input type="checkbox" id="inpChk21" name="benefit_check" value="ASSOC_PROMT_STD_CNT_1" onclick="javascript:benefitOnclick(&#39;ASSOC_PROMT_STD_CNT_1&#39;);">
									<label for="inpChk21">1+1</label>
								</li> 
								<li>
									<input type="checkbox" id="inpChk22" disabled="true" name="benefit_check" value="ASSOC_PROMT_STD_CNT_2" onclick="javascript:benefitOnclick(&#39;ASSOC_PROMT_STD_CNT_2&#39;);">
									<label for="inpChk22">2+1</label>
								</li>
							<li>
								<input type="checkbox" id="inpChk23" name="benefit_check" value="PRST_YN" onclick="javascript:benefitOnclick(&#39;PRST_YN&#39;);">
								<label for="inpChk23">증정상품</label>
							</li>
							<li>
								<input type="checkbox" id="inpChk24" name="benefit_check" value="FREE_DLV_YN" onclick="javascript:benefitOnclick(&#39;FREE_DLV_YN&#39;);">
								<label for="inpChk24">무료배송</label>
							</li>
			
		</ul>
	</div>
</div><!-- //혜택 -->
				
				
				<div class="search_box">
					<div class="inner">
						<h4 class="tit_th">가격대</h4>
						<div class="priceSearch">
						
					
	
						
							<input type="text" id="sale_below_price" name="sale_below_price" placeholder="최저가" value="" title=""><span>~</span>
							<input type="text" id="sale_over_price" name="sale_over_price" placeholder="최고가" value="" title="">
							<input type="submit" value="가격대 적용" title="가격대 적용" onclick="return Price_Search()">
							
							
							
						</div>
					</div>
				</div><!-- //가격대 -->
						

			</div>
			<!-- // 상품 속성 정보 검색 서비스 개선 -->


			<!-- 기획전 배너 영역 (2017-01-13 추가) -->
			<!-- 기획전 배너 수정 (2018-12-14 수정) -->
			
			
			

			<!-- 원래꺼 -->
			
			
				<p class="cate_info_tx">전체
				 <span>
				364</span>개의 상품이 등록되어 있습니다.</p>
			
			<!-- bFirstSearch -->
			
			
			
			<!-- 상품 정렬 조건 영역 -->
			<div class="cate_align_box">
				<div class="align_sort"> 
					<ul>
						<li class="on"><a href="http://www.oliveyoung.co.kr/store/search/getSearchMain.do?query=%EB%A1%9C%EC%85%98#" value="RNK/DESC" onclick="doSorting(&#39;RNK/DESC&#39;);">인기순</a></li>
						<li><a href="http://www.oliveyoung.co.kr/store/search/getSearchMain.do?query=%EB%A1%9C%EC%85%98#" value="DATE/DESC" onclick="doSorting(&#39;DATE/DESC&#39;);">최근등록순</a></li>
						<li><a href="http://www.oliveyoung.co.kr/store/search/getSearchMain.do?query=%EB%A1%9C%EC%85%98#" value="SALE_QTY/DESC" onclick="doSorting(&#39;SALE_QTY/DESC&#39;);">판매수량순</a></li>
						

						<li><a href="http://www.oliveyoung.co.kr/store/search/getSearchMain.do?query=%EB%A1%9C%EC%85%98#" value="SALE_PRC/ASC" onclick="doSorting(&#39;SALE_PRC/ASC&#39;);">낮은 가격순</a></li>
						<li><a href="http://www.oliveyoung.co.kr/store/search/getSearchMain.do?query=%EB%A1%9C%EC%85%98#" value="SALE_PRC/DESC" onclick="doSorting(&#39;SALE_PRC/DESC&#39;);">높은 가격순</a></li>
					</ul>
				</div>
				<div class="count_sort tx_num">
					<span class="tx_view">VIEW</span>
					<ul>
						<li class="on">24</li>
						<li><a href="http://www.oliveyoung.co.kr/store/search/getSearchMain.do?query=%EB%A1%9C%EC%85%98#" title="36개씩 보기" onclick="javascript:ShowViewList(&#39;36&#39;);">36</a></li>
						<li><a href="http://www.oliveyoung.co.kr/store/search/getSearchMain.do?query=%EB%A1%9C%EC%85%98#" title="48개씩 보기" onclick="javascript:ShowViewList(&#39;48&#39;);">48</a></li>
					</ul>
				</div>
				<div class="type_sort">
					<button class="btn_thumb active">컬럼형식으로 보기</button>
					<button class="btn_list">리스트형식으로 보기</button>
				</div> 
			</div>
			<!--// 상품 정렬 조건 영역 -->  
			
			<!-- 카테고리 상품 리스트 --> 
			<!-- 컬럼형 리스트 -->
			<ul id="w_cate_prd_list" class="cate_prd_list"><!-- 1단형일 경우 클래스 list_type 추가 -->
				<li class="flag">
					<div class="prd_info ">
						<!-- 이미지 영역 -->
						<a href="javascript:common.link.moveGoodsDetail(&#39;A000000104007&#39;,&#39;1000001000100010001&#39;);" class="prd_thumb">
								<span class="thumb_flag best">베스트</span><!-- 베스트/신상 Flag | best : 베스트 / new : 신상 -->								
								<img src="./로션 검색 _ 올리브영_files/A00000010400702ko.jpg" onerror="this.src=&#39;http://image.oliveyoung.co.kr/pc-static-root/image/comm/noimg_550.gif&#39;;this.onerror=&#39;&#39;;" alt="이미지 썸네일">
						</a>
						<!--// 이미지 영역 -->
						<!-- 상품명 -->
						<div class="prd_name">
							<a href="javascript:common.link.moveGoodsDetail(&#39;A000000104007&#39;,&#39;1000001000100010001&#39;);">
								<span class="tx_brand">아벤느</span>
								<p class="tx_name">아벤느 젠틀 토닝 로션 200ml +100ml   기획</p>
							</a>							
						</div>
						<!--// 상품명  -->
						<!-- 찜버튼 -->
						<button class="btn_zzim jeem" data-ref-goodsno="A000000104007" onclick="zzimWebLog();">찜하기</button>
						<!--// 찜버튼 -->
						<!-- 상품가격 영역 -->
						<p class="prd_price">
							
								
									<span class="tx_org"><span class="tx_num">27,000</span>원</span>
									<span class="tx_cur"><span class="tx_num">21,600</span>원</span>
								
							
						</p>
						<!--// 상품가격 영역 -->
						<!-- 상품 쿠폰 및 플러스 추가 영역 -->
						<!-- icon 사이 공백으로 인해 다 붙여서 한줄로 만들것 -->
						<p class="prd_flag">
						    <span class="icon_flag sale">세일</span><span class="icon_flag coupon">쿠폰</span><span class="icon_flag gift">증정</span><span class="icon_flag delivery">오늘드림</span>
						</p>
						<!--// 상품 쿠폰 및 플러스 추가 영역 -->
						<!--  상품평 및 장바구니버튼 -->
						<p class="prd_point_area tx_num"><span class="review_point"><span class="point" style="width:100%">914</span></span>(914)</p>
						<p class="prd_btn_area"><button class="cartBtn" data-ref-goodsno="A000000104007" data-ref-dispcatno="1000001000100010001" data-ref-itemno="001" data-ref-cnt="0" data-ref-prstyn="Y">장바구니</button>
						<button class="btn_new_pop goodsList" onclick="javascript:common.link.moveGoodsDetailNew(&#39;A000000104007&#39;,&#39;1000001000100010001&#39;);">새창보기</button></p>
						
						<!-- // 상품평 및 장바구니버튼 -->
					</div>
				</li> 
			
						

									
				<li class="flag">
					<div class="prd_info ">
						<!-- 이미지 영역 -->
						<a href="javascript:common.link.moveGoodsDetail(&#39;A000000111024&#39;,&#39;1000001000300040001&#39;);" class="prd_thumb">
							
								<span class="thumb_flag best">베스트</span><!-- 베스트/신상 Flag | best : 베스트 / new : 신상 -->								
							
							
								<img src="./로션 검색 _ 올리브영_files/A00000011102402ko.jpg" onerror="this.src=&#39;http://image.oliveyoung.co.kr/pc-static-root/image/comm/noimg_550.gif&#39;;this.onerror=&#39;&#39;;" alt="이미지 썸네일">
							
														
						</a>
						<!--// 이미지 영역 -->
						<!-- 상품명 -->
						<div class="prd_name">
							<a href="javascript:common.link.moveGoodsDetail(&#39;A000000111024&#39;,&#39;1000001000300040001&#39;);">
								<span class="tx_brand">일리윤</span>
								<p class="tx_name">[온라인단독] 일리윤 세라마이드 아토로션 대용량 528ML</p>
							</a>							
						</div>
						<!--// 상품명  -->
						<!-- 찜버튼 -->
						<button class="btn_zzim jeem" data-ref-goodsno="A000000111024" onclick="zzimWebLog();">찜하기</button>
						<!--// 찜버튼 -->
						<!-- 상품가격 영역 -->
						<p class="prd_price">
							
								
									<span class="tx_org"><span class="tx_num">30,000</span>원</span>
									<span class="tx_cur"><span class="tx_num">14,900</span>원</span>
								
							
						</p>
						<!--// 상품가격 영역 -->
						<!-- 상품 쿠폰 및 플러스 추가 영역 -->
						<!-- icon 사이 공백으로 인해 다 붙여서 한줄로 만들것 -->
						<p class="prd_flag">
						    <span class="icon_flag sale">세일</span>
						</p>
						<!--// 상품 쿠폰 및 플러스 추가 영역 -->
						<!--  상품평 및 장바구니버튼 -->
						<p class="prd_point_area tx_num"><span class="review_point"><span class="point" style="width:100%">752</span></span>(752)</p>
						<p class="prd_btn_area"><button class="cartBtn" data-ref-goodsno="A000000111024" data-ref-dispcatno="1000001000300040001" data-ref-itemno="001" data-ref-cnt="0" data-ref-prstyn="N">장바구니</button>
						<button class="btn_new_pop goodsList" onclick="javascript:common.link.moveGoodsDetailNew(&#39;A000000111024&#39;,&#39;1000001000300040001&#39;);">새창보기</button></p>
						
						<!-- // 상품평 및 장바구니버튼 -->
					</div>
				</li> 
			
						

									
				<li class="flag">
					<div class="prd_info ">
						<!-- 이미지 영역 -->
						<a href="javascript:common.link.moveGoodsDetail(&#39;A000000128136&#39;,&#39;1000001000100010004&#39;);" class="prd_thumb">
							
								<span class="thumb_flag best">베스트</span><!-- 베스트/신상 Flag | best : 베스트 / new : 신상 -->								
							
							
								<img src="./로션 검색 _ 올리브영_files/A00000012813601ko.jpg" onerror="this.src=&#39;http://image.oliveyoung.co.kr/pc-static-root/image/comm/noimg_550.gif&#39;;this.onerror=&#39;&#39;;" alt="이미지 썸네일">
							
														
						</a>
						<!--// 이미지 영역 -->
						<!-- 상품명 -->
						<div class="prd_name">
							<a href="javascript:common.link.moveGoodsDetail(&#39;A000000128136&#39;,&#39;1000001000100010004&#39;);">
								<span class="tx_brand">닥터자르트</span>
								<p class="tx_name">[닥터자르트] 컨트롤에이 티트리먼트 듀오세트 (티트리 토너+모이스처라이저)</p>
							</a>							
						</div>
						<!--// 상품명  -->
						<!-- 찜버튼 -->
						<button class="btn_zzim jeem" data-ref-goodsno="A000000128136" onclick="zzimWebLog();">찜하기</button>
						<!--// 찜버튼 -->
						<!-- 상품가격 영역 -->
						<p class="prd_price">
							
								
									<span class="tx_org"><span class="tx_num">43,000</span>원</span>
									<span class="tx_cur"><span class="tx_num">30,960</span>원</span>
								
							
						</p>
						<!--// 상품가격 영역 -->
						<!-- 상품 쿠폰 및 플러스 추가 영역 -->
						<!-- icon 사이 공백으로 인해 다 붙여서 한줄로 만들것 -->
						<p class="prd_flag">
						    <span class="icon_flag sale">세일</span><span class="icon_flag coupon">쿠폰</span>
						</p>
						<!--// 상품 쿠폰 및 플러스 추가 영역 -->
						<!--  상품평 및 장바구니버튼 -->
						<p class="prd_point_area tx_num"><span class="review_point"><span class="point" style="width:90%">7</span></span>(7)</p>
						<p class="prd_btn_area"><button class="cartBtn" data-ref-goodsno="A000000128136" data-ref-dispcatno="1000001000100010004" data-ref-itemno="001" data-ref-cnt="0" data-ref-prstyn="N">장바구니</button>
						<button class="btn_new_pop goodsList" onclick="javascript:common.link.moveGoodsDetailNew(&#39;A000000128136&#39;,&#39;1000001000100010004&#39;);">새창보기</button></p>
						
						<!-- // 상품평 및 장바구니버튼 -->
					</div>
				</li> 
			
						

									
				<li class="flag">
					<div class="prd_info ">
						<!-- 이미지 영역 -->
						<a href="javascript:common.link.moveGoodsDetail(&#39;A000000106411&#39;,&#39;1000001000100010001&#39;);" class="prd_thumb">
							
								<span class="thumb_flag best">베스트</span><!-- 베스트/신상 Flag | best : 베스트 / new : 신상 -->								
							
							
								<img src="./로션 검색 _ 올리브영_files/A00000010641103ko.jpg" onerror="this.src=&#39;http://image.oliveyoung.co.kr/pc-static-root/image/comm/noimg_550.gif&#39;;this.onerror=&#39;&#39;;" alt="이미지 썸네일">
							
														
						</a>
						<!--// 이미지 영역 -->
						<!-- 상품명 -->
						<div class="prd_name">
							<a href="javascript:common.link.moveGoodsDetail(&#39;A000000106411&#39;,&#39;1000001000100010001&#39;);">
								<span class="tx_brand">랩시리즈</span>
								<p class="tx_name">랩시리즈 레스큐 워터 로션 기획세트 (200ml+50ml+50ml)</p>
							</a>							
						</div>
						<!--// 상품명  -->
						<!-- 찜버튼 -->
						<button class="btn_zzim jeem" data-ref-goodsno="A000000106411" onclick="zzimWebLog();">찜하기</button>
						<!--// 찜버튼 -->
						<!-- 상품가격 영역 -->
						<p class="prd_price">
							
								
									<span class="tx_org"><span class="tx_num">51,000</span>원</span>
									<span class="tx_cur"><span class="tx_num">45,900</span>원</span>
								
							
						</p>
						<!--// 상품가격 영역 -->
						<!-- 상품 쿠폰 및 플러스 추가 영역 -->
						<!-- icon 사이 공백으로 인해 다 붙여서 한줄로 만들것 -->
						<p class="prd_flag">
						    <span class="icon_flag coupon">쿠폰</span><span class="icon_flag gift">증정</span>
						</p>
						<!--// 상품 쿠폰 및 플러스 추가 영역 -->
						<!--  상품평 및 장바구니버튼 -->
						<p class="prd_point_area tx_num"><span class="review_point"><span class="point" style="width:100%">116</span></span>(116)</p>
						<p class="prd_btn_area"><button class="cartBtn" data-ref-goodsno="A000000106411" data-ref-dispcatno="1000001000100010001" data-ref-itemno="001" data-ref-cnt="0" data-ref-prstyn="Y">장바구니</button>
						<button class="btn_new_pop goodsList" onclick="javascript:common.link.moveGoodsDetailNew(&#39;A000000106411&#39;,&#39;1000001000100010001&#39;);">새창보기</button></p>
						
						<!-- // 상품평 및 장바구니버튼 -->
					</div>
				</li> 
										
				</ul>			
			
						

			
			<ul id="w_cate_prd_list" class="cate_prd_list"><!-- 1단형일 경우 클래스 list_type 추가 -->
									
				<li class="flag">
					<div class="prd_info ">
						<!-- 이미지 영역 -->
						<a href="javascript:common.link.moveGoodsDetail(&#39;A000000012673&#39;,&#39;1000001000300040001&#39;);" class="prd_thumb">
							
								<span class="thumb_flag best">베스트</span><!-- 베스트/신상 Flag | best : 베스트 / new : 신상 -->								
							
							
								<img src="./로션 검색 _ 올리브영_files/A00000001267307ko.jpg" onerror="this.src=&#39;http://image.oliveyoung.co.kr/pc-static-root/image/comm/noimg_550.gif&#39;;this.onerror=&#39;&#39;;" alt="이미지 썸네일">
							
														
						</a>
						<!--// 이미지 영역 -->
						<!-- 상품명 -->
						<div class="prd_name">
							<a href="javascript:common.link.moveGoodsDetail(&#39;A000000012673&#39;,&#39;1000001000300040001&#39;);">
								<span class="tx_brand">더마비</span>
								<p class="tx_name">더마비 데일리 모이스처 바디로션 400ml</p>
							</a>							
						</div>
						<!--// 상품명  -->
						<!-- 찜버튼 -->
						<button class="btn_zzim jeem" data-ref-goodsno="A000000012673" onclick="zzimWebLog();">찜하기</button>
						<!--// 찜버튼 -->
						<!-- 상품가격 영역 -->
						<p class="prd_price">
							
								
									<span class="tx_org"><span class="tx_num">15,000</span>원</span>
									<span class="tx_cur"><span class="tx_num">10,500</span>원</span>
								
							
						</p>
						<!--// 상품가격 영역 -->
						<!-- 상품 쿠폰 및 플러스 추가 영역 -->
						<!-- icon 사이 공백으로 인해 다 붙여서 한줄로 만들것 -->
						<p class="prd_flag">
						    <span class="icon_flag sale">세일</span><span class="icon_flag delivery">오늘드림</span>
						</p>
						<!--// 상품 쿠폰 및 플러스 추가 영역 -->
						<!--  상품평 및 장바구니버튼 -->
						<p class="prd_point_area tx_num"><span class="review_point"><span class="point" style="width:100%">2085</span></span>(2085)</p>
						<p class="prd_btn_area"><button class="cartBtn" data-ref-goodsno="A000000012673" data-ref-dispcatno="1000001000300040001" data-ref-itemno="001" data-ref-cnt="0" data-ref-prstyn="N">장바구니</button>
						<button class="btn_new_pop goodsList" onclick="javascript:common.link.moveGoodsDetailNew(&#39;A000000012673&#39;,&#39;1000001000300040001&#39;);">새창보기</button></p>
						
						<!-- // 상품평 및 장바구니버튼 -->
					</div>
				</li> 
			
						

									
				<li class="flag">
					<div class="prd_info ">
						<!-- 이미지 영역 -->
						<a href="javascript:common.link.moveGoodsDetail(&#39;A000000129002&#39;,&#39;1000001000100010002&#39;);" class="prd_thumb">
							
								<span class="thumb_flag best">베스트</span><!-- 베스트/신상 Flag | best : 베스트 / new : 신상 -->								
							
							
								<img src="./로션 검색 _ 올리브영_files/A00000012900201ko.jpg" onerror="this.src=&#39;http://image.oliveyoung.co.kr/pc-static-root/image/comm/noimg_550.gif&#39;;this.onerror=&#39;&#39;;" alt="이미지 썸네일">
							
														
						</a>
						<!--// 이미지 영역 -->
						<!-- 상품명 -->
						<div class="prd_name">
							<a href="javascript:common.link.moveGoodsDetail(&#39;A000000129002&#39;,&#39;1000001000100010002&#39;);">
								<span class="tx_brand">에스트라</span>
								<p class="tx_name">에스트라 아토베리어365 로션 150ml</p>
							</a>							
						</div>
						<!--// 상품명  -->
						<!-- 찜버튼 -->
						<button class="btn_zzim jeem" data-ref-goodsno="A000000129002" onclick="zzimWebLog();">찜하기</button>
						<!--// 찜버튼 -->
						<!-- 상품가격 영역 -->
						<p class="prd_price">
							
								
									<span class="tx_org"><span class="tx_num">28,000</span>원</span>
									<span class="tx_cur"><span class="tx_num">22,400</span>원</span>
								
							
						</p>
						<!--// 상품가격 영역 -->
						<!-- 상품 쿠폰 및 플러스 추가 영역 -->
						<!-- icon 사이 공백으로 인해 다 붙여서 한줄로 만들것 -->
						<p class="prd_flag">
						    <span class="icon_flag coupon">쿠폰</span>
						</p>
						<!--// 상품 쿠폰 및 플러스 추가 영역 -->
						<!--  상품평 및 장바구니버튼 -->
						<p class="prd_point_area tx_num"><span class="review_point"><span class="point" style="width:100%">2</span></span>(2)</p>
						<p class="prd_btn_area"><button class="cartBtn" data-ref-goodsno="A000000129002" data-ref-dispcatno="1000001000100010002" data-ref-itemno="001" data-ref-cnt="0" data-ref-prstyn="N">장바구니</button>
						<button class="btn_new_pop goodsList" onclick="javascript:common.link.moveGoodsDetailNew(&#39;A000000129002&#39;,&#39;1000001000100010002&#39;);">새창보기</button></p>
						
						<!-- // 상품평 및 장바구니버튼 -->
					</div>
				</li> 
			
						

									
				<li class="flag">
					<div class="prd_info ">
						<!-- 이미지 영역 -->
						<a href="javascript:common.link.moveGoodsDetail(&#39;A000000121824&#39;,&#39;1000001000100070003&#39;);" class="prd_thumb">
							
								<span class="thumb_flag best">베스트</span><!-- 베스트/신상 Flag | best : 베스트 / new : 신상 -->								
							
							
								<img src="./로션 검색 _ 올리브영_files/A00000012182404ko.jpg" onerror="this.src=&#39;http://image.oliveyoung.co.kr/pc-static-root/image/comm/noimg_550.gif&#39;;this.onerror=&#39;&#39;;" alt="이미지 썸네일">
							
														
						</a>
						<!--// 이미지 영역 -->
						<!-- 상품명 -->
						<div class="prd_name">
							<a href="javascript:common.link.moveGoodsDetail(&#39;A000000121824&#39;,&#39;1000001000100070003&#39;);">
								<span class="tx_brand">라운드어라운드</span>
								<p class="tx_name">라운드어라운드 그린티 시카 선로션 100ml</p>
							</a>							
						</div>
						<!--// 상품명  -->
						<!-- 찜버튼 -->
						<button class="btn_zzim jeem" data-ref-goodsno="A000000121824" onclick="zzimWebLog();">찜하기</button>
						<!--// 찜버튼 -->
						<!-- 상품가격 영역 -->
						<p class="prd_price">
							
								
									<span class="tx_org"><span class="tx_num">20,000</span>원</span>
									<span class="tx_cur"><span class="tx_num">16,000</span>원</span>
								
							
						</p>
						<!--// 상품가격 영역 -->
						<!-- 상품 쿠폰 및 플러스 추가 영역 -->
						<!-- icon 사이 공백으로 인해 다 붙여서 한줄로 만들것 -->
						<p class="prd_flag">
						    <span class="icon_flag sale">세일</span><span class="icon_flag delivery">오늘드림</span>
						</p>
						<!--// 상품 쿠폰 및 플러스 추가 영역 -->
						<!--  상품평 및 장바구니버튼 -->
						<p class="prd_point_area tx_num"><span class="review_point"><span class="point" style="width:100%">167</span></span>(167)</p>
						<p class="prd_btn_area"><button class="cartBtn" data-ref-goodsno="A000000121824" data-ref-dispcatno="1000001000100070003" data-ref-itemno="001" data-ref-cnt="0" data-ref-prstyn="N">장바구니</button>
						<button class="btn_new_pop goodsList" onclick="javascript:common.link.moveGoodsDetailNew(&#39;A000000121824&#39;,&#39;1000001000100070003&#39;);">새창보기</button></p>
						
						<!-- // 상품평 및 장바구니버튼 -->
					</div>
				</li> 
			
						

									
				<li class="flag">
					<div class="prd_info ">
						<!-- 이미지 영역 -->
						<a href="javascript:common.link.moveGoodsDetail(&#39;A000000127574&#39;,&#39;1000001000100010001&#39;);" class="prd_thumb">
							
								<span class="thumb_flag best">베스트</span><!-- 베스트/신상 Flag | best : 베스트 / new : 신상 -->								
							
							
								<img src="./로션 검색 _ 올리브영_files/A00000012757401ko.jpg" onerror="this.src=&#39;http://image.oliveyoung.co.kr/pc-static-root/image/comm/noimg_550.gif&#39;;this.onerror=&#39;&#39;;" alt="이미지 썸네일">
							
														
						</a>
						<!--// 이미지 영역 -->
						<!-- 상품명 -->
						<div class="prd_name">
							<a href="javascript:common.link.moveGoodsDetail(&#39;A000000127574&#39;,&#39;1000001000100010001&#39;);">
								<span class="tx_brand">아벤느</span>
								<p class="tx_name">아벤느 이드랑스 에센스 인 로션 200ml +100ml 기획[파란에센스]</p>
							</a>							
						</div>
						<!--// 상품명  -->
						<!-- 찜버튼 -->
						<button class="btn_zzim jeem" data-ref-goodsno="A000000127574" onclick="zzimWebLog();">찜하기</button>
						<!--// 찜버튼 -->
						<!-- 상품가격 영역 -->
						<p class="prd_price">
							
								
									<span class="tx_org"><span class="tx_num">28,000</span>원</span>
									<span class="tx_cur"><span class="tx_num">25,200</span>원</span>
								
							
						</p>
						<!--// 상품가격 영역 -->
						<!-- 상품 쿠폰 및 플러스 추가 영역 -->
						<!-- icon 사이 공백으로 인해 다 붙여서 한줄로 만들것 -->
						<p class="prd_flag">
						    <span class="icon_flag coupon">쿠폰</span><span class="icon_flag gift">증정</span><span class="icon_flag delivery">오늘드림</span>
						</p>
						<!--// 상품 쿠폰 및 플러스 추가 영역 -->
						<!--  상품평 및 장바구니버튼 -->
						<p class="prd_point_area tx_num"><span class="review_point"><span class="point" style="width:100%">2</span></span>(2)</p>
						<p class="prd_btn_area"><button class="cartBtn" data-ref-goodsno="A000000127574" data-ref-dispcatno="1000001000100010001" data-ref-itemno="001" data-ref-cnt="0" data-ref-prstyn="Y">장바구니</button>
						<button class="btn_new_pop goodsList" onclick="javascript:common.link.moveGoodsDetailNew(&#39;A000000127574&#39;,&#39;1000001000100010001&#39;);">새창보기</button></p>
						
						<!-- // 상품평 및 장바구니버튼 -->
					</div>
				</li> 
										
				</ul>			
			
						

			
			<ul id="w_cate_prd_list" class="cate_prd_list"><!-- 1단형일 경우 클래스 list_type 추가 -->
									
				<li class="flag">
					<div class="prd_info ">
						<!-- 이미지 영역 -->
						<a href="javascript:common.link.moveGoodsDetail(&#39;A000000128911&#39;,&#39;1000001000100010002&#39;);" class="prd_thumb">
							
								<span class="thumb_flag best">베스트</span><!-- 베스트/신상 Flag | best : 베스트 / new : 신상 -->								
							
							
								<img src="./로션 검색 _ 올리브영_files/A00000012891101ko.jpg" onerror="this.src=&#39;http://image.oliveyoung.co.kr/pc-static-root/image/comm/noimg_550.gif&#39;;this.onerror=&#39;&#39;;" alt="이미지 썸네일">
							
														
						</a>
						<!--// 이미지 영역 -->
						<!-- 상품명 -->
						<div class="prd_name">
							<a href="javascript:common.link.moveGoodsDetail(&#39;A000000128911&#39;,&#39;1000001000100010002&#39;);">
								<span class="tx_brand">라운드랩</span>
								<p class="tx_name">라운드랩 1025 독도 로션 증정 기획세트</p>
							</a>							
						</div>
						<!--// 상품명  -->
						<!-- 찜버튼 -->
						<button class="btn_zzim jeem" data-ref-goodsno="A000000128911" onclick="zzimWebLog();">찜하기</button>
						<!--// 찜버튼 -->
						<!-- 상품가격 영역 -->
						<p class="prd_price">
							
								
									<span class="tx_cur"><span class="tx_num">20,000</span>원</span>
								
							
						</p>
						<!--// 상품가격 영역 -->
						<!-- 상품 쿠폰 및 플러스 추가 영역 -->
						<!-- icon 사이 공백으로 인해 다 붙여서 한줄로 만들것 -->
						<p class="prd_flag">
						    
						</p>
						<!--// 상품 쿠폰 및 플러스 추가 영역 -->
						<!--  상품평 및 장바구니버튼 -->
						<p class="prd_point_area tx_num"><span class="review_point"><span class="point" style="width:0%">0</span></span>(0)</p>
						<p class="prd_btn_area"><button class="cartBtn" data-ref-goodsno="A000000128911" data-ref-dispcatno="1000001000100010002" data-ref-itemno="001" data-ref-cnt="0" data-ref-prstyn="N">장바구니</button>
						<button class="btn_new_pop goodsList" onclick="javascript:common.link.moveGoodsDetailNew(&#39;A000000128911&#39;,&#39;1000001000100010002&#39;);">새창보기</button></p>
						
						<!-- // 상품평 및 장바구니버튼 -->
					</div>
				</li> 
			
						

									
				<li class="flag">
					<div class="prd_info ">
						<!-- 이미지 영역 -->
						<a href="javascript:common.link.moveGoodsDetail(&#39;A000000128697&#39;,&#39;1000001000100010002&#39;);" class="prd_thumb">
							
							
								<img src="./로션 검색 _ 올리브영_files/A00000012869703ko.jpg" onerror="this.src=&#39;http://image.oliveyoung.co.kr/pc-static-root/image/comm/noimg_550.gif&#39;;this.onerror=&#39;&#39;;" alt="이미지 썸네일">
							
														
						</a>
						<!--// 이미지 영역 -->
						<!-- 상품명 -->
						<div class="prd_name">
							<a href="javascript:common.link.moveGoodsDetail(&#39;A000000128697&#39;,&#39;1000001000100010002&#39;);">
								<span class="tx_brand">랩시리즈</span>
								<p class="tx_name">랩시리즈 New 에이지 레스큐 훼이스 로션 50ml 기획세트 (+워터로션 50ml)</p>
							</a>							
						</div>
						<!--// 상품명  -->
						<!-- 찜버튼 -->
						<button class="btn_zzim jeem" data-ref-goodsno="A000000128697" onclick="zzimWebLog();">찜하기</button>
						<!--// 찜버튼 -->
						<!-- 상품가격 영역 -->
						<p class="prd_price">
							
								
									<span class="tx_org"><span class="tx_num">69,000</span>원</span>
									<span class="tx_cur"><span class="tx_num">62,100</span>원</span>
								
							
						</p>
						<!--// 상품가격 영역 -->
						<!-- 상품 쿠폰 및 플러스 추가 영역 -->
						<!-- icon 사이 공백으로 인해 다 붙여서 한줄로 만들것 -->
						<p class="prd_flag">
						    <span class="icon_flag coupon">쿠폰</span><span class="icon_flag gift">증정</span>
						</p>
						<!--// 상품 쿠폰 및 플러스 추가 영역 -->
						<!--  상품평 및 장바구니버튼 -->
						<p class="prd_point_area tx_num"><span class="review_point"><span class="point" style="width:80%">2</span></span>(2)</p>
						<p class="prd_btn_area"><button class="cartBtn" data-ref-goodsno="A000000128697" data-ref-dispcatno="1000001000100010002" data-ref-itemno="001" data-ref-cnt="0" data-ref-prstyn="Y">장바구니</button>
						<button class="btn_new_pop goodsList" onclick="javascript:common.link.moveGoodsDetailNew(&#39;A000000128697&#39;,&#39;1000001000100010002&#39;);">새창보기</button></p>
						
						<!-- // 상품평 및 장바구니버튼 -->
					</div>
				</li> 
			
						

									
				<li class="flag">
					<div class="prd_info ">
						<!-- 이미지 영역 -->
						<a href="javascript:common.link.moveGoodsDetail(&#39;A000000014359&#39;,&#39;1000001000100040005&#39;);" class="prd_thumb">
							
							
								<img src="./로션 검색 _ 올리브영_files/A00000001435903ko.jpg" onerror="this.src=&#39;http://image.oliveyoung.co.kr/pc-static-root/image/comm/noimg_550.gif&#39;;this.onerror=&#39;&#39;;" alt="이미지 썸네일">
							
														
						</a>
						<!--// 이미지 영역 -->
						<!-- 상품명 -->
						<div class="prd_name">
							<a href="javascript:common.link.moveGoodsDetail(&#39;A000000014359&#39;,&#39;1000001000100040005&#39;);">
								<span class="tx_brand">유리아쥬</span>
								<p class="tx_name">유리아쥬 레 데마끼앙 250ml 1+1 기획</p>
							</a>							
						</div>
						<!--// 상품명  -->
						<!-- 찜버튼 -->
						<button class="btn_zzim jeem" data-ref-goodsno="A000000014359" onclick="zzimWebLog();">찜하기</button>
						<!--// 찜버튼 -->
						<!-- 상품가격 영역 -->
						<p class="prd_price">
							
								
									<span class="tx_org"><span class="tx_num">28,000</span>원</span>
									<span class="tx_cur"><span class="tx_num">23,800</span>원</span>
								
							
						</p>
						<!--// 상품가격 영역 -->
						<!-- 상품 쿠폰 및 플러스 추가 영역 -->
						<!-- icon 사이 공백으로 인해 다 붙여서 한줄로 만들것 -->
						<p class="prd_flag">
						    <span class="icon_flag coupon">쿠폰</span><span class="icon_flag gift">증정</span><span class="icon_flag delivery">오늘드림</span>
						</p>
						<!--// 상품 쿠폰 및 플러스 추가 영역 -->
						<!--  상품평 및 장바구니버튼 -->
						<p class="prd_point_area tx_num"><span class="review_point"><span class="point" style="width:100%">139</span></span>(139)</p>
						<p class="prd_btn_area"><button class="cartBtn" data-ref-goodsno="A000000014359" data-ref-dispcatno="1000001000100040005" data-ref-itemno="001" data-ref-cnt="0" data-ref-prstyn="Y">장바구니</button>
						<button class="btn_new_pop goodsList" onclick="javascript:common.link.moveGoodsDetailNew(&#39;A000000014359&#39;,&#39;1000001000100040005&#39;);">새창보기</button></p>
						
						<!-- // 상품평 및 장바구니버튼 -->
					</div>
				</li> 
			
						

									
				<li class="flag">
					<div class="prd_info ">
						<!-- 이미지 영역 -->
						<a href="javascript:common.link.moveGoodsDetail(&#39;A000000128616&#39;,&#39;1000001000100010001&#39;);" class="prd_thumb">
							
							
								<img src="./로션 검색 _ 올리브영_files/A00000012861601ko.jpg" onerror="this.src=&#39;http://image.oliveyoung.co.kr/pc-static-root/image/comm/noimg_550.gif&#39;;this.onerror=&#39;&#39;;" alt="이미지 썸네일">
							
														
						</a>
						<!--// 이미지 영역 -->
						<!-- 상품명 -->
						<div class="prd_name">
							<a href="javascript:common.link.moveGoodsDetail(&#39;A000000128616&#39;,&#39;1000001000100010001&#39;);">
								<span class="tx_brand">로벡틴</span>
								<p class="tx_name">[온라인단독] 로벡틴 트리트먼트 로션 180ml + 추가 100ml 기획팩</p>
							</a>							
						</div>
						<!--// 상품명  -->
						<!-- 찜버튼 -->
						<button class="btn_zzim jeem" data-ref-goodsno="A000000128616" onclick="zzimWebLog();">찜하기</button>
						<!--// 찜버튼 -->
						<!-- 상품가격 영역 -->
						<p class="prd_price">
							
								
									<span class="tx_org"><span class="tx_num">29,000</span>원</span>
									<span class="tx_cur"><span class="tx_num">26,100</span>원</span>
								
							
						</p>
						<!--// 상품가격 영역 -->
						<!-- 상품 쿠폰 및 플러스 추가 영역 -->
						<!-- icon 사이 공백으로 인해 다 붙여서 한줄로 만들것 -->
						<p class="prd_flag">
						    <span class="icon_flag sale">세일</span>
						</p>
						<!--// 상품 쿠폰 및 플러스 추가 영역 -->
						<!--  상품평 및 장바구니버튼 -->
						<p class="prd_point_area tx_num"><span class="review_point"><span class="point" style="width:0%">0</span></span>(0)</p>
						<p class="prd_btn_area"><button class="cartBtn" data-ref-goodsno="A000000128616" data-ref-dispcatno="1000001000100010001" data-ref-itemno="001" data-ref-cnt="0" data-ref-prstyn="N">장바구니</button>
						<button class="btn_new_pop goodsList" onclick="javascript:common.link.moveGoodsDetailNew(&#39;A000000128616&#39;,&#39;1000001000100010001&#39;);">새창보기</button></p>
						
						<!-- // 상품평 및 장바구니버튼 -->
					</div>
				</li> 
										
				</ul>			
			
						

			
			<ul id="w_cate_prd_list" class="cate_prd_list"><!-- 1단형일 경우 클래스 list_type 추가 -->
									
				<li class="flag">
					<div class="prd_info ">
						<!-- 이미지 영역 -->
						<a href="javascript:common.link.moveGoodsDetail(&#39;A000000010481&#39;,&#39;1000001000100010001&#39;);" class="prd_thumb">
							
							
								<img src="./로션 검색 _ 올리브영_files/A00000001048104ko.jpg" onerror="this.src=&#39;http://image.oliveyoung.co.kr/pc-static-root/image/comm/noimg_550.gif&#39;;this.onerror=&#39;&#39;;" alt="이미지 썸네일">
							
														
						</a>
						<!--// 이미지 영역 -->
						<!-- 상품명 -->
						<div class="prd_name">
							<a href="javascript:common.link.moveGoodsDetail(&#39;A000000010481&#39;,&#39;1000001000100010001&#39;);">
								<span class="tx_brand">라로슈포제</span>
								<p class="tx_name">라로슈포제 똘러리앙 더모 수딩 하이드레이팅 토너 [200ml]</p>
							</a>							
						</div>
						<!--// 상품명  -->
						<!-- 찜버튼 -->
						<button class="btn_zzim jeem" data-ref-goodsno="A000000010481" onclick="zzimWebLog();">찜하기</button>
						<!--// 찜버튼 -->
						<!-- 상품가격 영역 -->
						<p class="prd_price">
							<span class="tx_org"><span class="tx_num">24,000</span>원</span>
							<span class="tx_cur"><span class="tx_num">20,400</span>원</span>
						</p>
						<!--// 상품가격 영역 -->
						<!-- 상품 쿠폰 및 플러스 추가 영역 -->
						<!-- icon 사이 공백으로 인해 다 붙여서 한줄로 만들것 -->
						<p class="prd_flag">
						    <span class="icon_flag sale">세일</span><span class="icon_flag delivery">오늘드림</span>
						</p>
						<!--// 상품 쿠폰 및 플러스 추가 영역 -->
						<!--  상품평 및 장바구니버튼 -->
						<p class="prd_point_area tx_num"><span class="review_point"><span class="point" style="width:100%">255</span></span>(255)</p>
						<p class="prd_btn_area"><button class="cartBtn" data-ref-goodsno="A000000010481" data-ref-dispcatno="1000001000100010001" data-ref-itemno="001" data-ref-cnt="0" data-ref-prstyn="N">장바구니</button>
						<button class="btn_new_pop goodsList" onclick="javascript:common.link.moveGoodsDetailNew(&#39;A000000010481&#39;,&#39;1000001000100010001&#39;);">새창보기</button></p>
						
						<!-- // 상품평 및 장바구니버튼 -->
					</div>
				</li> 
				<li class="flag">
					<div class="prd_info ">
						<!-- 이미지 영역 -->
						<a href="javascript:common.link.moveGoodsDetail(&#39;A000000121268&#39;,&#39;1000001000100010002&#39;);" class="prd_thumb">
							<img src="./로션 검색 _ 올리브영_files/A00000012126802ko.jpg" onerror="this.src=&#39;http://image.oliveyoung.co.kr/pc-static-root/image/comm/noimg_550.gif&#39;;this.onerror=&#39;&#39;;" alt="이미지 썸네일">
						</a>
						<!--// 이미지 영역 -->
						<!-- 상품명 -->
						<div class="prd_name">
							<a href="javascript:common.link.moveGoodsDetail(&#39;A000000121268&#39;,&#39;1000001000100010002&#39;);">
								<span class="tx_brand">싸이닉</span>
								<p class="tx_name">싸이닉 더심플데일리로션 145ml</p>
							</a>							
						</div>
						<!--// 상품명  -->
						<!-- 찜버튼 -->
						<button class="btn_zzim jeem" data-ref-goodsno="A000000121268" onclick="zzimWebLog();">찜하기</button>
						<!--// 찜버튼 -->
						<!-- 상품가격 영역 -->
						<p class="prd_price">
							<span class="tx_org"><span class="tx_num">18,000</span>원</span>
							<span class="tx_cur"><span class="tx_num">9,900</span>원</span>
						</p>
						<!--// 상품가격 영역 -->
						<!-- 상품 쿠폰 및 플러스 추가 영역 -->
						<!-- icon 사이 공백으로 인해 다 붙여서 한줄로 만들것 -->
						<p class="prd_flag">
						    <span class="icon_flag sale">세일</span>
						</p>
						<!--// 상품 쿠폰 및 플러스 추가 영역 -->
						<!--  상품평 및 장바구니버튼 -->
						<p class="prd_point_area tx_num"><span class="review_point"><span class="point" style="width:90%">73</span></span>(73)</p>
						<p class="prd_btn_area"><button class="cartBtn" data-ref-goodsno="A000000121268" data-ref-dispcatno="1000001000100010002" data-ref-itemno="001" data-ref-cnt="0" data-ref-prstyn="N">장바구니</button>
						<button class="btn_new_pop goodsList" onclick="javascript:common.link.moveGoodsDetailNew(&#39;A000000121268&#39;,&#39;1000001000100010002&#39;);">새창보기</button></p>
						<!-- // 상품평 및 장바구니버튼 -->
					</div>
				</li> 
				<li class="flag">
					<div class="prd_info ">
						<!-- 이미지 영역 -->
						<a href="javascript:common.link.moveGoodsDetail(&#39;A000000015652&#39;,&#39;1000001000100010004&#39;);" class="prd_thumb">
							<img src="./로션 검색 _ 올리브영_files/A00000001565205ko.jpg" onerror="this.src=&#39;http://image.oliveyoung.co.kr/pc-static-root/image/comm/noimg_550.gif&#39;;this.onerror=&#39;&#39;;" alt="이미지 썸네일">
						</a>
						<!--// 이미지 영역 -->
						<!-- 상품명 -->
						<div class="prd_name">
							<a href="javascript:common.link.moveGoodsDetail(&#39;A000000015652&#39;,&#39;1000001000100010004&#39;);">
								<span class="tx_brand">아벤느</span>
								<p class="tx_name">아벤느 CPI 스킨 리커버리 크림 노멀 50ml 기획 (젠틀 토닝 로션 100ml 증정)</p>
							</a>							
						</div>
						<!--// 상품명  -->
						<!-- 찜버튼 -->
						<button class="btn_zzim jeem" data-ref-goodsno="A000000015652" onclick="zzimWebLog();">찜하기</button>
						<!--// 찜버튼 -->
						<!-- 상품가격 영역 -->
						<p class="prd_price">
							<span class="tx_org"><span class="tx_num">28,000</span>원</span>
							<span class="tx_cur"><span class="tx_num">25,200</span>원</span>
						</p>
						<!--// 상품가격 영역 -->
						<!-- 상품 쿠폰 및 플러스 추가 영역 -->
						<!-- icon 사이 공백으로 인해 다 붙여서 한줄로 만들것 -->
						<p class="prd_flag">
						    <span class="icon_flag sale">세일</span><span class="icon_flag gift">증정</span><span class="icon_flag delivery">오늘드림</span>
						</p>
						<!--// 상품 쿠폰 및 플러스 추가 영역 -->
						<!--  상품평 및 장바구니버튼 -->
						<p class="prd_point_area tx_num"><span class="review_point"><span class="point" style="width:100%">79</span></span>(79)</p>
						<p class="prd_btn_area"><button class="cartBtn" data-ref-goodsno="A000000015652" data-ref-dispcatno="1000001000100010004" data-ref-itemno="001" data-ref-cnt="0" data-ref-prstyn="Y">장바구니</button>
						<button class="btn_new_pop goodsList" onclick="javascript:common.link.moveGoodsDetailNew(&#39;A000000015652&#39;,&#39;1000001000100010004&#39;);">새창보기</button></p>
						
						<!-- // 상품평 및 장바구니버튼 -->
					</div>
				</li> 
				<li class="flag">
					<div class="prd_info ">
						<!-- 이미지 영역 -->
						<a href="javascript:common.link.moveGoodsDetail(&#39;A000000112805&#39;,&#39;1000001000100010002&#39;);" class="prd_thumb">
							<img src="./로션 검색 _ 올리브영_files/A00000011280501ko.jpg" onerror="this.src=&#39;http://image.oliveyoung.co.kr/pc-static-root/image/comm/noimg_550.gif&#39;;this.onerror=&#39;&#39;;" alt="이미지 썸네일">
						</a>
						<!--// 이미지 영역 -->
						<!-- 상품명 -->
						<div class="prd_name">
							<a href="javascript:common.link.moveGoodsDetail(&#39;A000000112805&#39;,&#39;1000001000100010002&#39;);">
								<span class="tx_brand">아벤느</span>
								<p class="tx_name">아벤느 트릭세라 뉴트리-플루이드 로션 200ml</p>
							</a>							
						</div>
						<!--// 상품명  -->
						<!-- 찜버튼 -->
						<button class="btn_zzim jeem" data-ref-goodsno="A000000112805" onclick="zzimWebLog();">찜하기</button>
						<!--// 찜버튼 -->
						<!-- 상품가격 영역 -->
						<p class="prd_price">
							<span class="tx_cur"><span class="tx_num">33,000</span>원</span>
						</p>
						<!--// 상품가격 영역 -->
						<!-- 상품 쿠폰 및 플러스 추가 영역 -->
						<!-- icon 사이 공백으로 인해 다 붙여서 한줄로 만들것 -->
						<p class="prd_flag">
						    <span class="icon_flag gift">증정</span><span class="icon_flag delivery">오늘드림</span>
						</p>
						<!--// 상품 쿠폰 및 플러스 추가 영역 -->
						<!--  상품평 및 장바구니버튼 -->
						<p class="prd_point_area tx_num"><span class="review_point"><span class="point" style="width:90%">16</span></span>(16)</p>
						<p class="prd_btn_area"><button class="cartBtn" data-ref-goodsno="A000000112805" data-ref-dispcatno="1000001000100010002" data-ref-itemno="001" data-ref-cnt="0" data-ref-prstyn="Y">장바구니</button>
						<button class="btn_new_pop goodsList" onclick="javascript:common.link.moveGoodsDetailNew(&#39;A000000112805&#39;,&#39;1000001000100010002&#39;);">새창보기</button></p>
						<!-- // 상품평 및 장바구니버튼 -->
					</div>
				</li> 
				</ul>			
			<ul id="w_cate_prd_list" class="cate_prd_list"><!-- 1단형일 경우 클래스 list_type 추가 -->
				<li class="flag">
					<div class="prd_info ">
						<!-- 이미지 영역 -->
						<a href="javascript:common.link.moveGoodsDetail(&#39;A000000116840&#39;,&#39;1000001000100060007&#39;);" class="prd_thumb">
							<img src="./로션 검색 _ 올리브영_files/A00000011684001ko.jpg" onerror="this.src=&#39;http://image.oliveyoung.co.kr/pc-static-root/image/comm/noimg_550.gif&#39;;this.onerror=&#39;&#39;;" alt="이미지 썸네일">
						</a>
						<!--// 이미지 영역 -->
						<!-- 상품명 -->
						<div class="prd_name">
							<a href="javascript:common.link.moveGoodsDetail(&#39;A000000116840&#39;,&#39;1000001000100060007&#39;);">
								<span class="tx_brand">아벤느</span>
								<p class="tx_name">아벤느 미셀라 로션 500ml 1+1 기획</p>
							</a>							
						</div>
						<!--// 상품명  -->
						<!-- 찜버튼 -->
						<button class="btn_zzim jeem" data-ref-goodsno="A000000116840" onclick="zzimWebLog();">찜하기</button>
						<!--// 찜버튼 -->
						<!-- 상품가격 영역 -->
						<p class="prd_price">
							<span class="tx_org"><span class="tx_num">35,000</span>원</span>
							<span class="tx_cur"><span class="tx_num">29,750</span>원</span>
						</p>
						<!--// 상품가격 영역 -->
						<!-- 상품 쿠폰 및 플러스 추가 영역 -->
						<!-- icon 사이 공백으로 인해 다 붙여서 한줄로 만들것 -->
						<p class="prd_flag">
						    <span class="icon_flag sale">세일</span><span class="icon_flag gift">증정</span><span class="icon_flag delivery">오늘드림</span>
						</p>
						<!--// 상품 쿠폰 및 플러스 추가 영역 -->
						<!--  상품평 및 장바구니버튼 -->
						<p class="prd_point_area tx_num"><span class="review_point"><span class="point" style="width:100%">142</span></span>(142)</p>
						<p class="prd_btn_area"><button class="cartBtn" data-ref-goodsno="A000000116840" data-ref-dispcatno="1000001000100060007" data-ref-itemno="001" data-ref-cnt="0" data-ref-prstyn="Y">장바구니</button>
						<button class="btn_new_pop goodsList" onclick="javascript:common.link.moveGoodsDetailNew(&#39;A000000116840&#39;,&#39;1000001000100060007&#39;);">새창보기</button></p>
						<!-- // 상품평 및 장바구니버튼 -->
					</div>
				</li> 
				<li class="flag">
					<div class="prd_info ">
						<!-- 이미지 영역 -->
						<a href="javascript:common.link.moveGoodsDetail(&#39;A000000012809&#39;,&#39;1000001000100010002&#39;);" class="prd_thumb">
							<img src="./로션 검색 _ 올리브영_files/A00000001280901ko.jpg" onerror="this.src=&#39;http://image.oliveyoung.co.kr/pc-static-root/image/comm/noimg_550.gif&#39;;this.onerror=&#39;&#39;;" alt="이미지 썸네일">
						</a>
						<!--// 이미지 영역 -->
						<!-- 상품명 -->
						<div class="prd_name">
							<a href="javascript:common.link.moveGoodsDetail(&#39;A000000012809&#39;,&#39;1000001000100010002&#39;);">
								<span class="tx_brand">피지오겔</span>
								<p class="tx_name">피지오겔 DMT 로션 200ml</p>
							</a>							
						</div>
						<!--// 상품명  -->
						<!-- 찜버튼 -->
						<button class="btn_zzim jeem" data-ref-goodsno="A000000012809" onclick="zzimWebLog();">찜하기</button>
						<!--// 찜버튼 -->
						<!-- 상품가격 영역 -->
						<p class="prd_price">
							<span class="tx_cur"><span class="tx_num">31,900</span>원</span>
						</p>
						<!--// 상품가격 영역 -->
						<!-- 상품 쿠폰 및 플러스 추가 영역 -->
						<!-- icon 사이 공백으로 인해 다 붙여서 한줄로 만들것 -->
						<p class="prd_flag">
						    <span class="icon_flag delivery">오늘드림</span>
						</p>
						<!--// 상품 쿠폰 및 플러스 추가 영역 -->
						<!--  상품평 및 장바구니버튼 -->
						<p class="prd_point_area tx_num"><span class="review_point"><span class="point" style="width:100%">890</span></span>(890)</p>
						<p class="prd_btn_area"><button class="cartBtn" data-ref-goodsno="A000000012809" data-ref-dispcatno="1000001000100010002" data-ref-itemno="001" data-ref-cnt="0" data-ref-prstyn="N">장바구니</button>
						<button class="btn_new_pop goodsList" onclick="javascript:common.link.moveGoodsDetailNew(&#39;A000000012809&#39;,&#39;1000001000100010002&#39;);">새창보기</button></p>
						<!-- // 상품평 및 장바구니버튼 -->
					</div>
				</li> 
				<li class="flag">
					<div class="prd_info ">
						<!-- 이미지 영역 -->
						<a href="javascript:common.link.moveGoodsDetail(&#39;A000000121743&#39;,&#39;1000001000300040001&#39;);" class="prd_thumb">
							<span class="thumb_flag best">베스트</span><!-- 베스트/신상 Flag | best : 베스트 / new : 신상 -->								
							<img src="./로션 검색 _ 올리브영_files/A00000012174308ko.jpg" onerror="this.src=&#39;http://image.oliveyoung.co.kr/pc-static-root/image/comm/noimg_550.gif&#39;;this.onerror=&#39;&#39;;" alt="이미지 썸네일">
						</a>
						<!--// 이미지 영역 -->
						<!-- 상품명 -->
						<div class="prd_name">
							<a href="javascript:common.link.moveGoodsDetail(&#39;A000000121743&#39;,&#39;1000001000300040001&#39;);">
								<span class="tx_brand">캐스키드슨</span>
								<p class="tx_name">[온라인단독] 캐스키드슨 핸드&amp;바디세트 (바디워시+로션+핸드크림+배쓰솔트)</p>
							</a>							
						</div>
						<!--// 상품명  -->
						<!-- 찜버튼 -->
						<button class="btn_zzim jeem" data-ref-goodsno="A000000121743" onclick="zzimWebLog();">찜하기</button>
						<!--// 찜버튼 -->
						<!-- 상품가격 영역 -->
						<p class="prd_price">
							<span class="tx_org"><span class="tx_num">38,000</span>원</span>
							<span class="tx_cur"><span class="tx_num">19,860</span>원</span>
						</p>
						<!--// 상품가격 영역 -->
						<!-- 상품 쿠폰 및 플러스 추가 영역 -->
						<!-- icon 사이 공백으로 인해 다 붙여서 한줄로 만들것 -->
						<p class="prd_flag">
						    <span class="icon_flag sale">세일</span><span class="icon_flag coupon">쿠폰</span>
						</p>
						<!--// 상품 쿠폰 및 플러스 추가 영역 -->
						<!--  상품평 및 장바구니버튼 -->
						<p class="prd_point_area tx_num"><span class="review_point"><span class="point" style="width:100%">15</span></span>(15)</p>
						<p class="prd_btn_area"><button class="cartBtn" data-ref-goodsno="A000000121743" data-ref-dispcatno="1000001000300040001" data-ref-itemno="001" data-ref-cnt="0" data-ref-prstyn="N">장바구니</button>
						<button class="btn_new_pop goodsList" onclick="javascript:common.link.moveGoodsDetailNew(&#39;A000000121743&#39;,&#39;1000001000300040001&#39;);">새창보기</button></p>
						<!-- // 상품평 및 장바구니버튼 -->
					</div>
				</li> 
				<li class="flag">
					<div class="prd_info ">
						<!-- 이미지 영역 -->
						<a href="javascript:common.link.moveGoodsDetail(&#39;A000000128617&#39;,&#39;1000001000100010001&#39;);" class="prd_thumb">
							<img src="./로션 검색 _ 올리브영_files/A00000012861701ko.jpg" onerror="this.src=&#39;http://image.oliveyoung.co.kr/pc-static-root/image/comm/noimg_550.gif&#39;;this.onerror=&#39;&#39;;" alt="이미지 썸네일">
						</a>
						<!--// 이미지 영역 -->
						<!-- 상품명 -->
						<div class="prd_name">
							<a href="javascript:common.link.moveGoodsDetail(&#39;A000000128617&#39;,&#39;1000001000100010001&#39;);">
								<span class="tx_brand">로벡틴</span>
								<p class="tx_name">[온라인단독] 로벡틴 올리브영&nbsp;트리트먼트로션&nbsp;100ml 기획팩</p>
							</a>							
						</div>
						<!--// 상품명  -->
						<!-- 찜버튼 -->
						<button class="btn_zzim jeem" data-ref-goodsno="A000000128617" onclick="zzimWebLog();">찜하기</button>
						<!--// 찜버튼 -->
						<!-- 상품가격 영역 -->
						<p class="prd_price">
							<span class="tx_cur"><span class="tx_num">9,900</span>원</span>
						</p>
						<!--// 상품가격 영역 -->
						<!-- 상품 쿠폰 및 플러스 추가 영역 -->
						<!-- icon 사이 공백으로 인해 다 붙여서 한줄로 만들것 -->
						<p class="prd_flag">
						</p>
						<!--// 상품 쿠폰 및 플러스 추가 영역 -->
						<!--  상품평 및 장바구니버튼 -->
						<p class="prd_point_area tx_num"><span class="review_point"><span class="point" style="width:80%">1</span></span>(1)</p>
						<p class="prd_btn_area"><button class="cartBtn" data-ref-goodsno="A000000128617" data-ref-dispcatno="1000001000100010001" data-ref-itemno="001" data-ref-cnt="0" data-ref-prstyn="N">장바구니</button>
						<button class="btn_new_pop goodsList" onclick="javascript:common.link.moveGoodsDetailNew(&#39;A000000128617&#39;,&#39;1000001000100010001&#39;);">새창보기</button></p>
						<!-- // 상품평 및 장바구니버튼 -->
					</div>
				</li> 
				</ul>			
			<ul id="w_cate_prd_list" class="cate_prd_list"><!-- 1단형일 경우 클래스 list_type 추가 -->
									
				<li class="flag">
					<div class="prd_info ">
						<!-- 이미지 영역 -->
						<a href="javascript:common.link.moveGoodsDetail(&#39;A000000012312&#39;,&#39;1000001000100040008&#39;);" class="prd_thumb">
							<span class="thumb_flag best">베스트</span><!-- 베스트/신상 Flag | best : 베스트 / new : 신상 -->								
							<img src="./로션 검색 _ 올리브영_files/A00000001231205ko.jpg" onerror="this.src=&#39;http://image.oliveyoung.co.kr/pc-static-root/image/comm/noimg_550.gif&#39;;this.onerror=&#39;&#39;;" alt="이미지 썸네일">
						</a>
						<!--// 이미지 영역 -->
						<!-- 상품명 -->
						<div class="prd_name">
							<a href="javascript:common.link.moveGoodsDetail(&#39;A000000012312&#39;,&#39;1000001000100040008&#39;);">
								<span class="tx_brand">바이오더마</span>
								<p class="tx_name">바이오더마 아토덤 pp밤 500ml</p>
							</a>							
						</div>
						<!--// 상품명  -->
						<!-- 찜버튼 -->
						<button class="btn_zzim jeem" data-ref-goodsno="A000000012312" onclick="zzimWebLog();">찜하기</button>
						<!--// 찜버튼 -->
						<!-- 상품가격 영역 -->
						<p class="prd_price">
							<span class="tx_org"><span class="tx_num">42,000</span>원</span>
							<span class="tx_cur"><span class="tx_num">37,800</span>원</span>
						</p>
						<!--// 상품가격 영역 -->
						<!-- 상품 쿠폰 및 플러스 추가 영역 -->
						<!-- icon 사이 공백으로 인해 다 붙여서 한줄로 만들것 -->
						<p class="prd_flag">
						    <span class="icon_flag sale">세일</span><span class="icon_flag delivery">오늘드림</span>
						</p>
						<!--// 상품 쿠폰 및 플러스 추가 영역 -->
						<!--  상품평 및 장바구니버튼 -->
						<p class="prd_point_area tx_num"><span class="review_point"><span class="point" style="width:100%">109</span></span>(109)</p>
						<p class="prd_btn_area"><button class="cartBtn" data-ref-goodsno="A000000012312" data-ref-dispcatno="1000001000100040008" data-ref-itemno="001" data-ref-cnt="0" data-ref-prstyn="N">장바구니</button>
						<button class="btn_new_pop goodsList" onclick="javascript:common.link.moveGoodsDetailNew(&#39;A000000012312&#39;,&#39;1000001000100040008&#39;);">새창보기</button></p>
						<!-- // 상품평 및 장바구니버튼 -->
					</div>
				</li> 
				<li class="flag">
					<div class="prd_info ">
						<!-- 이미지 영역 -->
						<a href="javascript:common.link.moveGoodsDetail(&#39;A000000006565&#39;,&#39;1000001000100010008&#39;);" class="prd_thumb">
							<span class="thumb_flag best">베스트</span><!-- 베스트/신상 Flag | best : 베스트 / new : 신상 -->								
							<img src="./로션 검색 _ 올리브영_files/A00000000656501ko.jpg" onerror="this.src=&#39;http://image.oliveyoung.co.kr/pc-static-root/image/comm/noimg_550.gif&#39;;this.onerror=&#39;&#39;;" alt="이미지 썸네일">
						</a>
						<!--// 이미지 영역 -->
						<!-- 상품명 -->
						<div class="prd_name">
							<a href="javascript:common.link.moveGoodsDetail(&#39;A000000006565&#39;,&#39;1000001000100010008&#39;);">
								<span class="tx_brand">우르오스</span>
								<p class="tx_name">우르오스 스킨밀크 200ml</p>
							</a>							
						</div>
						<!--// 상품명  -->
						<!-- 찜버튼 -->
						<button class="btn_zzim jeem" data-ref-goodsno="A000000006565" onclick="zzimWebLog();">찜하기</button>
						<!--// 찜버튼 -->
						<!-- 상품가격 영역 -->
						<p class="prd_price">
							<span class="tx_cur"><span class="tx_num">29,700</span>원</span>
						</p>
						<!--// 상품가격 영역 -->
						<!-- 상품 쿠폰 및 플러스 추가 영역 -->
						<!-- icon 사이 공백으로 인해 다 붙여서 한줄로 만들것 -->
						<p class="prd_flag">
						    <span class="icon_flag delivery">오늘드림</span>
						</p>
						<!--// 상품 쿠폰 및 플러스 추가 영역 -->
						<!--  상품평 및 장바구니버튼 -->
						<p class="prd_point_area tx_num"><span class="review_point"><span class="point" style="width:100%">591</span></span>(591)</p>
						<p class="prd_btn_area"><button class="cartBtn" data-ref-goodsno="A000000006565" data-ref-dispcatno="1000001000100010008" data-ref-itemno="001" data-ref-cnt="0" data-ref-prstyn="N">장바구니</button>
						<button class="btn_new_pop goodsList" onclick="javascript:common.link.moveGoodsDetailNew(&#39;A000000006565&#39;,&#39;1000001000100010008&#39;);">새창보기</button></p>
						<!-- // 상품평 및 장바구니버튼 -->
					</div>
				</li> 
				<li class="flag">
					<div class="prd_info ">
						<!-- 이미지 영역 -->
						<a href="javascript:common.link.moveGoodsDetail(&#39;A000000110826&#39;,&#39;1000001000100010001&#39;);" class="prd_thumb">
							<img src="./로션 검색 _ 올리브영_files/A00000011082603ko.jpg" onerror="this.src=&#39;http://image.oliveyoung.co.kr/pc-static-root/image/comm/noimg_550.gif&#39;;this.onerror=&#39;&#39;;" alt="이미지 썸네일">
						</a>
						<!--// 이미지 영역 -->
						<!-- 상품명 -->
						<div class="prd_name">
							<a href="javascript:common.link.moveGoodsDetail(&#39;A000000110826&#39;,&#39;1000001000100010001&#39;);">
								<span class="tx_brand">아벤느</span>
								<p class="tx_name">아벤느 이드랑스 에센스 인 로션 200ml 기획(수분부스팅에센스정품증정)</p>
							</a>							
						</div>
						<!--// 상품명  -->
						<!-- 찜버튼 -->
						<button class="btn_zzim jeem" data-ref-goodsno="A000000110826" onclick="zzimWebLog();">찜하기</button>
						<!--// 찜버튼 -->
						<!-- 상품가격 영역 -->
						<p class="prd_price">
							<span class="tx_org"><span class="tx_num">28,000</span>원</span>
							<span class="tx_cur"><span class="tx_num">25,200</span>원</span>
						</p>
						<!--// 상품가격 영역 -->
						<!-- 상품 쿠폰 및 플러스 추가 영역 -->
						<!-- icon 사이 공백으로 인해 다 붙여서 한줄로 만들것 -->
						<p class="prd_flag">
						    <span class="icon_flag coupon">쿠폰</span><span class="icon_flag gift">증정</span><span class="icon_flag delivery">오늘드림</span>
						</p>
						<!--// 상품 쿠폰 및 플러스 추가 영역 -->
						<!--  상품평 및 장바구니버튼 -->
						<p class="prd_point_area tx_num"><span class="review_point"><span class="point" style="width:100%">284</span></span>(284)</p>
						<p class="prd_btn_area"><button class="cartBtn" data-ref-goodsno="A000000110826" data-ref-dispcatno="1000001000100010001" data-ref-itemno="001" data-ref-cnt="0" data-ref-prstyn="Y">장바구니</button>
						<button class="btn_new_pop goodsList" onclick="javascript:common.link.moveGoodsDetailNew(&#39;A000000110826&#39;,&#39;1000001000100010001&#39;);">새창보기</button></p>
						<!-- // 상품평 및 장바구니버튼 -->
					</div>
				</li> 
				<li class="flag">
					<div class="prd_info ">
						<!-- 이미지 영역 -->
						<a href="javascript:common.link.moveGoodsDetail(&#39;A000000117623&#39;,&#39;1000001000300040001&#39;);" class="prd_thumb">
								<span class="thumb_flag best">베스트</span><!-- 베스트/신상 Flag | best : 베스트 / new : 신상 -->								
								<img src="./로션 검색 _ 올리브영_files/A00000011762304ko.jpg" onerror="this.src=&#39;http://image.oliveyoung.co.kr/pc-static-root/image/comm/noimg_550.gif&#39;;this.onerror=&#39;&#39;;" alt="이미지 썸네일">
						</a>
						<!--// 이미지 영역 -->
						<!-- 상품명 -->
						<div class="prd_name">
							<a href="javascript:common.link.moveGoodsDetail(&#39;A000000117623&#39;,&#39;1000001000300040001&#39;);">
								<span class="tx_brand">더마비</span>
								<p class="tx_name">더마비 마일드 모이스처 바디로션 400ml</p>
							</a>							
						</div>
						<!--// 상품명  -->
						<!-- 찜버튼 -->
						<button class="btn_zzim jeem" data-ref-goodsno="A000000117623" onclick="zzimWebLog();">찜하기</button>
						<!--// 찜버튼 -->
						<!-- 상품가격 영역 -->
						<p class="prd_price">
									<span class="tx_org"><span class="tx_num">15,000</span>원</span>
									<span class="tx_cur"><span class="tx_num">10,500</span>원</span>
						</p>
						<!--// 상품가격 영역 -->
						<!-- 상품 쿠폰 및 플러스 추가 영역 -->
						<!-- icon 사이 공백으로 인해 다 붙여서 한줄로 만들것 -->
						<p class="prd_flag">
						    <span class="icon_flag sale">세일</span><span class="icon_flag delivery">오늘드림</span>
						</p>
						<!--// 상품 쿠폰 및 플러스 추가 영역 -->
						<!--  상품평 및 장바구니버튼 -->
						<p class="prd_point_area tx_num"><span class="review_point"><span class="point" style="width:100%">314</span></span>(314)</p>
						<p class="prd_btn_area"><button class="cartBtn" data-ref-goodsno="A000000117623" data-ref-dispcatno="1000001000300040001" data-ref-itemno="001" data-ref-cnt="0" data-ref-prstyn="N">장바구니</button>
						<button class="btn_new_pop goodsList" onclick="javascript:common.link.moveGoodsDetailNew(&#39;A000000117623&#39;,&#39;1000001000300040001&#39;);">새창보기</button></p>
						<!-- // 상품평 및 장바구니버튼 -->
					</div>
				</li> 
				</ul>			
			<!--// 컬럼형 리스트 -->
			<!--// 카테고리 상품 리스트 -->
			<!-- pageing start -->
			<div class="pageing">
				<strong title="현재 페이지">1</strong><a href="http://www.oliveyoung.co.kr/store/search/getSearchMain.do?query=%EB%A1%9C%EC%85%98#none" onclick="javascript:doPaging(&#39;24&#39;);" title="Paging"> 2 </a><a href="http://www.oliveyoung.co.kr/store/search/getSearchMain.do?query=%EB%A1%9C%EC%85%98#none" onclick="javascript:doPaging(&#39;48&#39;);" title="Paging"> 3 </a><a href="http://www.oliveyoung.co.kr/store/search/getSearchMain.do?query=%EB%A1%9C%EC%85%98#none" onclick="javascript:doPaging(&#39;72&#39;);" title="Paging"> 4 </a><a href="http://www.oliveyoung.co.kr/store/search/getSearchMain.do?query=%EB%A1%9C%EC%85%98#none" onclick="javascript:doPaging(&#39;96&#39;);" title="Paging"> 5 </a><a href="http://www.oliveyoung.co.kr/store/search/getSearchMain.do?query=%EB%A1%9C%EC%85%98#none" onclick="javascript:doPaging(&#39;120&#39;);" title="Paging"> 6 </a><a href="http://www.oliveyoung.co.kr/store/search/getSearchMain.do?query=%EB%A1%9C%EC%85%98#none" onclick="javascript:doPaging(&#39;144&#39;);" title="Paging"> 7 </a><a href="http://www.oliveyoung.co.kr/store/search/getSearchMain.do?query=%EB%A1%9C%EC%85%98#none" onclick="javascript:doPaging(&#39;168&#39;);" title="Paging"> 8 </a><a href="http://www.oliveyoung.co.kr/store/search/getSearchMain.do?query=%EB%A1%9C%EC%85%98#none" onclick="javascript:doPaging(&#39;192&#39;);" title="Paging"> 9 </a><a href="http://www.oliveyoung.co.kr/store/search/getSearchMain.do?query=%EB%A1%9C%EC%85%98#none" onclick="javascript:doPaging(&#39;216&#39;);" title="Paging"> 10 </a><a class="next" href="http://www.oliveyoung.co.kr/store/search/getSearchMain.do?query=%EB%A1%9C%EC%85%98#none" onclick="javascript:doPaging(&#39;240&#39;)" title="Next Page">다음 페이지</a>
			</div>
			<!-- //pageing end -->			
		<!-- </div> -->
		
		</div>
		<!-- //#Contents -->
	</div></form>
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