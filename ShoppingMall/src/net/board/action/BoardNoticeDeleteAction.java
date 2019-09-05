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

public class BoardNoticeDeleteAction implements Action {
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) 
			throws Exception {
		System.out.println("BoardNoticeDeleteAction execute()");
		request.setCharacterEncoding("utf-8");
		
		NoticeDAO noticedao = new NoticeDAO();
		
		HttpSession session = request.getSession();
		String id=(String)session.getAttribute("id");
		int num = Integer.parseInt(request.getParameter("num"));
		noticedao.deleteBoard(num);
		
		/*PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("alert('삭제성공');");
		out.println("history.back();");
		out.println("</script>");
		out.close();
		return null;*/
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/notice.bd");
		return forward;

	}
}






