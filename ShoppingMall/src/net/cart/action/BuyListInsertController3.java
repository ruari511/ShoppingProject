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
		String delivery_tel = request.getParameter("delivery_tel");
		System.out.println("delivery_tel = " + delivery_tel);
		String delivery_tel1 = request.getParameter("delivery_tel1");
		System.out.println("delivery_tel1 = " + delivery_tel1);
		String delivery_tel2 = request.getParameter("delivery_tel2");
		System.out.println("delivery_tel2 = " + delivery_tel2);
		String delivery_phone = delivery_tel + "-" + delivery_tel1 + "-" + delivery_tel2;
		
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
		
		ActionForward forward=new ActionForward();

		forward.setRedirect(true);

		forward.setPath("./BuyListInsertController2.buy");
		
		return forward;
	}
}
