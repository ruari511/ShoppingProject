package net.product.action;


import java.util.ArrayList;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.action.Action;
import net.action.ActionForward;
import net.product.db.ProductDAO;
import net.product.db.ProductDTO;


public class ProductSelectAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) 
			throws Exception {
		System.out.println("ProductSelectAction execute()");
		
		request.setCharacterEncoding("utf-8");
		if(request.getParameter("query") != null){
		ProductDAO pdao = new ProductDAO();
		String query = request.getParameter("query");
		ArrayList<String> category = pdao.selectProductcate(query);
		ArrayList<String> brand = pdao.selectProductbrand(query);
		
		if(request.getParameter("cate") != null){
			String cate = request.getParameter("cate");
			ArrayList<String> subcategory = pdao.selectProductsubcate(query, cate);
			request.setAttribute("subcategory", subcategory);
		}
		String startrow = request.getParameter("startrow");
		Vector<ProductDTO> productList = pdao.selectProduct(query, Integer.parseInt(startrow), 24);
		int count = pdao.selectProductCount(query);
		
		request.setAttribute("brand", brand);
		request.setAttribute("productList", productList);
		request.setAttribute("count", count);
		request.setAttribute("query", query);
		request.setAttribute("startrow", startrow);
		request.setAttribute("category", category);
		
		ActionForward forward=new ActionForward();

		forward.setRedirect(false);

		forward.setPath("./ProductSelect.pro");
		
		return forward;
		}
		return null;
	}
}
