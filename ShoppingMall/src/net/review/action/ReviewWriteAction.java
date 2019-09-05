package net.review.action;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import net.action.ActionForward;
import net.review.db.*;

@WebServlet("/review_write")
public class ReviewWriteAction extends HttpServlet {
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
			}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("review_write 서블릿 요청");
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8;");
	
		//파라미터 추출
		HttpSession session = request.getSession();
		
		String id = (String) session.getAttribute("id");
		
		// 1. 현재 실행중인 웹프로젝트에 대한 정보를 지니고 있는 컨텍스트 객체 얻기
		ServletContext ctx = getServletContext();
					
		// 2. 파일이 업로드될 실제 서버측의 경로 얻기
		// -실제 업로드되는 경로
		String realPath = ctx.getRealPath("./asset/image/review");
					
		
		
		int review_star = 0;
		
		// 3.업로드 할수 있는 파일의 최대 크기 지정 5MB
		int max = 1024 * 1024 * 5;
		
		
		try{
			// 4. 실제 MultipartRequest객체를 이용하여 파일을 업로드를 함
			// 전달값 1. <form>태그에서 요청한 request객체를 생성자로 전달~
			// 전달값2. 실제 업로드될 경로 위치
			// 전달값3. 업로드 할수 있는 최대 사이즈
			// 전달값4. 만약 파일이름이 한글일 경우 문제가 생기므로 처리할수 있게 인코딩 타입을 지정
			// 전달값5. 중복된 파일이 존재한다면 자동으로 파일이름을 변환해주는 객체 전달
			com.oreilly.servlet.MultipartRequest multi = new MultipartRequest(request,realPath,max,"utf-8",new DefaultFileRenamePolicy());
			
			String product_num = multi.getParameter("product_num");
			String review_title = multi.getParameter("review_title");
			String review_content = multi.getParameter("review_content");
			review_star = Integer.parseInt(multi.getParameter("review_star"));
			String review_img = multi.getParameter("review_img");
			
			
		
			// 업로드한 파일 정보는 모두 MultipartRequest객체에 저장되어 있다.
			
			// 파일 업로드시 <form>태그 내부의 모든 <input>태그의 name속성값들을 
			// MultipartRequest객체에서 꺼내와서 Enumeration반복기 역할을 하는 객체에 담습니다.
			// 그리고 Enumeration반복기 객체 자체를 반환
			
			ArrayList saveFiles = new ArrayList();
			
			
			Enumeration e = multi.getFileNames();
			
			while(e.hasMoreElements()){ // 업로드한 파일이 존재한다면
				
				String file = (String)e.nextElement();
				saveFiles.add(multi.getFilesystemName(file));
				
				System.out.println("saveFiles: " + saveFiles);
				
			}
			
			
			// 빈 객체에 데이터 set
			ReviewDTO dto = new ReviewDTO();
			
			dto.setId(id);
			dto.setReview_title(review_title);
			dto.setProduct_num(Integer.parseInt(product_num));
			dto.setReview_content(review_content);
			dto.setReview_star(review_star);
			dto.setReview_img((String)saveFiles.get(0));
		
		
			//DB에 저장
			review_DAO dao = new review_DAO();
			dao.review_write(dto);
			
			
			PrintWriter out = response.getWriter();
			
			out.write("<script>");
			out.write("location.href='ProductDetailAction.pro?product_num="+ product_num + "&review_select=review_In';");
			out.write("</script>");
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}