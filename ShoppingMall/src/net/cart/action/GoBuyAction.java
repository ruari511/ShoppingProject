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
import net.coupon.db.CouponDAO;
import net.coupon.db.UserCouponDTO;
import net.member.db.MemberDAO;
import net.member.db.MemberDTO;


public class GoBuyAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) 
			throws Exception {
		System.out.println("GoBuyAction execute()");
		
		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		
		int product_num = Integer.parseInt(request.getParameter("product_num"));
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
		
		ActionForward forward=new ActionForward();

		forward.setRedirect(false);

		forward.setPath("./Buy.buy");
		
		return forward;
	}
}
