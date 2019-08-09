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
		//����ڷ� ���� �Է¹��� ���̵��� �ѱ��ϰ�� �ѱ� ������ ������ ���� ���ڼ� ��� ����
		request.setCharacterEncoding("UTF-8");
		//������ ������ ���� ����
		response.setContentType("text/html; charset=UTF-8");
		//����(���)�� ������ �ϴ�  PrintWriter��ü ���
		PrintWriter writer = response.getWriter();
		
		//��û�����(����ڰ� �Է��� ���̵� ���)
		String id = request.getParameter("id");
		System.out.println("id=" + id);
		
		String pass = request.getParameter("pass");
		String pass2 = request.getParameter("pass2");
		System.out.println("pass = " + pass);
				
		//����ڰ� �Է��� id��  DB�� ����Ǿ� �ִ� ȸ���� id�� �� �ϱ� ���� DB�۾�
		MemberDAO memberDAO = new MemberDAO();
		
		//���̵� �ߺ� üũ ���ΰ� ���
		boolean overlappedID = memberDAO.overlappedID(id);
		
		//���̵� �ߺ��̳� �ߺ��� �ƴϳĿ� ���� �޼����� Ŭ���̾�Ʈ�� ���������� ���(����)
		if(overlappedID == true){
			writer.print("not_usable");
		}else{
			writer.print("usable");
		}
		
		
	}	
	
	
}









