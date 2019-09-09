package net.mypage.action;

import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.action.Action;
import net.action.ActionForward;
import net.buyList.db.BuyListDAO;
import net.buyList.db.BuyListDTO;

public class MypageBuyListDetailAction implements Action {
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) 
			throws Exception { 
		System.out.println("MypageBuyListDetailAction execute()");
		request.setCharacterEncoding("utf-8");
		
		BuyListDAO bdao = new BuyListDAO();
		
		HttpSession session = request.getSession();
		String id=(String)session.getAttribute("id");
		
		int buynum = Integer.parseInt(request.getParameter("buynum"));
		
		int limit = bdao.coupon_limitmax(buynum);
		int totalsaleprice = bdao.buytotalsaleprice(buynum, limit);
		
		Vector<BuyListDTO> buylist = bdao.getBuyDetail(id, buynum);
		request.setAttribute("buylist", buylist);
		request.setAttribute("totalsaleprice", totalsaleprice);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./Main.jsp?section=myPage/mypage_BuyListDetail.jsp");
		return forward;
		
	}
	
	
}




