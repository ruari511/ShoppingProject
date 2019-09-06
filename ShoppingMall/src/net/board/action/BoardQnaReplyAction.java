package net.board.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.action.Action;
import net.action.ActionForward;
import net.board.db.FaqDAO;
import net.board.db.QnaDAO;
import net.board.db.BoardDTO;

public class BoardQnaReplyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) 
			throws Exception {
		System.out.println("BoardQnaWriteAction execute()");
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		String id=(String)session.getAttribute("id");
		int num = Integer.parseInt(request.getParameter("num"));
		
		BoardDTO boarddto = new BoardDTO();
		
		

		
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("./qnalistcheck.ad");
		return forward;
	}
}
