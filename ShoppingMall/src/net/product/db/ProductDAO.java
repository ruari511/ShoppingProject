package net.product.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Vector;

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
	
	public Vector<ProductDTO> selectProduct(String query, int startRow, int pageSize){
		
		Vector<ProductDTO> productList = new Vector<ProductDTO>();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		try {
			
			con = getConnection();
			sql = "select * from product where product_name like ? || product_subname like ? limit ?,?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, "%"+query+"%");
			pstmt.setString(2, "%"+query+"%");
			pstmt.setInt(3, startRow);
			pstmt.setInt(4, pageSize);
			
			rs = pstmt.executeQuery();
					
			while(rs.next()){
				
				ProductDTO pdto = new ProductDTO();
				
				pdto.setProduct_num(rs.getInt("product_num"));
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
				
				productList.add(pdto);
			}
			
		} catch (Exception e) {
			System.out.println("selectProduct()메소드 내부에서의 오류 : " + e);
		} finally{
			if(pstmt!=null){ try{pstmt.close();} catch(Exception e){e.printStackTrace();}}
			if(con!=null){ try{con.close();} catch(Exception e){e.printStackTrace();}}
			if(rs!=null){ try{rs.close();} catch(Exception e){e.printStackTrace();}}
		}
		
		return productList;
	}
	
	
	public Vector<ProductDTO> selectProductcate(String query, int startRow, int pageSize, String cate){
		
		Vector<ProductDTO> productList = new Vector<ProductDTO>();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		try {
			
			con = getConnection();
			sql = "select * from product where product_name like ? || product_subname like ? && category_main=? limit ?,?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, "%"+query+"%");
			pstmt.setString(2, "%"+query+"%");
			pstmt.setString(3, cate);
			pstmt.setInt(4, startRow);
			pstmt.setInt(5, pageSize);
			
			rs = pstmt.executeQuery();
					
			while(rs.next()){
				
				ProductDTO pdto = new ProductDTO();
				
				pdto.setProduct_num(rs.getInt("product_num"));
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
				
				productList.add(pdto);
			}
			
		} catch (Exception e) {
			System.out.println("selectProductcate()메소드 내부에서의 오류 : " + e);
		} finally{
			if(pstmt!=null){ try{pstmt.close();} catch(Exception e){e.printStackTrace();}}
			if(con!=null){ try{con.close();} catch(Exception e){e.printStackTrace();}}
			if(rs!=null){ try{rs.close();} catch(Exception e){e.printStackTrace();}}
		}
		
		return productList;
	}
	
	
	public Vector<ProductDTO> selectProductsubcate(String query, int startRow, int pageSize, String cate, String subcate){
		
		Vector<ProductDTO> productList = new Vector<ProductDTO>();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		try {
			
			con = getConnection();
			sql = "select * from product where product_name like ? || product_subname like ? && category_main=? && category_sub=? limit ?,?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, "%"+query+"%");
			pstmt.setString(2, "%"+query+"%");
			pstmt.setString(3, cate);
			pstmt.setString(3, subcate);
			pstmt.setInt(5, startRow);
			pstmt.setInt(6, pageSize);
			
			rs = pstmt.executeQuery();
					
			while(rs.next()){
				
				ProductDTO pdto = new ProductDTO();
				
				pdto.setProduct_num(rs.getInt("product_num"));
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
				
				productList.add(pdto);
			}
			
		} catch (Exception e) {
			System.out.println("selectProductsubcate()메소드 내부에서의 오류 : " + e);
		} finally{
			if(pstmt!=null){ try{pstmt.close();} catch(Exception e){e.printStackTrace();}}
			if(con!=null){ try{con.close();} catch(Exception e){e.printStackTrace();}}
			if(rs!=null){ try{rs.close();} catch(Exception e){e.printStackTrace();}}
		}
		
		return productList;
	}
	
	
	
	
	public int selectProductCount(String query){
		
		int count=0;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		try {
			con = getConnection();
			sql = "select count(*) from product where product_name like ? || product_subname like ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%"+query+"%");
			pstmt.setString(2, "%"+query+"%");
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				count = rs.getInt(1);
			}
			
		} catch (Exception e) {
			System.out.println("selectProductCount()메소드 내부에서의 오류 : " + e);
		} finally{
			if(pstmt!=null){ try{pstmt.close();} catch(Exception e){e.printStackTrace();}}
			if(con!=null){ try{con.close();} catch(Exception e){e.printStackTrace();}}
			if(rs!=null){ try{rs.close();} catch(Exception e){e.printStackTrace();}}
		}
		
		return count;
	}
	
	
	public ArrayList<String> selectProductcate(String query){
		
		ArrayList<String> category = new ArrayList<String>();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		try {
			
			con = getConnection();
			sql = "select distinct category_main from product where product_name like ? || product_subname like ?";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, "%"+query+"%");
			pstmt.setString(2, "%"+query+"%");
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				category.add(rs.getString(1));
			}
			
		} catch (Exception e) {
			System.out.println("selectProductcate()메소드 내부에서의 오류 : " + e);
		} finally{
			if(pstmt!=null){ try{pstmt.close();} catch(Exception e){e.printStackTrace();}}
			if(con!=null){ try{con.close();} catch(Exception e){e.printStackTrace();}}
			if(rs!=null){ try{rs.close();} catch(Exception e){e.printStackTrace();}}
		}
		
		return category;
	}
	
	
	
	public ArrayList<String> selectProductsubcate(String query, String cate){
		
		ArrayList<String> subcategory = new ArrayList<String>();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		try {
			
			con = getConnection();
			sql = "select distinct category_sub from product where product_name like ? || product_subname like ? && category_main=?";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, "%"+query+"%");
			pstmt.setString(2, "%"+query+"%");
			pstmt.setString(3, cate);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				subcategory.add(rs.getString(1));
			}
			
		} catch (Exception e) {
			System.out.println("selectProductsubcate()메소드 내부에서의 오류 : " + e);
		} finally{
			if(pstmt!=null){ try{pstmt.close();} catch(Exception e){e.printStackTrace();}}
			if(con!=null){ try{con.close();} catch(Exception e){e.printStackTrace();}}
			if(rs!=null){ try{rs.close();} catch(Exception e){e.printStackTrace();}}
		}
		
		return subcategory;
	}
	
	public int selectProductcateCount(String query, String cate){
		
		int count=0;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		try {
			
			con = getConnection();
			sql = "select count(*) from product where product_name like ? || product_subname like ? && category_main=?";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, "%"+query+"%");
			pstmt.setString(2, "%"+query+"%");
			pstmt.setString(3, cate);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				count = rs.getInt(1);
			}
			
		} catch (Exception e) {
			System.out.println("selectProductcateCount()메소드 내부에서의 오류 : " + e);
		} finally{
			if(pstmt!=null){ try{pstmt.close();} catch(Exception e){e.printStackTrace();}}
			if(con!=null){ try{con.close();} catch(Exception e){e.printStackTrace();}}
			if(rs!=null){ try{rs.close();} catch(Exception e){e.printStackTrace();}}
		}
		
		return count;
	}
	
	public int selectProductsubcateCount(String query, String cate, String subcate){
		
		int count=0;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		try {
			
			con = getConnection();
			sql = "select count(*) from product where product_name like ? || product_subname like ? && category_main=? && category_sub=?";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, "%"+query+"%");
			pstmt.setString(2, "%"+query+"%");
			pstmt.setString(3, cate);
			pstmt.setString(3, subcate);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				count = rs.getInt(1);
			}
			
		} catch (Exception e) {
			System.out.println("selectProductsubcateCount()메소드 내부에서의 오류 : " + e);
		} finally{
			if(pstmt!=null){ try{pstmt.close();} catch(Exception e){e.printStackTrace();}}
			if(con!=null){ try{con.close();} catch(Exception e){e.printStackTrace();}}
			if(rs!=null){ try{rs.close();} catch(Exception e){e.printStackTrace();}}
		}
		
		return count;
	}
	
	
	
	
	
	public ArrayList<String> selectProductbrand(String query){
		
		ArrayList<String> brand = new ArrayList<String>();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		try {
			
			con = getConnection();
			sql = "select distinct brand from product where product_name like ? || product_subname like ?";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, "%"+query+"%");
			pstmt.setString(2, "%"+query+"%");
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				brand.add(rs.getString(1));
			}
			
		} catch (Exception e) {
			System.out.println("selectProductbrand()메소드 내부에서의 오류 : " + e);
		} finally{
			if(pstmt!=null){ try{pstmt.close();} catch(Exception e){e.printStackTrace();}}
			if(con!=null){ try{con.close();} catch(Exception e){e.printStackTrace();}}
			if(rs!=null){ try{rs.close();} catch(Exception e){e.printStackTrace();}}
		}
		
		return brand;
	}
	
	
	
	
	
}
