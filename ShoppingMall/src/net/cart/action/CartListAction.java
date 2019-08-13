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

import net.member.db.MemberDAO;
import net.member.db.MemberDTO;
import net.cart.db.CartDAO;
import net.cart.db.CartDTO;

/*CarReservation.jsp페이지에서.. 전체검색 버튼 클릭했을떄.. DB에 저장되어 있는 전체 차량 검색요청을 받는 서블릿*/
@WebServlet("/CartListController.do")
public class CartListAction extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		requestPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		requestPro(request, response);
	}

	protected void requestPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		
		/*DB에 존재하는 전체 차량 을 검색하기 위한 작업 */
		//데이터베이스에 접근해서 작업할  자바빈 역할을 하는 CarDAO객체 생성
		CartDAO cdao = new CartDAO();
		
		MemberDAO mdao = new MemberDAO();
		
		MemberDTO m = mdao.selectMember(id);
		
		Vector<CartDTO> v = cdao.getAllCartList(id);
		
		request.setAttribute("v", v);
		
		//장바구니 페이지의 주문자정보 값 넘기
		request.setAttribute("m", m);
		
		RequestDispatcher dis = 
					request.getRequestDispatcher("Cart.jsp");
		//실제 재요청
		dis.forward(request, response);		
	}
	
	
}




