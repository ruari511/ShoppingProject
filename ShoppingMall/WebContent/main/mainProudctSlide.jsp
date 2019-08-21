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

	/* input hidden으로 각 슬라이드마다 현재 인덱스값을 저장
	
	전체인덱스값은...음... ul의 갯수 새기..?
			
	로 할려고 했는 데 data-* 값 이용하기
	https://www.zerocho.com/category/HTML&DOM/post/5a76d1eaabd090001b981ba6
	
	
	오른쪽 이동 : 현재 인덱스값 +1 * 1020
	
	왼쪽: 반대
	
	번호 눌러서 이동 : 선택한번호값 * 1020
	
	마지막번호인지 첫ㅅ번재 번호인지 꼭 확인 
	
	슬라이드만들때 : 맨앞에 마지막꺼 붙이고 맨뒤엔 첫번재꺼 중복으로 붙인다 */
	$(function(){
		
		$(".productSlide_List").each(function(index, item){
			
			//초기 너비설정(슬라이드갯수 +2)
			var max = $(item).data("max-index");
			$(item).css("width", (1020*(max+2))+"px")
				.css("left", -1020+"px"); //초기 슬라이드 위치(1)
			
			
			//슬라이드 현재 인덱스 초기화(1)
			$(item).data("current-index", 1);
			
		})
	});
	
	
	
	//오른쪽 버튼
	function RightButton(n){	
		var category = $("[data-category="+n+"]");
		var maxIndex = category.data("max-index");
		var currentIndex = category.data("current-index");
		
		if(!category.is(':animated')){
			if(currentIndex<maxIndex){			
				category.animate({left: (currentIndex+1)*(-1020)+"px"}, 500)
				category.data("current-index", currentIndex+1);
			}else{// 맨뒤일때 맨앞으로 보내기
				category.animate({left: (currentIndex+1)*(-1020)+"px"}, 500, function(){
					//애니메이션이 끝나면 위치를 맨 앞으로 바꿔주기
					category.css("left", (-1020)+"px");
				});			
				//첫번째 인덱스로 바꾸기
				category.data("current-index", 1);		
			}
		}	
	}
	
	//왼쪽버튼
	function LeftButton(n){	
		var category = $("[data-category="+n+"]");
		var currentIndex = category.data("current-index");
		
		
		if(!category.is(':animated')){
			if(currentIndex>1){		
				category.animate({left: (currentIndex-1)*(-1020)+"px"}, 500);
				category.data("current-index", currentIndex-1);	
				
			}else{ //맨앞일때 맨뒤로 보내기
				var maxIndex = category.data("max-index");
				category.animate({left: (currentIndex-1)*(-1020)+"px"}, 500, function(){
					//애니메이션이 끝나면 위치를 맨 마지막으로 바꿔주기
					category.css("left", maxIndex*(-1020)+"px");
				});			
				//마지막 인덱스로 바꾸기
				category.data("current-index", maxIndex);	
			}
		}	
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
						<input type="button" value="&lt;" onclick="LeftButton(1);" >
					</div>
				
					<div class="productSlide_ArrowBtn_Right">
						<input type="button" value="&gt" onclick="RightButton(1);">
					</div>
				
				<div class="productSlide_Contents_Wrap">
					<ul class="productSlide_List" data-category="1" data-max-index="4" data-current-index="1">
					<li>
						<div class="productSlide_Content">

							<a href="#">
								<img src="../asset/image/testImg/test4.png">
								<div class="productSlide_Text">
								<p class="productSlide_Text_Brand">{Brand}</p>
								<p class="productSlide_Text_Name">{Name}</p>
								<p class="productSlide_Text_Price">{####} 원</p>

								</div>
							</a>
						</div>

						<div class="productSlide_Content">
							<a href="#">
								<img src="../asset/image/testImg/test4.png">
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
								<img src="../asset/image/testImg/test4.png">
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
								<img src="../asset/image/testImg/test4.png">
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
									<img src="../asset/image/testImg/test1.png">
									<div class="productSlide_Text">
									<p class="productSlide_Text_Brand">{Brand}</p>
									<p class="productSlide_Text_Name">{Name}</p>
									<p class="productSlide_Text_Price">{####} 원</p>

									</div>
								</a>
							</div>

							<div class="productSlide_Content">
								<a href="#">
									<img src="../asset/image/testImg/test1.png"">
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
									<img src="../asset/image/testImg/test1.png"">
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
									<img src="../asset/image/testImg/test1.png">
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
									<img src="../asset/image/testImg/test2.png">
									<div class="productSlide_Text">
									<p class="productSlide_Text_Brand">{Brand}</p>
									<p class="productSlide_Text_Name">{Name}</p>
									<p class="productSlide_Text_Price">{####} 원</p>

									</div>
								</a>
							</div>

							<div class="productSlide_Content">
								<a href="#">
									<img src="../asset/image/testImg/test2.png">
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
									<img src="../asset/image/testImg/test2.png">
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
									<img src="../asset/image/testImg/test2.png">
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
									<img src="../asset/image/testImg/test3.png">
									<div class="productSlide_Text">
									<p class="productSlide_Text_Brand">{Brand}</p>
									<p class="productSlide_Text_Name">{Name}</p>
									<p class="productSlide_Text_Price">{####} 원</p>

									</div>
								</a>
							</div>

							<div class="productSlide_Content">
								<a href="#">
									<img src="../asset/image/testImg/test3.png">
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
									<img src="../asset/image/testImg/test3.png">
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
									<img src="../asset/image/testImg/test3.png">
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
									<img src="../asset/image/testImg/test4.png">
									<div class="productSlide_Text">
									<p class="productSlide_Text_Brand">{Brand}</p>
									<p class="productSlide_Text_Name">{Name}</p>
									<p class="productSlide_Text_Price">{####} 원</p>

									</div>
								</a>
							</div>

							<div class="productSlide_Content">
								<a href="#">
									<img src="../asset/image/testImg/test4.png">
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
									<img src="../asset/image/testImg/test4.png">
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
									<img src="../asset/image/testImg/test4.png">
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
									<img src="../asset/image/testImg/test1.png">
									<div class="productSlide_Text">
									<p class="productSlide_Text_Brand">{Brand}</p>
									<p class="productSlide_Text_Name">{Name}</p>
									<p class="productSlide_Text_Price">{####} 원</p>

									</div>
								</a>
							</div>

							<div class="productSlide_Content">
								<a href="#">
									<img src="../asset/image/testImg/test1.png"">
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
									<img src="../asset/image/testImg/test1.png"">
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
									<img src="../asset/image/testImg/test1.png">
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