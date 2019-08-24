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


public class CartBuyAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) 
			throws Exception {
		System.out.println("CartBuyAction execute()");
		
		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		
		//Cart.jsp에서 checked인 cart_num값을 배열로 받아오기
		String[] chk = request.getParameterValues("cart");
		
		MemberDAO mdao = new MemberDAO();
		
		MemberDTO m = mdao.selectMember(id);
		
		CartDAO cdao = new CartDAO();
		
		CouponDAO coudao = new CouponDAO();
		
		Vector<UserCouponDTO> cou = coudao.getAllCouponList(id);
		//chk에 null값 들어오는거 예외처리 !!
		Vector<CartDTO> v = new Vector<CartDTO>();
		
		if(chk != null){
			for(int i=0; i<chk.length; i++){
				//cart_num값을 검색하여 구매하기 페이지의 상품 리스트를 벡터타입으로 저장
				v.add(cdao.getCartList(Integer.parseInt(chk[i])));
			}
		}
		
		
		//장바구니에 체크된 값만 벡터로 넘기기
		request.setAttribute("v", v);
		
		//구매하기 페이지의 주문자정보 값 넘기
		request.setAttribute("m", m);
		
		request.setAttribute("cou", cou);
		
		ActionForward forward=new ActionForward();

		forward.setRedirect(false);

		forward.setPath("./Buy.buy");
		
		return forward;
	}
}
