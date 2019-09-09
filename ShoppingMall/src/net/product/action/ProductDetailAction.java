package net.product.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.action.Action;
import net.action.ActionForward;
import net.product.db.ProductDAO;
import net.product.db.ProductDTO;
import net.review.db.ReviewDTO;
import net.review.db.review_DAO;


public class ProductDetailAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) 
			throws Exception {

		ActionForward forward=new ActionForward();

		request.setCharacterEncoding("utf-8");
		System.out.println("ProductDetailAction execute()");
		
		HttpSession session = request.getSession();
		
		String id = (String) session.getAttribute("id");
		String product_num = request.getParameter("product_num");
		String review_select = request.getParameter("review_select");
		
		ProductDAO pdao = new ProductDAO();
		ProductDTO pdto = pdao.getProduct(Integer.parseInt(product_num));
		
		request.setAttribute("pdto", pdto);
		request.setAttribute("id", id);
		
		
		review_DAO rdao = new review_DAO();
		String order = "";
		String returnOrder = "insert_product";
		
		int size = 15;

		int cnt = rdao.review_getPageCount(Integer.parseInt(product_num));
		
		double staravg = rdao.review_getStarAvg(Integer.parseInt(product_num));
		
		int start = 0;
		
		//상품평 전체 뿌려주는 부분
		ArrayList<ReviewDTO> reviewlist = rdao.review_get(start, size, Integer.parseInt(product_num));
		
		if(request.getParameter("startRow") != null){
			start = Integer.parseInt(request.getParameter("startRow"));
		}
		
		
		if(request.getParameter("order") != null && request.getParameter("order").length() != 0){
			if(request.getParameter("order").equals("insert_product")){
				
				returnOrder = "insert_product";
				order = " order by review_regdate desc ";
				reviewlist = rdao.review_get(start, size, Integer.parseInt(product_num), order);
				cnt = rdao.review_getPageCount(Integer.parseInt(product_num));
				
			} else if(request.getParameter("order").equals("high_like")){
				
				returnOrder = "high_like";
				order = " order by like_count desc ";
				reviewlist = rdao.review_get(start, size, Integer.parseInt(product_num), order);
				cnt = rdao.review_getPageCount(Integer.parseInt(product_num));
				
			} else if(request.getParameter("order").equals("high_star")){
				
				returnOrder = "high_star";
				order = " order by review_star desc ";
				reviewlist = rdao.review_get(start, size, Integer.parseInt(product_num), order);
				cnt = rdao.review_getPageCount(Integer.parseInt(product_num));
				
			} else if(request.getParameter("order").equals("low_star")){
				
				returnOrder = "low_star";
				order = " order by review_star ";
				reviewlist = rdao.review_get(start, size, Integer.parseInt(product_num), order);
				cnt = rdao.review_getPageCount(Integer.parseInt(product_num));
				
			}
		}
		
		
		// 리뷰게시판 불러오기.
		
		//상품평 이미지탭 이미지 뿌려주는 부분
		ArrayList<ReviewDTO> reviewAlllist = rdao.review_Allget(Integer.parseInt(product_num));
		
		// request 객체에 list를 담아준다.
		request.setAttribute("reviewlist", reviewlist);
		request.setAttribute("reviewAlllist", reviewAlllist);
		request.setAttribute("startRow", start);
		request.setAttribute("product_num", product_num);
		request.setAttribute("review_cnt", cnt);
		request.setAttribute("order", request.getParameter("order"));
		request.setAttribute("returnOrder", returnOrder);
		request.setAttribute("review_select", review_select);
		request.setAttribute("staravg", staravg);

		forward.setRedirect(false);

		forward.setPath("./Product.pro");
		
		return forward;
	}
}