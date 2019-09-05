package net.coupon.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.member.db.MemberDAO;
import net.member.db.MemberDTO;
import net.action.Action;
import net.action.ActionForward;
import net.cart.db.CartDAO;
import net.cart.db.CartDTO;
import net.coupon.db.CouponDAO;
import net.coupon.db.UserCouponDTO;

/*CarReservation.jsp페이지에서.. 전체검색 버튼 클릭했을떄.. DB에 저장되어 있는 전체 차량 검색요청을 받는 서블릿*/
public class CouponRouletAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) 
			throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		
		// 아이디 값 가져오기
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		
		CouponDAO cdao = new CouponDAO();
		
		int check = cdao.rouletCheck(id);
		
		if(check != 0){
			//페이지 이동 방식 여부 값,이동페이지 경로 값 저장 하여 리턴 해주는 객체 생성
			ActionForward forward = new ActionForward();
			//페이지 이동 방식 여부 값 true로 저장  
			//sendRedirect() <-이방식은 이동할 페이지 주소 경로 노출 함.
			forward.setRedirect(false);
			// ./member/login.jsp 이동할 페이지 주소 저장
			forward.setPath("./Main.jsp?section=./Coupon.jsp");
			
			//페이지 이동 방식 여부 값 true와...
			//new ActionForward()객체를 MemberFrontController로 리턴  
			return forward;
		}else{
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.println("<script>");
			out.println("alert('쿠폰 이벤트에 이미 모두 참여하셨습니다.');");
			out.println("location.href='./mypage_coupon.mp';");
			out.println("</script>");
			out.close();
			return null;
		}
		
		
		
		
		
	}
}



