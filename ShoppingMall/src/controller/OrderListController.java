package controller;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import buyList.BuyListDAO;
import buyList.BuyListDTO;
import product.ProductDAO;
import product.ProductDTO;

@WebServlet("/getOrderList.do")
public class OrderListController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		requestPro(request, response);
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		requestPro(request, response);
	}

	protected void requestPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//주문 정보 받기
		BuyListDAO bdao = new BuyListDAO();
		
		String id = "admin";
		/*String id = request.getParameter("id");*/
		Vector<BuyListDTO> buylist = bdao.getBuyList(id);
		
		request.setAttribute("buylist", buylist);
		System.out.println(buylist);
		RequestDispatcher dis = request.getRequestDispatcher("OrderList.jsp");
		
		dis.forward(request, response);		
	}
	
	
}




