package net.review.action;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.review.db.*;

/**
 * Servlet implementation class review_write
 */
@WebServlet("/review_write")
public class review_write extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public review_write() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	
		System.out.println("review_write 서블릿 요청");
		
		//파라미터 추출
		
		String id = request.getParameter("id");
		String review_title = request.getParameter("review_title");
		int product_num =  Integer.parseInt(request.getParameter("product_num"));
		String review_content = request.getParameter("review_content");
		
		int review_star = Integer.parseInt(request.getParameter("review_star"));
		
		
		// 값 출력 test
		System.out.println(id);
		System.out.println(review_title);
		System.out.println(product_num);
		System.out.println(review_content);
		System.out.println(review_star);
		
		
		// 빈 객체에 데이터 set
		ReviewDTO dto = new ReviewDTO();
		
		dto.setId(id);
		dto.setReview_title(review_title);
		dto.setProduct_num(product_num);
		dto.setReview_content(review_content);
		dto.setReview_star(review_star);
		
		
		//DB에 저장
		review_DAO dao = new review_DAO();
		dao.review_write(dto);
		
		//페이지 이동
		String site = "review.credu";
		response.sendRedirect(site);
		
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
