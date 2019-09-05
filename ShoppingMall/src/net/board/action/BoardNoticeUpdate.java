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

public class BoardNoticeUpdate implements Action {
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) 
			throws Exception {
		System.out.println("BoardNoticeUpdate execute()");
		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		String id=(String)session.getAttribute("id");
		int num = Integer.parseInt(request.getParameter("num"));
		NoticeDAO noticedao = new NoticeDAO();
		
		BoardDTO notice = noticedao.getNoticeDetail(num);
		request.setAttribute("noticeDetail", notice);
		request.setAttribute("num", num);

		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./Main.jsp?section=board/noticeUpdate.jsp");
		return forward;

	}
}






