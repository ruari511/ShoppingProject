package net.product.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.action.Action;
import net.action.ActionForward;
import net.product.action.ProductDetailAction;


public class ProductFrontController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doProcess(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doProcess(request, response);
	}

	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		//�����û �ּ� ��������
		//  /CarProject/MemberJoin.do
		String RequestURI=request.getRequestURI();
		System.out.println(RequestURI);
		
		//  /CarProject ���
		String contextPath=request.getContextPath();
		
		//	���� 11
		System.out.println(contextPath.length());
		
		//  /MemberJoin.do ���
		// /MemberJoinAction.do
		//  /MemberLogin.do ��� 
		String command=RequestURI.substring(contextPath.length());
		System.out.println(command);
					
		/*�ּ� ��*/	
		//������ �̵� ��� ���� ��,�̵������� ��� �� ���� �Ͽ� ���� ���ִ� ��ü�� ������ �������� ���� 
		ActionForward forward=null;
	
		//�ڽ� Action ��ü���� ���� �������̽� Ÿ���� �������� ����
		Action action=null;
			
		//��� �����ϱ� ������ �Ϸ�� �� ���ſϷ� �������� �̵��ϴ� �κ�
		if(command.equals("/Product.pro")){
		
			//������ �̵� ��� ���� ��,�̵������� ��� �� ���� �Ͽ� ���� ���ִ� ��ü ���� 
			forward=new ActionForward();
			//������ �̵� ��� ���� �� false�� ����-> RequestDispatcher  forward() ���
			forward.setRedirect(false);
			//�̵��� ������ ���(ȸ������ ������) �ּҰ� ����
			forward.setPath("./product/product.jsp");
			
		//�����ϱ� ���������� �����ϱ� ��ư�� �������� �����ϴ� �κ�
		}else if(command.equals("/ProductDetailAction.pro")){
	
			
			//ȸ������ ó���� ���� Action��ü ����
			action=new ProductDetailAction();
			
			try {
				forward=action.execute(request, response);
						
			} catch (Exception e) {
				e.printStackTrace();
			}
		//�����ϱ� ��ư�� ������ ���Ÿ���� insert�ǰ� �� �� Member�� ������ ������Ʈ �ϴ� �κ�
		}else if(command.equals("/ProductSelectAction.pro")){
	
			
			//ȸ������ ó���� ���� Action��ü ����
			action=new ProductSelectAction();
			
			try {
				forward=action.execute(request, response);
						
			} catch (Exception e) {
				e.printStackTrace();
			}
		//�����ϱ� ��ư�� ������ ���Ÿ���� insert�ǰ� �� �� Member�� ������ ������Ʈ �ϴ� �κ�
		}else if(command.equals("/ProductSelect.pro")){
	
			//������ �̵� ��� ���� ��,�̵������� ��� �� ���� �Ͽ� ���� ���ִ� ��ü ���� 
			forward=new ActionForward();
			//������ �̵� ��� ���� �� false�� ����-> RequestDispatcher  forward() ���
			forward.setRedirect(false);
			//�̵��� ������ ���(ȸ������ ������) �ּҰ� ����
			forward.setPath("./ProductSelect.jsp");
		}else if(command.equals("/ProductList.pro")){
			action = new ProductListAction();
			
			try {
				forward = action.execute(request, response);
			}catch (Exception e) {
				e.printStackTrace();
			}
		
		}
		
		
		
		//�ּ� �̵�
		if(forward!=null){ //new ActionForward()��ü�� ���� �ϰ�..
			if(forward.isRedirect()){//true -> sendRedirect() ����ϋ�..
				//�����̷�Ʈ ������� ������ �̵�!  ������ �ּ� ��� ���� �� 
				//join.jspȭ�� �̵�
				//login.jspȭ�� �̵�
				//CarMain.jspȭ�� �̵��� session���� ����
				response.sendRedirect(forward.getPath());
				
			}else{//false -> forward() ����϶�...
				
				RequestDispatcher dispatcher=request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
		}//if 
		
	}//	doProcess �޼ҵ� ��
	
}//���� ��



