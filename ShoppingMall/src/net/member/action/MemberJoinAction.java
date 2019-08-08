package net.member.action;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.MemberDTO;
import member.MemberDAO;

//하는일
//1.회원가입 폼 (join.jsp)에서  입려한 정보들을 MemberBean 객체(자바빈)에 저장 시키고..
//2.저장시킨 MemberBean객체를  DB작업을 하기위한 DAO객체에 전달하여 회원가입 한다.
//3.회원 가입 성공시.... 로그인 페이지로 이동시키기위해..
//페이지 이동 방식 여부 값,이동페이지 경로 값을 new ActionForward()객체에 저장 하여...
//MemberFrontController로 리턴 해주는 역할을 함

public class MemberJoinAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) 
			throws Exception {
		System.out.println("MemberJoinAction execute()");
		
		//회원가입 폼 (join.jsp)에서  입력한 한글  정보들이 깨지지 않도록 인코딩 설정
		request.setCharacterEncoding("utf-8");
		
		
		/*1,2클라이언트 요청 정보 받기 */
		/*3.자바빈 DTO에 저장에 저장*/
		//회원가입 폼 (join.jsp)에서  입려한 정보들을 MemberBean 객체(자바빈)에 저장한다.
		MemberDTO dto=new MemberDTO();
		dto.setId(request.getParameter("id"));//회원 id 저장
		dto.setPassword(request.getParameter("pass")); //회원 pass 저장
		dto.setName(request.getParameter("name")); //회원 이름 저장
		dto.setBirth_date(request.getParameter("birth_date"));
		dto.setGender(request.getParameter("gender"));
		dto.setEmail(request.getParameter("email"));//회원 이메일 저장
		dto.setReg_date(new Timestamp(System.currentTimeMillis()));//회원가입 시간 저장
		dto.setAddress_main(request.getParameter("address_main")); //회원 주소 저장
		dto.setAddress_detail(request.getParameter("address_detail"));
		dto.setTel(request.getParameter("tel1")+"-"+request.getParameter("tel2")+"-"+request.getParameter("tel3"));//회원 전화번호 저장
		dto.setPhone(request.getParameter("phone1")+"-"+request.getParameter("phone2")+"-"+request.getParameter("phone3"));//회원  폰번호 저장
		dto.setGrade(request.getParameter("grade"));
		dto.setTotalprice(Integer.parseInt(request.getParameter("totalprice")));
		dto.setPoint(Integer.parseInt(request.getParameter("point")));
		
		
		//회원가입 성공 여부를 담을 변수 선언
		boolean result = false;
		
		//MemberBean객체를 매개변수로 DAO클래스의 insertMember()메소드에 전달하여 회원가입 처리 
		member.MemberDAO mdao=new member.MemberDAO();
		
		//회원가입 내용을 담고 있는 dto객체를 전달하여..
		//가입에 성공하면 true리턴, 실패하면 false리턴
		result = mdao.insertMember(dto);
		
		System.out.println("fgds");
		
		//회원 가입 처리에 실패 했을 경우 null을 반환 한다.
		if(result == false){
			System.out.println("회원가입 실패");
			return null;
		}
		
		/*회원 가입 성공시.... 로그인 페이지로 이동 시킨다.*/
		//페이지 이동 방식 여부 값,이동페이지 경로 값 저장 하여 리턴 해주는 객체 생성
		ActionForward forward=new ActionForward();
		//페이지 이동 방식 여부 값 true로 저장  
		//sendRedirect() <-이방식은 이동할 페이지 주소 경로 노출 함.
		forward.setRedirect(true);
		// ./member/login.jsp 이동할 페이지 주소 저장
		forward.setPath("./MemberLogin.me");
		
		//페이지 이동 방식 여부 값 true와...
		// 이동할페이지 주소 (./member/login.jsp)를 담고 있는..
		//new ActionForward()객체를 MemberFrontController로 리턴  
		return forward;
	}
}
