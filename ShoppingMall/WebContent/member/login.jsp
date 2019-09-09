<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>

<!-- 구글 -->
<meta name="google-signin-scope" content="profile email">
<meta name="google-signin-client_id" content="714799720673-kmhsf3rqmk083p148at0tui000p84ntu.apps.googleusercontent.com">

<script src="https://apis.google.com/js/platform.js" async defer></script>


<!-- 네이버 -->
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>

<!-- 카카오 -->
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>


<link rel="stylesheet" href="./asset/css/member.css"/> 
 
<title>로그인 페이지</title>

<!-- 제이쿼리 최선버전의 js파일을 불러와 jquery를 사용하기 위해 반드시 설정해야함 -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script type="text/javascript">
   
   // 로그인 폼 안에 아이디/비밀번호 입력이 되지 않았을때 경고문 ajax로 나타내기
   function login_check(){
      var _id = $("#id").val();
      
      var _pass = $("#password").val();

      $.ajax(
         {
            url:"${pageContext.request.contextPath}/member/login.jsp",
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
   
	// 아이디 / 비밀번호 찾기 팝업창
   function showPopup() {
      
       var _width = 600;
       var _height = 450;
    
       // 팝업을 가운데 위치시키기 위해 아래와 같이 값 구하기
       var _left = Math.ceil(( window.screen.width - _width )/2);
       var _top = Math.ceil(( window.screen.height - _height )/2); 
    
       window.open("./member/find_IDForm.jsp", "ID / PW 찾기", 'width='+ _width +', height='+ _height +', left=' + _left + ', top='+ _top );
    
   }
   
   window.onload=function(){
	   $(".g-signin2>div").css('width','500px');
	   $("#naverIdLogin img").css('height', '49px');
   }
   
</script>
</head>

<body class="container">
    
    <!-- 로그인 폼 -->
    <%--MemberFrontController서블릿에.. 로그인 처리 요청시! 입력한 id와 패스워드 전달 --%>
<div>
    <form action="./MemberLoginAction.do" method="post" id="login">
    
    <div class="jointo">
    
        <h1 align="center" class="tit">로그인</h1>
        <h3 align="center">아이티영의 다양한 서비스와 혜택을 누리세요.</h3>
		
	<div class="joinin">
    
        <div>
   			<h3 class="join_title">
        		<label>아이디</label>
       	 	</h3>
            
            <input type="text" id="id" name="id" class="form-control" onblur="login_check()" required autofocus/>
            
            <div class="check_font" id="idMessage"></div>
            
        </div>
        
        <div>
    		<h3 class="join_title">
        		<label>비밀번호</label>
        	</h3>
            
            <input  type="password" id="password" name="password" class="form-control" onblur="login_check()" required autofocus/>
            
            <div class="check_font" id="passMessage"></div>
        </div>
        
        
        
	<div class="for">
        <div class="login_SR">
        	<input type="submit" value="로그인" class="submit_l">
        </div>
        
        <div class="fond_btn">
        
        <br>
        
        	<input type="button" class="btn btn-primary" value="아이디/비밀번호 찾기" onclick="showPopup();" style="float: left;"/>
        	<a href="./join.do"><input type="button" class="btn btn-primary2" value="회원가입" ></a>
        	
        </div>
    </div>
      
      
      <br><br>
      
      <!-- 구글 로그인 추가 -->
	<div>
		<a class="g-signin2" data-onsuccess="onSignIn" data-theme="dark" ></a>
	</div>
	
	<br><br>
      
    <div>
		<a id="kakao-login-btn" ></a>
		<a href="http://developers.kakao.com/logout" ></a>
	</div>
      
      
    <br><br>
      
	<!-- //네이버아이디로로그인 버튼 노출 영역 -->
	<div id="naverIdLogin" style="width: 100px; display: inline-block;"></div>


	</div>
      
   
    
	</form>
</div>
	
	
	<script type="text/javascript">
	function fn_process(Email, Name) {
		var checkEmail = 0;
		
		var name = 0;
		//아래의 아이디입력란에서 입력한 ID값을 얻어 저장
		var _email = Email;
		var _name = Name;
		
		
		if(_email == ''){//아이디를 입력 하지 않았을 경우
			alert("ID를 입력하세요.");
			return;
		}
		
		$.ajax(
				{
					url:"${pageContext.request.contextPath}/emailcheck", //요청할 가상주소 
					type:"post", //요청방식 지정
					async:false,  //비동기 방식의 요청 지정 
					data:{id:_email, name:_name}, // 아래의 입력한 아이디를 서블릿으로 전송함(요청값).
					dataType:"text",// 요청후 서블릿으로 부터 응답받을 데이터 타입 
					success:function(data,textStatus){//요청전송과 응답이 모두 성공했을경우 응답 메세지를 받아 작업할 곳
						//응답메세지를 받아 구현할 곳
						if(data == 'usable'){
							//id속성값이 message인 <div>태그영역을 선택해  "사용할수 있는 ID입니다."메세지표시
							//사용할수 있는 ID이면  버튼을 비활성화 시킵니다.
							checkEmail = 0;
						}else{
							checkEmail = 1;
						}
					}
					
				}
			  );
		return checkEmail, name;
	}    
	
	
		// 네이버 로그인
		var naverLogin = new naver.LoginWithNaverId(
				{
					clientId : "b_4AViMK1jUwar3v5AFO",
					callbackUrl : "http://localhost:8090/ShoppingMall/member/navercallback.jsp",
					isPopup : false,
					loginButton : {
						color : "green",
						type : 3,
						height : 60
					}
				})

		naverLogin.init();
		naverLogin.getLoginStatus(function(status) {
			if (status) {
				var naverEmail = naverLogin.user.getEmail();
				
				var naverName = naverLogin.user.getName();
				
				var checkEmail = fn_process(naverEmail)
				
			    if(checkEmail == 0) {
			    	//데이터 베이스에 없을 경우(즉 회원가입하지 않은 이메일인 경우) join페이지로 get방식으로 이메일 전달
			    	location.href = "./join.do?email=" + naverEmail + "&name=" + naverName;
			    }
			    
			}
		});

		
		// 카카오 로그인
		// 사용할 앱의 JavaScript 키를 설정해 주세요.
		Kakao.init('777ae91931ca4226f41a91ad5e54ce26');
		// 카카오 로그인 버튼을 생성합니다.
		Kakao.Auth.createLoginButton({
			container : '#kakao-login-btn',
			success : function(authObj) {
				// 로그인 성공시, API를 호출합니다.
				Kakao.API.request({
					url : '/v2/user/me',
					success : function(res) {
						
						var kakaoEmail = res.kakao_account.email;
						var kakaoName = res.properties['nickname'];
						
						var checkEmail = fn_process(kakaoEmail)
						
					    if(checkEmail == 0) {
					    	//데이터 베이스에 없을 경우(즉 회원가입하지 않은 이메일인 경우) join페이지로 get방식으로 이메일 전달
					    	location.href = "./join.do?email=" + kakaoEmail + "&name=" + kakaoName;
					    } else {
					    	//위의 반대
					    	alert("login하였음");
					    }
						
					},
					fail : function(error) {
						alert(JSON.stringify(error));
					}
				});
			},
			fail : function(err) {
				alert(JSON.stringify(err));
			}
		});

		//구글 로그인
		function onSignIn(googleUser) {
			// Useful data for your client-side scripts:
			var profile = googleUser.getBasicProfile();
			
			// 이름 저장
			var fullname = profile.getName();
			
			// 이메일 저장
			var gmailEmail = profile.getEmail();
			
			var checkEmail = fn_process(gmailEmail);
			
			if (checkEmail == 0) {
				//데이터 베이스에 없을 경우(즉 회원가입하지 않은 이메일인 경우) join페이지로 get방식으로 이메일 전달
				location.href = "./join.do?email=" + gmailEmail + "&name=" + fullname;
			} else {
				//위의 반대
				alert("login하였음");
			}
			var auth2 = gapi.auth2.getAuthInstance();
			auth2.disconnect();
		}
	</script>

</body>
</html>

