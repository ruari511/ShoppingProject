package net.review.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.review.db.*;

/**
 * Servlet implementation class review_delete
 */
@WebServlet("/review_delete")
public class review_delete extends HttpServlet {
	
	public review_delete() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("review_delete.credu 요청");

		// 파라미터 한글처리
		request.setCharacterEncoding("utf-8");

		// 파라미터값 추출
		int review_num = Integer.parseInt(request.getParameter("review_num"));

		// 해당 리뷰글 번호로 해당 글 삭제.
		try {
			
			review_DAO dao = new review_DAO();
			
			dao.review_delete(review_num);


		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
