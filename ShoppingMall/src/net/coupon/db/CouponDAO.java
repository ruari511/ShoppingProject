package net.coupon.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class CouponDAO {
	
	DataSource ds;
	
	//DB연결 메소드
	private Connection getConnection() throws Exception {
		Context ctx = new InitialContext();
		ds = (DataSource)ctx.lookup("java:comp/env/jdbc/shoppingmall");
		return ds.getConnection();
	}
	
	public int rouletCheck(String id){
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		int result = 0;
		
		try {
			con = getConnection();
			
			sql = "select count from coupon_roulet where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				result = rs.getInt(1);
			}
			
		} catch (Exception e) {
			System.out.println("rouletCheck()메소드 내부에서의 오류 : " + e);
		}
		
		return result;
		
	}
	
	public void rouletComplete(String id){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		int result = 0;
		
		try {
			con = getConnection();
			
			sql = "update coupon_roulet set count = 0 where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("rouletComplete()메소드 내부에서의 오류 : " + e);
		}
		
	}
	
	public Vector<UserCouponDTO> getAllCouponList(String id){
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		Vector<UserCouponDTO> couponList = new Vector<UserCouponDTO>();
		
		try {
			con = getConnection();
			
			sql  = "select c.coupon_num, c.coupon_name, c.coupon_percent, "
				 +	"c.coupon_limitmax, c.coupon_type, u.start_date, u.last_date, "
				 + "u.usecheck, u.id "
				 + "from coupon c join user_coupon u "
				 + "on c.coupon_num = u.coupon_num "
				 + "where u.id=? && u.usecheck=0";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				UserCouponDTO ucouDTO = new UserCouponDTO();
				
				ucouDTO.setCoupon_num(rs.getInt("coupon_num"));
				ucouDTO.setUsecheck(rs.getInt("usecheck"));
				ucouDTO.setCoupon_percent(rs.getInt("coupon_percent"));
				ucouDTO.setCoupon_limitmax(rs.getInt("coupon_limitmax"));
				ucouDTO.setId(rs.getString("id"));
			    ucouDTO.setStart_date(rs.getTimestamp("start_date"));
			    ucouDTO.setLast_date(rs.getTimestamp("last_date"));
				ucouDTO.setCoupon_name(rs.getString("coupon_name"));
				ucouDTO.setCoupon_type(rs.getString("coupon_type"));
				
				couponList.add(ucouDTO);
				
			}
			
		} catch (Exception e) {
			System.out.println("getAllCouponList()메소드 내부에서의 오류 : " + e);
		} finally{
			if(pstmt!=null){ try{pstmt.close();} catch(Exception e){e.printStackTrace();}}
			if(con!=null){ try{con.close();} catch(Exception e){e.printStackTrace();}}
			if(rs!=null){ try{rs.close();} catch(Exception e){e.printStackTrace();}}
		}

		return couponList;
		
	}
	
	public void UpdateUserCoupon(int couponNum, String id){
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		try {
			
			con = getConnection();
			
			sql = "Update user_coupon set usecheck=1 where coupon_num=? && id=?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, couponNum);
			pstmt.setString(2, id);
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("DeleteUserCoupon()메소드 내부에서의 오류 : " + e);
		} finally{
			if(pstmt!=null){ try{pstmt.close();} catch(Exception e){e.printStackTrace();}}
			if(con!=null){ try{con.close();} catch(Exception e){e.printStackTrace();}}
			if(rs!=null){ try{rs.close();} catch(Exception e){e.printStackTrace();}}
		}
		
	}
	
	public void insertCoupon(UserCouponDTO dto){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		//int result = 0;
		
		try {
			con = getConnection();
			
			sql = "insert into user_coupon values(?, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, dto.getCoupon_num());
			pstmt.setString(2, dto.getId());
			pstmt.setTimestamp(3, dto.getStart_date());
			pstmt.setTimestamp(4, dto.getLast_date());
			pstmt.setInt(5, 0);
			
			//result = pstmt.executeUpdate();
			pstmt.executeUpdate();
			
			// 쿠폰 삽입 성공시 true 리턴
//			if (result != 0) {
//	            return true;
//	        }
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			 if(rs!=null)try{rs.close();}catch(SQLException ex){}
	         if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
	         if(con!=null)try{con.close();}catch(SQLException ex){}
	    }

	     // return false; // 쿠폰 삽입 실패시! false리턴
		
	}
	
	public int SelectCouponNum(String cpName){
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		int cpNum = 0;
		
		try {
			
			con = getConnection();
			
			sql = "select coupon_num from coupon where coupon_name=?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, cpName);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				cpNum = rs.getInt(1);
			}
			
		} catch (Exception e) {
			System.out.println("SelectCouponNum() 메소드 내부의 오류 : " + e);
		} finally {
			 if(rs!=null)try{rs.close();}catch(SQLException ex){}
	         if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
	         if(con!=null)try{con.close();}catch(SQLException ex){}
	    }
		
		return cpNum;
	}
	
	public int SelectCouponPercent(String cpName){
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		int cpPercent = 0;
		
		try {
			
			con = getConnection();
			
			sql = "select coupon_percent from coupon where coupon_name=?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, cpName);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				cpPercent = rs.getInt(1);
			}
			
		} catch (Exception e) {
			System.out.println("SelectCouponPercent() 메소드 내부의 오류 : " + e);
		} finally {
			 if(rs!=null)try{rs.close();}catch(SQLException ex){}
	         if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
	         if(con!=null)try{con.close();}catch(SQLException ex){}
	    }
		
		return cpPercent;
	}
	
	
	public Vector<UserCouponDTO> getAllCouponList_MP(String id){
	
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		Vector<UserCouponDTO> couponList = new Vector<UserCouponDTO>();
		
		try {
			con = getConnection();
			
	//		sql  = "select c.coupon_name, c.coupon_percent, "
	//			 + "c.coupon_limitmax, c.coupon_type, u.start_date, u.last_date, u.usecheck"
	//			 + "from coupon c join user_coupon u "
	//			 + "on c.coupon_num = u.coupon_num "
	//			 + "where u.id= 'master' ";
			
			sql = "select * from coupon natural join user_coupon where id = ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				
				UserCouponDTO ucouDTO = new UserCouponDTO();
				
				ucouDTO.setCoupon_name(rs.getString("coupon_name"));
				ucouDTO.setCoupon_percent(rs.getInt("coupon_percent"));
				ucouDTO.setCoupon_limitmax(rs.getInt("coupon_limitmax"));
				ucouDTO.setCoupon_type(rs.getString("coupon_type"));
				ucouDTO.setStart_date(rs.getTimestamp("start_date"));
				ucouDTO.setLast_date(rs.getTimestamp("last_date"));
				ucouDTO.setUsecheck(rs.getInt("usecheck"));
					
				couponList.add(ucouDTO);
				
			}
			
		} catch (Exception e) {
			System.out.println("getAllCouponList_MP()메소드 내부에서의 오류 : " + e);
		} finally{
			if(pstmt!=null){ try{pstmt.close();} catch(Exception e){e.printStackTrace();}}
			if(con!=null){ try{con.close();} catch(Exception e){e.printStackTrace();}}
			if(rs!=null){ try{rs.close();} catch(Exception e){e.printStackTrace();}}
		}
	
		return couponList;
		
	}
	
	public int CouponNum(String id){
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		int cpNum = 0;
		
		try {
			con = getConnection();

			sql = "select count(id) from user_coupon where id=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				cpNum = rs.getInt(1);
			}
			
		} catch (Exception e) {
			System.out.println("CouponNum() 메소드 내부에서의 오류 : " + e);
		} finally {
			 if(rs!=null)try{rs.close();}catch(SQLException ex){}
	         if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
	         if(con!=null)try{con.close();}catch(SQLException ex){}
		}
		
		return cpNum;
	}
	
	
	public int AllCouponCheck(String id){
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		int count = 0;
		
		try {
			
			con = getConnection();

			sql = "select count(*)"
				+ " from shoppingmall.coupon c join shoppingmall.user_coupon u"
				+ " on c.coupon_num = u.coupon_num"
				+ " where u.id=? && u.usecheck=0 && c.coupon_type='전체금액'";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				count = rs.getInt(1);
			}
			
		} catch (Exception e) {
			System.out.println("AllCouponCheck() 메소드 내부에서의 오류 : " + e);
		} finally {
			 if(rs!=null)try{rs.close();}catch(SQLException ex){}
	         if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
	         if(con!=null)try{con.close();}catch(SQLException ex){}
		}
		
		return count;
	}
	
	public int DeliveryCouponCheck(String id){
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		int count = 0;
		
		try {
			
			con = getConnection();

			sql = "select count(*)"
				+ " from shoppingmall.coupon c join shoppingmall.user_coupon u"
				+ " on c.coupon_num = u.coupon_num"
				+ " where u.id=? && u.usecheck=0 && c.coupon_type='배송비'";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				count = rs.getInt(1);
			}
			
		} catch (Exception e) {
			System.out.println("DeliveryCouponCheck() 메소드 내부에서의 오류 : " + e);
		} finally {
			 if(rs!=null)try{rs.close();}catch(SQLException ex){}
	         if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
	         if(con!=null)try{con.close();}catch(SQLException ex){}
		}
		
		return count;
	}
	
}
