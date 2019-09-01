package net.review.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ReviewLikeDAO {
	
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	DataSource ds;
	String sql = "";
	
	//DB연결 메소드
	public Connection getConnection() throws Exception {
		   con=null;
		   Context init=new InitialContext();
		   ds=(DataSource)init.lookup("java:comp/env/jdbc/shoppingmall");
		   con=ds.getConnection();
		   return con;
		      
	}
	
	 
	public int like(String review_num, String id){

		con=null;
	    sql="";
	    pstmt=null;
	    rs=null;
		
	    try {
	    	
	    	con = getConnection();
	    	
	    	sql = "INSERT INTO review_like VALUES(?,?)";
	    	
	    	pstmt = con.prepareStatement(sql);
	    	
	    	pstmt.setString(1, review_num);
	    	pstmt.setString(2, id);
	    	
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
	
}
