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

public class MypageAllBuyListAction implements Action {
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) 
			throws Exception {
		System.out.println("MypageAllBuyListAction execute()111");

		request.setCharacterEncoding("utf-8");
		BuyListDAO bdao = new BuyListDAO();
		System.out.println("111");
		HttpSession session = request.getSession();
		String id=(String)session.getAttribute("id");
		String search_id = request.getParameter("search_id");
		//�쁽�옱 �뀈, �썡, �씪 援ы븯湲�
		Date date = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");

		
		String c_month = null;
		c_month = (String) request.getParameter("data_month");
		String startdate = null;
		String enddate = dateFormat.format(date);
		/* 첫 占싸듸옙占쏙옙 */
		if(c_month == null && startdate == null){
			startdate = getDate(-1);
		}else{
			int data_month = Integer.parseInt(c_month);
			startdate = getDate(data_month);
		}
		
		//占쏙옙占쏙옙占쏙옙 占쏙옙호
		/*int num=Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");
		bdao.getBuyListCount(id);*/
		Vector<BuyListDTO> buylist = null;
		if(id.equals("admin") && search_id == null){
		//占쌍뱄옙 占쏙옙占쏙옙 占쌨깍옙
			buylist = bdao.getAllBuyList(startdate, enddate);
		}else if( id.equals("admin") && search_id != null){
			buylist = bdao.getBuyList(search_id, startdate, enddate);
		}
		/*request.setAttribute("pageNum", pageNum);*/
		request.setAttribute("buylist", buylist);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./Main.jsp?section=admin/buylist.jsp");
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
	sbDate.append ( nMonth + "/" );
	if ( nDay < 10 )
	sbDate.append ( "0" );
	sbDate.append ( nDay );
	 
	return sbDate.toString ( );
	}
	
}






