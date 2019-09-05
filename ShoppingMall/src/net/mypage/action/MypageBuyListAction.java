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
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");


		String c_month = null;
		c_month = (String) request.getParameter("data_month");
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
/*		System.out.println(startdate);
		System.out.println(enddate);*/
		
		//페이지 번호
		/*int num=Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");
		bdao.getBuyListCount(id);*/
		
		
		//주문 정보 받기
		Vector<BuyListDTO> buylist = bdao.getBuyList(id, startdate, enddate);
		
		/*request.setAttribute("pageNum", pageNum);*/
		request.setAttribute("buylist", buylist);
		
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
	 
	sbDate.append ( nYear );
	if ( nMonth < 10 )
	sbDate.append ( "0" );
	sbDate.append ( nMonth );
	if ( nDay < 10 )
	sbDate.append ( "0" );
	sbDate.append ( nDay );
	 
	return sbDate.toString ( );
	}
	
}






