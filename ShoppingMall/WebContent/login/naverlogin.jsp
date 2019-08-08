<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>

<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

<title>Insert title here</title>
</head>
<body>

  <!-- //네이버아이디로로그인 버튼 노출 영역 -->
  <div id="naverIdLogin"></div>
  <br><br><br><br><br>
  
  
  <a id="kakao-login-btn"></a>
  <a href="http://developers.kakao.com/logout"></a>
  
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
    //<![CDATA[
    // 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('777ae91931ca4226f41a91ad5e54ce26');
    // 카카오 로그인 버튼을 생성합니다.
    Kakao.Auth.createLoginButton({
      container: '#kakao-login-btn',
      success: function(authObj) {
      alert(JSON.stringify(authObj));
     },
     fail: function(err) {
        alert(JSON.stringify(err));
     }
   });
   //]]>
  
    Kakao.Auth.createLoginButton({

    	   container: '#kakao-login-btn',

    	   success: function(authObj) {

    	     Kakao.API.request({

    	       url: '/v1/user/me',

    	       success: function(res) {

    	             alert(JSON.stringify(res)); //<---- kakao.api.request 에서 불러온 결과값 json형태로 출력

    	             alert(JSON.stringify(authObj)); //<----Kakao.Auth.createLoginButton에서 불러온 결과값 json형태로 출력

    	             console.log(res.id);//<---- 콘솔 로그에 id 정보 출력(id는 res안에 있기 때문에  res.id 로 불러온다)

    	             console.log(res.kaccount_email);//<---- 콘솔 로그에 email 정보 출력
    	             
    	             console.log(res.kaccount_gender);//<---- 콘솔 로그에 email 정보 출력
    	             
    	             console.log(res.properties['gender']);//<---- 콘솔 로그에 email 정보 출력
    	             
    	             console.log(res.properties['nickname']);//<---- 콘솔 로그에 닉네임 출력(properties에 있는 nickname 접근 

    	         // res.properties.nickname으로도 접근 가능 )

    	             console.log(authObj.access_token);//<---- 콘솔 로그에 토큰값 출력

    	           }

    	         })

    	       },

    	       fail: function(error) {

    	         alert(JSON.stringify(error));

    	       }

    	     });

    	//]]>
  </script>
</body>
</html>