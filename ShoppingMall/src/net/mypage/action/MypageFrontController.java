package net.mypage.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.action.Action;
import net.action.ActionForward;
import net.coupon.action.CouponMypageAction;
import net.member.action.MemberJoinAction;


public class MypageFrontController extends HttpServlet{

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
      String RequestURI=request.getRequestURI();
      String contextPath=request.getContextPath();
      String command=RequestURI.substring(contextPath.length());
      /*二쇱냼 鍮꾧탳*/   
      //�럹�씠吏� �씠�룞 諛⑹떇 �뿬遺� 媛�,�씠�룞�럹�씠吏� 寃쎈줈 媛� ���옣 �븯�뿬 由ы꽩 �빐二쇰뒗 媛앹껜瑜� ���옣�븷 李몄“蹂��닔 �꽑�뼵 
      ActionForward forward=null;
   
      //�옄�떇 Action 媛앹껜�뱾�쓣 �떞�쓣 �씤�꽣�럹�씠�뒪 ���엯�쓽 李몄“蹂��닔 �꽑�뼵
      Action action=null;
      
      // 留덉씠�럹�씠吏� 硫붿씤
      if(command.equals("/mypage.mp")){
    	  action = new MypageBuyListAction();
			try{
				forward = action.execute(request, response);
			}catch (Exception e) {
				e.printStackTrace();
			}
      // 留덉씠�럹�씠吏� 二쇰Ц�긽�꽭由ъ뒪�듃
      }else if(command.equals("/mypage_BuyListDetail.mp")){
    	  action = new MypageBuyListDetailAction();
			try{
				forward = action.execute(request, response);
			}catch (Exception e) {
				e.printStackTrace();
			}
      }else if(command.equals("/mypage_BuyCancelA.mp")){
    	  action = new MypageBuyCancelListAction();
			try{
				forward = action.execute(request, response);
			}catch (Exception e) {
				e.printStackTrace();
			}
      }else if(command.equals("/mypage_BuyCancelB.mp")){
    	  action = new MypageBuyCancelUpdateAction();
			try{
				forward = action.execute(request, response);
			}catch (Exception e) {
				e.printStackTrace();
			}
      }else if(command.equals("/mypage_CancelList.mp")){
      
         action = new MypageCancelListAction();
			try{
				forward = action.execute(request, response);
			}catch (Exception e) {
				e.printStackTrace();
			}
      // 留덉씠�럹�씠吏� 二쇰Ц痍⑥냼由ъ뒪�듃
      }else if(command.equals("/Cart.jsp")){
      
         //�럹�씠吏� �씠�룞 諛⑹떇 �뿬遺� 媛�,�씠�룞�럹�씠吏� 寃쎈줈 媛� ���옣 �븯�뿬 由ы꽩 �빐二쇰뒗 媛앹껜 �깮�꽦 
         forward=new ActionForward();
         //�럹�씠吏� �씠�룞 諛⑹떇 �뿬遺� 媛� false濡� ���옣-> RequestDispatcher  forward() 諛⑹떇
         forward.setRedirect(false);
         //�씠�룞�븷 �럹�씠吏� 寃쎈줈(�쉶�썝媛��엯 �럹�씠吏�) 二쇱냼媛� ���옣
         forward.setPath("./Main.jsp?section=./Cart.jsp");
      
      // 留덉씠�럹�씠吏� �룷�씤�듃
      }else if(command.equals("/mypage_PointInfo.mp")){
      
         //�럹�씠吏� �씠�룞 諛⑹떇 �뿬遺� 媛�,�씠�룞�럹�씠吏� 寃쎈줈 媛� ���옣 �븯�뿬 由ы꽩 �빐二쇰뒗 媛앹껜 �깮�꽦 
         forward=new ActionForward();
         //�럹�씠吏� �씠�룞 諛⑹떇 �뿬遺� 媛� false濡� ���옣-> RequestDispatcher  forward() 諛⑹떇
         forward.setRedirect(false);
         //�씠�룞�븷 �럹�씠吏� 寃쎈줈(�쉶�썝媛��엯 �럹�씠吏�) 二쇱냼媛� ���옣
         forward.setPath("./Main.jsp?section=./myPage/mypage_PointInfo.jsp");
      
      // 留덉씠�럹�씠吏� �긽�뭹�룊
      }else if(command.equals("/mypage_coupon.mp")){
      		//�럹�씠吏� �씠�룞 諛⑹떇 �뿬遺� 媛�,�씠�룞�럹�씠吏� 寃쎈줈 媛� ���옣 �븯�뿬 由ы꽩 �빐二쇰뒗 媛앹껜 �깮�꽦 
		action = new CouponMypageAction();
			
		try {
			forward = action.execute(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
      
      // 留덉씠�럹�씠吏� �긽�뭹�룊
      }else if(command.equals("/mypage_Review.mp")){
      
         //�럹�씠吏� �씠�룞 諛⑹떇 �뿬遺� 媛�,�씠�룞�럹�씠吏� 寃쎈줈 媛� ���옣 �븯�뿬 由ы꽩 �빐二쇰뒗 媛앹껜 �깮�꽦 
         forward=new ActionForward();
         //�럹�씠吏� �씠�룞 諛⑹떇 �뿬遺� 媛� false濡� ���옣-> RequestDispatcher  forward() 諛⑹떇
         forward.setRedirect(false);
         //�씠�룞�븷 �럹�씠吏� 寃쎈줈(�쉶�썝媛��엯 �럹�씠吏�) 二쇱냼媛� ���옣
         forward.setPath("./Main.jsp?section=./myPage/mypage_Review.jsp");
      
      // 留덉씠�럹�씠吏� �긽�뭹Q&A   
      }else if(command.equals("/mypage_GoodsQnaList.mp")){
      
         //�럹�씠吏� �씠�룞 諛⑹떇 �뿬遺� 媛�,�씠�룞�럹�씠吏� 寃쎈줈 媛� ���옣 �븯�뿬 由ы꽩 �빐二쇰뒗 媛앹껜 �깮�꽦 
         forward=new ActionForward();
         //�럹�씠吏� �씠�룞 諛⑹떇 �뿬遺� 媛� false濡� ���옣-> RequestDispatcher  forward() 諛⑹떇
         forward.setRedirect(false);
         //�씠�룞�븷 �럹�씠吏� 寃쎈줈(�쉶�썝媛��엯 �럹�씠吏�) 二쇱냼媛� ���옣
         forward.setPath("./Main.jsp?section=./myPage/mypage_GoodsQnaList.jsp");
      
      // 留덉씠�럹�씠吏� �쉶�썝�젙蹂� �닔�젙   
      }else if(command.equals("/MemberInfoModify.jsp")){
      
         //�럹�씠吏� �씠�룞 諛⑹떇 �뿬遺� 媛�,�씠�룞�럹�씠吏� 寃쎈줈 媛� ���옣 �븯�뿬 由ы꽩 �빐二쇰뒗 媛앹껜 �깮�꽦 
         forward=new ActionForward();
         //�럹�씠吏� �씠�룞 諛⑹떇 �뿬遺� 媛� false濡� ���옣-> RequestDispatcher  forward() 諛⑹떇
         forward.setRedirect(false);
         //�씠�룞�븷 �럹�씠吏� 寃쎈줈(�쉶�썝媛��엯 �럹�씠吏�) 二쇱냼媛� ���옣
         forward.setPath("./Main.jsp?section=./member/MemberInfoModify.jsp");
      
      // 留덉씠�럹�씠吏� �쉶�썝�깉�눜   
      }else if(command.equals("/MemberOut.jsp")){
      
         //�럹�씠吏� �씠�룞 諛⑹떇 �뿬遺� 媛�,�씠�룞�럹�씠吏� 寃쎈줈 媛� ���옣 �븯�뿬 由ы꽩 �빐二쇰뒗 媛앹껜 �깮�꽦 
         forward=new ActionForward();
         //�럹�씠吏� �씠�룞 諛⑹떇 �뿬遺� 媛� false濡� ���옣-> RequestDispatcher  forward() 諛⑹떇
         forward.setRedirect(false);
         //�씠�룞�븷 �럹�씠吏� 寃쎈줈(�쉶�썝媛��엯 �럹�씠吏�) 二쇱냼媛� ���옣
         forward.setPath("./Main.jsp?section=./member/MemberOut.jsp");
         
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
      
   }//   doProcess 硫붿냼�뱶 �걹
   
}//�꽌釉붾┸ �걹


