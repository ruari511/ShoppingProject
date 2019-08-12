package net.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.member.db.MemberDAO;

import net.member.db.MemberDTO;
import net.action.Action;
import net.action.ActionForward;

/**
 * 회원정보 수정작업을 처리하는 Action 클래스
 *
 */
public class MemberModifyAction implements Action
{

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8"); // 인코딩
		
		ActionForward forward = new ActionForward();
		
		MemberDAO dao = MemberDAO.getInstance();
		
		// 세션이 가지고있는 로그인한 ID 정보를 가져온다
		HttpSession session = request.getSession();
		String id = session.getAttribute("sessionID").toString();
		
		// 수정할 정보를 자바빈에 세팅한다.
		MemberDTO member = new MemberDTO();
		member.setId(id);
		member.setPassword(request.getParameter("password"));
		member.setEmail(request.getParameter("email"));
		member.setPhone(request.getParameter("phone"));
		member.setAddress_main(request.getParameter("address_main"));
		member.setAddress_detail(request.getParameter("address_detail"));
		
		dao.updateMember(member);

		forward.setRedirect(true);
   		forward.setPath("./MemberLogin.me");
		
   		// 회원정보 수정 성공 메시지를 세션에 담는다.
   		session.setAttribute("msg", "0");
   		
		return forward;
	}

}
