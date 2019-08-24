package net.cart.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import net.product.db.ProductDTO;

public class CartDAO {
	
	DataSource ds;
	
	//DB연결 메소드
	private Connection getConnection() throws Exception {
		Context ctx = new InitialContext();
		ds = (DataSource)ctx.lookup("java:comp/env/jdbc/shoppingmall");
		return ds.getConnection();
	}
		
	public Vector<CartDTO> getAllCartList(String id){
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		Vector<CartDTO> cartList = new Vector<CartDTO>();
		
		try {
			con = getConnection();
			
			sql  = "select c.id, p.product_name, p.img_main, p.brand, p.product_price, c.product_count, p.product_sale_price, c.cart_num, c.product_num "
					+"from product p join cart c "+
					"on p.product_num=c.product_num "+
					"where c.id=?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				
				CartDTO cartDTO = new CartDTO();
				
				cartDTO.setCart_num(rs.getInt("cart_num"));
				cartDTO.setId(rs.getString("id"));
				cartDTO.setProduct_name(rs.getString("product_name"));
				cartDTO.setImg_main(rs.getString("img_main"));
				cartDTO.setBrand(rs.getString("brand"));
				cartDTO.setProduct_price(rs.getInt("product_price"));
				cartDTO.setProduct_count(rs.getInt("product_count"));
				cartDTO.setDiscount(rs.getInt("product_sale_price"));
				cartDTO.setProduct_num(rs.getInt("product_num"));
				
				cartList.add(cartDTO);
			}//while문 끝
			
		} catch (Exception e) {
			System.out.println("getAllCartList()메소드 내부에서의 오류 : " + e);
		} finally{
			if(pstmt!=null){ try{pstmt.close();} catch(Exception e){e.printStackTrace();}}
			if(con!=null){ try{con.close();} catch(Exception e){e.printStackTrace();}}
			if(rs!=null){ try{rs.close();} catch(Exception e){e.printStackTrace();}}
		}
	
		return cartList;
	}//getCartList() 메소드 끝
	
	public CartDTO getCartList(int cart_num){
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		CartDTO cartDTO = new CartDTO();
		
		try {
			con = getConnection();
			
			sql  = "select c.cart_num, p.product_name, p.img_main, p.brand, p.product_price, c.product_count, p.product_sale_price, c.product_num "
					+"from product p join cart c "+
					"on p.product_num=c.product_num "+
					"where c.cart_num=?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, cart_num);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				
				cartDTO = new CartDTO();
				
				cartDTO.setCart_num(rs.getInt("cart_num"));
				cartDTO.setProduct_name(rs.getString("product_name"));
				cartDTO.setImg_main(rs.getString("img_main"));
				cartDTO.setBrand(rs.getString("brand"));
				cartDTO.setProduct_price(rs.getInt("product_price"));
				cartDTO.setProduct_count(rs.getInt("product_count"));
				cartDTO.setDiscount(rs.getInt("product_sale_price"));
				cartDTO.setProduct_num(rs.getInt("product_num"));
				
			}//while문 끝
			
		} catch (Exception e) {
			System.out.println("getCartList()메소드 내부에서의 오류 : " + e);
		} finally{
			if(pstmt!=null){ try{pstmt.close();} catch(Exception e){e.printStackTrace();}}
			if(con!=null){ try{con.close();} catch(Exception e){e.printStackTrace();}}
			if(rs!=null){ try{rs.close();} catch(Exception e){e.printStackTrace();}}
		}
	
		return cartDTO;
	}//getCartList() 메소드 끝
	
	
	
	public CartDTO getGoBuyList(int product_num, int product_count){
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		CartDTO cartDTO = new CartDTO();
		
		System.out.println("product_num = " + product_num);
		
		try {
			con = getConnection();
			
			sql = "select product_num, product_name, img_main, brand, product_price, product_sale_price "
				+ "from product where product_num=?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, product_num);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				
				System.out.println("product_name = " + rs.getString("product_name"));
				
				cartDTO = new CartDTO();
				
				cartDTO.setCart_num(0);
				cartDTO.setProduct_num(rs.getInt("product_num"));
				cartDTO.setProduct_name(rs.getString("product_name"));
				cartDTO.setImg_main(rs.getString("img_main"));
				cartDTO.setBrand(rs.getString("brand"));
				cartDTO.setProduct_price(rs.getInt("product_price"));
				cartDTO.setProduct_count(product_count);
				cartDTO.setDiscount(rs.getInt("product_sale_price"));
				
			}//while문 끝
			
		} catch (Exception e) {
			System.out.println("getGoBuyList()메소드 내부에서의 오류 : " + e);
		} finally{
			if(pstmt!=null){ try{pstmt.close();} catch(Exception e){e.printStackTrace();}}
			if(con!=null){ try{con.close();} catch(Exception e){e.printStackTrace();}}
			if(rs!=null){ try{rs.close();} catch(Exception e){e.printStackTrace();}}
		}
	
		return cartDTO;
	}//getCartList() 메소드 끝
	
	
	
	public void InsertCart(int product_num, String id, int count){
		
		int pro_count = 0;
		int cart_num = 0;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		try {
			con = getConnection();
			
			sql = "select product_count, cart_num from cart where product_num=? and id=?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, product_num);
			pstmt.setString(2, id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				pro_count = rs.getInt(1);
				cart_num = rs.getInt(2);
				sql = "update cart set product_count=? where cart_num=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, pro_count+count);
				pstmt.setInt(2, cart_num);
				pstmt.executeUpdate();
			}else{
				sql = "insert into cart values(null, ?, ?, ?)";
				
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, product_num);
				pstmt.setString(2, id);
				pstmt.setInt(3, count);
				
				pstmt.executeUpdate();
			}
			
		} catch (Exception e) {
			System.out.println("insertCart()메소드 내부에서의 오류 : " + e);
		} finally{
			if(pstmt!=null){ try{pstmt.close();} catch(Exception e){e.printStackTrace();}}
			if(con!=null){ try{con.close();} catch(Exception e){e.printStackTrace();}}
			if(rs!=null){ try{rs.close();} catch(Exception e){e.printStackTrace();}}
		}
	}
	
	public int updateCart(int cart_num, int count){
		
		int up = 1;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		try {
			con = getConnection();
			
			sql  = "update cart set product_count=? where cart_num=?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, count);
			pstmt.setInt(2, cart_num);
			
			pstmt.executeUpdate();
			
			up = 2;
			
		} catch (Exception e) {
			System.out.println("updateCart()메소드 내부에서의 오류 : " + e);
		} finally{
			if(pstmt!=null){ try{pstmt.close();} catch(Exception e){e.printStackTrace();}}
			if(con!=null){ try{con.close();} catch(Exception e){e.printStackTrace();}}
			if(rs!=null){ try{rs.close();} catch(Exception e){e.printStackTrace();}}
		}
		
		return up;
	}
	
	public int deleteCart(int cart_num){
		
		int up = 3;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		try {
			con = getConnection();
			
			sql  = "delete from cart where cart_num=?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, cart_num);
			
			pstmt.executeUpdate();
			
			up = 4;
			
		} catch (Exception e) {
			System.out.println("deleteCart()메소드 내부에서의 오류 : " + e);
		} finally{
			if(pstmt!=null){ try{pstmt.close();} catch(Exception e){e.printStackTrace();}}
			if(con!=null){ try{con.close();} catch(Exception e){e.printStackTrace();}}
			if(rs!=null){ try{rs.close();} catch(Exception e){e.printStackTrace();}}
		}
		
		return up;
	}
	
	
	
	
	@SuppressWarnings("resource")
	public int insertCart(String id, ProductDTO productDTO, int count){
		
		int check=0;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "";
		
		try {
			con = getConnection();
			
			if(id==null){
				check= 0;
			}
			else{
			
				sql = "select * from cart where id=? and product_num=?";
			
				pstmt = con.prepareStatement(sql);
			
				pstmt.setString(1, id);
				pstmt.setInt(2, 1);
			
				rs = pstmt.executeQuery();
			
				if(rs.next()){
					check=-1;
				} else{
					sql = "insert into cart values(?,?,?)";
				
					pstmt = con.prepareStatement(sql);
				
					pstmt.setInt(1, 1);
					pstmt.setString(2, "admin");
					pstmt.setInt(3, 2);
				
					//insert문 실행
					pstmt.executeUpdate();
					check = 1;
				}
			}
			
		} catch (Exception e) {
			System.out.println("insertCart()메소드 내부의 오류 : " + e);
		} finally{
			if(pstmt!=null){ try{pstmt.close();} catch(Exception e){e.printStackTrace();}}
			if(con!=null){ try{con.close();} catch(Exception e){e.printStackTrace();}}
			if(rs!=null){ try{rs.close();} catch(Exception e){e.printStackTrace();}}
		}
		
		return check;
	}
	
	public void Deletecart(int cartnum){
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "";
		
		try {
			con = getConnection();
			
			if(cartnum != 0){
			sql = "delete from cart where cart_num=?";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, cartnum);
			
			pstmt.executeUpdate();
			}
			
		} catch (Exception e) {
			System.out.println("Deletecart()메소드 내부의 오류 : " + e);
		} finally{
			if(pstmt!=null){ try{pstmt.close();} catch(Exception e){e.printStackTrace();}}
			if(con!=null){ try{con.close();} catch(Exception e){e.printStackTrace();}}
			if(rs!=null){ try{rs.close();} catch(Exception e){e.printStackTrace();}}
		}
		
	}
	
	public int getMaxCartNum(String id){
		
		int cartNum = 0;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "";
		
		try {
			con = getConnection();
			
			sql = "select max(cart_num) from cart where id=?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				cartNum = rs.getInt(1);
			}
			
		} catch (Exception e) {
			System.out.println("getMaxCartNum()메소드 내부의 오류 : " + e);
		} finally{
			if(pstmt!=null){ try{pstmt.close();} catch(Exception e){e.printStackTrace();}}
			if(con!=null){ try{con.close();} catch(Exception e){e.printStackTrace();}}
			if(rs!=null){ try{rs.close();} catch(Exception e){e.printStackTrace();}}
		}
		
		return cartNum;
	}
	
	//잠시 Insert
	public void waitInsertCart(int product_num, String id, int count){
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		try {
			con = getConnection();
			
			
			sql = "insert into cart values(null, ?, ?, ?)";
				
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, product_num);
			pstmt.setString(2, id);
			pstmt.setInt(3, count);
				
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("waitInsertCart()메소드 내부에서의 오류 : " + e);
		} finally{
			if(pstmt!=null){ try{pstmt.close();} catch(Exception e){e.printStackTrace();}}
			if(con!=null){ try{con.close();} catch(Exception e){e.printStackTrace();}}
			if(rs!=null){ try{rs.close();} catch(Exception e){e.printStackTrace();}}
		}
	}
	
	
	
	
	
	
}
