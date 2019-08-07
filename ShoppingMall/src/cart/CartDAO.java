package cart;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class CartDAO {
	
	//재료 준비
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	DataSource ds;
	String sql = "";
	
	//DB연결 메소드
	private Connection getConnection() throws Exception {
		Context ctx = new InitialContext();
		ds = (DataSource)ctx.lookup("java:comp/env/jdbc/shoppingmall");
		return ds.getConnection();
	}
		
	//DB종료 메소드
	private void CloseDB() {
		try {
			if(con != null) con.close();
			if(pstmt != null) pstmt.close();
			if(rs != null) rs.close();
		} catch(Exception e) {
			System.out.println("CloseDB()메서드에서 에러 : " + e);
		}
	}
	
	
	
	
	
	
}
