package net.member.action;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.action.Action;
import net.action.ActionForward;
import net.product.db.ProductDAO;
import net.product.db.ProductDTO;

public class MainAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward  = new ActionForward();
		
		ProductDAO pdao = new ProductDAO();
		//카테고리 불러오기
		//DB에 저장해서 우르르불러오면 좋을 것 같다...
		Vector<ProductDTO> v = pdao.getProductLimitList(1, 1, 8);
		
		Vector<Vector> category = Make2DArray(v);
		
		System.out.println(category.get(0));
		request.setAttribute("category", category);
		
		forward.setRedirect(false);
		forward.setPath("./Main.jsp");
		
		return forward;
	}
	
	//4*n 2차원배열로 만들어주는 함수
	private Vector<Vector> Make2DArray(Vector<ProductDTO> v){
		
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
