package net.product.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import net.cart.db.CartDTO;
import net.member.db.MemberDTO;

public class ProductDAO {
   
   Connection con;
   PreparedStatement pstmt;
   ResultSet rs;
   DataSource ds;
   String sql = "";
   
   //DB연결 메소드
   private Connection getConnection() throws Exception {
      con=null;
      Context init=new InitialContext();
      ds=(DataSource)init.lookup("java:comp/env/jdbc/shoppingmall");
      con=ds.getConnection();
      return con;
      
   }
   
   public void modifyProduct(ProductDTO pdto){
	   con = null;
       pstmt = null;
       sql = "";
       
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
	   con = null;
       pstmt = null;
       rs = null;
       sql = "";
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
	   con = null;
       pstmt = null;
       rs = null;
       sql = "";
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
	   
	   con = null;
       pstmt = null;
       rs = null;
       sql = "";
       
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
	      con = null;
	      sql = "";
	      pstmt = null;

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