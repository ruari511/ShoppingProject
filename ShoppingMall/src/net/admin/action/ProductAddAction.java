package net.admin.action;

import java.io.File;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import net.product.db.ProductDAO;
import net.product.db.ProductDTO;
import net.action.Action;
import net.action.ActionForward;


public class ProductAddAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) 
			throws Exception {
		System.out.println("ProductAddAction execute()");
		
		request.setCharacterEncoding("utf-8");
		
		int size = 10*1024*1024;
		
		ServletContext ctx = request.getServletContext();
		
		String uploadPath = ctx.getRealPath("upload");
		
		try {
			MultipartRequest multi = new MultipartRequest(request, uploadPath, size, new DefaultFileRenamePolicy() );
			
			
			String product_name = multi.getParameter("product_name");
			String product_subname = multi.getParameter("product_subname");
			int product_price = Integer.parseInt(multi.getParameter("product_price"));
			String brand = multi.getParameter("brand");
			String img_main = multi.getParameter("img_main");
			String img_contents = multi.getParameter("img_contents");
			String category_main = multi.getParameter("category_main");
			String category_sub = multi.getParameter("category_sub");
			//int price_count = Integer.parseInt(multi.getParameter("price_count"));
			int discount = Integer.parseInt(multi.getParameter("discount"));
			
			ArrayList saveFiles = new ArrayList();
			ArrayList originFiles = new ArrayList();
			
			Enumeration e = multi.getFileNames();
			
			while(e.hasMoreElements()){
				String file = (String)e.nextElement();
				saveFiles.add(multi.getFilesystemName(file));
				originFiles.add(multi.getOriginalFileName(file));
			}
			
			System.out.println(saveFiles);
		    
		    
			ProductDTO pdto=new ProductDTO();
			pdto.setProduct_name(product_name);
			pdto.setProduct_subname(product_subname);
			pdto.setProduct_price(product_price);
			pdto.setBrand(brand);
			pdto.setImg_main((String)saveFiles.get(0));
			pdto.setImg_contents((String)saveFiles.get(1));
			pdto.setCategory_main(category_main);
			pdto.setCategory_sub(category_sub);
			//pdto.setPrice_count(Integer.parseInt(request.getParameter("price_count")));
			pdto.setDiscount(discount);
			
			boolean result = false;
			
			ProductDAO pdao = new ProductDAO();
			
			result = pdao.insertProduct(pdto);
			
			/*회원 가입 성공시.... 로그인 페이지로 이동 시킨다.*/
			//페이지 이동 방식 여부 값,이동페이지 경로 값 저장 하여 리턴 해주는 객체 생성
			
			if(result == false){
				System.out.println("상품등록 실패");
				return null;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		ActionForward forward=new ActionForward();
		//페이지 이동 방식 여부 값 true로 저장  
		//sendRedirect() <-이방식은 이동할 페이지 주소 경로 노출 함.
		forward.setRedirect(true);
		// ./member/login.jsp 이동할 페이지 주소 저장
		
//		String alert = "상품등록을 성공적으로 완료했습니다.";
//		request.setAttribute("alert", alert);
		
		forward.setPath("./productList.ad");
		
		return forward;
	}
}
