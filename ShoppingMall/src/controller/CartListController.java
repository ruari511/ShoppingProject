package controller;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cart.CartDAO;
import cart.CartDTO;

/*CarReservation.jsp페이지에서.. 전체검색 버튼 클릭했을떄.. DB에 저장되어 있는 전체 차량 검색요청을 받는 서블릿*/
@WebServlet("/CartListController.do")
public class CartListController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		requestPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		requestPro(request, response);
	}

	protected void requestPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		/*DB에 존재하는 전체 차량 을 검색하기 위한 작업 */
		//데이터베이스에 접근해서 작업할  자바빈 역할을 하는 CarDAO객체 생성
		CartDAO cdao = new CartDAO();
		
		//실제 데이터베이스에 접근하여 자동차 정보를 모두 검색해서 얻기
		Vector<CartDTO> v = cdao.getCartList("admin");
		
		//전체차량을 검색한 정보는 백터에 있으므로
		//View페이지로 백터를 전달하기 위해.. request내장객체 영역에 수동으로 저장
		request.setAttribute("v", v);
		
		//CarMain.jsp로  포워딩 (재요청)시~ request영역 전달
		//디스패치 방식으로 ...
		RequestDispatcher dis = 
					request.getRequestDispatcher("Cart.jsp");
		//실제 재요청
		dis.forward(request, response);		
	}
	
	
}




