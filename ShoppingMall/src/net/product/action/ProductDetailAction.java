package net.product.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.product.db.ProductDAO;
import net.product.db.ProductDTO;

@WebServlet("/ProductDetailAction.do")
public class ProductDetailAction extends HttpServlet{
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		requestPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		requestPro(request, response);
	}

	protected void requestPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		
		ProductDAO pdao = new ProductDAO();
		ProductDTO pdto = pdao.getProduct(1);
		
		request.setAttribute("pdto", pdto);
		request.setAttribute("id", id);
		
		RequestDispatcher dis = 
				request.getRequestDispatcher("product/product.jsp");
		//실제 재요청
		dis.forward(request, response);		
		
	}
}
