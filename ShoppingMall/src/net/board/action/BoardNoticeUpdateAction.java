package net.board.action;

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

public class BoardNoticeUpdateAction implements Action {
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) 
			throws Exception {
		System.out.println("BoardNoticeUpdateAction execute()");
		request.setCharacterEncoding("utf-8");
		
		BoardDTO boarddto = new BoardDTO();
		HttpSession session = request.getSession();
		String id=(String)session.getAttribute("id");
		boarddto.setCategory(request.getParameter("category"));
		boarddto.setSubject(request.getParameter("subject"));
		boarddto.setContent(request.getParameter("content"));
		boarddto.setNum(Integer.parseInt(request.getParameter("num")));
		
		NoticeDAO noticedao = new NoticeDAO();
		noticedao.updateBoard(boarddto);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/noticeDetail.bd?num="+request.getParameter("num"));
		return forward;

	}
}






