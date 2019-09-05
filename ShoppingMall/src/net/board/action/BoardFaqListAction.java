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
import net.board.db.FaqDAO;
import net.board.db.BoardDTO;

public class BoardFaqListAction implements Action {
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) 
			throws Exception {
		System.out.println("BoardFaqListction execute()");
		request.setCharacterEncoding("utf-8");
		
		FaqDAO faqdao = new FaqDAO();
		
		HttpSession session = request.getSession();
		String id=(String)session.getAttribute("id");
		String category = request.getParameter("category");
		String search = request.getParameter("search");
		int count = 0; //0으로 초기화
		
		if(category == null && search == null){ //전체 게시글 수 조회
			count = faqdao.getFaqCount();
		}else if(category == null && search != null){
		    count = faqdao.getFaqSearchCount(search);
		}else if(category != null && search != null){
			count = faqdao.getFaqSearchCount(category, search);
		}else{ //카테고리별 게시글 수 조회
			count = faqdao.getFaqCount(category);
		}
		//페이지 크기 설정
		int pageSize = 10;
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null){
			pageNum = "1";
		}
		int pageNo = Integer.parseInt(pageNum);
		int startRow = (pageNo-1)*pageSize+1;
		int endRow = pageNo*pageSize;
		
		List<BoardDTO> faqList = null;
		if(category == null && count != 0 && search == null){
			faqList = faqdao.getFaqList(startRow, pageSize);
		}else if(category == null && count != 0 && search != null){
			faqList = faqdao.getFaqSearchList(startRow, pageSize, search);
		}else if(category != null && count != 0 && search != null){
			faqList = faqdao.getFaqSearchList(category, search, startRow, pageSize);
		}else if(category != null && count != 0 && search == null){
			faqList = faqdao.getFaqList(category, startRow, pageSize);
		}
		int finalPage =count/pageSize+(count%pageSize==0?0:1);
		int firstPage = 1;
		int pageBlock=5;
		
		int startPage=((pageNo-1)/pageBlock)*pageBlock+1;
		int endPage=startPage+pageBlock-1;
		if(endPage > finalPage){
			endPage = finalPage;
		}
		request.setAttribute("faqList", faqList); 
		request.setAttribute("pageNo", pageNo);
		request.setAttribute("finalPage", finalPage);
		request.setAttribute("firstPage", firstPage);
		request.setAttribute("pageBlock", pageBlock);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("search", search);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./Main.jsp?section=board/faq.jsp");
		return forward;

	}
}






