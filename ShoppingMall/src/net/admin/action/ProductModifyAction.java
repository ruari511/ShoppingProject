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


public class ProductModifyAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) 
			throws Exception {
		System.out.println("ProductModifyAction execute()");
		
		request.setCharacterEncoding("utf-8");
		
		int size = 10*1024*1024;
		
		ServletContext ctx = request.getServletContext();
		
		String uploadPath = ctx.getRealPath("upload");
		
		try {
			MultipartRequest multi = new MultipartRequest(request, uploadPath, size, new DefaultFileRenamePolicy() );
			
			int product_num = Integer.parseInt(multi.getParameter("product_num"));
			String product_name = multi.getParameter("product_name");
			String product_subname = multi.getParameter("product_subname");
			int product_price = Integer.parseInt(multi.getParameter("product_price"));
			int product_count = Integer.parseInt(multi.getParameter("product_count"));
			int price_count = Integer.parseInt(multi.getParameter("price_count"));
			String brand = multi.getParameter("brand");
			String img_main = multi.getParameter("img_main");
			String img_contents = multi.getParameter("img_contents");
			String category_main = multi.getParameter("category_main");
			String category_sub = multi.getParameter("category_sub");
			//int price_count = Integer.parseInt(multi.getParameter("price_count"));
			int product_sale_price = Integer.parseInt(multi.getParameter("product_sale_price"));
			
			ArrayList saveFiles = new ArrayList();
			ArrayList originFiles = new ArrayList();
			
			Enumeration e = multi.getFileNames();
			
			while(e.hasMoreElements()){
				String file = (String)e.nextElement();
				saveFiles.add(multi.getFilesystemName(file));
				originFiles.add(multi.getOriginalFileName(file));
			}
			
		    
			ProductDTO pdto=new ProductDTO();
			pdto.setProduct_num(product_num);
			pdto.setProduct_name(product_name);
			pdto.setProduct_subname(product_subname);
			pdto.setProduct_price(product_price);
			pdto.setProduct_count(product_count);
			pdto.setPrice_count(price_count);
			pdto.setBrand(brand);
			pdto.setImg_main((String)saveFiles.get(0));
			pdto.setImg_contents((String)saveFiles.get(1));
			pdto.setCategory_main(category_main);
			pdto.setCategory_sub(category_sub);
			pdto.setProduct_sale_price(product_sale_price);
			
			
			ProductDAO pdao = new ProductDAO();
			
			pdao.modifyProduct(pdto);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		ActionForward forward=new ActionForward();
		//페이지 이동 방식 여부 값 true로 저장  
		//sendRedirect() <-이방식은 이동할 페이지 주소 경로 노출 함.
		forward.setRedirect(true);
		// ./member/login.jsp 이동할 페이지 주소 저장
		
		forward.setPath("./productList.ad");
		
		return forward;
	}
}
