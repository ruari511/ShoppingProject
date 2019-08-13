package net.cart.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		String ordername = request.getParameter("ordername");
		String orderphone = request.getParameter("orderphone");
		String orderemail = request.getParameter("orderemail");
		String delivery_title = request.getParameter("delivery_title");
		String delivery_name = request.getParameter("delivery_name");
		
		System.out.println("id = " + id + "\t ordername = " + ordername);
		System.out.println("orderphone = " + orderphone + "\t orderemail = " + orderemail);
		System.out.println("delivery_title = " + delivery_title + "\t delivery_name = " + delivery_name);
		
		String delivery_tel = request.getParameter("delivery_tel");
		String delivery_tel1 = request.getParameter("delivery_tel1");
		String delivery_tel2 = request.getParameter("delivery_tel2");
		
		String delivery_phone = delivery_tel + "-" + delivery_tel1 + "-" + delivery_tel2;
		System.out.println("delivery_phone = " + delivery_phone);
		
		//둘 중 하나는 null임 message_1은 직접 메세지 입력하는 input의 값
		String delivery_message = request.getParameter("delivery_message_2");
		String delivery_message_1 = request.getParameter("delivery_message_1");
		if(delivery_message == null){
			System.out.println("delivery_message_1 = " + delivery_message_1);
		} else{
			System.out.println("delivery_message = " + delivery_message);
		}
		
		String[] cartnum = request.getParameterValues("cartnum");
		
		if(cartnum != null){
			for(int i=0; i<cartnum.length; i++){
				System.out.println("i = " + i + "\t cartnum[i] = " + cartnum[i]);
			}
		}
		String allcouponnum = request.getParameter("allcouponnum");
		String[] coupon_split = allcouponnum.split("-");
		allcouponnum = coupon_split[0];
		
		System.out.println("couponnum = " + allcouponnum);
		
		String delcouponnum = request.getParameter("delcouponnum");
		
		System.out.println("delcouponnum = " + delcouponnum);
		
		String inpoint = request.getParameter("inpoint");
		System.out.println("inpoint = " + inpoint);
		String paytype = request.getParameter("paytype");
		System.out.println("paytype = " + paytype);
		
	}
	
}
