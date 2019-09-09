package net.admin.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.action.Action;
import net.action.ActionForward;
import net.board.action.BoardQnaListAction;
import net.board.action.BoardQnaReplyAction;
import net.member.action.MemberLogoutAction;
import net.mypage.action.MypageAllBuyListAction;
import net.mypage.action.MypageBuyListUpdateAction;


public class AdminFrontController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doProcess(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doProcess(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		String RequestURI=request.getRequestURI();
		String contextPath=request.getContextPath();
		String command=RequestURI.substring(contextPath.length());
					
		ActionForward forward=null;
	
		Action action=null;
			
		if(command.equals("/adminMenu.ad")){
			forward=new ActionForward();
			forward.setRedirect(false); //二쇱냼媛� �끂異� x
			forward.setPath("./Main.jsp?section=./admin/adminMenu.jsp"); //�씠�룞�븷 �럹�씠吏� ���옣
			
		}else if(command.equals("/productList.ad")){
			action=new ProductListAction();
			try {
				forward=action.execute(request, response); //return null;
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/productAdd.ad")){
			forward=new ActionForward();
			forward.setRedirect(false); //二쇱냼媛� �끂異� x
			forward.setPath("./Main.jsp?section=./admin/productAdd.jsp"); //�씠�룞�븷 �럹�씠吏� ���옣
		}else if(command.equals("/productAddAction.ad")){
			action=new ProductAddAction();
			try {
				forward=action.execute(request, response); //return null;
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/memberCheck.ad")){
			action=new MemberListAction();
			try {
				forward=action.execute(request, response); //return null;
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/MemberDeleteAction.ad")){
			try {
				forward=action.execute(request, response); //return null;
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/ProductInfoAction.ad")){
			action=new ProductInfoAction();
			try {
				forward=action.execute(request, response); //return null;
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/productModify.ad")){
			forward=new ActionForward();
			forward.setRedirect(false); //二쇱냼媛� �끂異� x
			forward.setPath("./Main.jsp?section=./admin/productModify.jsp"); //�씠�룞�븷 �럹�씠吏� ���옣
		}else if(command.equals("/ProductModifyAction.ad")){
			action=new ProductModifyAction();
			try {
				forward=action.execute(request, response); //return null;
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/ProductDeleteAction.ad")){
			action=new ProductDeleteAction();
			try {
				forward=action.execute(request, response); //return null;
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/buylistCheck.ad")){
			 action = new MypageAllBuyListAction();
	    	 	try{
	    	 		forward=action.execute(request, response);
	    	 	}catch (Exception e) {
	    	 		e.printStackTrace();
	    	 	}
		}else if(command.equals("/buylistUpdate.ad")){
			action = new MypageBuyListUpdateAction();
				try{
					forward=action.execute(request, response);
				}catch (Exception e) {
					e.printStackTrace();
				}
		}else if(command.equals("/qnalistcheck.ad")){
			action = new BoardQnaListAction();
			try{
				forward=action.execute(request, response);
			}catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/BoardQnaReplyAction.ad")){
			action = new BoardQnaReplyAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		//二쇱냼 �씠�룞
		if(forward!=null){ //new ActionForward()媛앹껜媛� 議댁옱 �븯怨�..
			if(forward.isRedirect()){//true -> sendRedirect() 諛⑹떇�씪�뻹..
				//由щ떎�씠�젆�듃 諛⑹떇�쑝濡� �럹�씠吏� �씠�룞!  �럹�씠吏� 二쇱냼 寃쎈줈 �끂異� �븿 
				//join.jsp�솕硫� �씠�룞
				//login.jsp�솕硫� �씠�룞
				//CarMain.jsp�솕硫� �씠�룞�떆 session�쁺�뿭 �쟾�떖
				response.sendRedirect(forward.getPath());
				
			}else{//false -> forward() 諛⑹떇�씪�븣...
				
				RequestDispatcher dispatcher=request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
		}//if 
		
	}//	doProcess 硫붿냼�뱶 �걹
	
}//�꽌釉붾┸ �걹



