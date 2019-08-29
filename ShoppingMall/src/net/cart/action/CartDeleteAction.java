package net.cart.action;

import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.action.Action;
import net.action.ActionForward;
import net.cart.db.CartDAO;
import net.cart.db.CartDTO;
import net.member.db.MemberDAO;
import net.member.db.MemberDTO;


public class CartDeleteAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) 
			throws Exception {
		System.out.println("CartDeleteController execute()");
		
		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		
		int cart_num = Integer.parseInt(request.getParameter("cart_num"));
		
		CartDAO cdao = new CartDAO();
		
		int num = cdao.deleteCart(cart_num);
		
		MemberDAO mdao = new MemberDAO();
		
		MemberDTO m = mdao.selectMember(id);
		
		Vector<CartDTO> v = cdao.getAllCartList(id);
		
		request.setAttribute("v", v);
		
		//장바구니 페이지의 주문자정보 값 넘기
		request.setAttribute("m", m);
		
		ActionForward forward=new ActionForward();

		forward.setRedirect(false);

		forward.setPath("./Cart.buy?num="+num);
		
		return forward;
	}
}
