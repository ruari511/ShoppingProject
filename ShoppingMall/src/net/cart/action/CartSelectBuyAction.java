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


public class CartSelectBuyAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) 
			throws Exception {
		System.out.println("CartSelectBuyAction execute()");
		
		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		
		int cart_num = Integer.parseInt(request.getParameter("cart_num"));
		
		MemberDAO mdao = new MemberDAO();
		
		MemberDTO m = mdao.selectMember(id);
		
		CartDAO cdao = new CartDAO();
		
		CouponDAO coudao = new CouponDAO();
		
		int allCouCheck = coudao.AllCouponCheck(id);
		int delCouCheck = coudao.DeliveryCouponCheck(id);
		
		Vector<UserCouponDTO> cou = coudao.getAllCouponList(id);
		//chk에 null값 들어오는거 예외처리 !!
		Vector<CartDTO> v = new Vector<CartDTO>();
		
		v.add(cdao.getCartList(cart_num));
		
		//장바구니에 체크된 값만 벡터로 넘기기
		request.setAttribute("v", v);
		
		//구매하기 페이지의 주문자정보 값 넘기
		request.setAttribute("m", m);
		
		request.setAttribute("cou", cou);
		
		request.setAttribute("allCheck", allCouCheck);
		request.setAttribute("delCheck", delCouCheck);
		
		ActionForward forward=new ActionForward();

		forward.setRedirect(false);

		forward.setPath("./Buy.buy");
		
		return forward;
	}
}
