package net.product.action;

import java.util.Vector;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.action.Action;
import net.action.ActionForward;
import net.member.action.MainAction;
import net.product.db.PageDTO;
import net.product.db.ProductDAO;
import net.product.db.ProductDTO;

public class ProductListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		
		//메인카테고리 불러오기
		String category_main =request.getParameter("main");		
		//서브 카테고리 불러오기
		String  category_sub = request.getParameter("sub");
		//정렬방법 불러오기
		String sort = request.getParameter("sort");	
		
		//정렬방법 쿼리문을 저장하는 변수
		String sort_query="";
		
		switch(sort){
			case "price_count":
			case "pop":
				sort_query=" order by price_count desc, product_num";
				break;
			case "recent":
				sort_query=" order by product_num desc";
				break;
			case "low_price":
				sort_query=" order by product_price-product_sale_price, product_num";
				break;
			case "high_price":
				sort_query=" order by product_price-product_sale_price desc, product_num";
				break;
		}
		
		//페이지번호 불러오기
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		
		//선택한 브랜드 불러오기
		String[] brands = request.getParameterValues("brand");
		
		//한 페이지에 표시되는 상품 갯수
		int maxNum =24;
		
		ProductDAO pdao = new ProductDAO();
		
		//상품목록 불러오기
		Vector<ProductDTO> v = pdao.getProductListAll(category_main, category_sub, sort_query, pageNum, brands, maxNum);	
		
		Vector<Vector> productList = Make2DArray(v);
		
		request.setAttribute("productList", productList);

		
		
		
		//기타.. 일자 정렬?
		
		//서브카테고리 목록불러오기
		
			Vector<String> subList = pdao.getSubList(category_main);
			request.setAttribute("subList", subList);
		//브랜드목록 불러오기
			Vector<String> brandList = pdao.getBrandList(category_main, category_sub);
			request.setAttribute("brandList", brandList);

		//상품 총 갯수 불러오기
			int productCount = pdao.getProductCount(category_main, category_sub, brands);
			request.setAttribute("productCount", productCount);
		
			
		PageDTO page = new PageDTO();
		//페이지 최대 인덱스
			page.setMaxPage(productCount/maxNum +(productCount%maxNum>0?1:0));
		//시작 인덱스	
			page.setStartPage(pageNum/10*10+(pageNum%10>0?1:-9));
		//마지막 인덱스	
			page.setEndPage(page.getStartPage()+9>=page.getMaxPage()?
					page.getMaxPage():page.getStartPage()+9);
		request.setAttribute("page", page);	


		forward.setRedirect(false);
		forward.setPath("./Main.jsp?section=./product/productList.jsp");
		return forward;
	}
	
	//4*n 2차원배열로 만들어주는 함수
		public static Vector<Vector> Make2DArray(Vector<ProductDTO> v){
			
			Vector<Vector> vector1 = new Vector<Vector>();
			for(int i = 0; i< v.size(); ){
				Vector<ProductDTO> vector2 = new Vector<ProductDTO>();
				for(int j =0 ;j <4; j++){
					if(i>=v.size()) break;
					vector2.add(v.get(i++));			
				}
				
				vector1.add(vector2);
			}
			return vector1;
		}
	

}
