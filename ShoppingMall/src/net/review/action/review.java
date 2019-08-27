package net.review.action;


import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.review.db.*;

/**
 * Servlet implementation class review
 */
@WebServlet("/review")
public class review extends HttpServlet {

	public review() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		review_DAO dao = new review_DAO();
		
		System.out.println("review.credu");

		int pagenum = 1; // 페이지 번호
		if (request.getParameter("Page_num") != null) {
			pagenum = Integer.parseInt(request.getParameter("Page_num"));
		}

		// size 보여줄 페이지당 게시글 개수. 15개당 1page
		int size = 15;

		int tot = 0;
		int cnt = 0;

		try {

			// 총 게시글 개수.
			cnt = dao.review_getPageCount();
			//페이지 번호
			tot = cnt / size;
			if (cnt % size != 0) {
				tot++;
			}

			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		// 1page 1 ~ 15 15개
		// 2page 16 ~ 30 15개
		// 3page 31 ~ 45 15개
		
		int end = pagenum * size;
		int start = end - size + 1;
		
		System.out.println(start);
		System.out.println(end);

		// 리뷰게시판 불러오기.
		ArrayList<ReviewDTO> list = dao.review_get(start, end);

		// request 객체에 list를 담아준다.
		request.setAttribute("list", list);
		
		// request 객체에 총 페이지수를 담아준다.
		request.setAttribute("tot", tot);
				

		// product.jsp로 이동
		RequestDispatcher dis = 
				request.getRequestDispatcher("product/product.jsp");
		
		//실제 재요청
		dis.forward(request, response);		

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
