<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<head>
	<meta charset="utf-8">
	<meta http-equiv="Content-Script-Type" content="text/javascript">
	<meta http-equiv="Content-Style-Type" content="text/css">
	<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
	<meta name="format-detection" content="telephone=no">
	<meta property="og:title" content="공식 온라인몰">
	<meta property="og:url" content="main.html">
	<meta property="og:image" content="">
	<meta property="og:description" content="">
	<title> # </title>

	<link rel="stylesheet" href="./asset/css/global.css"/> 
	<script type="text/javascript" src="./asset/js/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="./asset/js/slick.min.js"></script>
	<script type="text/javascript" src="./asset/js/common.js"></script>
	
</head>
<body>
<%
	String section = request.getParameter("section");
	if(section == null){
		section = "Section.jsp";
	}
%>
<div id="Wrapper">
	<div id="skip_navi"><a href="#Container">본문바로가기</a></div>
	
	<!-- header -->
	<jsp:include page="./include/Header.jsp"/>
	<!-- header// -->
					
	<!-- section -->
	<jsp:include page="<%=section %>"/>
	<!-- section// -->

	<!-- footer -->
	<jsp:include page="./include/Footer.jsp"/>
	<!-- footer// -->
</div>
