<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../asset/css/mainBanner.css"/> 
<link rel="stylesheet" href="../asset/css/global.css"/> 
<title>Insert title here</title>
</head>
<body>
<!--190808 김현정 메인 배너 틀 제작-->
	<div id="content"> <!-- content 나중에 제거하고 main에 추가-->
		<div id="mainBanner">
			<div id="mainBanner_Wrap">
				<div id="mainBanner_Img">
					<!--링크배너-->
					<div class="mainBanner_Img_Wrap">
						<a href="#">
							<img src="img/test1.jpg">
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
				
				</div>
				<div id="mainBanner_Btn">
					<Button>1</Button>
					<span>1234</span>
					<Button>2</Button>	
					<Button>3</Button>	
				</div>
			
			</div>
		
		</div>
	</div>
</body>
</html>