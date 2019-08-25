package net.cart.action;

import java.io.PrintWriter;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.action.Action;
import net.action.ActionForward;
import net.cart.db.CartDAO;
import net.cart.db.CartDTO;
import net.member.db.MemberDAO;
import net.member.db.MemberDTO;


public class CartInsertAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) 
			throws Exception {
		System.out.println("CartInsertAction execute()");
		
		request.setCharacterEncoding("utf-8");
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
		
		return null;
	}
}
