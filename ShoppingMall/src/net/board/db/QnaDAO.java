package net.board.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class QnaDAO {

	DataSource ds;
	
	private Connection getConnection() throws Exception {
		Context ctx = new InitialContext();
		ds = (DataSource)ctx.lookup("java:comp/env/jdbc/shoppingmall");
		return ds.getConnection();
	}
	/* Qna 글쓰기 (전체번호, 카테고리별 번호 부여)*/	
	public void insertQna(BoardDTO boarddto){
		Connection con=null;
		PreparedStatement pstmt=null;
		String sql="";
		ResultSet rs=null;
		int num=0;
		int category_num = 0;
		try {
			con=getConnection();
			// Qna 최대번호
			sql="select max(num) from qna";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()){
				num=rs.getInt(1)+1; // 글번호의 최대큰번호 + 1
			}
			//카테코리별 카테고리 최대번호
			sql="select max(category_num) from Qna where category=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, boarddto.getCategory());
			rs=pstmt.executeQuery();
			if(rs.next()){
				category_num=rs.getInt(1)+1; //카테고리번호의 최대큰번호 +1
			}
			
			sql="insert into qna(num, id, category, category_num, product_num, subject, content, re_result, reg_date)"
					  + " values(?, ?, ?, ?, ?, ?, ?, 0, now())";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num); 
			pstmt.setString(2, boarddto.getId());
			pstmt.setString(3, boarddto.getCategory());
			pstmt.setInt(4, category_num);
			pstmt.setInt(5, boarddto.getProduct_num());
			pstmt.setString(6, boarddto.getSubject());
			pstmt.setString(7, boarddto.getContent());
			
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(pstmt!=null){ try{pstmt.close();} catch(Exception e){e.printStackTrace();}}
			if(con!=null){ try{con.close();} catch(Exception e){e.printStackTrace();}}
			if(rs!=null){ try{rs.close();} catch(Exception e){e.printStackTrace();}}
		}
	}// insertQna()
	
	/* 전체 게시글 수 조회 */
	public int getQnaCount(){
		Connection con=null;
		PreparedStatement pstmt=null;
		String sql="";
		ResultSet rs=null;
		int count=0;
		try {
			con=getConnection();
			sql="select count(*) from qna";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()){
				count=rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(pstmt!=null){ try{pstmt.close();} catch(Exception e){e.printStackTrace();}}
			if(con!=null){ try{con.close();} catch(Exception e){e.printStackTrace();}}
			if(rs!=null){ try{rs.close();} catch(Exception e){e.printStackTrace();}}
		}
		return count;
	}
	
	/* id별 게시글 수 조회*/
	public int getQnaCount(String id){
		Connection con=null;
		PreparedStatement pstmt=null;
		String sql="";
		ResultSet rs=null;
		int count=0;
		try {
			con=getConnection();
			if(id.equals("admin")){
				sql="select count(*) from qna"; 
				pstmt=con.prepareStatement(sql);
			}else{
				sql="select count(*) from qna where id=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, id);
			}
			rs=pstmt.executeQuery();
			if(rs.next()){
				count=rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(pstmt!=null){ try{pstmt.close();} catch(Exception e){e.printStackTrace();}}
			if(con!=null){ try{con.close();} catch(Exception e){e.printStackTrace();}}
			if(rs!=null){ try{rs.close();} catch(Exception e){e.printStackTrace();}}
		}
		return count;
	}
	
	
	
	/* Qna 전체 페이지 번호 */
	public List<BoardDTO> getQnaList(int startRow,int pageSize){
		Connection con=null;
		PreparedStatement pstmt=null;
		String sql="";
		ResultSet rs=null;
		List<BoardDTO> qnaList=new ArrayList<>();
		try{
			con=getConnection();
			
			sql="select * from qna order by category_num asc limit ?,?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, startRow-1);
			pstmt.setInt(2, pageSize);

			rs=pstmt.executeQuery();

			while(rs.next()){
				BoardDTO boarddto=new BoardDTO();

				boarddto.setNum(rs.getInt("num"));
				boarddto.setId(rs.getString("id"));
				boarddto.setCategory(rs.getString("category"));
				boarddto.setCategory_num(rs.getInt("category_num"));
				boarddto.setSubject(rs.getString("subject"));
				boarddto.setContent(rs.getString("content"));
				boarddto.setRe_result(rs.getString("re_result"));
				boarddto.setReply(rs.getString("reply"));
				qnaList.add(boarddto);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			if(pstmt!=null){ try{pstmt.close();} catch(Exception e){e.printStackTrace();}}
			if(con!=null){ try{con.close();} catch(Exception e){e.printStackTrace();}}
			if(rs!=null){ try{rs.close();} catch(Exception e){e.printStackTrace();}}
		}
		return qnaList;
	}
	
	
	/* id별 페이지 번호*/
	public List<BoardDTO> getQnaList(String id, int startRow,int pageSize){
		Connection con=null;
		PreparedStatement pstmt=null;
		String sql="";
		ResultSet rs=null;
		List<BoardDTO> qnaList=new ArrayList<>();
		try{
			con=getConnection();
			if(id.equals("admin")){
				sql="select * from qna natural join product order by num asc limit ?,?";
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, startRow-1);
				pstmt.setInt(2, pageSize);
			}else{
				sql="select * from qna natural join product where id=? order by num asc limit ?,?";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, id);
				pstmt.setInt(2, startRow-1);
				pstmt.setInt(3, pageSize);
			}
			rs=pstmt.executeQuery();

			while(rs.next()){
				BoardDTO boarddto=new BoardDTO();

				boarddto.setNum(rs.getInt("num"));
				boarddto.setId(rs.getString("id"));
				boarddto.setCategory(rs.getString("category"));
				boarddto.setCategory_num(rs.getInt("category_num"));
				boarddto.setProduct_num(rs.getInt("product_num"));
				boarddto.setProduct_name(rs.getString("product_name"));
				boarddto.setSubject(rs.getString("subject"));
				boarddto.setContent(rs.getString("content"));
				boarddto.setRe_result(rs.getString("re_result"));
				boarddto.setReply(rs.getString("reply_id"));
				boarddto.setReply(rs.getString("reply"));
				boarddto.setReg_date(rs.getTimestamp("reg_date"));
				boarddto.setRe_reg_date(rs.getTimestamp("re_reg_date"));
				
				qnaList.add(boarddto);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			if(pstmt!=null){ try{pstmt.close();} catch(Exception e){e.printStackTrace();}}
			if(con!=null){ try{con.close();} catch(Exception e){e.printStackTrace();}}
			if(rs!=null){ try{rs.close();} catch(Exception e){e.printStackTrace();}}
		}
		return qnaList;
	}

}
