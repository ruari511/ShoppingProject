package net.board.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.action.Action;
import net.action.ActionForward;

public class BoardFrontController extends HttpServlet {

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

		String RequestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = RequestURI.substring(contextPath.length());
		ActionForward forward = null;
		Action action = null;
/*
		System.out.println("RequestURI:	"+RequestURI);
		System.out.println("contextPath:	"+contextPath);
		System.out.println("command:	"+command);
		System.out.println("---------------------------------------");*/
		/* FAQ */
		if (command.equals("/faq.bd")) {
			action = new BoardFaqListAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/faqWrite.bd")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./Main.jsp?section=board/faqWrite.jsp");
		} else if (command.equals("/faqUpdate.bd")) {
			action = new BoardFaqUpdate();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/faqUpdateAction.bd")) {
			action = new BoardFaqUpdateAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/faqDelete.bd")) {
			action = new BoardFaqDeleteAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		/* Notice */
		} else if (command.equals("/BoardFaqWriteAction.bd")) {
			action = new BoardFaqWriteAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/notice.bd")) {
			action = new BoardNoticeListAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/noticeDetail.bd")) {
			action = new BoardNoticeDetailAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/noticeWrite.bd")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./Main.jsp?section=board/noticeWrite.jsp");
		} else if (command.equals("/BoardNoticeWriteAction.bd")) {
			action = new BoardNoticeWriteAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/noticeDetail.bd")) {
			action = new BoardNoticeDetailAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/noticeUpdate.bd")) {
			action = new BoardNoticeUpdate();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/BoardNoticeUpdateAction.bd")){
			action = new BoardNoticeUpdateAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
				
		} else if (command.equals("/noticeDelete.bd")) {
			action = new BoardNoticeDeleteAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if(command.equals("/qna.bd")) {
			action = new BoardQnaListAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/qnaWrite.bd")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./Main.jsp?section=board/qnaWrite.jsp");
		} else if (command.equals("/BoardQnaWriteAction.bd")) {
			action = new BoardQnaWriteAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} 
		
		if (forward != null) { 
			if (forward.isRedirect()) {
				response.sendRedirect(forward.getPath());
			} else {
				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
		} // if
	}// doProcess
}
