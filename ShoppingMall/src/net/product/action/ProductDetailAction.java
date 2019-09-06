package net.product.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.action.Action;
import net.action.ActionForward;
import net.product.db.ProductDAO;
import net.product.db.ProductDTO;


public class ProductDetailAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) 
			throws Exception {
		System.out.println("ProductDetailAction execute()");
		
		request.setCharacterEncoding("utf-8");
		//ftp://itwillbs9@itwillbs9.cafe24.com/tomcat/webapps/ShoppingMall/product/product.jsp
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		String product_num=request.getParameter("product_num");
		ProductDAO pdao = new ProductDAO();
		ProductDTO pdto = pdao.getProduct(Integer.parseInt(product_num));
		request.setAttribute("pdto", pdto);
		request.setAttribute("id", id);
		
		ActionForward forward=new ActionForward();

		forward.setRedirect(false);
		
		forward.setPath("./Product.pro");
		
		return forward;
	}
}
