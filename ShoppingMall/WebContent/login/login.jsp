<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<title>Hello JSP</title>
</head>

<body class="container">
    <div class="jumbotron">
        <h1>로그인</h1>
        <p>id 비밀번호 입력해주세요</p>
    </div>
    
    <!-- 로그인 폼 -->
    <form action="#" method="post" style=" margin: 0 auto; width: 50%; ">
        <div class="form-group">
            <label>아이디</label>
            <input name="email" type="email" class="form-control" />
        </div>
        <div class="form-group">
            <label>비밀번호</label>
            <input name="password" type="password" class="form-control" />
        </div>
        <button type="submit" class="btn btn-primary">전송</button>
    </form>
    
</body>

</html>