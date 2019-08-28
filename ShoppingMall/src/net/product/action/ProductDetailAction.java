package net.product.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.product.db.ProductDAO;
import net.product.db.ProductDTO;
import net.review.db.ReviewDTO;
import net.review.db.review_DAO;

@WebServlet("/ProductDetailAction.do")
public class ProductDetailAction extends HttpServlet{
	
	public ProductDetailAction() {
		super();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		requestPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		requestPro(request, response);
	}

	protected void requestPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		String product_num=request.getParameter("product_num");
		
		ProductDAO pdao = new ProductDAO();
		ProductDTO pdto = pdao.getProduct(Integer.parseInt(product_num));
		
		request.setAttribute("pdto", pdto);
		request.setAttribute("id", id);
		
		
		review_DAO dao = new review_DAO();
		
		
		System.out.println("상품 액션");

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
		
//		int end = pagenum * size;
		int end = 30;
		int start = end - size + 1;
		
		System.out.println(start);
		System.out.println(end);
		System.out.println("상품번호: " + product_num);

		// 리뷰게시판 불러오기.
		ArrayList<ReviewDTO> list = dao.review_get(start, end, Integer.parseInt(product_num));
		// request 객체에 list를 담아준다.
		request.setAttribute("list", list);
		
		// request 객체에 총 페이지수를 담아준다.
		request.setAttribute("tot", tot);
		System.out.println("-===End");
	
////////////////////////////////////////////////////////////////////////////////////////////////////////
		
//		review_DAO dao = new review_DAO();
//		ArrayList<ReviewDTO> dto = dao.getReview(Integer.parseInt(product_num));
//		
//		System.out.println("review.credu");
//
//		int pagenum = 1; // 페이지 번호
//		if (request.getParameter("Page_num") != null) {
//			pagenum = Integer.parseInt(request.getParameter("Page_num"));
//		}
//
//		// size 보여줄 페이지당 게시글 개수. 15개당 1page
//		int size = 15;
//
//		int tot = 0;
//		int cnt = 0;
//
//		try {
//
//			// 총 게시글 개수.
//			cnt = dao.review_getPageCount();
//			//페이지 번호
//			tot = cnt / size;
//			if (cnt % size != 0) {
//				tot++;
//			}
//
//			
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		
//		
//		// 1page 1 ~ 15 15개
//		// 2page 16 ~ 30 15개
//		// 3page 31 ~ 45 15개
//		
//		int end = pagenum * size;
//		int start = end - size + 1;
//		
//		System.out.println(start);
//		System.out.println(end);
//		System.out.println("상품번호: " + product_num);
//		
//		// 리뷰게시판 불러오기.
////		ArrayList<ReviewDTO> list = dao.review_get(start, end, Integer.parseInt(product_num));
//		ArrayList<ReviewDTO> list = dao.getReview(Integer.parseInt(product_num));
//		// request 객체에 list를 담아준다.
//		request.setAttribute("list", list);
//		
//		// request 객체에 총 페이지수를 담아준다.
//		request.setAttribute("tot", tot);
		
		
		
		RequestDispatcher dis = 
				request.getRequestDispatcher("product/product.jsp");
		
		//실제 재요청
		dis.forward(request, response);		
		
	}
}

