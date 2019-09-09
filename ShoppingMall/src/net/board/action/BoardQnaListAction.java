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
		String RequestURI=request.getRequestURI();
		String contextPath=request.getContextPath();
		String command=RequestURI.substring(contextPath.length());
		
		request.setCharacterEncoding("utf-8");
		
		QnaDAO qnadao = new QnaDAO();
		
		HttpSession session = request.getSession();
		String id=(String)session.getAttribute("id");
		
		Date date = new Date();
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String c_month = null;
		c_month = request.getParameter("data_month");
		String startdate = null;
		String enddate = dateFormat.format(date);
		
		if(c_month == null && startdate == null){
			startdate = getDate(-1);
		}else{
			int data_month = Integer.parseInt(c_month);
			startdate = getDate(data_month);
		}
		
		int count = 0; 
		
			count = qnadao.getQnaCount(id, startdate, enddate);
		int pageSize = 10;
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null){
			pageNum = "1";
		}
		int pageNo = Integer.parseInt(pageNum);
		int startRow = (pageNo-1)*pageSize+1;
		int endRow = pageNo*pageSize;
		List<BoardDTO> qnaList = null;
		int finalPage =count/pageSize+(count%pageSize==0?0:1);
		int firstPage = 1;
		int pageBlock=5;
		
		int startPage=((pageNo-1)/pageBlock)*pageBlock+1;
		int endPage=startPage+pageBlock-1;
		if(endPage > finalPage){
			endPage = finalPage;
		}
		qnaList = qnadao.getQnaList(id, startRow, pageSize, startdate, enddate);

		request.setAttribute("qnaList", qnaList); 
		request.setAttribute("pageNo", pageNo);
		request.setAttribute("finalPage", finalPage);
		request.setAttribute("firstPage", firstPage);
		request.setAttribute("pageBlock", pageBlock);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		if(command.equals("/qnalistcheck.ad")){
			forward.setPath("./Main.jsp?section=admin/boardQnaList.jsp");
		}else{
			forward.setPath("./Main.jsp?section=board/qna.jsp");
		}
		return forward;
	}
	public String getDate ( int MM )
	{
	Calendar temp=Calendar.getInstance ( );
	StringBuffer sbDate=new StringBuffer ( );
	 
	temp.add ( Calendar.MONTH, MM );
	 
	int nYear = temp.get ( Calendar.YEAR );
	int nMonth = temp.get ( Calendar.MONTH ) + 1;
	int nDay = temp.get ( Calendar.DAY_OF_MONTH );
	 
	sbDate.append ( nYear + "-" );
	if ( nMonth < 10 )
	sbDate.append ( "0" );
	sbDate.append ( nMonth + "-");
	if ( nDay < 10 )
	sbDate.append ( "0" );
	sbDate.append ( nDay );
	 
	return sbDate.toString ( );
	}
	
}