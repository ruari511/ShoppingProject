package net.coupon.action;

import java.sql.Timestamp;
import java.util.Calendar;
import java.util.TimeZone;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.action.Action;
import net.action.ActionForward;
import net.coupon.db.CouponDAO;
import net.coupon.db.UserCouponDTO;


public class CouponInsertAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) 
			throws Exception {
		
		request.setCharacterEncoding("utf-8");
		
		// 아이디 값 가져오기
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		
		// 당첨된 쿠폰명 가져오기
		String couponNum = request.getParameter("coupon_num");
		CouponDAO cdao = new CouponDAO();
		
		int cpNum = Integer.parseInt(couponNum);
				//Integer.parseInt(cpName.substring(0, 2));
		
		System.out.println("cpNum = " + cpNum);
		
		// 유저쿠폰 테이블 삽입을 위한 DTO객체 생성
		UserCouponDTO dto = new UserCouponDTO();
		
		// 쿠폰 시작날짜 마감날짜 구하기
		Calendar currentTime = Calendar.getInstance(TimeZone.getTimeZone("UTC"));
		Timestamp start_date = new Timestamp(currentTime.getTimeInMillis());
		
		currentTime.add(Calendar.MONTH, +1); // 쿠폰 유효기간 : 현재날짜로부터 +1개월
		
		Timestamp last_date = new Timestamp(currentTime.getTimeInMillis());
		
		dto.setId(id);
		dto.setCoupon_num(cpNum);
		dto.setStart_date(start_date);
		dto.setLast_date(last_date);
		dto.setUsecheck(0);
		
//		boolean result = cdao.insertCoupon(dto);
//		
//		if(result == false){
//			System.out.println("쿠폰 삽입 실패");
//			return null;
//		}
		cdao.insertCoupon(dto);
		
		//페이지 이동 방식 여부 값,이동페이지 경로 값 저장 하여 리턴 해주는 객체 생성
		ActionForward forward=new ActionForward();
		//페이지 이동 방식 여부 값 true로 저장  
		//sendRedirect() <-이방식은 이동할 페이지 주소 경로 노출 함.
		forward.setRedirect(true);
		// ./member/login.jsp 이동할 페이지 주소 저장
		forward.setPath("./Main.jsp?section=./myPage/mypage_coupon.jsp");
		
		//페이지 이동 방식 여부 값 true와...
		//new ActionForward()객체를 MemberFrontController로 리턴  
		return forward;
	}
}
