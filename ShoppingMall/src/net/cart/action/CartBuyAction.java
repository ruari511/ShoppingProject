package net.cart.action;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.member.db.MemberDAO;
import net.member.db.MemberDTO;
import net.cart.db.CartDAO;
import net.cart.db.CartDTO;

/*CarReservation.jsp페이지에서.. 전체검색 버튼 클릭했을떄.. DB에 저장되어 있는 전체 차량 검색요청을 받는 서블릿*/
@WebServlet("/CartBuyController.do")
public class CartBuyAction extends HttpServlet {
	
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
		
		Vector<CartDTO> v = new Vector<CartDTO>();
		
		
		for(int i=0; i<chk.length; i++){
			System.out.println("i = " + i);
			//cart_num값을 검색하여 구매하기 페이지의 상품 리스트를 벡터타입으로 저장
			v.add(cdao.getCartList(Integer.parseInt(chk[i])));
		}
		
		//장바구니에 체크된 값만 벡터로 넘기기
		request.setAttribute("v", v);
		
		//구매하기 페이지의 주문자정보 값 넘기
		request.setAttribute("m", m);
		
		
		RequestDispatcher dis = 
					request.getRequestDispatcher("Buy.jsp");
		//실제 재요청
		dis.forward(request, response);	
		
	}
}



