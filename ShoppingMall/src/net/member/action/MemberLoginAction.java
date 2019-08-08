package net.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.MemberDAO;

/*login.jsp���� ����ڰ� �Է��� id�� pass��  userCheck�޼ҵ�� �����Ͽ�..
����ڰ� �Է��� id�� pass����...DB�� �ִ� id,pass���� ���Ͽ� �α��� ó�� �ϱ� */
public class MemberLoginAction implements Action{
   @Override
   public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

      //login.jsp���� ����ڰ� �Է��� id�� pass �Ķ���� ��������
      String id=request.getParameter("id");
      String pass=request.getParameter("pass");
      
      //DB�۾� ��ü ����
      MemberDAO mdao=new MemberDAO();
      
    
      //login.jsp���� ����ڰ� �Է��� id�� pass��  userCheck�޼ҵ�� �����Ͽ�..
      //����ڰ� �Է��� id�� pass����...DB�� �ִ� id,pass���� ���Ͽ� �α��� ó�� �ϱ� 
      //: check = 1 -> ���̵�, ��й�ȣ ����
      //: check = 0 -> ���̵�, ��й�ȣ Ʋ��
      //: check = -1 -> ���̵� Ʋ��
      int check=mdao.userCheck(id, pass);
      
      
      // check==0  "��й�ȣƲ��" �ڷ��̵�
      if(check==0){
         response.setContentType("text/html; charset=UTF-8");
         PrintWriter out=response.getWriter();
         out.println("<script>");
         out.println("alert('���̵� �Ǵ� ��й�ȣƲ��');");
         out.println("history.back();");
         out.println("</script>");
         out.close();
         return null;
      
      // check==-1 "���̵����" �ڷ��̵�   
      }else if(check==-1){
         response.setContentType("text/html; charset=UTF-8");
         PrintWriter out=response.getWriter();
         out.println("<script>");
         out.println("alert('���̵����');");
         out.println("history.back();");
         out.println("</script>");
         out.close();
         return null;   
      }
      
      
   /*check == 1  
    * DB�� �ִ� ���̵�,��й�ȣ��...
    * login.jsp ȭ�鿡�� �Է��� ���̵�,��й�ȣ�� ��ġ�Ҷ�...
    */
      //���ǰ�ü ����
      HttpSession session=request.getSession();
      
      //login.jsp ȭ�鿡�� �Է��� ���̵� ���ǰ�ü������ ����
      session.setAttribute("id", id);
      
      /*�α��� ������.... CarMain.jsp �������� �̵� ��Ų��.*/
      //������ �̵� ��� ���� ��,�̵������� ��� �� ���� �Ͽ� ���� ���ִ� ��ü ����
      ActionForward forward=new ActionForward();
      
      //������ �̵� ��� ���� �� true�� ����  
      //true sendRedirect() <- �̹���� �̵��� ������ �ּ� ��� ���� ��.   
      forward.setRedirect(true);
      
      // ./CarMain.jsp �̵��� ������ �ּ� ����
      forward.setPath("./Main.me"); 
      
      //������ �̵� ��� ���� �� true��...
      // �̵��������� �ּ� (./CarMain.jsp)�� ��� �ִ�..
      //new ActionForward()��ü�� MemberFrontController�� ����  
      return forward;
   }
}
