<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../asset/css/mainProductSlide.css"/> 
<link rel="stylesheet" href="../asset/css/global.css"/> 
<title>제품슬라이드</title>

<script type="text/javascript" src="../asset/js/jquery-1.9.1.min.js"></script>

<script type="text/javascript">

	<!--input hidden으로 각 슬라이드마다 현재 인덱스값을 저장
	
	전체인덱스값은...음... ul의 갯수 새기..?
			
	로 할려고 했는 데 data-* 값 이용하기
	https://www.zerocho.com/category/HTML&DOM/post/5a76d1eaabd090001b981ba6
	
	
	오른쪽 이동 : 현재 인덱스값 +1 * 1020
	
	왼쪽: 반대
	
	번호 눌러서 이동 : 선택한번호값 * 1020
	
	마지막번호인지 첫ㅅ번재 번호인지 꼭 확인 
	
	슬라이드만들때 : 맨앞에 마지막꺼 붙이고 맨뒤엔 첫번재꺼 중복으로 붙인다 -->
	$(function(){
		
	});
	
	function RightButton(n){
		
		console.log($(".productSlide_"+n).css("left"));
		
		$(".productSlide_"+n).css("left", 500 +"px");
	}
</script>

</head>
<body>
<!-- 상품이름 줄바꾸기 설정해야함 -->
	<div id="content"> <!-- content 나중에 제거하고 main에 추가-->
		<section id="productSlide">
			<div class="productSlide_Wrap">
				<div class="productSlide_Title">
					<p>{Title}</p>
				 
				</div>
				
					<div class="productSlide_ArrowBtn_Left">
						<input type="button" value="&lt;" >
					</div>
				
					<div class="productSlide_ArrowBtn_Right">
						<input type="button" value="&gt" onclick="RightButton(1);">
					</div>
				
				<div class="productSlide_Contents_Wrap">
					<ul class="productSlide_List productSlide_1">
						<li>
							<div class="productSlide_Content">

								<a href="#">
									<img src="img/diary.jpg">
									<div class="productSlide_Text">
									<p class="productSlide_Text_Brand">{Brand}</p>
									<p class="productSlide_Text_Name">{Name}</p>
									<p class="productSlide_Text_Price">{####} 원</p>

									</div>
								</a>
							</div>

							<div class="productSlide_Content">
								<a href="#">
									<img src="img/diary.jpg">
									<div class="productSlide_Text">
									<p class="productSlide_Text_Brand">{Brand}</p>
									<p class="productSlide_Text_Name">{Name}<br>
										sfsfds</p>
									<p class="productSlide_Text_Price">{####} 원</p>

									</div>
								</a>
							</div>

							<div class="productSlide_Content">				
								<a href="#">
									<img src="img/diary.jpg">
									<div class="productSlide_Text">
									<p class="productSlide_Text_Brand">{Brand}</p>
									<p class="productSlide_Text_Name">{Name}<br>
										sfsfds</p>
									<p class="productSlide_Text_Price">{####} 원</p>

									</div>
								</a>
							</div>

							<div class="productSlide_Content">			
								<a href="#">
									<img src="img/diary.jpg">
									<div class="productSlide_Text">
									<p class="productSlide_Text_Brand">{Brand}</p>
									<p class="productSlide_Text_Name">{Name}</p>
									<p class="productSlide_Text_Price">{####} 원</p>

									</div>
								</a>
							</div>
							</li>
							
							<li>
							<div class="productSlide_Content">

								<a href="#">
									<img src="img/diary.jpg">
									<div class="productSlide_Text">
									<p class="productSlide_Text_Brand">{Brand}</p>
									<p class="productSlide_Text_Name">{Name}</p>
									<p class="productSlide_Text_Price">{####} 원</p>

									</div>
								</a>
							</div>

							<div class="productSlide_Content">
								<a href="#">
									<img src="img/diary.jpg">
									<div class="productSlide_Text">
									<p class="productSlide_Text_Brand">{Brand}</p>
									<p class="productSlide_Text_Name">{Name}<br>
										sfsfds</p>
									<p class="productSlide_Text_Price">{####} 원</p>

									</div>
								</a>
							</div>

							<div class="productSlide_Content">				
								<a href="#">
									<img src="img/diary.jpg">
									<div class="productSlide_Text">
									<p class="productSlide_Text_Brand">{Brand}</p>
									<p class="productSlide_Text_Name">{Name}<br>
										sfsfds</p>
									<p class="productSlide_Text_Price">{####} 원</p>

									</div>
								</a>
							</div>

							<div class="productSlide_Content">			
								<a href="#">
									<img src="img/diary.jpg">
									<div class="productSlide_Text">
									<p class="productSlide_Text_Brand">{Brand}</p>
									<p class="productSlide_Text_Name">{Name}</p>
									<p class="productSlide_Text_Price">{####} 원</p>

									</div>
								</a>
							</div>
							</li>
							
							<li>
							<div class="productSlide_Content">

								<a href="#">
									<img src="img/diary.jpg">
									<div class="productSlide_Text">
									<p class="productSlide_Text_Brand">{Brand}</p>
									<p class="productSlide_Text_Name">{Name}</p>
									<p class="productSlide_Text_Price">{####} 원</p>

									</div>
								</a>
							</div>

							<div class="productSlide_Content">
								<a href="#">
									<img src="img/diary.jpg">
									<div class="productSlide_Text">
									<p class="productSlide_Text_Brand">{Brand}</p>
									<p class="productSlide_Text_Name">{Name}<br>
										sfsfds</p>
									<p class="productSlide_Text_Price">{####} 원</p>

									</div>
								</a>
							</div>

							<div class="productSlide_Content">				
								<a href="#">
									<img src="img/diary.jpg">
									<div class="productSlide_Text">
									<p class="productSlide_Text_Brand">{Brand}</p>
									<p class="productSlide_Text_Name">{Name}<br>
										sfsfds</p>
									<p class="productSlide_Text_Price">{####} 원</p>

									</div>
								</a>
							</div>

							<div class="productSlide_Content">			
								<a href="#">
									<img src="img/diary.jpg">
									<div class="productSlide_Text">
									<p class="productSlide_Text_Brand">{Brand}</p>
									<p class="productSlide_Text_Name">{Name}</p>
									<p class="productSlide_Text_Price">{####} 원</p>

									</div>
								</a>
							</div>
							</li>
							
							<li>
							<div class="productSlide_Content">

								<a href="#">
									<img src="img/diary.jpg">
									<div class="productSlide_Text">
									<p class="productSlide_Text_Brand">{Brand}</p>
									<p class="productSlide_Text_Name">{Name}</p>
									<p class="productSlide_Text_Price">{####} 원</p>

									</div>
								</a>
							</div>

							<div class="productSlide_Content">
								<a href="#">
									<img src="img/diary.jpg">
									<div class="productSlide_Text">
									<p class="productSlide_Text_Brand">{Brand}</p>
									<p class="productSlide_Text_Name">{Name}<br>
										sfsfds</p>
									<p class="productSlide_Text_Price">{####} 원</p>

									</div>
								</a>
							</div>

							<div class="productSlide_Content">				
								<a href="#">
									<img src="img/diary.jpg">
									<div class="productSlide_Text">
									<p class="productSlide_Text_Brand">{Brand}</p>
									<p class="productSlide_Text_Name">{Name}<br>
										sfsfds</p>
									<p class="productSlide_Text_Price">{####} 원</p>

									</div>
								</a>
							</div>

							<div class="productSlide_Content">			
								<a href="#">
									<img src="img/diary.jpg">
									<div class="productSlide_Text">
									<p class="productSlide_Text_Brand">{Brand}</p>
									<p class="productSlide_Text_Name">{Name}</p>
									<p class="productSlide_Text_Price">{####} 원</p>

									</div>
								</a>
							</div>
							</li>

						</ul>
				
					</div>
			</div>	
		
		</section>
	</div>
</body>
</html>