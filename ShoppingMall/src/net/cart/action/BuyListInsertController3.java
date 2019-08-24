package net.cart.action;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.action.Action;
import net.action.ActionForward;
import net.buyList.db.BuyListDAO;
import net.buyList.db.BuyListDTO;
import net.cart.db.CartDAO;
import net.coupon.db.CouponDAO;
import net.member.db.MemberDAO;


public class BuyListInsertController3 implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) 
			throws Exception {
		System.out.println("BuyListInsertController3 execute()");
		
		request.setCharacterEncoding("utf-8");
		
		BuyListDTO bdto = null;
		BuyListDAO bdao = new BuyListDAO();
		CartDAO cdao = new CartDAO();
		CouponDAO coudao = new CouponDAO();
		MemberDAO mdao = new MemberDAO();
		
		String laprice = request.getParameter("lastprice");
		
		int	lastprice = 0;
		
		if(request.getParameter("lastprice") != null){
			lastprice = Integer.parseInt(laprice);
		}
			
		System.out.println("lastprice = " + laprice);
		
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		System.out.println("id = " + id);
		String ordername = request.getParameter("ordername");
		System.out.println("ordername = " + ordername);
		String orderphone = request.getParameter("orderphone");
		System.out.println("orderphone = " + orderphone);
		String orderemail = request.getParameter("orderemail");
		System.out.println("orderemail = " + orderemail);
		String delivery_title = request.getParameter("delivery_title");
		System.out.println("delivery_title = " + delivery_title);
		String delivery_name = request.getParameter("delivery_name");
		System.out.println("delivery_name = " + delivery_name);
		String delcost = request.getParameter("deltotal");
		System.out.println("deltotal = " + delcost);
		
		int delivery_cost = 0;
		if(request.getParameter("deltotal") != null){
			delivery_cost = Integer.parseInt(delcost);
		}
//		if(request.getParameter("lastprice") != null){
//			delivery_cost = Integer.parseInt(delcost);		
//		}
		
//		System.out.println("id = " + id + "\t ordername = " + ordername);
//		System.out.println("orderphone = " + orderphone + "\t orderemail = " + orderemail);
//		System.out.println("delivery_title = " + delivery_title + "\t delivery_name = " + delivery_name);
		
		String delivery_tel = request.getParameter("delivery_tel");
		System.out.println("delivery_tel = " + delivery_tel);
		String delivery_tel1 = request.getParameter("delivery_tel1");
		System.out.println("delivery_tel1 = " + delivery_tel1);
		String delivery_tel2 = request.getParameter("delivery_tel2");
		System.out.println("delivery_tel2 = " + delivery_tel2);
		String delivery_phone = delivery_tel + "-" + delivery_tel1 + "-" + delivery_tel2;
//		System.out.println("delivery_phone = " + delivery_phone);
		
		String delivery_address = request.getParameter("delivery_address") + " " + request.getParameter("delivery_address2");
		
		String del_message = "";
		//둘 중 하나는 null임 message_1은 직접 메세지 입력하는 input의 값
		if(request.getParameter("delivery_message_2") != null){
			
			String delivery_message = request.getParameter("delivery_message_2");
			if(delivery_message == "배송 메시지 직접입력"){
				String delivery_message_1 = request.getParameter("delivery_message_1");
				del_message = delivery_message_1;
			} else{
				del_message = delivery_message;
			}
		}
		
		if(request.getParameter("delivery_message_1") != null){
			del_message = request.getParameter("delivery_message_1");
		}
		
		String allcouponnum = request.getParameter("allcouponnum");
		if(allcouponnum != null){
		String[] coupon_split = allcouponnum.split("-");
		allcouponnum = coupon_split[0];
		} else{
			allcouponnum = "0";
		}
		
//		System.out.println("couponnum = " + allcouponnum);
		
		String delcouponnum = request.getParameter("delcouponnum");
		if(delcouponnum=="선택안함" || delcouponnum==null || delcouponnum.length()==4){
			delcouponnum="0";
			delivery_cost=2500;
			if(lastprice>=20000){
				delivery_cost=0;
			}
		} else{
			delivery_cost=0;
		}
		
		String inpoint = request.getParameter("inpoint");
		
		if(inpoint==null || inpoint.length()==0 || inpoint==""){
			inpoint = "0";
		}
		
		session.setAttribute("inpoint", inpoint);
		
		String paytype = request.getParameter("paytype");
		
		String[] cartnum = request.getParameterValues("cartnum");
		String[] product_num = request.getParameterValues("product_num");
		String[] product_count = request.getParameterValues("product_count");
		
		int maxbuynum = bdao.maxBuynum();
		
		SimpleDateFormat simpl = new SimpleDateFormat("yyyy/MM/dd");
		String buydate = simpl.format(System.currentTimeMillis());
		
		String thisDayMore = buydate.replaceAll("/","");
        int thisDayMoreInt = Integer.parseInt(thisDayMore);
        thisDayMoreInt = thisDayMoreInt+1;
        thisDayMore = String.valueOf(thisDayMoreInt);
        
        SimpleDateFormat sdfmt = new SimpleDateFormat("yyyyMMdd"); 
        Date date = null;
		try {
			date = sdfmt.parse(thisDayMore);
		} catch (ParseException e) {
			e.printStackTrace();
		}
        
        thisDayMore = new java.text.SimpleDateFormat ("yyyy.MM.dd").format(date);
        
        session.setAttribute("buyday", thisDayMore);
        
		if(cartnum != null){
			for(int i=0; i<cartnum.length; i++){
				bdto = new BuyListDTO();
			
				bdto.setBuynum(maxbuynum);
				bdto.setId(id);
				bdto.setOrder_name(ordername);
				bdto.setOrder_mtel(orderphone);
				bdto.setOrder_email(orderemail);
				bdto.setBuydate(buydate);
				bdto.setProduct_num(Integer.parseInt(product_num[i]));
				bdto.setProduct_count(Integer.parseInt(product_count[i]));
				bdto.setAll_coupon_num(Integer.parseInt(allcouponnum));
				bdto.setDelivery_coupon_num(Integer.parseInt(delcouponnum));
				bdto.setPoint(Integer.parseInt(inpoint));
				bdto.setDelivery_title(delivery_title);
				bdto.setDelivery_cost(delivery_cost);
				bdto.setDelivery_result("배송준비중");
				bdto.setDelivery_name(delivery_name);
				bdto.setDelivery_mtel(delivery_phone);
				bdto.setDelivery_address(delivery_address);
				bdto.setDelivery_message(del_message);
				bdto.setPayments(paytype);
				
				cdao.Deletecart(Integer.parseInt(cartnum[i]));
			
				bdao.insertBuyList(bdto);
			}
		}
		
		if(delcouponnum != "0"){
			coudao.UpdateUserCoupon(Integer.parseInt(delcouponnum), id);
		} else if(allcouponnum != "0"){
			coudao.UpdateUserCoupon(Integer.parseInt(allcouponnum), id);
		}
		
		/*//회원 등급을 조회(포인트 적립비율을 위한 조회) 예)아이언이면 1%적립 브론즈2% 실버3%...
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
		
		request.setAttribute("totalprice", totalprice);
		request.setAttribute("totalsaleprice", totalsaleprice);
		request.setAttribute("delivery_cost", delivery_cost1);
		request.setAttribute("buylist", buylist);
		request.setAttribute("buyday", thisDayMore);*/
		
		/*회원 가입 성공시.... 로그인 페이지로 이동 시킨다.*/
		//페이지 이동 방식 여부 값,이동페이지 경로 값 저장 하여 리턴 해주는 객체 생성
		ActionForward forward=new ActionForward();
		//페이지 이동 방식 여부 값 true로 저장  
		//sendRedirect() <-이방식은 이동할 페이지 주소 경로 노출 함.
		forward.setRedirect(true);
		// ./member/login.jsp 이동할 페이지 주소 저장
		forward.setPath("./BuyListInsertController2.buy");
		
		//페이지 이동 방식 여부 값 true와...
		// 이동할페이지 주소 (./member/login.jsp)를 담고 있는..
		//new ActionForward()객체를 MemberFrontController로 리턴  
		return forward;
	}
}
