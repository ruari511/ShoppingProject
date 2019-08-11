package member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Check")
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
		String phone = request.getParameter("phone");
				
		//����ڰ� �Է��� id��  DB�� ����Ǿ� �ִ� ȸ���� id�� �� �ϱ� ���� DB�۾�
		MemberDAO memberDAO = new MemberDAO();
		
		//���̵� �ߺ� üũ ���ΰ� ���
		int overlappedID = memberDAO.overlappedID(id);
		//�ڵ�����ȣ �ߺ� üũ ���ΰ� ���
		int overlappedPhone = memberDAO.overlappedPhone(phone);
		
		// ���̵� �ߺ��� �� : 1
		// ���̵� �ߺ��� �ƴҶ� : 2
		// �ڵ��� �ߺ��� �� : 3
		// �ڵ��� �ߺ��� �ƴҶ� : 4
		
		
		//���̵� �ߺ��̳� �ߺ��� �ƴϳĿ� ���� �޼����� Ŭ���̾�Ʈ�� ���������� ���(����)
		if(overlappedID == 1){ // ���̵� �ߺ��Ǿ��ٸ�
			writer.print("1"); // �ߺ��Ǿ ��� X
			System.out.println(id + " : �ߺ�");
		}else if(overlappedID == 0){
			writer.print("2"); // ��� ����
			System.out.println(id + " : ��밡��");
		}
		
		//�ڵ�����ȣ �ߺ��̳� �ߺ��� �ƴϳĿ� ���� �޼����� Ŭ���̾�Ʈ�� ���������� ���(����)	
		if(overlappedPhone == 1){ 
			writer.print("3"); // �ߺ��Ǿ ��� X
			System.out.println(phone + " : �ߺ�");
		}else if(overlappedPhone == 0){
			writer.print("4"); // �ߺ��ȵǼ� ��� ����
			System.out.println(phone + " : ��� ����");
		}
		
//		if(flag){
//			if(overlappedPhone == 1){ 
//				writer.print("3"); // �ߺ��Ǿ ��� X
//				System.out.println(phone + " : �ߺ�");
//			}else if(overlappedPhone == 0){
//				writer.print("4"); // �ߺ��ȵǼ� ��� ����
//				System.out.println(phone + " : ��� ����");
//			}
//		}		
//		switch(overlappedID){
//			case 1:
//				writer.print("1"); // �ߺ��Ǿ ��� X
//				System.out.println(id + " : �ߺ�");
//				break;
//			case 0:
//				writer.print("2"); // �ߺ� �ȵǼ� ��� ����
//				System.out.println(id + " : ��� ����");
//				break;
//		}
		
		
//		if(overlappedPhone == 1){
//			writer.print("overlappedPhone"); // �ߺ��Ǿ ��� X
//			System.out.println(phone + " : �ߺ�");
//		}else if(overlappedPhone == 0){
//			writer.print("not_overlappedPhone"); // �ߺ��ȵǼ� ��� ����
//			System.out.println(phone + " : ��� ����");
//		}
		
		
	}	
	
	
}
