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

@WebServlet("/getOrderDetail.do")
public class OrderListDetailController extends HttpServlet {
	
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
		
		int buynum = 200;
		/* int buynum = request.getParameter("buynum");*/
		String id = "admin";
		/*String id = request.getParameter("id");*/
		
		Vector<BuyListDTO> buylist = bdao.getBuyDetail(id, buynum);
		
		request.setAttribute("buylist", buylist);
		
		RequestDispatcher dis = request.getRequestDispatcher("OrderListDetail.jsp");
		
		dis.forward(request, response);		
	}
	
	
}




