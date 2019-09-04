package net.review.db;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import net.product.db.ProductDTO;

public class review_DAO {

	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	DataSource ds;
	String sql = "";
	
	//DB연결 메소드
	private Connection getConnection() throws Exception {
	     con=null;
	     Context init=new InitialContext();
	     ds=(DataSource)init.lookup("java:comp/env/jdbc/shoppingmall");
	     con=ds.getConnection();
	     return con;
	      
	   }
	
	// 빈객체를 매개변수로 받는다.
	// 리뷰작성
	public void review_write(ReviewDTO dto) {

		con = null;
        sql = "";
        pstmt = null;
		
		try {

			con = getConnection();
			
			// SQL 문
			String sql = "INSERT INTO reviewboard(id, product_num, review_title, review_content, like_count, review_star, review_regdate)"
					+ " VALUES(?, ?, ?, ?, 0, ?, now())";

			pstmt=con.prepareStatement(sql);

			pstmt.setString(1, dto.getId());
			pstmt.setInt(2, dto.getProduct_num());
			pstmt.setString(3, dto.getReview_title());
			pstmt.setString(4, dto.getReview_content());
			pstmt.setInt(5, dto.getReview_star());

			// SQL 실행
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
			
		}finally{
	         // 자원해제
	         if(rs!=null)try{rs.close();}catch(SQLException ex){}
	         if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
	         if(con!=null)try{con.close();}catch(SQLException ex){}
	      }
	} // review_write()


	
	// 모든 리뷰글들을 불러온다.
	public ArrayList<ReviewDTO> review_get(int start, int size, int product_num) {

		con=null;
	    sql="";
	    pstmt=null;
	    rs=null;
	    
		// Arraylist 생성
		// 빈객체를 담을 arraylist
		ArrayList<ReviewDTO> list = new ArrayList<ReviewDTO>();

		try {

		
			// DB연결
			con=getConnection();

			// SQL
			// 리뷰게시판에 모든 데이터를 불러온다.
			sql = "select * from (select review_num as rnum, a1.* "
					+ "from (select review_num, id, product_num, review_title, review_content, like_count, review_star, review_regdate FROM reviewboard) a1) a2 "
					+ "where product_num = ? ORDER BY review_num DESC limit ? , ? ";
			
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, product_num);
			pstmt.setInt(2, start);
			pstmt.setInt(3, size);

			// SQL 실행
			rs=pstmt.executeQuery();

			// rs.next() 값이 있으면 투루를 반환.
			while (rs.next()) {

				int review_num = rs.getInt("REVIEW_NUM"); // 글 번호
				String id = rs.getString("ID"); // 작성자 ID
				String review_title = rs.getString("REVIEW_TITLE"); // 리뷰 제목
				String review_content = rs.getString("REVIEW_CONTENT"); // 리뷰 내용
				int review_star = rs.getInt("REVIEW_STAR"); // 별점
				Date review_regdate = rs.getDate("REVIEW_REGDATE"); // 리뷰 작성일

				// 빈객체 생성
				ReviewDTO dto = new ReviewDTO();

				dto.setReview_num(review_num);
				dto.setId(id);
				dto.setProduct_num(product_num);
				dto.setReview_title(review_title);
				dto.setReview_content(review_content);
				dto.setLike_count(rs.getInt("like_count"));
				dto.setReview_star(review_star);
				dto.setReview_regdate(review_regdate);

				list.add(dto);
			}

		} catch (Exception e) {
			e.printStackTrace();
			
		}finally{
	         //마무리
	         if(rs!=null)try{rs.close();}catch(SQLException ex){}
	         if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
	         if(con!=null)try{con.close();}catch(SQLException ex){}
	      }

		return list;

	}
	
	
	
	public ArrayList<ReviewDTO> review_get(int start, int size, int product_num, String order) {

		con=null;
	    sql="";
	    pstmt=null;
	    rs=null;
	    
		// Arraylist 생성
		// 빈객체를 담을 arraylist
		ArrayList<ReviewDTO> list = new ArrayList<ReviewDTO>();

		try {

		
			// DB연결
			con=getConnection();

			// SQL
			// 리뷰게시판에 모든 데이터를 불러온다.
			sql = "select * from (select review_num as rnum, a1.* "
					+ "from (select review_num, id, product_num, review_title, review_content, like_count, review_star, review_regdate FROM reviewboard) a1) a2 "
					+ "where product_num = ?"
					+ order + " limit ? , ? ";
					
			
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, product_num);
			pstmt.setInt(2, start);
			pstmt.setInt(3, size);

			// SQL 실행
			rs=pstmt.executeQuery();

			// rs.next() 값이 있으면 투루를 반환.
			while (rs.next()) {

				int review_num = rs.getInt("REVIEW_NUM"); // 글 번호
				String id = rs.getString("ID"); // 작성자 ID
				String review_title = rs.getString("REVIEW_TITLE"); // 리뷰 제목
				String review_content = rs.getString("REVIEW_CONTENT"); // 리뷰 내용
				int review_star = rs.getInt("REVIEW_STAR"); // 별점
				Date review_regdate = rs.getDate("REVIEW_REGDATE"); // 리뷰 작성일

				// 빈객체 생성
				ReviewDTO dto = new ReviewDTO();

				dto.setReview_num(review_num);
				dto.setId(id);
				dto.setProduct_num(product_num);
				dto.setReview_title(review_title);
				dto.setReview_content(review_content);
				dto.setLike_count(rs.getInt("like_count"));
				dto.setReview_star(review_star);
				dto.setReview_regdate(review_regdate);

				list.add(dto);
			}

		} catch (Exception e) {
			e.printStackTrace();
			
		}finally{
	         //마무리
	         if(rs!=null)try{rs.close();}catch(SQLException ex){}
	         if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
	         if(con!=null)try{con.close();}catch(SQLException ex){}
	      }

		return list;

	}
	
	
	
	
	public int rlike(String review_num){

		con=null;
	    sql="";
	    pstmt=null;
	    rs=null;
	    
	    try {
	    	
	    	con = getConnection();
	    	
	    	sql = "UPDATE reviewboard SET like_count = like_count + 1 WHERE review_num = ?";

	    	pstmt = con.prepareStatement(sql);

	    	pstmt.setString(1, review_num);

	    	return pstmt.executeUpdate();
	    	
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			 if(rs!=null)try{rs.close();}catch(SQLException ex){}
	         if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
	         if(con!=null)try{con.close();}catch(SQLException ex){}
		}
	    return -1; // 데이터베이스 오류
	}

	
	
	public ArrayList<ReviewDTO> review_Allget(int product_num) {

		con=null;
	    sql="";
	    pstmt=null;
	    rs=null;
	    
		// Arraylist 생성
		// 빈객체를 담을 arraylist
		ArrayList<ReviewDTO> list = new ArrayList<ReviewDTO>();
		try {

		
			// DB연결
			con=getConnection();

			// SQL
			// 리뷰게시판에 모든 데이터를 불러온다.
			sql = "select * from (select review_num as rnum, a1.* "
					+ "from (select review_num, id, product_num, review_title, review_content, like_count, review_star, review_regdate, img FROM reviewboard where img is not null && img != '') a1) a2 "
					+ "where product_num = ? ORDER BY review_num DESC";
			
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, product_num);

			// SQL 실행
			rs=pstmt.executeQuery();

			// rs.next() 값이 있으면 투루를 반환.
			while (rs.next()) {

				int review_num = rs.getInt("REVIEW_NUM"); // 글 번호
				String id = rs.getString("ID"); // 작성자 ID
				String review_title = rs.getString("REVIEW_TITLE"); // 리뷰 제목
				String review_content = rs.getString("REVIEW_CONTENT"); // 리뷰 내용
				int review_star = rs.getInt("REVIEW_STAR"); // 별점
				Date review_regdate = rs.getDate("REVIEW_REGDATE"); // 리뷰 작성일
				
				// 빈객체 생성
				ReviewDTO dto = new ReviewDTO();

				dto.setReview_num(review_num);
				dto.setId(id);
				dto.setProduct_num(product_num);
				dto.setReview_title(review_title);
				dto.setReview_content(review_content);
				dto.setLike_count(rs.getInt("like_count"));
				dto.setReview_star(review_star);
				dto.setReview_regdate(review_regdate);
				dto.setReview_img(rs.getString("img"));
				
				list.add(dto);
			}

		} catch (Exception e) {
			e.printStackTrace();
			
		}finally{
	         //마무리
	         if(rs!=null)try{rs.close();}catch(SQLException ex){}
	         if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
	         if(con!=null)try{con.close();}catch(SQLException ex){}
	      }

		return list;

	}
	
	
	


	// 페이지 수를 구하는 메서드
	public int review_getPageCount(int product_num){

		con=null;
	    sql="";
	    pstmt=null;
	    rs=null;
	    int cnt = 0;
	    try {
	    	con=getConnection();
		    
			// 쿼리문
			sql = "select count(*) from reviewboard where product_num="+product_num;
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery(sql);
			
			if(rs.next()){
				// 전체 글의 개수를 가져온다.
				cnt = rs.getInt(1);
			}
			
		} catch (Exception e) {
			System.out.println("review_getPageCount() 메소드 내부의 오류 : " +  e);
		} finally {
			if(rs!=null)try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
			if(con!=null)try{con.close();}catch(SQLException ex){}
		}

		// 총 페이지 개수 리턴
		return cnt;

	}

	// 리뷰글을 읽어오는 메서드
	public ReviewDTO review_read(int num) throws Exception {
		con=null;
		sql="";
		
		// 빈객체 생성
		ReviewDTO dto = new ReviewDTO();

		// DB 연결
		con=getConnection();

		// SQL
		sql = "SELECT * FROM reviewboard WHERE REVIEW_NUM=" + num;

		Statement stmt = con.createStatement();

		ResultSet rs = stmt.executeQuery(sql);

		while (rs.next()) {

			int review_num = rs.getInt("REVIEW_NUM"); // 글 번호
			String id = rs.getString("ID"); // 작성자 ID
			int product_num = rs.getInt("PRODUCT_NUM"); // 상품명
			String review_title = rs.getString("REVIEW_TITLE"); // 리뷰 제목
			String review_content = rs.getString("REVIEW_CONTENT"); // 리뷰 내용
			int review_star = rs.getInt("REVIEW_STAR"); // 별점
																// 구매
			Date review_regdate = rs.getDate("REVIEW_REGDATE"); // 리뷰 작성일

			dto.setReview_num(review_num);
			dto.setId(id);
			dto.setProduct_num(product_num);
			dto.setReview_title(review_title);
			dto.setReview_content(review_content);
			dto.setReview_star(review_star);
			dto.setReview_regdate(review_regdate);

		}

		if(con!=null)try{con.close();}catch(SQLException ex){}

		return dto;

	}

	

}
