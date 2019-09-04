package net.cart.action;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Vector;

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

@WebServlet("/BuyListInsertController.do")
public class BuyListInsertController extends HttpServlet {

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
		int	lastprice = 0;
		if(request.getParameter("lastprice") != null){
			lastprice = Integer.parseInt(request.getParameter("lastprice"));			
		}
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		String ordername = request.getParameter("ordername");
		String orderphone = request.getParameter("orderphone");
		String orderemail = request.getParameter("orderemail");
		String delivery_title = request.getParameter("delivery_title");
		String delivery_name = request.getParameter("delivery_name");
		int delivery_cost = 0;
		if(request.getParameter("lastprice") != null){
			delivery_cost = Integer.parseInt(request.getParameter("deltotal"));		
		}
		
//		System.out.println("id = " + id + "\t ordername = " + ordername);
//		System.out.println("orderphone = " + orderphone + "\t orderemail = " + orderemail);
//		System.out.println("delivery_title = " + delivery_title + "\t delivery_name = " + delivery_name);
		
		String delivery_tel = request.getParameter("delivery_tel");
		String delivery_tel1 = request.getParameter("delivery_tel1");
		String delivery_tel2 = request.getParameter("delivery_tel2");
		
		String delivery_phone = delivery_tel + "-" + delivery_tel1 + "-" + delivery_tel2;
//		System.out.println("delivery_phone = " + delivery_phone);
		
		//�몮 以� �븯�굹�뒗 null�엫 message_1�� 吏곸젒 硫붿꽭吏� �엯�젰�븯�뒗 input�쓽 媛�
		String delivery_message = request.getParameter("delivery_message_2");
		String delivery_message_1 = request.getParameter("delivery_message_1");
		String del_message;
		if(delivery_message == "諛곗넚 硫붿떆吏� 吏곸젒�엯�젰"){
			del_message = delivery_message_1;
//			System.out.println("delivery_message = " + delivery_message_1);
		} else{
			del_message = delivery_message;
//			System.out.println("delivery_message_1 = " + delivery_message);
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
		if(delcouponnum=="�꽑�깮�븞�븿" || delcouponnum==null || delcouponnum.length()==4){
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
		
//		System.out.println("inpoint = " + inpoint);
		String paytype = request.getParameter("paytype");
//		System.out.println("paytype = " + paytype);
		
		String[] cartnum = request.getParameterValues("cartnum");
		
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
        
		if(cartnum != null){
			for(int i=0; i<cartnum.length; i++){
				bdto = new BuyListDTO();
			
				bdto.setBuynum(maxbuynum);
				bdto.setId(id);
				bdto.setOrder_name(ordername);
				bdto.setOrder_mtel(orderphone);
				bdto.setOrder_email(orderemail);
				bdto.setBuydate(buydate);
				bdto.setProduct_num(bdao.selectPronum(Integer.parseInt(cartnum[i])));
				bdto.setProduct_count(bdao.selectProcount(Integer.parseInt(cartnum[i])));
				bdto.setAll_coupon_num(Integer.parseInt(allcouponnum));
				bdto.setDelivery_coupon_num(Integer.parseInt(delcouponnum));
				bdto.setPoint(Integer.parseInt(inpoint));
				bdto.setDelivery_title(delivery_title);
				bdto.setDelivery_cost(delivery_cost);
				bdto.setDelivery_result("諛곗넚以�鍮꾩쨷");
				bdto.setDelivery_name(delivery_name);
				bdto.setDelivery_mtel(delivery_phone);
				bdto.setDelivery_address("諛곗넚二쇱냼");
				bdto.setDelivery_message(del_message);
				bdto.setPayments(paytype);
				
				cdao.Deletecart(Integer.parseInt(cartnum[i]));
			
				bdao.insertBuyList(bdto);
			}
		} 
		
		int totalprice = bdao.buytotalprice(maxbuynum);
		int limit = bdao.coupon_limitmax(maxbuynum);
		int totalsaleprice = bdao.buytotalsaleprice(maxbuynum, limit);
		int point = bdao.inpoint(maxbuynum);
		totalsaleprice = totalsaleprice + point;
		int delivery_cost1 = bdao.delivery_cost(maxbuynum);
		BuyListDTO buylist = bdao.getBuyList(maxbuynum);
		
		request.setAttribute("totalprice", totalprice);
		request.setAttribute("totalsaleprice", totalsaleprice);
		request.setAttribute("delivery_cost", delivery_cost1);
		request.setAttribute("buylist", buylist);
		request.setAttribute("buyday", thisDayMore);
		
		RequestDispatcher dis = 
				request.getRequestDispatcher("product/BuyComplete.jsp");
		//�떎�젣 �옱�슂泥�
		dis.forward(request, response);	
		
		
	}
	
}