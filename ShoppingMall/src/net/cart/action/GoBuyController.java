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
		requestPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
		
		Vector<UserCouponDTO> cou = coudao.getAllCouponList(id);

		Vector<CartDTO> v = new Vector<CartDTO>();
		
		v.add(cdao.getGoBuyList(product_num, product_count));
		
		request.setAttribute("v", v);
		
		request.setAttribute("m", m);
		
		request.setAttribute("cou", cou);
		
		RequestDispatcher dis = 
				request.getRequestDispatcher("product/Buy.jsp");
		//실제 재요청
		dis.forward(request, response);	
		
	}
}



