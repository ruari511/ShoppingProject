package net.cart.action;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cart.CartDAO;
import cart.CartDTO;
import coupon.CouponDAO;
import coupon.UserCouponDTO;
import member.MemberDAO;
import member.MemberDTO;

/*CarReservation.jsp페이지에서.. 전체검색 버튼 클릭했을떄.. DB에 저장되어 있는 전체 차량 검색요청을 받는 서블릿*/
@WebServlet("/CartAllBuyController.do")
public class CartAllBuyController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		requestPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		requestPro(request, response);
	}

	protected void requestPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		//Cart.jsp에서 checked인 cart_num값을 배열로 받아오기
		String[] chk = request.getParameterValues("cart");
		
		MemberDAO mdao = new MemberDAO();
		
		MemberDTO m = mdao.selectMember("admin");
		
		CartDAO cdao = new CartDAO();
		
		CouponDAO coudao = new CouponDAO();
		
		Vector<UserCouponDTO> cou = coudao.getAllCouponList("admin");
		
		Vector<CartDTO> v = cdao.getAllCartList("admin");
		
		//장바구니에 체크된 값만 벡터로 넘기기
		request.setAttribute("v", v);
		
		//구매하기 페이지의 주문자정보 값 넘기
		request.setAttribute("m", m);
		
		request.setAttribute("cou", cou);
		
		
		RequestDispatcher dis = 
					request.getRequestDispatcher("Buy.jsp");
		//실제 재요청
		dis.forward(request, response);	
		
	}
}



