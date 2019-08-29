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
			sql = "select count(*) from product where (product_name like ? || product_subname like ?) && category_main=? && category_sub=? && product_price between ? and ?";
			if(cate == null || cate.length() == 0){
				
				sql = "select count(*) from product where (product_name like ? || product_subname like ?) && product_price between ? and ?";
				sql += brandquery;
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%"+query+"%");
				pstmt.setString(2, "%"+query+"%");
				pstmt.setInt(3, Integer.parseInt(low));
				pstmt.setInt(4, Integer.parseInt(high));
				
			} else if(subcate == null || subcate.length() == 0){
				
				sql = "select count(*) from product where (product_name like ? || product_subname like ?) && category_main=? && product_price between ? and ?";
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
					sql = "select distinct brand from product where (product_name like ? || product_subname like ?) && product_price between ? and ?";
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
					sql = "select distinct brand from product where (product_name like ? || product_subname like ?) && category_main=? && product_price between ? and ?";
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
					sql = "select distinct brand from product where (product_name like ? || product_subname like ?) && category_main=? && category_sub=? && product_price between ? and ?";
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
			sql = "select * from product where (product_name like ? || product_subname like ?) && category_main=? && category_sub=? && product_price between ? and ?";
			
			if(cate == null || cate.length() == 0){
				sql = "select * from product where (product_name like ? || product_subname like ?) && product_price between ? and ?";
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
				sql = "select * from product where (product_name like ? || product_subname like ?) && category_main=? && product_price between ? and ?";
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
	
	
	
	
	
}
