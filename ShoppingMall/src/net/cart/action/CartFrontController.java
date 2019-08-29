package net.cart.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.action.Action;
import net.action.ActionForward;


public class CartFrontController extends HttpServlet{

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
		String RequestURI=request.getRequestURI();
		System.out.println(RequestURI);
		
		//  /CarProject 얻기
		String contextPath=request.getContextPath();
		
		//	길이 11
		System.out.println(contextPath.length());
		
		//  /MemberJoin.do 얻기
		// /MemberJoinAction.do
		//  /MemberLogin.do 얻기 
		String command=RequestURI.substring(contextPath.length());
		System.out.println("command = " +command);
					
		/*주소 비교*/	
		//페이지 이동 방식 여부 값,이동페이지 경로 값 저장 하여 리턴 해주는 객체를 저장할 참조변수 선언 
		ActionForward forward=null;
	
		//자식 Action 객체들을 담을 인터페이스 타입의 참조변수 선언
		Action action=null;
			
		//모든 구매하기 동작이 완료된 후 구매완료 페이지로 이동하는 부분
		if(command.equals("/BuyComplete.buy")){
		
			//페이지 이동 방식 여부 값,이동페이지 경로 값 저장 하여 리턴 해주는 객체 생성 
			forward=new ActionForward();
			//페이지 이동 방식 여부 값 false로 저장-> RequestDispatcher  forward() 방식
			forward.setRedirect(false);
			//이동할 페이지 경로(회원가입 페이지) 주소값 저장
			forward.setPath("./product/BuyComplete.jsp");
			
		//구매하기 페이지에서 결제하기 버튼을 눌렀을떄 동작하는 부분
		}else if(command.equals("/BuyFail.buy")){
		
			//페이지 이동 방식 여부 값,이동페이지 경로 값 저장 하여 리턴 해주는 객체 생성 
			forward=new ActionForward();
			//페이지 이동 방식 여부 값 false로 저장-> RequestDispatcher  forward() 방식
			forward.setRedirect(false);
			//이동할 페이지 경로(회원가입 페이지) 주소값 저장
			forward.setPath("./product/BuyFail.jsp");
			
		//구매하기 페이지에서 결제하기 버튼을 눌렀을떄 동작하는 부분
		}else if(command.equals("/BuyFailIn.buy")){
		
			action=new BuyFailIn();
			
			try {
				forward=action.execute(request, response);
						
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		//구매하기 페이지에서 결제하기 버튼을 눌렀을떄 동작하는 부분
		}else if(command.equals("/BuyListInsertCard.buy")){
	
			action=new BuyListInsertCardAction();
			
			try {
				forward=action.execute(request, response);
						
			} catch (Exception e) {
				e.printStackTrace();
			}
		//결제하기 버튼을 눌러서 구매목록이 insert되고 난 후 Member의 정보를 업데이트 하는 부분
		}else if(command.equals("/BuyListInsertBankBook.buy")){
	
			action=new BuyListInsertBankBookAction();
			
			try {
				forward=action.execute(request, response);
						
			} catch (Exception e) {
				e.printStackTrace();
			}
		//결제하기 버튼을 눌러서 구매목록이 insert되고 난 후 Member의 정보를 업데이트 하는 부분
		}else if(command.equals("/BuyMemberUpdate.buy")){
	
			
			//회원가입 처리를 위한 Action객체 생성
			action=new BuyMemberUpdateAction();
			
			try {
				forward=action.execute(request, response);
						
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/CartAllBuy.buy")){
	
			
			//회원가입 처리를 위한 Action객체 생성
			action=new CartAllBuyAction();
			
			try {
				forward=action.execute(request, response);
						
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/Buy.buy")){
		
			//페이지 이동 방식 여부 값,이동페이지 경로 값 저장 하여 리턴 해주는 객체 생성 
			forward=new ActionForward();
			//페이지 이동 방식 여부 값 false로 저장-> RequestDispatcher  forward() 방식
			forward.setRedirect(false);
			//이동할 페이지 경로(회원가입 페이지) 주소값 저장
			forward.setPath("./product/Buy.jsp");
			
		//구매하기 페이지에서 결제하기 버튼을 눌렀을떄 동작하는 부분
		}else if(command.equals("/Cart.buy")){
		
			//페이지 이동 방식 여부 값,이동페이지 경로 값 저장 하여 리턴 해주는 객체 생성 
			forward=new ActionForward();
			//페이지 이동 방식 여부 값 false로 저장-> RequestDispatcher  forward() 방식
			forward.setRedirect(false);
			//이동할 페이지 경로(회원가입 페이지) 주소값 저장
			forward.setPath("./product/Cart.jsp");
			
		//구매하기 페이지에서 결제하기 버튼을 눌렀을떄 동작하는 부분
		}else if(command.equals("/CartBuyAction.buy")){
	
			
			//회원가입 처리를 위한 Action객체 생성
			action=new CartBuyAction();
			
			try {
				forward=action.execute(request, response);
						
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/CartListAction.buy")){
	
			
			//회원가입 처리를 위한 Action객체 생성
			action=new CartListAction();
			
			try {
				forward=action.execute(request, response);
						
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/CartUpdateAction.buy")){
	
			
			//회원가입 처리를 위한 Action객체 생성
			action=new CartUpdateAction();
			
			try {
				forward=action.execute(request, response);
						
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/CartSelectBuyAction.buy")){
	
			
			//회원가입 처리를 위한 Action객체 생성
			action=new CartSelectBuyAction();
			
			try {
				forward=action.execute(request, response);
						
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/CartDeleteAction.buy")){
	
			
			//회원가입 처리를 위한 Action객체 생성
			action=new CartDeleteAction();
			
			try {
				forward=action.execute(request, response);
						
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/CartInsertAction.buy")){
	
			
			//회원가입 처리를 위한 Action객체 생성
			action=new CartInsertAction();
			
			try {
				forward=action.execute(request, response);
						
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/GoBuyAction.buy")){
	
			
			//회원가입 처리를 위한 Action객체 생성
			action=new GoBuyAction();
			
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



