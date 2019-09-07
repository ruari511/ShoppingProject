package net.product.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Vector;
import java.util.List;

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
	
	public Vector<ProductDTO> selectProduct(String query, int startRow, int pageSize, String order){
		
		Vector<ProductDTO> productList = new Vector<ProductDTO>();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		try {
			
			con = getConnection();
			sql = "select * from product where product_name like ? || product_subname like ?";
			sql += order;
			sql += " limit ?,?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, "%"+query+"%");
			pstmt.setString(2, "%"+query+"%");
			pstmt.setInt(3, startRow);
			pstmt.setInt(4, pageSize);
			
			System.out.println("sql = " + sql);
			
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
	
	
	public Vector<ProductDTO> selectProductcate(String query, int startRow, int pageSize, String cate, String order){
		
		Vector<ProductDTO> productList = new Vector<ProductDTO>();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		try {
			
			con = getConnection();
			sql = "select * from product where (product_name like ? || product_subname like ?) && category_main=? ";
			sql += order;
			sql += " limit ?,?";
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
	
	
	public Vector<ProductDTO> selectProductsubcate(String query, int startRow, int pageSize, String cate, String subcate, String order){
		
		Vector<ProductDTO> productList = new Vector<ProductDTO>();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		try {
			
			con = getConnection();
			sql = "select * from product where (product_name like ? || product_subname like ?) && category_main=? && category_sub=? ";
			sql += order;
			sql += " limit ?,?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, "%"+query+"%");
			pstmt.setString(2, "%"+query+"%");
			pstmt.setString(3, cate);
			pstmt.setString(4, subcate);
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
			sql = "select distinct category_sub from product where (product_name like ? || product_subname like ?) && category_main=?";
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
			sql = "select count(*) from product where (product_name like ? || product_subname like ?) && category_main=?";
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
			sql = "select count(*) from product where (product_name like ? || product_subname like ?) && category_main=? && category_sub=?";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, "%"+query+"%");
			pstmt.setString(2, "%"+query+"%");
			pstmt.setString(3, cate);
			pstmt.setString(4, subcate);
			
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
	
	public int selectProductbrandCount(String query, String cate, String subcate, String brandquery){
		
		int count=0;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		try {
			
			con = getConnection();
			sql = "select count(*) from product where (product_name like ? || product_subname like ?) && category_main=? && category_sub=?";
			if(cate == null || cate.length() == 0){
				
				sql = "select count(*) from product where (product_name like ? || product_subname like ?)";
				sql += brandquery;
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%"+query+"%");
				pstmt.setString(2, "%"+query+"%");
				
			} else if(subcate == null || subcate.length() == 0){
				
				sql = "select count(*) from product where (product_name like ? || product_subname like ?) && category_main=? ";
				sql += brandquery;
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%"+query+"%");
				pstmt.setString(2, "%"+query+"%");
				pstmt.setString(3, cate);
				
			} else{
				
				sql += brandquery;
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%"+query+"%");
				pstmt.setString(2, "%"+query+"%");
				pstmt.setString(3, cate);
				pstmt.setString(4, subcate);
			}
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				count = rs.getInt(1);
			}
			
		} catch (Exception e) {
			System.out.println("selectProductbrandCount()메소드 내부에서의 오류 : " + e);
		} finally{
			if(pstmt!=null){ try{pstmt.close();} catch(Exception e){e.printStackTrace();}}
			if(con!=null){ try{con.close();} catch(Exception e){e.printStackTrace();}}
			if(rs!=null){ try{rs.close();} catch(Exception e){e.printStackTrace();}}
		}
		
		return count;
	}
	
	public int selectProductPriceCount(String query, String cate, String subcate, String brandquery, String low, String high){
		
		int count=0;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		try {
			
			con = getConnection();
			sql = "select count(*) from product where (product_name like ? || product_subname like ?) && category_main=? && category_sub=? && product_price-product_sale_price between ? and ?";
			if(cate == null || cate.length() == 0){
				
				sql = "select count(*) from product where (product_name like ? || product_subname like ?) && product_price-product_sale_price between ? and ?";
				sql += brandquery;
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%"+query+"%");
				pstmt.setString(2, "%"+query+"%");
				pstmt.setInt(3, Integer.parseInt(low));
				pstmt.setInt(4, Integer.parseInt(high));
				
			} else if(subcate == null || subcate.length() == 0){
				
				sql = "select count(*) from product where (product_name like ? || product_subname like ?) && category_main=? && product_price-product_sale_price between ? and ?";
				sql += brandquery;
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%"+query+"%");
				pstmt.setString(2, "%"+query+"%");
				pstmt.setString(3, cate);
				pstmt.setInt(4, Integer.parseInt(low));
				pstmt.setInt(5, Integer.parseInt(high));
				
			} else{
				
				sql += brandquery;
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%"+query+"%");
				pstmt.setString(2, "%"+query+"%");
				pstmt.setString(3, cate);
				pstmt.setString(4, subcate);
				pstmt.setInt(5, Integer.parseInt(low));
				pstmt.setInt(6, Integer.parseInt(high));
			}
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				count = rs.getInt(1);
			}
			
		} catch (Exception e) {
			System.out.println("selectProductPriceCount()메소드 내부에서의 오류 : " + e);
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
	
	
	public ArrayList<String> selectProductbrand(String query, String cate, String subcate){
		
		ArrayList<String> brand = new ArrayList<String>();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		try {
			
			con = getConnection();
			
			if(cate == null || cate.length() == 0){
				
				sql = "select distinct brand from product where product_name like ? || product_subname like ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%"+query+"%");
				pstmt.setString(2, "%"+query+"%");
				
			} else if(subcate == null || subcate.length() == 0){
				
				sql = "select distinct brand from product where (product_name like ? || product_subname like ?) && category_main=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%"+query+"%");
				pstmt.setString(2, "%"+query+"%");
				pstmt.setString(3, cate);
				
			} else{
				sql = "select distinct brand from product where (product_name like ? || product_subname like ?) && category_main=? && category_sub=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%"+query+"%");
				pstmt.setString(2, "%"+query+"%");
				pstmt.setString(3, cate);
				pstmt.setString(4, subcate);
			}
			System.out.println("sql = " + sql);
			
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
	
	public ArrayList<String> selectProductbrand(String query, String cate, String subcate, String low, String high){
		
		ArrayList<String> brand = new ArrayList<String>();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		try {
			
			con = getConnection();
			
			if(cate == null || cate.length() == 0){
				
				if(low == null || low.length() == 0){
					sql = "select distinct brand from product where product_name like ? || product_subname like ?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, "%"+query+"%");
					pstmt.setString(2, "%"+query+"%");
				}else{
					sql = "select distinct brand from product where (product_name like ? || product_subname like ?) && product_price-product_sale_price between ? and ?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, "%"+query+"%");
					pstmt.setString(2, "%"+query+"%");
					pstmt.setInt(3, Integer.parseInt(low));
					pstmt.setInt(4, Integer.parseInt(high));
				}
			} else if(subcate == null || subcate.length() == 0){
				
				if(low == null || low.length() == 0){
					sql = "select distinct brand from product where (product_name like ? || product_subname like ?) && category_main=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, "%"+query+"%");
					pstmt.setString(2, "%"+query+"%");
					pstmt.setString(3, cate);
				}else{
					sql = "select distinct brand from product where (product_name like ? || product_subname like ?) && category_main=? && product_price-product_sale_price between ? and ?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, "%"+query+"%");
					pstmt.setString(2, "%"+query+"%");
					pstmt.setString(3, cate);
					pstmt.setInt(4, Integer.parseInt(low));
					pstmt.setInt(5, Integer.parseInt(high));
				}
				
			} else{
				
				if(low == null || low.length() == 0){
					sql = "select distinct brand from product where (product_name like ? || product_subname like ?) && category_main=? && category_sub=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, "%"+query+"%");
					pstmt.setString(2, "%"+query+"%");
					pstmt.setString(3, cate);
					pstmt.setString(4, subcate);
				}else{
					sql = "select distinct brand from product where (product_name like ? || product_subname like ?) && category_main=? && category_sub=? && product_price-product_sale_price between ? and ?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, "%"+query+"%");
					pstmt.setString(2, "%"+query+"%");
					pstmt.setString(3, cate);
					pstmt.setString(4, subcate);
					pstmt.setInt(5, Integer.parseInt(low));
					pstmt.setInt(6, Integer.parseInt(high));
				}
			}
			
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


	
	public Vector<ProductDTO> selectProductbrand(String query, int startRow, int pageSize, String cate, String subcate, String brandquery, String order){
		
		Vector<ProductDTO> productList = new Vector<ProductDTO>();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		try {
			
			con = getConnection();
			sql = "select * from product where (product_name like ? || product_subname like ?) && category_main=? && category_sub=?";
			
			if(cate == null || cate.length() == 0){
				
				sql = "select * from product where (product_name like ? || product_subname like ?)";
				sql += brandquery;
				sql += order;
				sql += " limit ?,?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%"+query+"%");
				pstmt.setString(2, "%"+query+"%");
				pstmt.setInt(3, startRow);
				pstmt.setInt(4, pageSize);
				
			} else if(subcate == null || subcate.length() == 0){
				
				sql = "select * from product where (product_name like ? || product_subname like ?) && category_main=? ";
				sql += brandquery;
				sql += order;
				sql += " limit ?,?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%"+query+"%");
				pstmt.setString(2, "%"+query+"%");
				pstmt.setString(3, cate);
				pstmt.setInt(4, startRow);
				pstmt.setInt(5, pageSize);
				
			} else{
				
				sql += brandquery;
				sql += order;
				sql += " limit ?,?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%"+query+"%");
				pstmt.setString(2, "%"+query+"%");
				pstmt.setString(3, cate);
				pstmt.setString(4, subcate);
				pstmt.setInt(5, startRow);
				pstmt.setInt(6, pageSize);
			}
			
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
			System.out.println("selectProductbrand()메소드 내부에서의 오류 : " + e);
		} finally{
			if(pstmt!=null){ try{pstmt.close();} catch(Exception e){e.printStackTrace();}}
			if(con!=null){ try{con.close();} catch(Exception e){e.printStackTrace();}}
			if(rs!=null){ try{rs.close();} catch(Exception e){e.printStackTrace();}}
		}
		
		return productList;
	}
	
	public Vector<ProductDTO> selectProductPrice(String query, int startRow, int pageSize, String cate, String subcate, String brandquery, String low, String high, String order){
		
		Vector<ProductDTO> productList = new Vector<ProductDTO>();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		try {
			con = getConnection();
			sql = "select * from product where (product_name like ? || product_subname like ?) && category_main=? && category_sub=? && product_price-product_sale_price between ? and ?";
			
			if(cate == null || cate.length() == 0){
				sql = "select * from product where (product_name like ? || product_subname like ?) && product_price-product_sale_price between ? and ?";
				sql += brandquery;
				sql += order;
				sql += " limit ?,?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%"+query+"%");
				pstmt.setString(2, "%"+query+"%");
				pstmt.setInt(3, Integer.parseInt(low));
				pstmt.setInt(4, Integer.parseInt(high));
				pstmt.setInt(5, startRow);
				pstmt.setInt(6, pageSize);
				
			} else if(subcate == null || subcate.length() == 0){
				sql = "select * from product where (product_name like ? || product_subname like ?) && category_main=? && product_price-product_sale_price between ? and ?";
				sql += brandquery;
				sql += order;
				sql += " limit ?,?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%"+query+"%");
				pstmt.setString(2, "%"+query+"%");
				pstmt.setString(3, cate);
				pstmt.setInt(4, Integer.parseInt(low));
				pstmt.setInt(5, Integer.parseInt(high));
				pstmt.setInt(6, startRow);
				pstmt.setInt(7, pageSize);
				
			} else{
				sql += brandquery;
				sql += order;
				sql += " limit ?,?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%"+query+"%");
				pstmt.setString(2, "%"+query+"%");
				pstmt.setString(3, cate);
				pstmt.setString(4, subcate);
				pstmt.setInt(5, Integer.parseInt(low));
				pstmt.setInt(6, Integer.parseInt(high));
				pstmt.setInt(7, startRow);
				pstmt.setInt(8, pageSize);
				
			}
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				System.out.println("product_name = " + rs.getString("product_name"));
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
			System.out.println("selectProductbrand()메소드 내부에서의 오류 : " + e);
		} finally{
			if(pstmt!=null){ try{pstmt.close();} catch(Exception e){e.printStackTrace();}}
			if(con!=null){ try{con.close();} catch(Exception e){e.printStackTrace();}}
			if(rs!=null){ try{rs.close();} catch(Exception e){e.printStackTrace();}}
		}
		
		return productList;
	}
	
	//상품 구매시 줄어드는 상품수량을 업데이트하기 위해 현재 상품 수량을 검색하는 메소드
	public int getProduct_count(int product_num){

		int product_count = 0;
		   
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		   
		try {
			con = getConnection();
			   
			sql  = "select product_count from product where product_num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, product_num);
			   
			rs = pstmt.executeQuery();
			   
			if(rs.next()){
				product_count = rs.getInt(1);
			}
			
		} catch (Exception e) {
			   System.out.println("getProduct_count()메소드 내부에서의 오류 : " + e);
		} finally{
		  if(pstmt!=null){ try{pstmt.close();} catch(Exception e){e.printStackTrace();}}
		  if(con!=null){ try{con.close();} catch(Exception e){e.printStackTrace();}}
		  if(rs!=null){ try{rs.close();} catch(Exception e){e.printStackTrace();}}
		}
		   
		return product_count;
	}
	
	//상품 구매시 줄어드는 상품 구매수량을 업데이트하기 위해 현재 상품 구매수량을 검색하는 메소드
	public int getPrice_count(int product_num){

		int price_count = 0;
		   
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		   
		try {
			con = getConnection();
			   
			sql  = "select price_count from product where product_num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, product_num);
			   
			rs = pstmt.executeQuery();
			   
			if(rs.next()){
				price_count = rs.getInt(1);
			}
			
		} catch (Exception e) {
			   System.out.println("getPrice_count()메소드 내부에서의 오류 : " + e);
		} finally{
		  if(pstmt!=null){ try{pstmt.close();} catch(Exception e){e.printStackTrace();}}
		  if(con!=null){ try{con.close();} catch(Exception e){e.printStackTrace();}}
		  if(rs!=null){ try{rs.close();} catch(Exception e){e.printStackTrace();}}
		}
		   
		return price_count;
	}
	
	
	//상품 구매시 상품의 남은 수량을 업데이트 하는 메소드
	public void UpdateProduct_count(int product_count, int product_num){
		   
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		   
		try {
			con = getConnection();
			   
			sql  = "update product set product_count=? where product_num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, product_count);
			pstmt.setInt(2, product_num);
			   
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			 System.out.println("UpdateProduct_count()메소드 내부에서의 오류 : " + e);
		} finally{
		  if(pstmt!=null){ try{pstmt.close();} catch(Exception e){e.printStackTrace();}}
		  if(con!=null){ try{con.close();} catch(Exception e){e.printStackTrace();}}
		  if(rs!=null){ try{rs.close();} catch(Exception e){e.printStackTrace();}}
		}
	}
	
	//상품 구매시 상품의 늘어난 구매수량을 업데이트하는 메소드
	public void UpdatePrice_count(int price_count, int product_num){
		   
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		   
		try {
			con = getConnection();
			   
			sql  = "update product set price_count=? where product_num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, price_count);
			pstmt.setInt(2, product_num);
			   
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			 System.out.println("UpdatePrice_count()메소드 내부에서의 오류 : " + e);
		} finally{
		  if(pstmt!=null){ try{pstmt.close();} catch(Exception e){e.printStackTrace();}}
		  if(con!=null){ try{con.close();} catch(Exception e){e.printStackTrace();}}
		  if(rs!=null){ try{rs.close();} catch(Exception e){e.printStackTrace();}}
		}
	}
	
	
	//190821김현정 
	//메인 슬라이드에서 상품 목록 불러오는 함수
	public Vector<ProductDTO> getProductLimitList(String category_main, String category_sub, int limit){
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		Vector<ProductDTO> v = new Vector<ProductDTO>();
		
		try {
			con = getConnection();
			
			sql = "select * from product where category_main=? and category_sub=? limit ?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, category_main);
			pstmt.setString(2, category_sub);
			pstmt.setInt(3, limit);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				
			
				ProductDTO pdto = new ProductDTO();
				
				pdto.setProduct_num(rs.getInt("product_num"));
				pdto.setProduct_name(rs.getString("product_name"));
				pdto.setProduct_price(rs.getInt("product_price"));
				pdto.setProduct_sale_price(rs.getInt("product_sale_price"));
				pdto.setProduct_count(rs.getInt("product_count"));
				pdto.setImg_main(rs.getString("img_main"));
				pdto.setBrand(rs.getString("brand"));
				
				
				v.add(pdto);
				
			}
			
		} catch (Exception e) {
			System.out.println("getProductLimit()메소드 내부에서의 오류 : " + e);
		} finally{
			if(pstmt!=null){ try{pstmt.close();} catch(Exception e){e.printStackTrace();}}
			if(con!=null){ try{con.close();} catch(Exception e){e.printStackTrace();}}
			if(rs!=null){ try{rs.close();} catch(Exception e){e.printStackTrace();}}
		}
		
		
		
		return v;
	}

	//상품목록 페이지 
	//메인카테고리/서브카테고리/정렬방법/페이지번호
	//한페이지에 나타나는 상품 갯수는 24개로 고정
	public Vector<ProductDTO> getProductListAll(String category_main, String category_sub, String sort_query, int pageNum, String[] brands, int MaxNum  ) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		Vector<ProductDTO> v = new Vector<ProductDTO>();
		
		try {
			con = getConnection();
			
			sql = "select * from product ";
			sql += getBrandQuery(brands, category_sub);
			sql += sort_query;
			sql += " limit ?, ?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, category_main);
			
			//서브카테고리가 선택되어있지않으면 전체 표시
			if(category_sub.equals("all")){			
				pstmt.setInt(2, (pageNum-1)*MaxNum);
				pstmt.setInt(3, MaxNum);
			}else{
				pstmt.setString(2, category_sub);		
				pstmt.setInt(3, (pageNum-1)*MaxNum);
				pstmt.setInt(4, MaxNum);
			}

			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				
			
				ProductDTO pdto = new ProductDTO();
				
				pdto.setProduct_num(rs.getInt("product_num"));
				pdto.setProduct_name(rs.getString("product_name"));
				pdto.setProduct_price(rs.getInt("product_price"));
				pdto.setImg_main(rs.getString("img_main"));
				pdto.setBrand(rs.getString("brand"));
				pdto.setProduct_count(rs.getInt("product_count"));
				pdto.setProduct_sale_price(rs.getInt("product_sale_price"));
				
				
				v.add(pdto);
				
			}
			
		} catch (Exception e) {
			System.out.println("getProductListAll()메소드 내부에서의 오류 : " + e);
		} finally{
			if(pstmt!=null){ try{pstmt.close();} catch(Exception e){e.printStackTrace();}}
			if(con!=null){ try{con.close();} catch(Exception e){e.printStackTrace();}}
			if(rs!=null){ try{rs.close();} catch(Exception e){e.printStackTrace();}}
		}
		
		
		
		return v;
	}

	//현재 브랜드 목록을 불러오는 함수
	public Vector<String> getBrandList(String category_main, String category_sub) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		Vector<String> v = new Vector<String>();
		
		try {
			con = getConnection();
			
			sql = "select distinct brand from product where category_main=?";
			
			if(!category_sub.equals("all"))
				sql += " and category_sub=?";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, category_main);
			
			if(!category_sub.equals("all"))
				pstmt.setString(2, category_sub);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				v.add(rs.getString("brand"));
			}
			
		} catch (Exception e) {
			System.out.println("getBrandList()메소드 내부에서의 오류 : " + e);
		} finally{
			if(pstmt!=null){ try{pstmt.close();} catch(Exception e){e.printStackTrace();}}
			if(con!=null){ try{con.close();} catch(Exception e){e.printStackTrace();}}
			if(rs!=null){ try{rs.close();} catch(Exception e){e.printStackTrace();}}
		}
		
		
		
		return v;
	}

	
	//총 상품 개수 불러오기
	public int getProductCount(String category_main, String category_sub, String[] brands) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		int count = 0;
		
		try {
			con = getConnection();
			
			//sql = "select count(*) from product where category_main=? and category_sub=?";
			sql = "select count(*) from product ";
			sql += getBrandQuery(brands, category_sub);
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, category_main);
			
			if(!category_sub.equals("all"))
				pstmt.setString(2, category_sub);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				count = rs.getInt(1);
			}
			
		} catch (Exception e) {
			System.out.println("getBrandList()메소드 내부에서의 오류 : " + e);
		} finally{
			if(pstmt!=null){ try{pstmt.close();} catch(Exception e){e.printStackTrace();}}
			if(con!=null){ try{con.close();} catch(Exception e){e.printStackTrace();}}
			if(rs!=null){ try{rs.close();} catch(Exception e){e.printStackTrace();}}
		}
		
		
		
		return count;
	}
	
	//서브카테고리 목록 불러오는 함수
	public Vector<String> getSubList(String category_main) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		Vector<String> v = new Vector<String>();
		
		try {
			con = getConnection();
			
			sql = "select distinct category_sub from product where category_main =? ";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, category_main);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				v.add(rs.getString(1));
			}
			
		} catch (Exception e) {
			System.out.println("getSubList()메소드 내부에서의 오류 : " + e);
		} finally{
			if(pstmt!=null){ try{pstmt.close();} catch(Exception e){e.printStackTrace();}}
			if(con!=null){ try{con.close();} catch(Exception e){e.printStackTrace();}}
			if(rs!=null){ try{rs.close();} catch(Exception e){e.printStackTrace();}}
		}

		return v;
	}
	
	
	//브랜드유무, 서브카테고리 전체 여부에 따라 쿼리문 만들어주는 함수
	private String getBrandQuery(String[] brands, String category_sub){
		String sql_temp = "where category_main=?";
		
		//카테고리가 전체이면 where절에서 sub카테고리 제거
		if(!category_sub.equals("all")){
			sql_temp+=" and category_sub=?";
		}
		//브랜드가 null이 아닐 때만 브랜드를 쿼리문에 셋팅
		if(brands!=null){
			
			//첫번째 브랜드 먼저 셋팅
			sql_temp+=" and brand in('"+brands[0]+"'";
			
			//남은브랜드와 쉼표 셋팅
			for(int i = 1; i<brands.length; i++){
				sql_temp+=", '"+brands[i]+"'";
			}
			//괄호닫기
			sql_temp+=") ";
		}
		
		return sql_temp;
	}

	public Vector<String> getMainList() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		Vector<String> v = new Vector<String>();
		
		try {
			con = getConnection();
			
			sql = "select distinct category_main from product";
			
			pstmt = con.prepareStatement(sql);

			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				v.add(rs.getString(1));
			}
			
		} catch (Exception e) {
			System.out.println("getMainList()메소드 내부에서의 오류 : " + e);
		} finally{
			if(pstmt!=null){ try{pstmt.close();} catch(Exception e){e.printStackTrace();}}
			if(con!=null){ try{con.close();} catch(Exception e){e.printStackTrace();}}
			if(rs!=null){ try{rs.close();} catch(Exception e){e.printStackTrace();}}
		}

		return v;
	}

	public ProductDTO getAd(String category_main) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		ProductDTO pdto = new ProductDTO();
		
		try {
			con = getConnection();
			
			sql = "select * from product where category_main = ? and product_count > 0 order by price_count desc limit 0, 1";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, category_main);

			
			rs = pstmt.executeQuery();
			
			if(rs.next()){

				pdto.setProduct_num(rs.getInt("product_num"));
				pdto.setProduct_name(rs.getString("product_name"));
				pdto.setProduct_price(rs.getInt("product_price"));
				pdto.setImg_main(rs.getString("img_main"));
				pdto.setBrand(rs.getString("brand"));
				pdto.setProduct_count(rs.getInt("product_count"));
				pdto.setProduct_sale_price(rs.getInt("product_sale_price"));
			}
			
		} catch (Exception e) {
			System.out.println("getAd()메소드 내부에서의 오류 : " + e);
		} finally{
			if(pstmt!=null){ try{pstmt.close();} catch(Exception e){e.printStackTrace();}}
			if(con!=null){ try{con.close();} catch(Exception e){e.printStackTrace();}}
			if(rs!=null){ try{rs.close();} catch(Exception e){e.printStackTrace();}}
		}

		return pdto;
	}


// 관리자용 함수
   public void modifyProduct(ProductDTO pdto){
       Connection con = null;
       PreparedStatement pstmt = null;
       String sql = "";
       
		try {
			sql = "update product set product_name=?, product_subname=?, brand=?, product_price=?,"
				+" img_main=?, img_contents=?, category_main=?, category_sub=?, product_sale_price=?,"
				+" price_count=?, product_count=?"
				+" where product_num=?";
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, pdto.getProduct_name());
			pstmt.setString(2, pdto.getProduct_subname());
			pstmt.setString(3, pdto.getBrand());
			pstmt.setInt(4, pdto.getProduct_price());
			pstmt.setString(5, pdto.getImg_main());
			pstmt.setString(6, pdto.getImg_contents());
			pstmt.setString(7, pdto.getCategory_main());
			pstmt.setString(8, pdto.getCategory_sub());
			pstmt.setInt(9, pdto.getProduct_sale_price());
			pstmt.setInt(10, pdto.getPrice_count());
			pstmt.setInt(11, pdto.getProduct_count());
			pstmt.setInt(12, pdto.getProduct_num());
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("modifyProduct메소드 내부에서 오류 : " + e);
		} finally {
			if(pstmt != null){try{pstmt.close();}catch(Exception err){err.printStackTrace();}}
			if(con != null){try{con.close();}catch (Exception err){err.printStackTrace();}}
		}
		
	}
   
   public ProductDTO getProductInfo(int num){
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "";
       ProductDTO pdto = null;
       
    try {
		con = getConnection();
		
		sql = "select * from product where product_num = ?";
		
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, num);
		rs = pstmt.executeQuery();
		
		if(rs.next()){
		  pdto = new ProductDTO();
  		  
		  pdto.setProduct_num(rs.getInt("product_num"));
  		  pdto.setProduct_name(rs.getString("product_name"));
  		  pdto.setProduct_subname(rs.getString("product_subname"));
  		  pdto.setProduct_price(rs.getInt("product_price"));
  		  pdto.setBrand(rs.getString("brand"));
  		  pdto.setImg_main(rs.getString("img_main"));
  		  pdto.setImg_contents(rs.getString("img_contents"));
  		  pdto.setCategory_main(rs.getString("category_main"));
  		  pdto.setCategory_sub(rs.getString("category_sub"));
  		  pdto.setProduct_sale_price(rs.getInt("product_sale_price"));
  		  
		}
		
	  return pdto;

	} catch (Exception e) {
        System.out.println("getProductInfo()메소드 내부에서의 오류 : " + e);
	} finally{
        if(pstmt!=null){ try{pstmt.close();} catch(Exception e){e.printStackTrace();}}
        if(con!=null){ try{con.close();} catch(Exception e){e.printStackTrace();}}
        if(rs!=null){ try{rs.close();} catch(Exception e){e.printStackTrace();}}
    }
	   
	   return pdto;
   }
   
   public ArrayList<ProductDTO> getProductList(){
	   
	   ArrayList<ProductDTO> productList = new ArrayList<ProductDTO>();
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "";
       ProductDTO pdto = null;
       
       try {
    	  con = getConnection();
    	  
    	  con.setAutoCommit(false);
    	  
    	  sql = "select * from product";
    	  pstmt = con.prepareStatement(sql);
    	  rs = pstmt.executeQuery();
    	  
    	  
    	   
    	  while(rs.next()){
    		  
    		  pdto = new ProductDTO();
    		  
    		  pdto.setProduct_num(rs.getInt("product_num"));
    		  pdto.setProduct_name(rs.getString("product_name"));
    		  pdto.setProduct_subname(rs.getString("product_subname"));
    		  pdto.setProduct_price(rs.getInt("product_price"));
    		  pdto.setBrand(rs.getString("brand"));
    		  pdto.setImg_main(rs.getString("img_main"));
    		  pdto.setImg_contents(rs.getString("img_contents"));
    		  pdto.setCategory_main(rs.getString("category_main"));
    		  pdto.setCategory_sub(rs.getString("category_sub"));
    		  pdto.setPrice_count(rs.getInt("price_count"));
    		  pdto.setProduct_sale_price(rs.getInt("product_sale_price"));
    		  pdto.setProduct_count(rs.getInt("product_count"));
    		  
    		  productList.add(pdto);
    	  }
    	   
       } catch (Exception e) {
           System.out.println("getProductList()메소드 내부에서의 오류 : " + e);
       } finally{
           if(pstmt!=null){ try{pstmt.close();} catch(Exception e){e.printStackTrace();}}
           if(con!=null){ try{con.close();} catch(Exception e){e.printStackTrace();}}
           if(rs!=null){ try{rs.close();} catch(Exception e){e.printStackTrace();}}
        }
       
	return productList;
	   
   }
   public int deleteProduct(int num) {
	   
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "";
       
       int check = 0;
       
    try {
		con = getConnection();
		
		sql = "delete from product where product_num = ?";
		
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, num);
		check = pstmt.executeUpdate();
		
		
		
	} catch (Exception e) {
		e.printStackTrace();
	}
	   
       return check;
   }
   
   public boolean insertProduct(ProductDTO pdto) {
	Connection con = null;
	PreparedStatement pstmt = null;
	String sql = "";

	      int result = 0; // 회원가입 성공여부

	      try {
	         // 예외가 발생할 명령문
	         // 1단계 드라이버로더 // 2단계 디비연결 => 연결정보 저장
	         con = getConnection();
	         // out.println("연결성공");
	         // 3단계 sql 객체 생성
	         // Statement PreparedStatement CallableStatement
	         // sql="insert into 테이블이름(열이름,...) values(값,값)";
	         sql = "insert into product(product_name,product_subname,product_price,brand,img_main,img_contents,category_main,category_sub,price_count,product_sale_price,product_count) values(?,?,?,?,?,?,?,?,?,?,?)";
	         pstmt = con.prepareStatement(sql);

	         pstmt.setString(1,pdto.getProduct_name()); //1 물음표 위치
	         pstmt.setString(2, pdto.getProduct_subname());
	         pstmt.setInt(3, pdto.getProduct_price());
	         pstmt.setString(4, pdto.getBrand());
	         pstmt.setString(5, pdto.getImg_main());
	         pstmt.setString(6, pdto.getImg_contents());
	         pstmt.setString(7, pdto.getCategory_main());
	         pstmt.setString(8, pdto.getCategory_sub());
	         pstmt.setInt(9, pdto.getPrice_count());
	         pstmt.setInt(10, pdto.getProduct_sale_price());
	         pstmt.setInt(11, pdto.getProduct_count());
	         
	         // 4단계 실행
	         result = pstmt.executeUpdate(); // 회원가입 성공하면 1리턴, 실패시0리턴

	         // 만약 회원가입에 성공하면.. true리턴
	         if (result != 0) {
	            return true;
	         }
	      } catch (Exception e) {
	         // 예외처리
	         e.printStackTrace();
	      } finally {
	         // 예외상관없이 마무리 작업
	         if (pstmt != null)try { pstmt.close();} catch (SQLException ex){}
	         if (con != null)try {con.close();} catch (SQLException ex) {}
	      }

	      return false; // 회원가입 실패시! false리턴

	   }// insertProduct()메소드
   
	
	
}
