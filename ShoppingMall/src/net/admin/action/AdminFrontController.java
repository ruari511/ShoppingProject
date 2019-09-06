package net.admin.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.action.Action;
import net.action.ActionForward;
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
		
		//가상요청 주소 가져오기
		//  /CarProject/MemberJoin.do
		//  /CarProject/MemberJoinAction.do
		//   /CarProject/MemberLogin.do 
		String RequestURI=request.getRequestURI();
		System.out.println(RequestURI);
		
		//  /CarProject 얻기
		//  /CarProject 얻기
		//  /CarProject 얻기
		String contextPath=request.getContextPath();
		
		//	길이 11
		//	길이 11
		//	길이 11
		System.out.println(contextPath.length());
		
		//  /MemberJoin.do 얻기
		// /MemberJoinAction.do
		//  /MemberLogin.do 얻기 
		String command=RequestURI.substring(contextPath.length());
					
		/*주소 비교*/	
		//페이지 이동 방식 여부 값,이동페이지 경로 값 저장 하여 리턴 해주는 객체를 저장할 참조변수 선언 
		ActionForward forward=null;
	
		//자식 Action 객체들을 담을 인터페이스 타입의 참조변수 선언
		Action action=null;
			
		//Top.jsp에서.. join링크를 누르면 회원가입페이지로 이동하는 요청이 들어 왔을때..
		if(command.equals("/adminMenu.ad")){
			//페이지 이동 방식 여부 값,이동페이지 경로 값 저장 하여 리턴 해주는 객체 생성
			forward=new ActionForward();
			forward.setRedirect(false); //주소값 노출 x
			forward.setPath("./Main.jsp?section=./admin/adminMenu.jsp"); //이동할 페이지 저장
			
		}else if(command.equals("/productList.ad")){
			//로그아웃 처리를 위한 Action객체 생성  
			action=new ProductListAction();
			try {
				//top.jsp에서  로그아웃 요청이 들어왔을때...  
				//세션값 초기화후~ 로그아웃 메세지창을 띄어주고...
				//CarList.jsp페이지로 이동하는일을 하는 execute()메소드 호출함.
				forward=action.execute(request, response); //return null;

			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}else if(command.equals("/productAdd.ad")){
			//페이지 이동 방식 여부 값,이동페이지 경로 값 저장 하여 리턴 해주는 객체 생성
			forward=new ActionForward();
			forward.setRedirect(false); //주소값 노출 x
			forward.setPath("./Main.jsp?section=./admin/productAdd.jsp"); //이동할 페이지 저장
			
		}else if(command.equals("/productAddAction.ad")){
			
			//로그아웃 처리를 위한 Action객체 생성  
			action=new ProductAddAction();
			try {
				//top.jsp에서  로그아웃 요청이 들어왔을때...  
				//세션값 초기화후~ 로그아웃 메세지창을 띄어주고...
				//CarList.jsp페이지로 이동하는일을 하는 execute()메소드 호출함.
				forward=action.execute(request, response); //return null;

			} catch (Exception e) {
				e.printStackTrace();
			}
		
			//MemberOut.jsp에서 ..회원탈퇴링크를 클릭하여 메인화면으로 이동하라 라는 요청이 들어 왔을때...	
			//또는 회원탈퇴후!.. 메인화면으로 이동하라 라는 요청이 들어 왔을떄...
		}else if(command.equals("/memberCheck.ad")){
			
			//로그아웃 처리를 위한 Action객체 생성  
			action=new MemberListAction();
			try {
				//top.jsp에서  로그아웃 요청이 들어왔을때...  
				//세션값 초기화후~ 로그아웃 메세지창을 띄어주고...
				//CarList.jsp페이지로 이동하는일을 하는 execute()메소드 호출함.
				forward=action.execute(request, response); //return null;

			} catch (Exception e) {
				e.printStackTrace();
			}
		
			//MemberOut.jsp에서 ..회원탈퇴링크를 클릭하여 메인화면으로 이동하라 라는 요청이 들어 왔을때...	
			//또는 회원탈퇴후!.. 메인화면으로 이동하라 라는 요청이 들어 왔을떄...
		}else if(command.equals("/MemberDeleteAction.ad")){
			
			//로그아웃 처리를 위한 Action객체 생성  
			action=new MemberDeleteAction();
			try {
				//top.jsp에서  로그아웃 요청이 들어왔을때...  
				//세션값 초기화후~ 로그아웃 메세지창을 띄어주고...
				//CarList.jsp페이지로 이동하는일을 하는 execute()메소드 호출함.
				forward=action.execute(request, response); //return null;

			} catch (Exception e) {
				e.printStackTrace();
			}
		
			//MemberOut.jsp에서 ..회원탈퇴링크를 클릭하여 메인화면으로 이동하라 라는 요청이 들어 왔을때...	
			//또는 회원탈퇴후!.. 메인화면으로 이동하라 라는 요청이 들어 왔을떄...
		}else if(command.equals("/ProductInfoAction.ad")){
			
			//로그아웃 처리를 위한 Action객체 생성  
			action=new ProductInfoAction();
			try {
				//top.jsp에서  로그아웃 요청이 들어왔을때...  
				//세션값 초기화후~ 로그아웃 메세지창을 띄어주고...
				//CarList.jsp페이지로 이동하는일을 하는 execute()메소드 호출함.
				forward=action.execute(request, response); //return null;

			} catch (Exception e) {
				e.printStackTrace();
			}
		
			//MemberOut.jsp에서 ..회원탈퇴링크를 클릭하여 메인화면으로 이동하라 라는 요청이 들어 왔을때...	
			//또는 회원탈퇴후!.. 메인화면으로 이동하라 라는 요청이 들어 왔을떄...
		}else if(command.equals("/productModify.ad")){
			//페이지 이동 방식 여부 값,이동페이지 경로 값 저장 하여 리턴 해주는 객체 생성
			forward=new ActionForward();
			forward.setRedirect(false); //주소값 노출 x
			forward.setPath("./Main.jsp?section=./admin/productModify.jsp"); //이동할 페이지 저장
			
		}else if(command.equals("/ProductModifyAction.ad")){
			
			//로그아웃 처리를 위한 Action객체 생성  
			action=new ProductModifyAction();
			try {
				//top.jsp에서  로그아웃 요청이 들어왔을때...  
				//세션값 초기화후~ 로그아웃 메세지창을 띄어주고...
				//CarList.jsp페이지로 이동하는일을 하는 execute()메소드 호출함.
				forward=action.execute(request, response); //return null;

			} catch (Exception e) {
				e.printStackTrace();
			}
		
			//MemberOut.jsp에서 ..회원탈퇴링크를 클릭하여 메인화면으로 이동하라 라는 요청이 들어 왔을때...	
			//또는 회원탈퇴후!.. 메인화면으로 이동하라 라는 요청이 들어 왔을떄...
		}else if(command.equals("/ProductDeleteAction.ad")){
			
			//로그아웃 처리를 위한 Action객체 생성  
			action=new ProductDeleteAction();
			try {
				//top.jsp에서  로그아웃 요청이 들어왔을때...  
				//세션값 초기화후~ 로그아웃 메세지창을 띄어주고...
				//CarList.jsp페이지로 이동하는일을 하는 execute()메소드 호출함.
				forward=action.execute(request, response); //return null;

			} catch (Exception e) {
				e.printStackTrace();
			}
		
			//MemberOut.jsp에서 ..회원탈퇴링크를 클릭하여 메인화면으로 이동하라 라는 요청이 들어 왔을때...	
			//또는 회원탈퇴후!.. 메인화면으로 이동하라 라는 요청이 들어 왔을떄...
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
		}
		
		//주소 이동
		if(forward!=null){ //new ActionForward()객체가 존재 하고..
			if(forward.isRedirect()){//true -> sendRedirect() 방식일떄..
				//리다이렉트 방식으로 페이지 이동!  페이지 주소 경로 노출 함 
				//join.jsp화면 이동
				//login.jsp화면 이동
				//CarMain.jsp화면 이동시 session영역 전달
				response.sendRedirect(forward.getPath());
				
			}else{//false -> forward() 방식일때...
				
				RequestDispatcher dispatcher=request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
		}//if 
		
	}//	doProcess 메소드 끝
	
}//서블릿 끝



