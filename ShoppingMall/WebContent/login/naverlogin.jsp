<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>

<!-- 구글 -->
<meta name="google-signin-scope" content="profile email">
    <meta name="google-signin-client_id" content="714799720673-kmhsf3rqmk083p148at0tui000p84ntu.apps.googleusercontent.com">

<!-- 네이버 -->
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>

<!-- 카카오 -->
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

<!-- 구글 -->
<script src="https://apis.google.com/js/platform.js" async defer></script>


<title>Insert title here</title>
</head>
<body>

  <!-- //네이버아이디로로그인 버튼 노출 영역 -->
  <div id="naverIdLogin"></div>
  
<br><br><br><br><br>
  
  
  <a id="kakao-login-btn"></a>
  <a href="http://developers.kakao.com/logout"></a>

<br><br><br><br><br>  
  
  <!-- 구글 로그인 추가 -->
  <a class="g-signin2" data-onsuccess="onSignIn" data-theme="dark"></a>

  
  <script type="text/javascript">
  // 네이버 로그인
     var naverLogin = new naver.LoginWithNaverId({
        clientId : "b_4AViMK1jUwar3v5AFO",
        callbackUrl : "http://localhost:8090/ShoppingMall/login/navercallback.jsp",
        isPopup : false,
        loginButton : {color : "green", type : 3, height : 60}
     })
     
     naverLogin.init();
     naverLogin.getLoginStatus(function (status) {
      if (status) {
         var gender = naverLogin.user.getGender();
         var email = naverLogin.user.getEmail();
         var name = naverLogin.user.getName();
         var profileImage = naverLogin.user.getProfileImage();
         var birthday = naverLogin.user.getBirthday();         
         var uniqId = naverLogin.user.getId();
         var age = naverLogin.user.getAge();
         console.log("email : ", email);
         console.log("gender : ", gender)
         console.log("name : ", name);
         console.log("profileImage : ", profileImage);
         console.log("birthday : ", birthday);
         console.log("uniqId : ", uniqId);
         console.log("age : ", age);
         
      } else {
         console.log("AccessToken이 올바르지 않습니다.");
      }
   });
    
     // 카카오 로그인
    // 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('777ae91931ca4226f41a91ad5e54ce26');
    // 카카오 로그인 버튼을 생성합니다.
    Kakao.Auth.createLoginButton({
      container: '#kakao-login-btn',
      success: function(authObj) {
        // 로그인 성공시, API를 호출합니다.
        Kakao.API.request({
          url: '/v2/user/me',
          success: function(res) {
	             alert(JSON.stringify(res)); //<---- kakao.api.request 에서 불러온 결과값 json형태로 출력
				 
	             alert(JSON.stringify(authObj)); //<----Kakao.Auth.createLoginButton에서 불러온 결과값 json형태로 출력

	             console.log(res.id);//<---- 콘솔 로그에 id 정보 출력(id는 res안에 있기 때문에  res.id 로 불러온다)

	             console.log(res.kakao_account.email);//<---- 콘솔 로그에 email 정보 출력
	             
	             console.log(res.kakao_account.has_birthday);
	             
	             console.log(res.kakao_account.birthday);
	            
	             console.log(res.kakao_account.gender);
	             
	             console.log(res.properties['kakao_account.gender']);//<---- 콘솔 로그에 email 정보 출력
	             
	             console.log(res.properties['nickname']);//<---- 콘솔 로그에 닉네임 출력(properties에 있는 nickname 접근 

	             console.log(authObj.access_token);//<---- 콘솔 로그에 토큰값 출력
          },
          fail: function(error) {
            alert(JSON.stringify(error));
          }
        });
      },
      fail: function(err) {
        alert(JSON.stringify(err));
      }
    });
        
    
        
  	//구글 로그인
	function onSignIn(googleUser) {
        // Useful data for your client-side scripts:
        var profile = googleUser.getBasicProfile();
        console.log("ID: " + profile.getId()); // Don't send this directly to your server!
        console.log('Full Name: ' + profile.getName());
        console.log('Given Name: ' + profile.getGivenName());
        console.log('Family Name: ' + profile.getFamilyName());
        console.log("Image URL: " + profile.getImageUrl());
        console.log("Email: " + profile.getEmail());

        // The ID token you need to pass to your backend:
        var id_token = googleUser.getAuthResponse().id_token;
        console.log("ID Token: " + id_token);
      }
  	
</script>
    
</body>
</html>