package net.review.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.review.db.*;

/**
 * Servlet implementation class review_read
 */
@WebServlet("/review_read")
public class review_read extends HttpServlet {
       
    public review_read() {
        super();
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("review_read.credu 요청");
	
		
		//파라미터 한글처리
		request.setCharacterEncoding("utf-8");
		
		review_DAO dao = new review_DAO();
		
		//파라미터값 추출
		int review_num = Integer.parseInt(request.getParameter("review_num"));
		
		System.out.println("리뷰 리드 = review_num" + review_num);
		
		//조회수1증가 시키시 위한 메소드 호출
		dao.updateReview_cnt(review_num); 
		
		
		// 해당 리뷰글 정보 불러오기.
		try {
			
			
			ReviewDTO dto = dao.review_read(review_num);
		
			// System.out.println(bean.getReview_num());
			
			// 어떤 형태로 데이터를 받는지 정의해줘야함.
			response.setContentType("text/plain; charset=utf-8");
			
			// 응답 결과를 출력할 스트림 생성
			PrintWriter pw = response.getWriter();
			pw.print(dto.getReview_content());
			
					
		
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
