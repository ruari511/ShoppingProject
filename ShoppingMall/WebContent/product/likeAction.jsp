<%@page import="net.review.db.review_DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="net.review.db.ReviewLikeDAO"%>

<%@ page import="java.io.PrintWriter"%>

<%
	
	request.setCharacterEncoding("UTF-8");
	
    // 로그인한 유저의 아이디를 가져오기(세션 확인)

	String review_num = null;
	String id = null;
	
	if(session.getAttribute("id") != null) {

		id = (String) session.getAttribute("id");

	}
	
// 	if(id == null) {

// 		PrintWriter script = response.getWriter();

// 		script.println("<script>");

// 		script.println("alert('로그인을 해주세요.');");

// 		script.println("location.href = '../login.do'");

// 		script.println("</script>");

// 		script.close();

// 		return;
// 	}
	
    // 이전의 파라매터로 보낸 리뷰 글번호 가져오기

	if(request.getParameter("review_num") != null) {

		review_num = (String) request.getParameter("review_num");

	}
	System.out.println("bb= " + request.getParameter("review_num"));
	
	review_DAO reviewdao = new review_DAO();
	ReviewLikeDAO likeyDAO = new ReviewLikeDAO();



	// id와 을 review_num이 PK, NN 설정이기때매 중복이 불가

	int result = likeyDAO.relike(review_num, id);

	System.out.println("CC= " + result);

	// 정상적으로 1번 데이터가 들어가면 1이 출력되고

	if (result == 1) {

		result = reviewdao.rlike(review_num);
		System.out.println("dd= " + result);

		if (result == 1) { // 1인경우 디비에서 해당 게시물 추천 완료

			PrintWriter script = response.getWriter();

			script.println("<script>");

			script.println("alert('추천이 완료되었습니다.');");

// 			script.println("location.href='index.jsp'");
			script.println("history.back();");

			script.println("</script>");

			script.close();

			System.out.println("ff= " + result);

			return;

		} else {

			PrintWriter script = response.getWriter();

			script.println("<script>");

			script.println("alert('데이터베이스 오류가 발생했습니다.');");

			script.println("history.back();");

			script.println("</script>");

			script.close();

			

			return;

		}



	} else { // 이미 PK, NN으로 설정되어 중복되면 1 반환이 되지 않음

		PrintWriter script = response.getWriter();

		script.println("<script>");

		script.println("alert('이미 추천을 누른 글입니다.');");

		script.println("history.back();");

		script.println("</script>");

		script.close();



		return;



	}

%>