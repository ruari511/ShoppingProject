package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import cart.CartDTO;

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
	
	public MemberDTO selectMember(String id){
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		MemberDTO member = new MemberDTO();
		
		
		try {
			con = getConnection();
			
			sql  = "select * from member where id=?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				
				member = new MemberDTO();
				
				member.setName(rs.getString("name"));
				member.setPhone_tel(rs.getString("phone"));
				member.setEmail(rs.getString("email"));
				member.setPoint(rs.getInt("point"));
				member.setGrade(rs.getInt("grade"));
				member.setPhone_tel(rs.getString("phone"));
				
			}//while문 끝
			
		} catch (Exception e) {
			System.out.println("selectMember()메소드 내부에서의 오류 : " + e);
		} finally{
			if(pstmt!=null){ try{pstmt.close();} catch(Exception e){e.printStackTrace();}}
			if(con!=null){ try{con.close();} catch(Exception e){e.printStackTrace();}}
			if(rs!=null){ try{rs.close();} catch(Exception e){e.printStackTrace();}}
		}
		
		return member;
	}
	
}
