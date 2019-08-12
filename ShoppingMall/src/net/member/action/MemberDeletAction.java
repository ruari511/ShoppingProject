package net.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.MemberDAO;

public class MemberDeletAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("MemberDeletAction execute()");
		
		ActionForward forward= new ActionForward();
		
		// 세션이 가지고 있는 로그인한 ID정보를 가져온다
		HttpSession session = request.getSession();
		String id=request.getParameter("id");
		String password=request.getParameter("password");
		
		//DB작업 객체 생성
		MemberDAO mdao=new MemberDAO();
		//login.jsp에서 사용자가 입력한 id와 pass를  userCheck메소드로 전달하여..
		//사용자가 입력한 id와 pass값과...DB에 있는 id,pass값을 비교하여  처리 하기 
		//: check = 1 -> 아이디, 비밀번호 맞음
		//: check = 0 -> 아이디, 비밀번호 틀림
		//: check = -1 -> 아이디 틀림
		int check=mdao.deleteMember(id, password);
		
		if(check==1){
			session.invalidate();//회원정보 담긴 세션 삭제
			forward.setRedirect(true);
			forward.setPath("../Main.me"); 
			return forward;
		}else{
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.println("<script>");
			out.println("alert('회원탈퇴실패');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
			return null;
		}
			//페이지 이동 방식 여부 값 true와...
			// 이동할페이지 주소 (./Main.jsp)를 담고 있는..
			//new ActionForward()객체를 MemberFrontController로 리턴  
			//return forward;
			
		}
	}


