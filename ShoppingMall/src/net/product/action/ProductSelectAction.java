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
		String startrow = request.getParameter("startrow");
		Vector<ProductDTO> productList = pdao.selectProduct(query, Integer.parseInt(startrow), 24);
		int count = pdao.selectProductCount(query);
		ArrayList<String> category = pdao.selectProductcate(query);
		ArrayList<String> brand = pdao.selectProductbrand(query);
		
		if(request.getParameter("cate") != null && request.getParameter("cate").length() != 0){
			String cate = request.getParameter("cate");
			ArrayList<String> subcategory = pdao.selectProductsubcate(query, cate);
			count = pdao.selectProductcateCount(query, cate);
			productList = pdao.selectProductcate(query, Integer.parseInt(startrow), 24, cate);
			request.setAttribute("subcategory", subcategory);
			request.setAttribute("cate", cate);
		}
		
		if(request.getParameter("subcate") != null && request.getParameter("subcate").length() != 0){
			String cate = request.getParameter("cate");
			String subcate = request.getParameter("subcate");
			count = pdao.selectProductsubcateCount(query, cate, subcate);
			productList = pdao.selectProductsubcate(query, Integer.parseInt(startrow), 24, cate, subcate);
			request.setAttribute("subcate", subcate);
		}
		
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
