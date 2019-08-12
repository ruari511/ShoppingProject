package buyList;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import cart.CartDTO;

public class BuyListDAO {

	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	DataSource ds;
	String sql = "";
	
	private Connection getConnection() throws Exception {
		Context ctx = new InitialContext();
		ds = (DataSource)ctx.lookup("java:comp/env/jdbc/shoppingmall");
		return ds.getConnection();
	}
		
	private void CloseDB() {
		try {
			if(con != null) con.close();
			if(pstmt != null) pstmt.close();
			if(rs != null) rs.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

	
	public Vector<BuyListDTO> getBuyList(String id){
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		Vector<BuyListDTO> buyList = new Vector<BuyListDTO>();
		System.out.println(id);
		try {
			con = getConnection();
			
			sql  = "select * from buylist natural join product where id=? order by buynum asc";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			while(rs.next()){
				
				BuyListDTO buylistDTO = new BuyListDTO();
				
				buylistDTO.setProduct_num(rs.getInt("product_num"));
				buylistDTO.setBuynum(rs.getInt("buynum"));
				buylistDTO.setProduct_name(rs.getString("product_name"));
				buylistDTO.setProduct_price(rs.getInt("product_price"));
/*				buylistDTO.setBuynum(rs.getInt("buynum"));
				buylistDTO.setOrder_name(rs.getString("order_name"));
				buylistDTO.setOrder_mtel(rs.getString("order_mtel"));
				buylistDTO.setOrder_email(rs.getString("order_email"));
				buylistDTO.setBuydate(rs.getTimestamp("buydate"));
				buylistDTO.setProduct_num(rs.getInt("product_num"));
				buylistDTO.setProduct_count(rs.getInt("product_count"));
				buylistDTO.setCoupon_num(rs.getString("coupon_num"));
				buylistDTO.setPoint(rs.getInt("point"));
				buylistDTO.setDelivery_cost(rs.getInt("delivery_cost"));
				buylistDTO.setDelivery_result(rs.getString("delivery_result"));
				buylistDTO.setDelivery_name(rs.getString("delivery_name"));
				buylistDTO.setDelivery_mtel(rs.getString("delivery_mtel"));
				buylistDTO.setDelivery_address(rs.getString("delivery_address"));
				buylistDTO.setDelivery_message(rs.getString("delivery_message"));
				buylistDTO.setPayments(rs.getString("payments"));*/
				
				buyList.add(buylistDTO);
			}
		} catch (Exception e) {
			System.out.println("getBuyList() error :" + e);
		} finally{
			
			CloseDB();
		}
		return buyList;
	}//getBuyList()
	
	
public Vector<BuyListDTO> getBuyDetail(String id, int buynum){
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		Vector<BuyListDTO> buyList = new Vector<BuyListDTO>();
		
		
		try {
			con = getConnection();
			
			sql  = "select * from buylist natural join product where id=? and buynum=?";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, id);
			pstmt.setInt(2, buynum);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				
				BuyListDTO buylistDTO = new BuyListDTO();
				
				buylistDTO.setProduct_num(rs.getInt("product_num"));
				buylistDTO.setBuynum(rs.getInt("buynum"));
				buylistDTO.setProduct_name(rs.getString("product_name"));
				buylistDTO.setProduct_price(rs.getInt("product_price"));
				
/*				buylistDTO.setBuynum(rs.getInt("buynum"));
				buylistDTO.setOrder_name(rs.getString("order_name"));
				buylistDTO.setOrder_mtel(rs.getString("order_mtel"));
				buylistDTO.setOrder_email(rs.getString("order_email"));
				buylistDTO.setBuydate(rs.getTimestamp("buydate"));
				buylistDTO.setProduct_num(rs.getInt("product_num"));
				buylistDTO.setProduct_count(rs.getInt("product_count"));
				buylistDTO.setCoupon_num(rs.getString("coupon_num"));
				buylistDTO.setPoint(rs.getInt("point"));
				buylistDTO.setDelivery_cost(rs.getInt("delivery_cost"));
				buylistDTO.setDelivery_result(rs.getString("delivery_result"));
				buylistDTO.setDelivery_name(rs.getString("delivery_name"));
				buylistDTO.setDelivery_mtel(rs.getString("delivery_mtel"));
				buylistDTO.setDelivery_address(rs.getString("delivery_address"));
				buylistDTO.setDelivery_message(rs.getString("delivery_message"));
				buylistDTO.setPayments(rs.getString("payments"));*/
				
				buyList.add(buylistDTO);
			}
			
		} catch (Exception e) {
			System.out.println("getBuyList() error :" + e);
		} finally{
			CloseDB();
		}
		return buyList;
	}//getBuyList()
}
