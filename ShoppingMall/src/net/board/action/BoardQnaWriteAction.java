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

public class BoardQnaWriteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) 
			throws Exception {
		System.out.println("BoardQnaWriteAction execute()");
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		String id=(String)session.getAttribute("id");
		int product_num = Integer.parseInt(request.getParameter("product_num"));
		System.out.println(product_num);
		
		
		BoardDTO boarddto = new BoardDTO();
		boarddto.setCategory(request.getParameter("category"));
		boarddto.setId(id);
		boarddto.setProduct_num(product_num);
		boarddto.setSubject(request.getParameter("subject"));
		boarddto.setContent(request.getParameter("content"));
		
		QnaDAO qnadao = new QnaDAO();
		qnadao.insertQna(boarddto);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./qna.bd");
		return forward;
	}
}
