package net.cart.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.cart.db.CartDAO;

@WebServlet("/CartInsertController.do")
public class CartInsertController extends HttpServlet{

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		requestPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		requestPro(request, response);
	}

	protected void requestPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8;");
		
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		String product_num = request.getParameter("product_num");
		String product_count = request.getParameter("product_count");
		
		int pnum = Integer.parseInt(product_num);
		int pcount = Integer.parseInt(product_count);
		
		CartDAO cdao = new CartDAO();
		
		cdao.InsertCart(pnum, id, pcount);
		
		PrintWriter out = response.getWriter();
		
		out.write("<script>");
		out.write("alert('장바구니에 저장이 완료되었습니다.');");
		out.write("history.go(-1);");
		out.write("</script>");
		
		
		
	}

}
