package net.coupon.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.action.Action;
import net.action.ActionForward;
import net.member.action.MemberJoinAction;


public class CouponFrontController extends HttpServlet{

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
		System.out.println(command);
					
		/*주소 비교*/	
		//페이지 이동 방식 여부 값,이동페이지 경로 값 저장 하여 리턴 해주는 객체를 저장할 참조변수 선언 
		ActionForward forward=null;
	
		//자식 Action 객체들을 담을 인터페이스 타입의 참조변수 선언
		Action action=null;
			
		//Top.jsp에서.. join링크를 누르면 회원가입페이지로 이동하는 요청이 들어 왔을때..
		if(command.equals("/Coupon.cp")){
		
//			//페이지 이동 방식 여부 값,이동페이지 경로 값 저장 하여 리턴 해주는 객체 생성 
//			forward=new ActionForward();
//			//페이지 이동 방식 여부 값 false로 저장-> RequestDispatcher  forward() 방식
//			forward.setRedirect(false);
//			//이동할 페이지 경로(회원가입 페이지) 주소값 저장
//			forward.setPath("./Main.jsp?section=./Coupon.jsp");
			
			//쿠폰 삽입 처리를 위한 Action객체 생성
			action=new CouponRouletAction();
			
			try {
				forward=action.execute(request, response);
						
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		//join.jsp에서...회원가입 처리요청이 들어 왔을떄...	
		}else if(command.equals("/CouponRouletAction.cp")){
	
			
			//쿠폰 삽입 처리를 위한 Action객체 생성
			action=new CouponRouletAction();
			
			try {
				forward=action.execute(request, response);
						
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			
		//top.jsp에서 ..login링크를 클릭하여 로그인화면으로 이동하라 라는 요청이 들어 왔을때...	
		//또는 회원가입후!.. 그인화면으로 이동하라 라는 요청이 들어 왔을떄로...
		}else if(command.equals("/CouponInsertAction.cp")){
	
			
			//쿠폰 삽입 처리를 위한 Action객체 생성
			action=new CouponInsertAction();
			
			try {
				forward=action.execute(request, response);
						
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			
		//top.jsp에서 ..login링크를 클릭하여 로그인화면으로 이동하라 라는 요청이 들어 왔을때...	
		//또는 회원가입후!.. 그인화면으로 이동하라 라는 요청이 들어 왔을떄로...
		}else if(command.equals("/CouponMypageAction.cp")){

			//쿠폰 삽입 처리를 위한 Action객체 생성
			action=new CouponMypageAction();
			
			try {
				forward=action.execute(request, response);
						
			} catch (Exception e) {
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


