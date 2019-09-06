package net.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.member.db.MemberDAO;
import net.member.db.MemberDTO;
import net.action.Action;
import net.action.ActionForward;

/** 
 *  회원정보 수정화면에 현재 회원정보를 출력하는 Action 클래스
 */
public class MemberInfoAction implements Action
{

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		ActionForward forward = new ActionForward();
		
	
		
		// 세션이 가지고있는 로그인한 ID 정보를 가져온다
		HttpSession session = request.getSession();
		String id = session.getAttribute("id").toString();

		

		
		// 수정할 회원정보를 가져온다.
		MemberDAO dao = new MemberDAO();
		
		
		
		MemberDTO member = dao.getUser(id);
		
		/*member.setId(request.getParameter("id"));
		member.setPassword(request.getParameter("password"));
		member.setEmail(request.getParameter("email"));
		member.setAddress_main(request.getParameter("address_main"));
		member.setAddress_detail(request.getParameter("address_detail"));*/
		// ModifyFrom.jsp에 회원정보를 전달하기 위해 request에 MemberBean을 세팅한다.
		request.setAttribute("memberInfo", member);
		
		
		
		
		/*
		forward=new ActionForward();
		//페이지 이동 방식 여부 값 false로 저장-> RequestDispatcher  forward() 방식
		forward.setRedirect(false); //주소값 노출 안됨
		//이동할 페이지 경로(탈퇴 페이지) 주소값 저장
		*/
		
		
		
		
		forward.setRedirect(false);
		//forward.setPath("memberInfoModify.do");
		
	
		forward.setPath("./Main.jsp?section=./member/MemberInfoModify.jsp");
			
			return forward;
		}

	
	}

