package net.board.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class FaqDAO {

	DataSource ds;
	
	private Connection getConnection() throws Exception {
		Context ctx = new InitialContext();
		ds = (DataSource)ctx.lookup("java:comp/env/jdbc/shoppingmall");
		return ds.getConnection();
	}
	/* Faq 글쓰기 (전체번호, 카테고리별 번호 부여)*/	
	public void insertFaq(BoardDTO boarddto){
		Connection con=null;
		PreparedStatement pstmt=null;
		String sql="";
		ResultSet rs=null;
		int num=0;
		int category_num = 0;
		try {
			con=getConnection();
			// faq 최대번호
			sql="select max(num) from faq";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()){
				num=rs.getInt(1)+1; // 글번호의 최대큰번호 + 1
			}
			//카테코리별 카테고리 최대번호
			sql="select max(category_num) from faq where category=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, boarddto.getCategory());
			rs=pstmt.executeQuery();
			if(rs.next()){
				category_num=rs.getInt(1)+1; //카테고리번호의 최대큰번호 +1
			}
			
			sql="insert into faq(num, category, category_num, subject, content) values(?, ?, ?,  ?, ?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num); //num
			pstmt.setString(2, boarddto.getCategory());
			pstmt.setInt(3, category_num);
			pstmt.setString(4, boarddto.getSubject());
			pstmt.setString(5, boarddto.getContent());
			
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
	public int getFaqCount(){
		Connection con=null;
		PreparedStatement pstmt=null;
		String sql="";
		ResultSet rs=null;
		int count=0;
		try {
			con=getConnection();
			sql="select count(*) from faq";
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
	
	/* 카테고리별 게시글 수 조회*/
	public int getFaqCount(String category){
		Connection con=null;
		PreparedStatement pstmt=null;
		String sql="";
		ResultSet rs=null;
		int count=0;
		try {
			con=getConnection();
			sql="select count(*) from faq where category=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, category);
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
	
	/* 검색한 게시글 수 전체 조회 */
	public int getFaqSearchCount(String search){
		Connection con=null;
		PreparedStatement pstmt=null;
		String sql="";
		ResultSet rs=null;
		int count=0;
		try {
			con=getConnection();
			sql="select count(*) from faq where subject like ? or content like ?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, "%"+search+"%");
			pstmt.setString(2, "%"+search+"%");
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
	
	/* 검색한 게시글 수 카테고리별 조회*/
	public int getFaqSearchCount(String category, String search){
		Connection con=null;
		PreparedStatement pstmt=null;
		String sql="";
		ResultSet rs=null;
		int count=0;
		try {
			con=getConnection();
			sql="select count(*) from faq where category=? and (subject like ? or content like ?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, category);
			pstmt.setString(2, "%"+search+"%");
			pstmt.setString(3, "%"+search+"%");
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
	
	/* Faq 전체 페이지 번호 */
	public List<BoardDTO> getFaqList(int startRow,int pageSize){
		Connection con=null;
		PreparedStatement pstmt=null;
		String sql="";
		ResultSet rs=null;
		List<BoardDTO> faqList=new ArrayList<>();
		try{
			con=getConnection();
			
			sql="select * from faq order by category_num asc limit ?,?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, startRow-1);
			pstmt.setInt(2, pageSize);

			rs=pstmt.executeQuery();

			while(rs.next()){
				BoardDTO boarddto=new BoardDTO();

				boarddto.setNum(rs.getInt("num"));
				boarddto.setCategory(rs.getString("category"));
				boarddto.setCategory_num(rs.getInt("category_num"));
				boarddto.setSubject(rs.getString("subject"));
				boarddto.setContent(rs.getString("content"));
				faqList.add(boarddto);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			if(pstmt!=null){ try{pstmt.close();} catch(Exception e){e.printStackTrace();}}
			if(con!=null){ try{con.close();} catch(Exception e){e.printStackTrace();}}
			if(rs!=null){ try{rs.close();} catch(Exception e){e.printStackTrace();}}
		}
		return faqList;
	}
	
	
	/* 카테고리별 페이지 번호*/
	public List<BoardDTO> getFaqList(String category, int startRow,int pageSize){
		Connection con=null;
		PreparedStatement pstmt=null;
		String sql="";
		ResultSet rs=null;
		List<BoardDTO> faqList=new ArrayList<>();
		try{
			con=getConnection();
			
			sql="select * from faq where category=? order by category_num asc limit ?,?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, category);
			pstmt.setInt(2, startRow-1);
			pstmt.setInt(3, pageSize);

			rs=pstmt.executeQuery();

			while(rs.next()){
				BoardDTO boarddto=new BoardDTO();

				boarddto.setNum(rs.getInt("num"));
				boarddto.setCategory(rs.getString("category"));
				boarddto.setCategory_num(rs.getInt("category_num"));
				boarddto.setSubject(rs.getString("subject"));
				boarddto.setContent(rs.getString("content"));
				faqList.add(boarddto);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			if(pstmt!=null){ try{pstmt.close();} catch(Exception e){e.printStackTrace();}}
			if(con!=null){ try{con.close();} catch(Exception e){e.printStackTrace();}}
			if(rs!=null){ try{rs.close();} catch(Exception e){e.printStackTrace();}}
		}
		return faqList;
	}
	
	/* Faq 전체 페이지 번호 */
	public List<BoardDTO> getFaqSearchList(int startRow,int pageSize, String search){
		Connection con=null;
		PreparedStatement pstmt=null;
		String sql="";
		ResultSet rs=null;
		List<BoardDTO> faqList=new ArrayList<>();
		try{
			con=getConnection();
			
			sql="select * from faq where subject like ? or content like ? order by category_num asc limit ?,?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, "%"+search+"%");
			pstmt.setString(2, "%"+search+"%");
			pstmt.setInt(3, startRow-1);
			pstmt.setInt(4, pageSize);

			rs=pstmt.executeQuery();

			while(rs.next()){
				BoardDTO boarddto=new BoardDTO();

				boarddto.setNum(rs.getInt("num"));
				boarddto.setCategory(rs.getString("category"));
				boarddto.setCategory_num(rs.getInt("category_num"));
				boarddto.setSubject(rs.getString("subject"));
				boarddto.setContent(rs.getString("content"));
				faqList.add(boarddto);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			if(pstmt!=null){ try{pstmt.close();} catch(Exception e){e.printStackTrace();}}
			if(con!=null){ try{con.close();} catch(Exception e){e.printStackTrace();}}
			if(rs!=null){ try{rs.close();} catch(Exception e){e.printStackTrace();}}
		}
		return faqList;
	}
	
	
	/* 카테고리별 페이지 번호*/
	public List<BoardDTO> getFaqSearchList(String category, String search, int startRow,int pageSize){
		Connection con=null;
		PreparedStatement pstmt=null;
		String sql="";
		ResultSet rs=null;
		List<BoardDTO> faqList=new ArrayList<>();
		try{
			con=getConnection();
			
			sql="select * from faq where category=? and (subject like ? or content like ?) order by category_num asc limit ?,?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, category);
			pstmt.setString(2, "%"+search+"%");
			pstmt.setString(3, "%"+search+"%");
			pstmt.setInt(4, startRow-1);
			pstmt.setInt(5, pageSize);

			rs=pstmt.executeQuery();

			while(rs.next()){
				BoardDTO boarddto=new BoardDTO();

				boarddto.setNum(rs.getInt("num"));
				boarddto.setCategory(rs.getString("category"));
				boarddto.setCategory_num(rs.getInt("category_num"));
				boarddto.setSubject(rs.getString("subject"));
				boarddto.setContent(rs.getString("content"));
				faqList.add(boarddto);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			if(pstmt!=null){ try{pstmt.close();} catch(Exception e){e.printStackTrace();}}
			if(con!=null){ try{con.close();} catch(Exception e){e.printStackTrace();}}
			if(rs!=null){ try{rs.close();} catch(Exception e){e.printStackTrace();}}
		}
		return faqList;
	}
	
	
	
	public BoardDTO getFaqDetail(int num){
		Connection con=null;
		PreparedStatement pstmt=null;
		String sql="";
		ResultSet rs=null;
		BoardDTO boarddto = null;
		try{
			con=getConnection();
			sql="select * from faq where num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs=pstmt.executeQuery();
			if(rs.next()){
				boarddto = new BoardDTO();
				boarddto.setNum(rs.getInt("num"));
				boarddto.setCategory(rs.getString("category"));
				boarddto.setCategory_num(rs.getInt("category_num"));
				boarddto.setSubject(rs.getString("subject"));
				boarddto.setContent(rs.getString("content"));
			}
		}catch (Exception e) {
		}finally {
			if(pstmt!=null){ try{pstmt.close();} catch(Exception e){e.printStackTrace();}}
			if(con!=null){ try{con.close();} catch(Exception e){e.printStackTrace();}}
			if(rs!=null){ try{rs.close();} catch(Exception e){e.printStackTrace();}}
		}
		return boarddto;
	}
	
	public void updateBoard(BoardDTO boarddto){
		Connection con=null;
		PreparedStatement pstmt=null;
		String sql="";
		try {
			con=getConnection();
			sql="update faq set category=?, subject=?, content=? where num =?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, boarddto.getCategory());
			pstmt.setString(2, boarddto.getSubject());
			pstmt.setString(3, boarddto.getContent());
			pstmt.setInt(4, boarddto.getNum());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(pstmt!=null){ try{pstmt.close();} catch(Exception e){e.printStackTrace();}}
			if(con!=null){ try{con.close();} catch(Exception e){e.printStackTrace();}}
		}
	}
	
	public void deleteBoard(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "";
		try {
			con = getConnection();
			sql = "delete from faq where num=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
					
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt!=null){ try{pstmt.close();} catch(Exception e){e.printStackTrace();}}
			if(con!=null){ try{con.close();} catch(Exception e){e.printStackTrace();}}
		}
	}
	

}
