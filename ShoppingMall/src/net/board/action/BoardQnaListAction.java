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
import net.board.db.QnaDAO;
import net.product.db.ProductDAO;
import net.product.db.ProductDTO;
import net.board.db.BoardDTO;

public class BoardQnaListAction implements Action {
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) 
			throws Exception {
		System.out.println("BoardQnaListAction execute()");
		request.setCharacterEncoding("utf-8");
		
		QnaDAO qnadao = new QnaDAO();
		
		HttpSession session = request.getSession();
		String id=(String)session.getAttribute("id");
		int count = 0; 
			count = qnadao.getQnaCount(id);
		int pageSize = 10;
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null){
			pageNum = "1";
		}
		int pageNo = Integer.parseInt(pageNum);
		int startRow = (pageNo-1)*pageSize+1;
		int endRow = pageNo*pageSize;
		
		List<BoardDTO> qnaList = null;
		qnaList = qnadao.getQnaList(id, startRow, pageSize);
		int finalPage =count/pageSize+(count%pageSize==0?0:1);
		int firstPage = 1;
		int pageBlock=5;
		
		int startPage=((pageNo-1)/pageBlock)*pageBlock+1;
		int endPage=startPage+pageBlock-1;
		if(endPage > finalPage){
			endPage = finalPage;
		}
		
		
		request.setAttribute("qnaList", qnaList); 
		request.setAttribute("pageNo", pageNo);
		request.setAttribute("finalPage", finalPage);
		request.setAttribute("firstPage", firstPage);
		request.setAttribute("pageBlock", pageBlock);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		if(id.equals("admin")){
			ActionForward forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./Main.jsp?section=admin/qnalist.jsp");
			return forward;
		}else{
			ActionForward forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./Main.jsp?section=board/qna.jsp");
			return forward;
		}
	}
}






