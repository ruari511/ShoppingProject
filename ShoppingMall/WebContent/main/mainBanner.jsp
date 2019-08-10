<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../asset/css/mainBanner.css"/> 
<link rel="stylesheet" href="../asset/css/global.css"/> 
<title>배너</title>
<script type="text/javascript" src="../asset/js/jquery-1.9.1.min.js"></script>

<script type="text/javascript">

	
	var mainBanner;//정해진 초마다 실행하는 함수
	var index=0;//현재 배너 인덱스
	var maxIndex; //배너 총개수

	$(function(){
		
		//배너 총 갯수
		maxIndex = $(".mainBanner_Img_Wrap").length;

		//배너들 위치 조정
		
		for(var i = 0; i<maxIndex; i++){
			var top = -450*i;
			$(".mainBanner_Img_Wrap").eq(i).css("top", top +"px").css("opacity", 0);
		}
		
		//첫번째 배너 위로 올리기
		$(".mainBanner_Img_Wrap").eq(0).css("z-index", 7);
		$(".mainBanner_Img_Wrap").eq(0).css("opacity", 1);
		
		
		//배너슬라이드 시작
		mainBanner = setInterval(function(){mainBannerUpdate();}, 5000);
		
		
		//배너에 마우스 오버했을 때 정지
		$("#mainBanner_Img, #mainBanner_Btn").hover(function(){
			clearInterval(mainBanner);
		}, function(){
			mainBanner=setInterval(function(){mainBannerUpdate();}, 5000);
		});
		
	});
	
	
	//배너 바꾸기 반복 함수	
	function mainBannerUpdate(){
		//현재 배너 값 저장
		var currentIndex = index;
		//현재 배너 z인덱스 줄이기
		$(".mainBanner_Img_Wrap").eq(currentIndex).css("z-index", 6);
					
		
		//새 인덱스
		index++
		
		//인덱스초과했으며 맨앞으로
		if(index>=maxIndex){
			index = 0;
		}
		
		//새 배너 z인덱스 올리기
		$(".mainBanner_Img_Wrap").eq(index).css("z-index", 7);
		
		//새 배너 오퍼시티 서서히 변하게
		$(".mainBanner_Img_Wrap").eq(index).animate({opacity: '1'}, 500, function(){
			
			
			//새배너 오퍼시티 1이 되면 현재배너 오퍼시티 0
			$(".mainBanner_Img_Wrap").eq(currentIndex).css("opacity", 0);				
		});	
	} //mainBannerUpdate끝
	
	function MoveBanner(n){
		//앞으로가는버튼: +1, 뒤로가는버튼 -1;
		index+=n;
		
		//index가 값을 초과했을때 처리
		if(index>=maxIndex){
			index = 0;
		}else if(index<0){
			index = maxIndex;
		}
		
		mainBannerUpdate();
	}
	
	

</script>

</head>
<body>
<!--190808 김현정 메인 배너 틀 제작-->
	<div id="content"> <!-- content 나중에 제거하고 main에 추가-->
		<div id="mainBanner">
			<div id="mainBanner_Wrap">
				<div id="mainBanner_Img">
				
					<!--링크배너-->
					<div class="mainBanner_Img_Wrap">
						<a href="http://www.naver.com">
							<img src="../asset/image/bannertest1.jpg">
							<p class="mainBanner_Img_Text">
							<span>{Title}</span>
							<strong>
							{Text1}<br>
							{Text2}<br>
							{Text3}<br>
							</strong>
							<span>{Tag}</span>
							</p>
						</a>
					</div>
					
					<div class="mainBanner_Img_Wrap">
						<a href="http://www.daum.net">
							<img src="../asset/image/bannertest2.jpg">
							<p class="mainBanner_Img_Text">
							<span>{Title}</span>
							<strong>
							{ccc}<br>
							{ccc}<br>
							{ccc}<br>
							</strong>
							<span>{Tag}</span>
							</p>
						</a>
					</div>
					
					<div class="mainBanner_Img_Wrap">
						<a href="http://www.daum.net">
							<img src="../asset/image/bannertest2.jpg">
							<p class="mainBanner_Img_Text">
							<span>{Title}</span>
							<strong>
							{3333333}<br>
							{ccc}<br>
							{ccc}<br>
							</strong>
							<span>{Tag}</span>
							</p>
						</a>
					</div>
					
					<div class="mainBanner_Img_Wrap">
						<a href="http://www.daum.net">
							<img src="../asset/image/bannertest2.jpg">
							<p class="mainBanner_Img_Text">
							<span>{Title}</span>
							<strong>
							{44444444}<br>
							{ccc}<br>
							{ccc}<br>
							</strong>
							<span>{Tag}</span>
							</p>
						</a>
					</div>
					

				
				</div>
				
				<!-- 배너 버튼 -->
				<div id="mainBanner_Btn">
					<Button onclick="MoveBanner(-1)">1</Button>
					<span>1234</span>
					<Button onclick="MoveBanner(1)">2</Button>	
					<Button onclick="">3</Button>	
				</div>
			
			</div>
		
		</div>
		
	</div>
</body>
</html>