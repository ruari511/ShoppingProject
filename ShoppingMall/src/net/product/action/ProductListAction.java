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
		String category_main =request.getParameter("main");		
		//서브 카테고리 불러오기
		String  category_sub = request.getParameter("sub");
		//정렬방법 불러오기
		String sort = request.getParameter("sort");		
		//페이지번호 불러오기
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		
		//선택한 브랜드 불러오기
		String[] brands = request.getParameterValues("brand");

		
		ProductDAO pdao = new ProductDAO();

		Vector<ProductDTO> productList = pdao.getProductListAll(category_main, category_sub, sort, pageNum, brands);	

		request.setAttribute("productList", productList);

		
		
		
		//기타.. 일자 정렬?
		
		//서브카테고리 목록불러오기
		
			Vector<String> subList = pdao.getSubList(category_main);
			request.setAttribute("subList", subList);
		//브랜드목록 불러오기
			Vector<String> brandList = pdao.getBrandList(category_main, category_sub);
			request.setAttribute("brandList", brandList);

		//상품 총 갯수 불러오기
			int productCount = pdao.getProductCount(category_main, category_sub, brands);
			request.setAttribute("productCount", productCount);

		
		forward.setRedirect(false);
		forward.setPath("product/productList.jsp");
		return forward;
	}
	

}
