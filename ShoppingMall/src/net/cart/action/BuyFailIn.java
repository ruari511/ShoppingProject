package net.cart.action;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.action.Action;
import net.action.ActionForward;
import net.buycard.db.BuyCardDTO;
import net.buycard.db.CardDAO;


public class BuyFailIn implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) 
			throws Exception {
		System.out.println("BuyFailIn execute()");
		
		request.setCharacterEncoding("utf-8");
		
		CardDAO cardDAO = new CardDAO();
		
		HttpSession session = request.getSession();
		
		if(session.getAttribute("bcnum") != null){
			
		int bcnum = (int) session.getAttribute("bcnum");
		
		BuyCardDTO bcDTO = cardDAO.selectBuyCard(bcnum);
		
		request.setAttribute("bcDTO", bcDTO);
		}
		
		session.removeAttribute("bcnum");
		
		ActionForward forward=new ActionForward();
		
		forward.setRedirect(false);
		
		forward.setPath("./BuyFail.buy");
		
		return forward;
	}
}
