<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<head>
	<meta charset="utf-8">
	<title>아이티영 온라인몰</title>

	<link rel="stylesheet" href="./asset/css/board.css"/>
	<link rel="stylesheet" href="./asset/css/global.css"/>
	<link rel="stylesheet" href="./asset/css/contents.css"/> 
	<script type="text/javascript" src="./asset/js/jquery-1.9.1.min.js"></script>
	
	<script type="text/javascript" src="./asset/js/slick.min.js"></script>
	
	<c:choose>
		<c:when test="${param.section eq null }">
		<script type="text/javascript" src="./asset/js/common.js"></script>
		</c:when>
		<c:otherwise>
		<script type="text/javascript" src="../asset/js/common.js"></script>
		</c:otherwise>
	</c:choose>

	
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
