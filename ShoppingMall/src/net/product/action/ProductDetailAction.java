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

@WebServlet("/ProductDetailAction.pro")
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
		
		request.setCharacterEncoding("utf-8");
		
		
		HttpSession session = request.getSession();
		
		String id = (String) session.getAttribute("id");
		String product_num = request.getParameter("product_num");
		
		ProductDAO pdao = new ProductDAO();
		ProductDTO pdto = pdao.getProduct(Integer.parseInt(product_num));
		
		request.setAttribute("pdto", pdto);
		request.setAttribute("id", id);
		
		
		review_DAO rdao = new review_DAO();
		String order = "";
		
		int size = 15;

		int cnt = rdao.review_getPageCount();
		
		int start = 0;
		
		if(request.getParameter("startRow") != null){
			System.out.println("스타트로우 들어왔음");
			start = Integer.parseInt(request.getParameter("startRow"));
		}
		
		System.out.println("startRow = " + start);
		System.out.println("상품번호: " + product_num);

		
		if(request.getParameter("order") != null && request.getParameter("order").length() != 0){
			System.out.println("order 들어감");
			if(request.getParameter("order").equals("insert_product")){
				order = " order by review_regdate desc ";
			} else if(request.getParameter("order").equals("high_like")){
				order = " order by like_count desc ";
			} else if(request.getParameter("order").equals("high_star")){
				order = " order by review_star desc ";
			} else if(request.getParameter("order").equals("low_star")){
				order = " order by review_star ";
			}
		}
		
		
		// 리뷰게시판 불러오기.
		ArrayList<ReviewDTO> reviewlist = rdao.review_get(start, size, Integer.parseInt(product_num));
		ArrayList<ReviewDTO> reviewAlllist = rdao.review_Allget(Integer.parseInt(product_num));
		ArrayList<ReviewDTO> orderlist = rdao.review_order(order);
		
		// request 객체에 list를 담아준다.
		request.setAttribute("reviewlist", reviewlist);
		request.setAttribute("reviewAlllist", reviewAlllist);
		request.setAttribute("startRow", start);
		request.setAttribute("product_num", product_num);
		request.setAttribute("review_cnt", cnt);
		request.setAttribute("orderlist", orderlist);
		request.setAttribute("order", request.getParameter("order"));
		
		System.out.println("ProductDetailAction: " + request.getParameter("order"));
		
		RequestDispatcher dis = 
				request.getRequestDispatcher("product/product.jsp");
		
		//실제 재요청
		dis.forward(request, response);		
		
	}
}
