package net.mypage.action;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.action.Action;
import net.action.ActionForward;
import net.buyList.db.BuyListDAO;
import net.buyList.db.BuyListDTO;

public class MypageBuyListAction implements Action {
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) 
			throws Exception {
		System.out.println("MypageBuyListAction execute()");
		
		request.setCharacterEncoding("utf-8");
		BuyListDAO bdao = new BuyListDAO();
		HttpSession session = request.getSession();
		String id=(String)session.getAttribute("id");
		
		//현재 년, 월, 일 구하기
		Date date = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");

		String c_month = null;
		c_month = request.getParameter("data_month");
		String startdate = null;
		String enddate = dateFormat.format(date);
		
		/* 첫 로딩시 */
		if(c_month == null && startdate == null){
			startdate = getDate(-1);
		}else{
			int data_month = Integer.parseInt(c_month);
		/*	System.out.println(data_month);*/
			startdate = getDate(data_month);
		}
		
		int count = 0;
		int pageSize = 10;
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null){
			pageNum = "1";
		}
			count = bdao.getBuyListCount(id, startdate, enddate);
		
		int pageNo = Integer.parseInt(pageNum);
		int startRow = (pageNo-1)*pageSize+1;
		int endRow = pageNo*pageSize;
		int finalPage =count/pageSize+(count%pageSize==0?0:1);
		int firstPage = 1;
		int pageBlock=5;
		
		int startPage=((pageNo-1)/pageBlock)*pageBlock+1;
		int endPage=startPage+pageBlock-1;
		if(endPage > finalPage){
			endPage = finalPage;
		}
		
		
		//�ֹ� ���� �ޱ�
		Vector<BuyListDTO> buylist = bdao.getBuyList(id, startdate, enddate, startRow, endRow);
		/*request.setAttribute("pageNum", pageNum);*/
		request.setAttribute("buylist", buylist);
		request.setAttribute("pageNo", pageNo);
		request.setAttribute("finalPage", finalPage);
		request.setAttribute("firstPage", firstPage);
		request.setAttribute("pageBlock", pageBlock);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("dataMonth", c_month);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./Main.jsp?section=myPage/mypage_Main.jsp");
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
	 
	sbDate.append ( nYear + "/" );
	if ( nMonth < 10 )
	sbDate.append ( "0" );
	sbDate.append ( nMonth + "/");
	if ( nDay < 10 )
	sbDate.append ( "0" );
	sbDate.append ( nDay );
	 
	return sbDate.toString ( );
	}
	
}






