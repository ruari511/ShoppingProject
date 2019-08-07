package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDAO {
	
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
	
	//아이디 중복확인 메소드
	public boolean checkID(String id) {
		boolean check = false;
		
		try {
			con = getConnection();
			
			String sql = "SELECT id, password FROM member WHERE id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) check = true;
			else check = false;
		} catch(Exception e) {
			System.out.println("checkID()메서드에서 에러 : " + e);
		} finally {
			CloseDB();
		}
		
		return check;
	}
	
	//로그인 시 아이디, 비밀번호 체크 메소드
	public boolean checkLogin(String id, String pass) {
		boolean check = false;
		
		try {
			con = getConnection();
			
			String sql = "SELECT id, password FROM member WHERE id=? AND password=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pass);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) check = true;
			else check = false;
		} catch(Exception e) {
			System.out.println("checkLogin()메서드에서 에러 : " + e);
		} finally {
			CloseDB();
		}
		return check;
	}
	
}
