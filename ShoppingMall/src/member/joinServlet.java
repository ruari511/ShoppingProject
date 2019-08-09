package member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/joinCheck")
public class joinServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}

	protected void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//사용자로 부터 입력받은 아이디값이 한글일경우 한글 꺠짐을 방지를 위해 문자셋 방식 지정
		request.setCharacterEncoding("UTF-8");
		//응답할 데이터 유형 지정
		response.setContentType("text/html; charset=UTF-8");
		//응답(출력)의 역할을 하는  PrintWriter객체 얻기
		PrintWriter writer = response.getWriter();
		
		//요청값얻기(사용자가 입력한 아이디 얻기)
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		String pass2 = request.getParameter("pass2");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String phone1 = request.getParameter("phone1");
		String phone2 = request.getParameter("phone2");
		String phone3 = request.getParameter("phone3");
		
		
		
				
		//사용자가 입력한 id와  DB에 저장되어 있는 회원의 id를 비교 하기 위해 DB작업
		MemberDAO memberDAO = new MemberDAO();
		
		//아이디 중복 체크 여부값 얻기
		boolean overlappedID = memberDAO.overlappedID(id);
		
		//아이디 중복이냐 중복이 아니냐에 따라 메세지를 클라이언트의 웹브라우저로 출력(응답)
		if(overlappedID == true){
			writer.print("not_usable");
		}else{
			writer.print("usable");
		}
		
		
		// 핸드폰 번호 3자리 합친 값 구하기
		String phone = phone1 + "-" + phone2 + "-" + phone3;
		System.out.println(phone);
		//핸드폰번호 중복 체크 여부값 얻기
		boolean overlappedPhone = memberDAO.overlappedPhone(phone);
		
		//핸드폰번호 중복이냐 중복이 아니냐에 따라 메세지를 클라이언트의 웹브라우저로 출력(응답)
		if(overlappedPhone == true){
			writer.print("overlapped");
		}else{
			writer.print("not_overlapped");
		}
		
		
		
		
	}	
	
	
}









