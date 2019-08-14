package net.buyList.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BuyListDAO {

DataSource ds;
	
	//DB연결 메소드
	private Connection getConnection() throws Exception {
		Context ctx = new InitialContext();
		ds = (DataSource)ctx.lookup("java:comp/env/jdbc/shoppingmall");
		return ds.getConnection();
	}
	
	public int maxBuynum(){
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		int num = 0;
		
		try {
			con = getConnection();
			
			sql  = "select max(buynum) from buylist";
			
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				num = rs.getInt(1) + 1;
			}else{
				num = 1;				
			}
			
		} catch (Exception e) {
			System.out.println("maxBuynum()메소드 내부의 오류 : " + e);
		} finally {
			if(pstmt!=null){ try{pstmt.close();} catch(Exception e){e.printStackTrace();}}
			if(con!=null){ try{con.close();} catch(Exception e){e.printStackTrace();}}
			if(rs!=null){ try{rs.close();} catch(Exception e){e.printStackTrace();}}
		}
		
		return num;
	}
	
	public void insertBuyList(BuyListDTO bdto){
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";

		try {
			
			con = getConnection();
			
			sql  = "insert into buylist values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, bdto.getBuynum());
			pstmt.setString(2, bdto.getId());
			pstmt.setString(3, bdto.getOrder_name());
			pstmt.setString(4, bdto.getOrder_mtel());
			pstmt.setString(5, bdto.getOrder_email());
			pstmt.setString(6, bdto.getBuydate());
			pstmt.setInt(7, bdto.getProduct_num());
			pstmt.setInt(8, bdto.getProduct_count());
			pstmt.setInt(9, bdto.getAll_coupon_num());
			pstmt.setInt(10, bdto.getDelivery_coupon_num());
			pstmt.setInt(11, bdto.getPoint());
			pstmt.setString(12, bdto.getDelivery_title());
			pstmt.setInt(13, bdto.getDelivery_cost());
			pstmt.setString(14, bdto.getDelivery_result());
			pstmt.setString(15, bdto.getDelivery_name());
			pstmt.setString(16, bdto.getDelivery_mtel());
			pstmt.setString(17, bdto.getDelivery_address());
			pstmt.setString(18, bdto.getDelivery_message());
			pstmt.setString(19, bdto.getPayments());
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("insertBuyList()메소드 내부의 오류 : " + e);
		} finally {
			if(pstmt!=null){ try{pstmt.close();} catch(Exception e){e.printStackTrace();}}
			if(con!=null){ try{con.close();} catch(Exception e){e.printStackTrace();}}
			if(rs!=null){ try{rs.close();} catch(Exception e){e.printStackTrace();}}
		}
		
	}
	
	public int selectPronum(int cartnum){
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		int num = 0;
		
		try {
			
			con = getConnection();
			
			sql  = "select product_num from cart where cart_num=?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, cartnum);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				num = rs.getInt(1);
			} else{
				num = 0;
			}
			
		} catch (Exception e) {
			System.out.println("selectPronum()메소드 내부의 오류 : " + e);
		} finally {
			if(pstmt!=null){ try{pstmt.close();} catch(Exception e){e.printStackTrace();}}
			if(con!=null){ try{con.close();} catch(Exception e){e.printStackTrace();}}
			if(rs!=null){ try{rs.close();} catch(Exception e){e.printStackTrace();}}
		}
		
		return num;
		
	}
	
	public int selectProcount(int cartnum){
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		int count = 0;
		
		try {
			
			con = getConnection();
			
			sql  = "select product_count from cart where cart_num=?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, cartnum);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				count = rs.getInt(1);
			} else{
				count = 0;
			}
			
		} catch (Exception e) {
			System.out.println("selectProcount()메소드 내부의 오류 : " + e);
		} finally {
			if(pstmt!=null){ try{pstmt.close();} catch(Exception e){e.printStackTrace();}}
			if(con!=null){ try{con.close();} catch(Exception e){e.printStackTrace();}}
			if(rs!=null){ try{rs.close();} catch(Exception e){e.printStackTrace();}}
		}
		
		return count;
		
	}
	
}
