package net.member.action;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.action.Action;
import net.action.ActionForward;
import net.product.action.ProductListAction;
import net.product.db.ProductDAO;
import net.product.db.ProductDTO;

public class MainAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward  = new ActionForward();
		
		ProductDAO pdao = new ProductDAO();
		//카테고리 불러오기
		//DB에 저장해서 우르르불러오면 좋을 것 같다...
		
		
		//메인 슬라이드 불러오기
		Vector<Vector> category = new Vector<Vector>();
		
		//메인카테고리, 서브카테고리, 상품 표시 갯수
		Vector<ProductDTO> v1 = pdao.getProductLimitList("스킨케어", "페이셜케어", 8);
		Vector<Vector> category1 = ProductListAction.Make2DArray(v1);	
		category.add(category1);
		
		//메인카테고리, 서브카테고리, 상품 표시 갯수
		Vector<ProductDTO> v2 = pdao.getProductLimitList("바디로션", "로션/크림", 8);
		Vector<Vector> category2 = ProductListAction.Make2DArray(v2);	
		category.add(category2);
		
		//메인카테고리, 서브카테고리, 상품 표시 갯수
		Vector<ProductDTO> v3 = pdao.getProductLimitList("헤어케어", "스타일링/에센스", 8);
		Vector<Vector> category3 = ProductListAction.Make2DArray(v3);	
		category.add(category3);
	
		request.setAttribute("category", category);
		
		//제목
		Vector<String> title = new Vector<String>();
		title.add("페이셜케어");
		title.add("로션/크림");
		title.add("스타일링/에센스");
		
		request.setAttribute("title", title);
		
		///////////////////////////////////////////////////////////
		
		//메인카테고리 목록 불러오기
		//메인메뉴
		Vector<String> mainCategory = pdao.getMainList();
		request.setAttribute("mainCategory", mainCategory);
		
		//서브메뉴-hashmap에 배열 넣기
		//https://enterkey.tistory.com/391
		HashMap<String, Vector> subCategory = new HashMap<String, Vector>();
		for(String s: mainCategory){
			subCategory.put(s, pdao.getSubList(s));					
		}
		
		request.setAttribute("subCategory", subCategory);
		
		//추천상품-제일 많이 팔린 상품 
		//메인카테고리/상품정보
		HashMap<String, ProductDTO> ad = new HashMap<String, ProductDTO>();
		for(String s: mainCategory){
			ad.put(s, pdao.getAd(s));
		}
		request.setAttribute("Ad", ad);
		
		
		
		
		
		forward.setRedirect(false);
		forward.setPath("./Main.jsp");
		
		return forward;
	}
	
}
