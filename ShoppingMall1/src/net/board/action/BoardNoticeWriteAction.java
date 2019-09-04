package net.board.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.action.Action;
import net.action.ActionForward;
import net.board.db.FaqDAO;
import net.board.db.NoticeDAO;
import net.board.db.BoardDTO;

public class BoardNoticeWriteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) 
			throws Exception {
		System.out.println("BoardFaqWriteAction execute()");
		request.setCharacterEncoding("utf-8");
		
		BoardDTO boarddto = new BoardDTO();
		boarddto.setCategory(request.getParameter("category"));
		boarddto.setSubject(request.getParameter("subject"));
		boarddto.setContent(request.getParameter("content"));
		
		NoticeDAO noticedao = new NoticeDAO();
		noticedao.insertNotice(boarddto);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("./notice.bd");
		return forward;
	}
}
