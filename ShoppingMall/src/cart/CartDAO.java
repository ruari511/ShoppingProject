package cart;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

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
	
	public List<CartDTO> getCartList(String id){
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		List<CartDTO> cartList = new ArrayList<CartDTO>();
		
		try {
			con = getConnection();
			
			sql  = "select c.id, p.product_name, p.img_main, p.brand, p.product_price, c.product_count, p.discount "
					+"from product p join cart c "+
					"on p.product_num=c.product_num "+
					"where c.id=?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, "admin");
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				
				CartDTO cartDTO = new CartDTO();
				
				cartDTO.setId(rs.getString("id"));
				cartDTO.setProduct_name(rs.getString("product_name"));
				cartDTO.setImg_main(rs.getString("img_main"));
				cartDTO.setProduct_brand(rs.getString("brand"));
				cartDTO.setProduct_price(rs.getInt("product_price"));
				cartDTO.setProduct_count(rs.getInt("product_count"));
				cartDTO.setDiscount(rs.getInt("discount"));
				
				cartList.add(cartDTO);
			}//while문 끝
			
		} catch (Exception e) {
			System.out.println("getCartList()메소드 내부에서의 오류 : " + e);
		} finally{
			CloseDB();
		}
	
		return cartList;
	}//getCartList() 메소드 끝
	
	
	
	
	
	
}
