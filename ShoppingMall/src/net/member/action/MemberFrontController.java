package net.member.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberFrontController extends HttpServlet{

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
		
		//媛��긽�슂泥� 二쇱냼 媛��졇�삤湲�
		//  /CarProject/MemberJoin.me
		//  /CarProject/MemberJoinAction.me
		//   /CarProject/MemberLogin.me 
		String RequestURI=request.getRequestURI();
		System.out.println(RequestURI);
		
		//  /CarProject �뼸湲�
		//  /CarProject �뼸湲�
		//  /CarProject �뼸湲�
		String contextPath=request.getContextPath();
		
		//	湲몄씠 11
		//	湲몄씠 11
		//	湲몄씠 11
		System.out.println(contextPath.length());
		
		//  /MemberJoin.me �뼸湲�
		// /MemberJoinAction.me
		//  /MemberLogin.me �뼸湲� 
		String command=RequestURI.substring(contextPath.length());
		System.out.println(command);
					
		/*二쇱냼 鍮꾧탳*/	
		//�럹�씠吏� �씠�룞 諛⑹떇 �뿬遺� 媛�,�씠�룞�럹�씠吏� 寃쎈줈 媛� ���옣 �븯�뿬 由ы꽩 �빐二쇰뒗 媛앹껜瑜� ���옣�븷 李몄“蹂��닔 �꽑�뼵 
		ActionForward forward=null;
	
		//�옄�떇 Action 媛앹껜�뱾�쓣 �떞�쓣 �씤�꽣�럹�씠�뒪 ���엯�쓽 李몄“蹂��닔 �꽑�뼵
		Action action=null;
			
		//Top.jsp�뿉�꽌.. join留곹겕瑜� �늻瑜대㈃ �쉶�썝媛��엯�럹�씠吏�濡� �씠�룞�븯�뒗 �슂泥��씠 �뱾�뼱 �솕�쓣�븣..
		if(command.equals("/MemberJoin.me")){
		
			//�럹�씠吏� �씠�룞 諛⑹떇 �뿬遺� 媛�,�씠�룞�럹�씠吏� 寃쎈줈 媛� ���옣 �븯�뿬 由ы꽩 �빐二쇰뒗 媛앹껜 �깮�꽦 
			forward=new ActionForward();
			//�럹�씠吏� �씠�룞 諛⑹떇 �뿬遺� 媛� false濡� ���옣-> RequestDispatcher  forward() 諛⑹떇
			forward.setRedirect(false);
			//�씠�룞�븷 �럹�씠吏� 寃쎈줈(�쉶�썝媛��엯 �럹�씠吏�) 二쇱냼媛� ���옣
			forward.setPath("./Main.jsp?=member/join.jsp");
			
		//join.jsp�뿉�꽌...�쉶�썝媛��엯 泥섎━�슂泥��씠 �뱾�뼱 �솕�쓣�뻹...	
		}else if(command.equals("/MemberJoinAction.me")){
	
			//�쉶�썝媛��엯 泥섎━瑜� �쐞�븳 Action媛앹껜 �깮�꽦
			action=new MemberJoinAction();
			
			try {
				forward=action.execute(request, response);
						
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		//top.jsp�뿉�꽌 ..login留곹겕瑜� �겢由��븯�뿬 濡쒓렇�씤�솕硫댁쑝濡� �씠�룞�븯�씪 �씪�뒗 �슂泥��씠 �뱾�뼱 �솕�쓣�븣...	
		//�삉�뒗 �쉶�썝媛��엯�썑!.. 濡쒓렇�씤�솕硫댁쑝濡� �씠�룞�븯�씪 �씪�뒗 �슂泥��씠 �뱾�뼱 �솕�쓣�뻹...
		}else if(command.equals("/MemberLogin.me")){ 
			//�럹�씠吏� �씠�룞 諛⑹떇 �뿬遺� 媛�,�씠�룞�럹�씠吏� 寃쎈줈 媛� ���옣 �븯�뿬 由ы꽩 �빐二쇰뒗 媛앹껜 �깮�꽦 
			forward=new ActionForward();
			//�럹�씠吏� �씠�룞 諛⑹떇 �뿬遺� 媛� false濡� ���옣-> RequestDispatcher  forward() 諛⑹떇
			forward.setRedirect(false); //二쇱냼媛� �끂異� �븞�맖
			//�씠�룞�븷 �럹�씠吏� 寃쎈줈(濡쒓렇�씤 �럹�씠吏�) 二쇱냼媛� ���옣
			forward.setPath("./CarMain.jsp?center=member/login.jsp"); 
		
		//login.jsp�뿉�꽌... "Sign in"踰꾪듉�쓣 �닃���쓣�븣..濡쒓렇�씤 泥섎━ �슂泥�諛쏄린!
		//�궗�슜�옄媛� �엯�젰�븳 id�� �뙣�뒪�썙�뱶瑜� request�쁺�뿭�뿉 �떞�븘�삤湲�
		}else if(command.equals("/MemberLoginAction.me")){
			
			//濡쒓렇�씤 泥섎━瑜� �쐞�븳 Action媛앹껜 �깮�꽦 
			action=new MemberLoginAction();
			
			try {
				forward=action.execute(request, response);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}else if(command.equals("/MemberLogout.me")){
			
			//濡쒓렇�븘�썐 泥섎━瑜� �쐞�븳 Action媛앹껜 �깮�꽦  
			action=new MemberLogoutAction();
			try {
				//top.jsp�뿉�꽌  濡쒓렇�븘�썐 �슂泥��씠 �뱾�뼱�솕�쓣�븣...  
				//�꽭�뀡媛� 珥덇린�솕�썑~ 濡쒓렇�븘�썐 硫붿꽭吏�李쎌쓣 �쓣�뼱二쇨퀬...
				//CarList.jsp�럹�씠吏�濡� �씠�룞�븯�뒗�씪�쓣 �븯�뒗 execute()硫붿냼�뱶 �샇異쒗븿.
				forward=action.execute(request, response); //return null;

			} catch (Exception e) {
				e.printStackTrace();
			}
		}	//"CarMain.jsp 硫붿씤 �럹�씠吏� �슂泥�"�씠 �뱾�뼱 �솕�쓣�뻹...
		else if(command.equals("/Main.me")){
			//�럹�씠吏� �씠�룞 諛⑹떇 �뿬遺� 媛�,�씠�룞�럹�씠吏� 寃쎈줈 媛� ���옣 �븯�뿬 由ы꽩 �빐二쇰뒗 媛앹껜 �깮�꽦
			forward=new ActionForward();
			forward.setRedirect(false); //二쇱냼媛� �끂異� x
			forward.setPath("./CarMain.jsp"); //�씠�룞�븷 �럹�씠吏� ���옣
		}
		
		//二쇱냼 �씠�룞
		if(forward!=null){ //new ActionForward()媛앹껜媛� 議댁옱 �븯怨�..
			if(forward.isRedirect()){//true -> sendRedirect() 諛⑹떇�씪�뻹..
				//由щ떎�씠�젆�듃 諛⑹떇�쑝濡� �럹�씠吏� �씠�룞!  �럹�씠吏� 二쇱냼 寃쎈줈 �끂異� �븿 
				//join.jsp�솕硫� �씠�룞
				//login.jsp�솕硫� �씠�룞
				//CarMain.jsp�솕硫� �씠�룞�떆 session�쁺�뿭 �쟾�떖
				response.sendRedirect(forward.getPath());
				
			}else{//false -> forward() 諛⑹떇�씪�븣...
				
				RequestDispatcher dispatcher=request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
		}//if 
		
	}//	doProcess 硫붿냼�뱶 �걹
	
}//�꽌釉붾┸ �걹



