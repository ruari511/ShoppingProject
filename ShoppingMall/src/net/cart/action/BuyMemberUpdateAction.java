package net.cart.action;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.action.Action;
import net.action.ActionForward;
import net.buyList.db.BuyListDAO;
import net.buyList.db.BuyListDTO;
import net.buycard.db.BuyCardDTO;
import net.buycard.db.CardDAO;
import net.member.db.MemberDAO;


public class BuyMemberUpdateAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) 
			throws Exception {
		System.out.println("BuyMemberUpdateAction execute()");
		
		request.setCharacterEncoding("utf-8");
		
		BuyListDAO bdao = new BuyListDAO();
		MemberDAO mdao = new MemberDAO();
		CardDAO cardDAO = new CardDAO();
		
		HttpSession session = request.getSession();
		
		String buyday = (String)session.getAttribute("buyday");
		
		String id = (String) session.getAttribute("id");
		String inpoint = (String) session.getAttribute("inpoint");
		
		if(inpoint != null){
		
		int maxbuynum = bdao.maxBuynum()-1;
        
		//회원 등급을 조회(포인트 적립비율을 위한 조회) 예)아이언이면 1%적립 브론즈2% 실버3%...
		String grade = mdao.GradeCheck(id);
		System.out.println("grade = " + grade);
				
		//현재 회원의 포인트를 조회
		int memberPoint = mdao.getPoint(id);
		System.out.println("현재 포인트 = " + memberPoint);
		//현재 회원의 포인트 - 구매에서 사용한 포인트 값 구하기(회원의 포인트 정보를 업데이트 하기 위함)
		int update_point = memberPoint - Integer.parseInt(inpoint);
		System.out.println("현재 포인트 - 사용한 포인트 = " + update_point);
				
		//회원의 포인트 정보 업데이트
		mdao.UpdatePoint(update_point, id);
				
		int totalprice = bdao.buytotalprice(maxbuynum);
		int limit = bdao.coupon_limitmax(maxbuynum);
		int totalsaleprice = bdao.buytotalsaleprice(maxbuynum, limit);
		int point = bdao.inpoint(maxbuynum);
		totalsaleprice = totalsaleprice + point;
		int delivery_cost1 = bdao.delivery_cost(maxbuynum);
		BuyListDTO buylist = bdao.getBuyList(maxbuynum);
		
		//실제로 구매하는 금액 (총 상품금액 - 할인금액 - 배송비) <-- 포인트 적립을 위한 update용도
		int realprice = totalprice-totalsaleprice-delivery_cost1;
		
		int grade_percent = 0;
		if(grade == "아이언" || grade.equals("아이언")){
			grade_percent = 1;
		} else if(grade == "브론즈" || grade.equals("브론즈")){
			grade_percent = 2;
		} else if(grade == "실버" || grade.equals("실버")){
			grade_percent = 3;
		} else if(grade == "골드" || grade.equals("골드")){
			grade_percent = 5;
		} else if(grade == "플래티넘" || grade.equals("플래티넘")){
			grade_percent = 8;
		} else if(grade == "다이아" || grade.equals("다이아")){
			grade_percent = 10;
		}
		//포인트를 사용하고 난 후의 업데이트 된 포인트 값 조회
		memberPoint = mdao.getPoint(id);
		
		System.out.println("memberPoint = " + memberPoint);
		System.out.println("grade_percent = " + grade_percent);
		//현재 포인트 + 구매한 상품의 금액*등급에 맞는 퍼센트/100
		update_point = memberPoint + realprice*grade_percent/100;
		
		System.out.println("update_point = " + update_point);
			
		//다시 포인트를 업데이트
		mdao.UpdatePoint(update_point, id);
				
		int mtotalprice = mdao.getTotalprice(id);
		mdao.UpdateTotalPrice(id, mtotalprice+realprice);
		mdao.UpdateGrade(id, mtotalprice);
		
		if(session.getAttribute("bcnum") != null){
		int bcnum = (int) session.getAttribute("bcnum");
		BuyCardDTO bcDTO = cardDAO.selectBuyCard(bcnum);
		request.setAttribute("bcDTO", bcDTO);
		}
		request.setAttribute("totalprice", totalprice);
		request.setAttribute("totalsaleprice", totalsaleprice);
		request.setAttribute("delivery_cost", delivery_cost1);
		request.setAttribute("buylist", buylist);
		request.setAttribute("buyday", buyday);
		
		}
		session.removeAttribute("bcnum");
		session.removeAttribute("buyday");
		session.removeAttribute("inpoint");
		
		/*회원 가입 성공시.... 로그인 페이지로 이동 시킨다.*/
		//페이지 이동 방식 여부 값,이동페이지 경로 값 저장 하여 리턴 해주는 객체 생성
		ActionForward forward=new ActionForward();
		//페이지 이동 방식 여부 값 true로 저장  
		//sendRedirect() <-이방식은 이동할 페이지 주소 경로 노출 함.
		forward.setRedirect(false);
		// ./member/login.jsp 이동할 페이지 주소 저장
		forward.setPath("/product/BuyComplete.jsp");
		
		//페이지 이동 방식 여부 값 true와...
		// 이동할페이지 주소 (./member/login.jsp)를 담고 있는..
		//new ActionForward()객체를 MemberFrontController로 리턴  
		return forward;
	}
}
