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
			String subcate = "";
			brand = pdao.selectProductbrand(query, cate, subcate);
			ArrayList<String> subcategory = pdao.selectProductsubcate(query, cate);
			count = pdao.selectProductcateCount(query, cate);
			productList = pdao.selectProductcate(query, Integer.parseInt(startrow), 24, cate);
			request.setAttribute("subcategory", subcategory);
			request.setAttribute("cate", cate);
		}
		if(request.getParameter("subcate") != null && request.getParameter("subcate").length() != 0){
			String cate = request.getParameter("cate");
			String subcate = request.getParameter("subcate");
			brand = pdao.selectProductbrand(query, cate, subcate);
			count = pdao.selectProductsubcateCount(query, cate, subcate);
			productList = pdao.selectProductsubcate(query, Integer.parseInt(startrow), 24, cate, subcate);
			request.setAttribute("subcate", subcate);
		}
		if(request.getParameterValues("brand_check") != null && request.getParameterValues("brand_check").length != 0){
			System.out.println("brand = " + request.getParameterValues("brand_check")[0]);
			String brandquery = "";
			String cate = request.getParameter("cate");
			String subcate = request.getParameter("subcate");
			String[] checkbrand = request.getParameterValues("brand_check");
			brand = pdao.selectProductbrand(query, cate, subcate);
			
			for(int i=0; i<checkbrand.length; i++){
				System.out.println("checkbox = " + checkbrand[i]);
				if(i==0){
					if(checkbrand.length == 1){
						brandquery += " && brand= '"+checkbrand[i]+"'";
					}else{
						brandquery += " && (brand= '"+checkbrand[i]+"'";
					}
				}else if(i == checkbrand.length-1){
					brandquery += " || brand= '"+checkbrand[i]+"')";
				}else{
					brandquery += " || brand= '"+checkbrand[i]+"'";
				}
			}
			System.out.println("brandquery = " + brandquery);
			count = pdao.selectProductbrandCount(query, cate, subcate, brandquery);
			productList = pdao.selectProductbrand(query, Integer.parseInt(startrow), 24, cate, subcate, brandquery);
			
			request.setAttribute("checkbrand", checkbrand);
		}
		
		if(request.getParameter("high_price") != null && request.getParameter("low_price") != null && request.getParameter("high_price").length() != 0 && request.getParameter("low_price").length() != 0){
			String brandquery = "";
			String cate = request.getParameter("cate");
			String subcate = request.getParameter("subcate");
			String[] checkbrand = request.getParameterValues("brand_check");
			String low = request.getParameter("low_price");
			String high = request.getParameter("high_price");
			brand = pdao.selectProductbrand(query, cate, subcate, low, high);
			
			for(int i=0; i<checkbrand.length; i++){
				System.out.println("checkbox = " + checkbrand[i]);
				if(i==0){
					if(checkbrand.length == 1){
						brandquery += " && brand= '"+checkbrand[i]+"'";
					}else{
						brandquery += " && (brand= '"+checkbrand[i]+"'";
					}
				}else if(i == checkbrand.length-1){
					brandquery += " || brand= '"+checkbrand[i]+"')";
				}else{
					brandquery += " || brand= '"+checkbrand[i]+"'";
				}
			}
			
			System.out.println("brandquery = " + brandquery);
			count = pdao.selectProductPriceCount(query, cate, subcate, brandquery, low, high);
			productList = pdao.selectProductPrice(query, Integer.parseInt(startrow), 24, cate, subcate, brandquery, low, high);
			
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
