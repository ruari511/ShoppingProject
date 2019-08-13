package net.coupon.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
				 + "where u.id='admin'";
			
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				
				UserCouponDTO ucouDTO = new UserCouponDTO();
				
				ucouDTO.setCoupon_num(rs.getInt("coupon_num"));
				ucouDTO.setUsecheck(rs.getInt("usecheck"));
				ucouDTO.setCoupon_percent(rs.getInt("coupon_percent"));
				ucouDTO.setCoupon_limitmax(rs.getInt("coupon_limitmax"));
				ucouDTO.setId(rs.getString("id"));
				ucouDTO.setStart_date(rs.getString("start_date"));
				ucouDTO.setLast_date(rs.getString("last_date"));
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
	
	
}
