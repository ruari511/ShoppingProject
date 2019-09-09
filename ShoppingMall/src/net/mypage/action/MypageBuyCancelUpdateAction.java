package net.mypage.action;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.action.Action;
import net.action.ActionForward;
import net.buyList.db.BuyListDAO;
import net.buyList.db.BuyListDTO;

public class MypageBuyCancelUpdateAction implements Action {
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) 
			throws Exception {
		System.out.println("MypageBuyCancelUpdateAction execute()");

		request.setCharacterEncoding("utf-8");
		BuyListDAO bdao = new BuyListDAO();
		
		HttpSession session = request.getSession();
		String id=(String)session.getAttribute("id");
		int buynum = Integer.parseInt(request.getParameter("buynum"));
		int product_num = Integer.parseInt(request.getParameter("product_num"));

		System.out.println(product_num);
		System.out.println(buynum);
		bdao.updateBuyCancel(buynum, product_num);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./buylistCheck.ad");
		return forward;

	}
	
	
}






