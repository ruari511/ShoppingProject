package net.product.action;

import java.util.Vector;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.action.Action;
import net.action.ActionForward;
import net.product.db.ProductDAO;
import net.product.db.ProductDTO;

public class ProductListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		
		//메인카테고리 불러오기
		int category_main = Integer.parseInt(request.getParameter("main"));
		
		//서브 카테고리 불러오기
		int category_sub = Integer.parseInt(request.getParameter("sub"));

		//정렬방법 불러오기
		String sort = request.getParameter("sort");
		
		//페이지번호 불러오기
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		
		ProductDAO pdao = new ProductDAO();
		
		//전체선택
		Vector<ProductDTO> v = pdao.getProductListAll(category_main, category_sub, sort, pageNum);
		
		//브랜드 필터 선택
		
		//기타.. 일자 정렬?
		
		request.setAttribute("categoryList", v);
		
		forward.setRedirect(false);
		forward.setPath("../product/productList.jsp");
		return forward;
	}
	

}
