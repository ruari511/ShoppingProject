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
import net.coupon.db.CouponDAO;
import net.coupon.db.UserCouponDTO;

/*바로구매 버튼 클릭했을떄.. */
@WebServlet("/GoBuyController.buy")
public class GoBuyController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("get방식 요청됨@@");
		requestPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("post방식 요청됨");
		requestPro(request, response);
	}

	protected void requestPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		
		int product_num = Integer.parseInt(request.getParameter("product_num"));
		System.out.println("product_num = " + product_num);
		int product_count = Integer.parseInt(request.getParameter("product_count"));
		
		MemberDAO mdao = new MemberDAO();
		
		MemberDTO m = mdao.selectMember(id);
		
		CartDAO cdao = new CartDAO();
		
		CouponDAO coudao = new CouponDAO();
		
//		cdao.waitInsertCart(product_num, id, product_count);
		
//		int cart_num = cdao.getMaxCartNum(id);
//		
		Vector<UserCouponDTO> cou = coudao.getAllCouponList(id);
		//chk에 null값 들어오는거 예외처리 !!
		Vector<CartDTO> v = new Vector<CartDTO>();
		
		v.add(cdao.getGoBuyList(product_num, product_count));
		
		//장바구니에 체크된 값만 벡터로 넘기기
		request.setAttribute("v", v);
		
		//구매하기 페이지의 주문자정보 값 넘기
		request.setAttribute("m", m);
		
		request.setAttribute("cou", cou);
		
		RequestDispatcher dis = 
				request.getRequestDispatcher("product/Buy.jsp");
		//실제 재요청
		dis.forward(request, response);	
		
	}
}



