package net.cart.action;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.buyList.db.BuyListDAO;
import net.buyList.db.BuyListDTO;
import net.cart.db.CartDAO;
import net.coupon.db.CouponDAO;
import net.member.db.MemberDAO;

public class BuyListInsertController2 extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		requestPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		requestPro(request, response);
	}

	protected void requestPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		BuyListDTO bdto = null;
		BuyListDAO bdao = new BuyListDAO();
		CartDAO cdao = new CartDAO();
		CouponDAO coudao = new CouponDAO();
		MemberDAO mdao = new MemberDAO();
		

		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		System.out.println("id = " + id);
		
		int maxbuynum = bdao.maxBuynum()-1;
		if(maxbuynum == 0){
			maxbuynum = 1;
		}
		
		System.out.println("maxbuynum = " + maxbuynum);
		
		String inpoint = (String)session.getAttribute("inpoint");
		
		System.out.println("inpoint = " + inpoint);
		String buyday = (String)session.getAttribute("buyday");
		
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
		System.out.println("totalprice = " + totalprice);
		int limit = bdao.coupon_limitmax(maxbuynum);
		System.out.println("limit = " + limit);
		int totalsaleprice = bdao.buytotalsaleprice(maxbuynum, limit);
		System.out.println("totalsaleprice = " + totalsaleprice);
		int point = bdao.inpoint(maxbuynum);
		totalsaleprice = totalsaleprice + point;
		int delivery_cost1 = bdao.delivery_cost(maxbuynum);
		BuyListDTO buylist = bdao.getBuyList(maxbuynum);
		
		//실제로 구매하는 금액 (총 상품금액 - 할인금액 - 배송비) <-- 포인트 적립을 위한 update용도
		int realprice = totalprice-totalsaleprice-delivery_cost1;
		
		System.out.println("realprice = " + realprice);
		
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
		System.out.println("원래 멤버의 돈 = " + mtotalprice);
		System.out.println("추가될 돈 = " + realprice);
		mdao.UpdateTotalPrice(id, mtotalprice+realprice);
		mdao.UpdateGrade(id, mtotalprice);
		
		request.setAttribute("totalprice", totalprice);
		request.setAttribute("totalsaleprice", totalsaleprice);
		request.setAttribute("delivery_cost", delivery_cost1);
		request.setAttribute("buylist", buylist);
		request.setAttribute("buyday", buyday);
		
		RequestDispatcher dis = 
				request.getRequestDispatcher("product/BuyComplete.jsp");
		//실제 재요청
		dis.forward(request, response);	
		
	}
	
}
