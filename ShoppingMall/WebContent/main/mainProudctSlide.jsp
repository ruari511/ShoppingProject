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
						<input type="button" value="&gt" >
					</div>
				
				<div class="productSlide_Contents_Wrap">
					<ul class="productSlide_List">
						<li>
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