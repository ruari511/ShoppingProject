package net.board.action;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.action.Action;
import net.action.ActionForward;
import net.board.db.NoticeDAO;
import net.board.db.BoardDTO;
import net.board.db.FaqDAO;

public class BoardFaqDeleteAction implements Action {
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) 
			throws Exception {
		System.out.println("BoardNoticeDeleteAction execute()");
		request.setCharacterEncoding("utf-8");
		
		FaqDAO faqdao = new FaqDAO();
		
		HttpSession session = request.getSession();
		String id=(String)session.getAttribute("id");
		int num = Integer.parseInt(request.getParameter("num"));
		faqdao.deleteBoard(num);
		
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/faq.bd");
		return forward;

	}
}






