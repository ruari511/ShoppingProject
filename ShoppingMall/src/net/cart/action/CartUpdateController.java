package net.cart.action;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.cart.db.CartDAO;
import net.cart.db.CartDTO;
import net.member.db.MemberDAO;
import net.member.db.MemberDTO;

/*CarReservation.jsp페이지에서.. 전체검색 버튼 클릭했을떄.. DB에 저장되어 있는 전체 차량 검색요청을 받는 서블릿*/
@WebServlet("/CartUpdateController.do")
public class CartUpdateController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		requestPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		requestPro(request, response);
	}

	protected void requestPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		
		int cart_num = Integer.parseInt(request.getParameter("cart_num"));
		int count = Integer.parseInt(request.getParameter("count"));
		
		CartDAO cdao = new CartDAO();
		
		int num = cdao.updateCart(cart_num, count);
		
		MemberDAO mdao = new MemberDAO();
		
		MemberDTO m = mdao.selectMember(id);
		
		Vector<CartDTO> v = cdao.getAllCartList(id);
		
		request.setAttribute("v", v);
		
		//장바구니 페이지의 주문자정보 값 넘기
		request.setAttribute("m", m);
		
		RequestDispatcher dis = 
					request.getRequestDispatcher("product/Cart.jsp?num=" + num);
		//실제 재요청
		dis.forward(request, response);		
	}
	
	
}




