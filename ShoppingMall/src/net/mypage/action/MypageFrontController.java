package net.mypage.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.action.Action;
import net.action.ActionForward;
import net.coupon.action.CouponMypageAction;
import net.member.action.MemberJoinAction;


public class MypageFrontController extends HttpServlet{

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
      String RequestURI=request.getRequestURI();
      String contextPath=request.getContextPath();
      String command=RequestURI.substring(contextPath.length());
      /*주소 비교*/   
      //페이지 이동 방식 여부 값,이동페이지 경로 값 저장 하여 리턴 해주는 객체를 저장할 참조변수 선언 
      ActionForward forward=null;
   
      //자식 Action 객체들을 담을 인터페이스 타입의 참조변수 선언
      Action action=null;
      
      // 마이페이지 메인
      if(command.equals("/mypage.mp")){
    	  action = new MypageBuyListAction();
			try{
				forward = action.execute(request, response);
			}catch (Exception e) {
				e.printStackTrace();
			}
      // 마이페이지 주문상세리스트
      }if(command.equals("/mypage_BuyListDetail.mp")){
    	  action = new MypageBuyListDetailAction();
			try{
				forward = action.execute(request, response);
			}catch (Exception e) {
				e.printStackTrace();
			}
      }else if(command.equals("/mypage_Order_manager.mp")){
    	 action = new MypageAllBuyListAction();
    	 	try{
    	 		forward=action.execute(request, response);
    	 	}catch (Exception e) {
    	 		e.printStackTrace();
    	 	}
   	  }else if(command.equals("/mypage_OrderCancelList.mp")){
      
         action = new MypageBuyListAction();
			try{
				forward = action.execute(request, response);
			}catch (Exception e) {
				e.printStackTrace();
			}

      // 마이페이지 주문취소리스트
      }else if(command.equals("/mypage_OrderCancelList.mp")){
		
	//페이지 이동 방식 여부 값,이동페이지 경로 값 저장 하여 리턴 해주는 객체 생성 
	forward=new ActionForward();
	//페이지 이동 방식 여부 값 false로 저장-> RequestDispatcher  forward() 방식
	forward.setRedirect(false);
	//이동할 페이지 경로(회원가입 페이지) 주소값 저장
	forward.setPath("./Main.jsp?section=./myPage/mypage_OrderCancelList.jsp");
      // 마이페이지 장바구니
      }else if(command.equals("/Cart.jsp")){
      
         //페이지 이동 방식 여부 값,이동페이지 경로 값 저장 하여 리턴 해주는 객체 생성 
         forward=new ActionForward();
         //페이지 이동 방식 여부 값 false로 저장-> RequestDispatcher  forward() 방식
         forward.setRedirect(false);
         //이동할 페이지 경로(회원가입 페이지) 주소값 저장
         forward.setPath("./Main.jsp?section=./Cart.jsp");
      
      // 마이페이지 포인트
      }else if(command.equals("/mypage_PointInfo.mp")){
      
         //페이지 이동 방식 여부 값,이동페이지 경로 값 저장 하여 리턴 해주는 객체 생성 
         forward=new ActionForward();
         //페이지 이동 방식 여부 값 false로 저장-> RequestDispatcher  forward() 방식
         forward.setRedirect(false);
         //이동할 페이지 경로(회원가입 페이지) 주소값 저장
         forward.setPath("./Main.jsp?section=./myPage/mypage_PointInfo.jsp");
      
      // 마이페이지 상품평
      }else if(command.equals("/mypage_coupon.mp")){
      		//페이지 이동 방식 여부 값,이동페이지 경로 값 저장 하여 리턴 해주는 객체 생성 
		action = new CouponMypageAction();
			
		try {
			forward = action.execute(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
      
      // 마이페이지 상품평
      }else if(command.equals("/mypage_Review.mp")){
      
         //페이지 이동 방식 여부 값,이동페이지 경로 값 저장 하여 리턴 해주는 객체 생성 
         forward=new ActionForward();
         //페이지 이동 방식 여부 값 false로 저장-> RequestDispatcher  forward() 방식
         forward.setRedirect(false);
         //이동할 페이지 경로(회원가입 페이지) 주소값 저장
         forward.setPath("./Main.jsp?section=./myPage/mypage_Review.jsp");
      
      // 마이페이지 상품Q&A   
      }else if(command.equals("/mypage_GoodsQnaList.mp")){
      
         //페이지 이동 방식 여부 값,이동페이지 경로 값 저장 하여 리턴 해주는 객체 생성 
         forward=new ActionForward();
         //페이지 이동 방식 여부 값 false로 저장-> RequestDispatcher  forward() 방식
         forward.setRedirect(false);
         //이동할 페이지 경로(회원가입 페이지) 주소값 저장
         forward.setPath("./Main.jsp?section=./myPage/mypage_GoodsQnaList.jsp");
      
      // 마이페이지 회원정보 수정   
      }else if(command.equals("/MemberInfoModify.jsp")){
      
         //페이지 이동 방식 여부 값,이동페이지 경로 값 저장 하여 리턴 해주는 객체 생성 
         forward=new ActionForward();
         //페이지 이동 방식 여부 값 false로 저장-> RequestDispatcher  forward() 방식
         forward.setRedirect(false);
         //이동할 페이지 경로(회원가입 페이지) 주소값 저장
         forward.setPath("./Main.jsp?section=./member/MemberInfoModify.jsp");
      
      // 마이페이지 회원탈퇴   
      }else if(command.equals("/MemberOut.jsp")){
      
         //페이지 이동 방식 여부 값,이동페이지 경로 값 저장 하여 리턴 해주는 객체 생성 
         forward=new ActionForward();
         //페이지 이동 방식 여부 값 false로 저장-> RequestDispatcher  forward() 방식
         forward.setRedirect(false);
         //이동할 페이지 경로(회원가입 페이지) 주소값 저장
         forward.setPath("./Main.jsp?section=./member/MemberOut.jsp");
         
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
      
   }//   doProcess 메소드 끝
   
}//서블릿 끝


