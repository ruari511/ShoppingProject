package net.member.action;

import java.io.PrintWriter;
import java.util.ArrayList;
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
		Vector<ProductDTO> v = pdao.getProductLimitList("1", "1", 8);
		
		Vector<Vector> category = ProductListAction.Make2DArray(v);
		
		request.setAttribute("category", category);
		
		forward.setRedirect(false);
		forward.setPath("./Main.jsp");
		
		return forward;
	}
	
}
