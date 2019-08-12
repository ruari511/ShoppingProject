<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<title>로그인 페이지</title>

<!-- 제이쿼리 최선버전의 js파일을 불러와 jquery를 사용하기 위해 반드시 설정해야함 -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	
	function login_check(){
		var _id = $("#id").val();
		
		var _pass = $("#password").val();

		$.ajax(
			{
				url:"http://localhost:8090/ShoppingMall/member/login.jsp",
				type:"post",
				async:false,
				data:{id:_id, pass:_pass},
				dataType:"text",
				success:function(data,textStatus){
					
					// 아이디 체크
					if(_id.length == 0){ // 아이디가 입력되지 않았을 때
						$("#idMessage").text("아이디를 입력해주세요 :)");
						$("#idMessage").css("color","red");
						$(".submit").attr("disabled",true);
					} else if(_id.length != 0){
						$("#idMessage").text("");

					}
					
					// 비밀번호 체크
					if(_pass.length == 0){ // 비밀번호가 입력되지 않았을 때
						$("#passMessage").text("비밀번호를 입력해주세요 :)");
						$("#passMessage").css("color","red");
						$(".submit").attr("disabled",true);
					} else if(_pass.length != 0){
						$("#passMessage").text("");

					}	
					
				},
				error:function(data,textStatus){ //작업중 오류가 발생했을 경우에 수행할 작업을 설정 합니다.
					 alert("에러가 발생했습니다.");
			 }
		}); // ajax 메소드 끝
		
	};	
	
</script>
</head>

<body class="container">
    <div class="jumbotron">
        <h1>로그인</h1>
        <p>아이디 / 비밀번호 입력해주세요</p>
    </div>
    
    <!-- 로그인 폼 -->
    <%--MemberFrontController서블릿에.. 로그인 처리 요청시! 입력한 id와 패스워드 전달 --%>
    <form action="./MemberLoginAction.me" method="post" style=" margin: 0 auto; width: 50%; ">
        <div class="form-group">
            <label>아이디</label>
            <input type="text" id="id" name="id" class="form-control" onblur="login_check()" required autofocus/>
            <div class="check_font" id="idMessage"></div>
        </div>
        <div class="form-group">
            <label>비밀번호</label>
            <input  type="password" id="password" name="password" class="form-control" onblur="login_check()" required autofocus/>
            <div class="check_font" id="passMessage"></div>
        </div>
        <button type="submit" class="btn btn-primary">전송</button>
    </form>
    
</body>

</html>