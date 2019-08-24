package net.product.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ProductDAO {

	DataSource ds;
	
	//DB연결 메소드
	private Connection getConnection() throws Exception {
		Context ctx = new InitialContext();
		ds = (DataSource)ctx.lookup("java:comp/env/jdbc/shoppingmall");
		return ds.getConnection();
	}
	
	public ProductDTO getProduct(int product_num){
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		ProductDTO pdto = null;
		
		try {
			con = getConnection();
			
			sql = "select * from product where product_num=?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, product_num);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				
				pdto = new ProductDTO();
				pdto.setProduct_num(product_num);
				pdto.setCategory_main(rs.getString("category_main"));
				pdto.setCategory_sub(rs.getString("category_sub"));
				pdto.setProduct_name(rs.getString("product_name"));
				pdto.setProduct_count(rs.getInt("product_count"));
				pdto.setProduct_price(rs.getInt("product_price"));
				pdto.setProduct_sale_price(rs.getInt("product_sale_price"));
				pdto.setImg_main(rs.getString("img_main"));
				pdto.setImg_contents(rs.getString("img_contents"));
				pdto.setBrand(rs.getString("brand"));
				pdto.setPrice_count(rs.getInt("price_count"));
				
			}
			
		} catch (Exception e) {
			System.out.println("getProduct()메소드 내부에서의 오류 : " + e);
		} finally{
			if(pstmt!=null){ try{pstmt.close();} catch(Exception e){e.printStackTrace();}}
			if(con!=null){ try{con.close();} catch(Exception e){e.printStackTrace();}}
			if(rs!=null){ try{rs.close();} catch(Exception e){e.printStackTrace();}}
		}
		
		
		
		return pdto;
	}
	
	
	
	
	
}
