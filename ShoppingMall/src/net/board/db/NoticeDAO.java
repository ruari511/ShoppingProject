package net.board.db;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import net.buyList.db.BuyListDTO;


public class NoticeDAO {

	DataSource ds;
	
	private Connection getConnection() throws Exception {
		Context ctx = new InitialContext();
		ds = (DataSource)ctx.lookup("java:comp/env/jdbc/shoppingmall");
		return ds.getConnection();
	}
	
	public void insertNotice(BoardDTO boarddto){
		Connection con=null;
		PreparedStatement pstmt=null;
		String sql="";
		ResultSet rs=null;
		int num=0;
		int category_num = 0;
		try {
			con=getConnection();
			// faq 최대번호
			sql="select max(num) from notice";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()){
				num=rs.getInt(1)+1; // 글번호의 최대큰번호 + 1
			}
			//카테코리별 카테고리 최대번호
			sql="select max(category_num) from notice where category=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, boarddto.getCategory());
			rs=pstmt.executeQuery();
			if(rs.next()){
				category_num=rs.getInt(1)+1; //카테고리번호의 최대큰번호 +1
			}
			
			sql="insert into notice(num, category, category_num, subject, content, reg_date) values(?, ?, ?, ?, ?, now())";
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
	}
	
	/* 전체 게시글 수 조회 */
	public int getNoticeCount(){
		Connection con=null;
		PreparedStatement pstmt=null;
		String sql="";
		ResultSet rs=null;
		int count=0;
		try {
			con=getConnection();
			sql="select count(*) from notice";
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
	public int getNoticeCount(String category){
		Connection con=null;
		PreparedStatement pstmt=null;
		String sql="";
		ResultSet rs=null;
		int count=0;
		try {
			con=getConnection();
			sql="select count(*) from notice where category=?";
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
	
	/* Faq 전체 페이지 번호 */
	public List<BoardDTO> getNoticeList(int startRow,int pageSize){
		Connection con=null;
		PreparedStatement pstmt=null;
		String sql="";
		ResultSet rs=null;
		List<BoardDTO> noticeList=new ArrayList<>();
		try{
			con=getConnection();
			
			sql="select * from notice order by num asc limit ?,?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, startRow-1);
			pstmt.setInt(2, pageSize);

			rs=pstmt.executeQuery();

			while(rs.next()){
				BoardDTO boarddto=new BoardDTO();
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				boarddto.setNum(rs.getInt("num"));
				boarddto.setCategory(rs.getString("category"));
				boarddto.setCategory_num(rs.getInt("category_num"));
				boarddto.setSubject(rs.getString("subject"));
				boarddto.setContent(rs.getString("content"));
				boarddto.setReg_date(rs.getTimestamp("reg_date"));
				noticeList.add(boarddto);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			if(pstmt!=null){ try{pstmt.close();} catch(Exception e){e.printStackTrace();}}
			if(con!=null){ try{con.close();} catch(Exception e){e.printStackTrace();}}
			if(rs!=null){ try{rs.close();} catch(Exception e){e.printStackTrace();}}
		}
		return noticeList;
	}
	
	
	/* 카테고리별 페이지 번호*/
	public List<BoardDTO> getNoticeList(String category, int startRow,int pageSize){
		Connection con=null;
		PreparedStatement pstmt=null;
		String sql="";
		ResultSet rs=null;
		List<BoardDTO> noticeList=new ArrayList<>();
		try{
			con=getConnection();
			
			sql="select * from notice where category=? order by category_num asc limit ?,?";
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
				boarddto.setReg_date(rs.getTimestamp("reg_date"));
				noticeList.add(boarddto);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			if(pstmt!=null){ try{pstmt.close();} catch(Exception e){e.printStackTrace();}}
			if(con!=null){ try{con.close();} catch(Exception e){e.printStackTrace();}}
			if(rs!=null){ try{rs.close();} catch(Exception e){e.printStackTrace();}}
		}
		return noticeList;
	}
	
	public BoardDTO getNoticeDetail(int num){
		Connection con=null;
		PreparedStatement pstmt=null;
		String sql="";
		ResultSet rs=null;
		BoardDTO notice = null;
		try{
			con=getConnection();
			sql="select * from notice where num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs=pstmt.executeQuery();
			if(rs.next()){
				notice = new BoardDTO();
				notice.setNum(rs.getInt("num"));
				notice.setCategory(rs.getString("category"));
				notice.setCategory_num(rs.getInt("category_num"));
				notice.setSubject(rs.getString("subject"));
				notice.setContent(rs.getString("content"));
				notice.setReg_date(rs.getTimestamp("reg_date"));
			}
		}catch (Exception e) {
		}finally {
			if(pstmt!=null){ try{pstmt.close();} catch(Exception e){e.printStackTrace();}}
			if(con!=null){ try{con.close();} catch(Exception e){e.printStackTrace();}}
			if(rs!=null){ try{rs.close();} catch(Exception e){e.printStackTrace();}}
		}
		return notice;
	}
	
	public void updateBoard(BoardDTO boarddto){
		Connection con=null;
		PreparedStatement pstmt=null;
		String sql="";
		try {
			con=getConnection();
			sql="update notice set category=?, subject=?, content=? where num =?";
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
			sql = "delete from notice where num=?";
			
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