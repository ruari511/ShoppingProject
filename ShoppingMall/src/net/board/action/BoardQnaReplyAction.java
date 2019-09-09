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
		System.out.println("BoardQnaReplyAction execute()");

		String RequestURI=request.getRequestURI();
		String contextPath=request.getContextPath();
		String command=RequestURI.substring(contextPath.length());
		
		
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		int num = Integer.parseInt(request.getParameter("num"));
		System.out.println(num);
		String reply_id=(String)session.getAttribute("id");
		System.out.println(reply_id);
		String reply = request.getParameter("reply");
		System.out.println(reply);
		
		
		
		BoardDTO boarddto = new BoardDTO();
		boarddto.setNum(num);
		boarddto.setReply_id(reply_id);
		boarddto.setReply(reply);
		
		QnaDAO qnadao = new QnaDAO();
		
		qnadao.replyQna(boarddto);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		if(command.equals("/BoardQnaReplyAction.ad")){
			forward.setPath("./qnalistcheck.ad");
		}else{
			forward.setPath("./qna.bd");
		}
		return forward;
	}
}
