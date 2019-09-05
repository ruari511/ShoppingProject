package net.admin.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.member.db.MemberDAO;
import net.product.db.ProductDAO;
import net.product.db.ProductDTO;
import net.action.Action;
import net.action.ActionForward;

/*CarReservation.jsp페이지에서.. 전체검색 버튼 클릭했을떄.. DB에 저장되어 있는 전체 차량 검색요청을 받는 서블릿*/
public class ProductInfoAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) 
			throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		
		int num = Integer.parseInt(request.getParameter("product_num"));
		
		System.out.println("num = "+num);
		
		ProductDAO pdao = new ProductDAO();
		
		ProductDTO productInfo = pdao.getProductInfo(num);
		
		System.out.println("name = "+productInfo.getProduct_name());
		
		request.setAttribute("productInfo", productInfo);
		
		// 페이지의 회원정보 값 넘기
		
			//페이지 이동 방식 여부 값,이동페이지 경로 값 저장 하여 리턴 해주는 객체 생성
			ActionForward forward = new ActionForward();
			//페이지 이동 방식 여부 값 true로 저장  
			//sendRedirect() <-이방식은 이동할 페이지 주소 경로 노출 함.
			forward.setRedirect(true);
			// ./member/login.jsp 이동할 페이지 주소 저장
			forward.setPath("./productModify.ad");
			
			//페이지 이동 방식 여부 값 true와...
			//new ActionForward()객체를 MemberFrontController로 리턴  
			return forward;
		
	}
}


