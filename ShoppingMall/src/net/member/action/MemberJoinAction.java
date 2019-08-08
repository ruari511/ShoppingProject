package net.member.action;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.MemberDTO;
import member.MemberDAO;


public class MemberJoinAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) 
			throws Exception {
		System.out.println("MemberJoinAction execute()");
		
		request.setCharacterEncoding("utf-8");
		
		
		MemberDTO dto=new MemberDTO();
		dto.setId(request.getParameter("id"));//�쉶�썝 id ���옣
		dto.setPassword(request.getParameter("pass")); //�쉶�썝 pass ���옣
		dto.setName(request.getParameter("name")); //�쉶�썝 �씠由� ���옣
		dto.setBirth_date(request.getParameter("birth_date"));
		dto.setGender(request.getParameter("gender"));
		dto.setEmail(request.getParameter("email"));//�쉶�썝 �씠硫붿씪 ���옣
		dto.setReg_date(new Timestamp(System.currentTimeMillis()));//�쉶�썝媛��엯 �떆媛� ���옣
		dto.setAddress_main(request.getParameter("address_main")); //�쉶�썝 二쇱냼 ���옣
		dto.setAddress_detail(request.getParameter("address_detail"));
		dto.setTel(request.getParameter("tel1")+"-"+request.getParameter("tel2")+"-"+request.getParameter("tel3"));//�쉶�썝 �쟾�솕踰덊샇 ���옣
		dto.setPhone(request.getParameter("phone1")+"-"+request.getParameter("phone2")+"-"+request.getParameter("phone3"));//�쉶�썝  �룿踰덊샇 ���옣
		
		
		
		boolean result = false;
		
		member.MemberDAO mdao=new member.MemberDAO();
		
		result = mdao.insertMember(dto);
		
		System.out.println("fgds");
		
		if(result == false){
			System.out.println("�쉶�썝媛��엯 �떎�뙣");
			return null;
		}
		
		/*�쉶�썝 媛��엯 �꽦怨듭떆.... 濡쒓렇�씤 �럹�씠吏�濡� �씠�룞 �떆�궓�떎.*/
		//�럹�씠吏� �씠�룞 諛⑹떇 �뿬遺� 媛�,�씠�룞�럹�씠吏� 寃쎈줈 媛� ���옣 �븯�뿬 由ы꽩 �빐二쇰뒗 媛앹껜 �깮�꽦
		ActionForward forward=new ActionForward();
		//�럹�씠吏� �씠�룞 諛⑹떇 �뿬遺� 媛� true濡� ���옣  
		//sendRedirect() <-�씠諛⑹떇�� �씠�룞�븷 �럹�씠吏� 二쇱냼 寃쎈줈 �끂異� �븿.
		forward.setRedirect(true);
		// ./member/login.jsp �씠�룞�븷 �럹�씠吏� 二쇱냼 ���옣
		forward.setPath("./MemberLogin.me");
		
		//�럹�씠吏� �씠�룞 諛⑹떇 �뿬遺� 媛� true��...
		// �씠�룞�븷�럹�씠吏� 二쇱냼 (./member/login.jsp)瑜� �떞怨� �엳�뒗..
		//new ActionForward()媛앹껜瑜� MemberFrontController濡� 由ы꽩  
		return forward;
	}
}
