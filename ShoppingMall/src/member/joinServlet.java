package member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.member.db.MemberDAO;

@WebServlet("/Check")
//@RequestMapping(value="/login/regiEmailChk.do", method = RequestMethod.POST)
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
		String phone = request.getParameter("phone");
				
		//사용자가 입력한 id와  DB에 저장되어 있는 회원의 id를 비교 하기 위해 DB작업
		MemberDAO memberDAO = new MemberDAO();
		
		//아이디 중복 체크 여부값 얻기
		int overlappedID = memberDAO.overlappedID(id);
		//핸드폰번호 중복 체크 여부값 얻기
		int overlappedPhone = memberDAO.overlappedPhone(phone);
		
		// 아이디 중복일 때 : 1
		// 아이디 중복이 아닐때 : 2
		// 핸드폰 중복일 때 : 3
		// 핸드폰 중복이 아닐때 : 4
		
		
		//아이디 중복이냐 중복이 아니냐에 따라 메세지를 클라이언트의 웹브라우저로 출력(응답)
		if(overlappedID == 1){ // 아이디가 중복되었다면
			writer.print("1"); // 중복되어서 사용 X
		}else if(overlappedID == 0){
			writer.print("2"); // 사용 가능
		}
		
		//핸드폰번호 중복이냐 중복이 아니냐에 따라 메세지를 클라이언트의 웹브라우저로 출력(응답)	
		if(overlappedPhone == 1){ 
			writer.print("3"); // 중복되어서 사용 X
		}else if(overlappedPhone == 0){
			writer.print("4"); // 중복안되서 사용 가능
		}
		
	}	
	
	
}
