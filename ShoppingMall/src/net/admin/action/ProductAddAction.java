package net.admin.action;

import java.io.PrintWriter;
import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.member.db.MemberDTO;
import net.product.db.ProductDAO;
import net.product.db.ProductDTO;
import net.action.Action;
import net.action.ActionForward;
import net.member.db.MemberDAO;


public class ProductAddAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) 
			throws Exception {
		System.out.println("MemberJoinAction execute()");
		
		request.setCharacterEncoding("utf-8");
		
		
		ProductDTO pdto=new ProductDTO();
		pdto.setProduct_name(request.getParameter("product_name"));
		pdto.setProduct_subname(request.getParameter("product_subname"));
		pdto.setProduct_price(Integer.parseInt(request.getParameter("product_price")));
		pdto.setBrand(request.getParameter("brand"));
		pdto.setImg_main(request.getParameter("img_main"));
		pdto.setImg_contents(request.getParameter("img_contents"));
		pdto.setCategory_main(request.getParameter("category_main"));
		pdto.setCategory_sub(request.getParameter("category_sub"));
		pdto.setPrice_count(Integer.parseInt(request.getParameter("price_count")));
		pdto.setDiscount(Integer.parseInt(request.getParameter("discount")));		
		
		
		boolean result = false;
		
		ProductDAO pdao = new ProductDAO();
		
		result = pdao.insertProduct(pdto);
		
		/*회원 가입 성공시.... 로그인 페이지로 이동 시킨다.*/
		//페이지 이동 방식 여부 값,이동페이지 경로 값 저장 하여 리턴 해주는 객체 생성
		ActionForward forward=new ActionForward();
		//페이지 이동 방식 여부 값 true로 저장  
		//sendRedirect() <-이방식은 이동할 페이지 주소 경로 노출 함.
		forward.setRedirect(true);
		// ./member/login.jsp 이동할 페이지 주소 저장
		forward.setPath("./member/alert.jsp");
		
		if(result == false){
			System.out.println("회원가입 실패");
			return null;
		}
		
		return forward;
	}
}
