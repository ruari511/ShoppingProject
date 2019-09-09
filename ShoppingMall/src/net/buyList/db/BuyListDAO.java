package net.buyList.db;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

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
	
	public BuyListDTO getBuyList(int buynum){
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		BuyListDTO buyDTO = null;
		
		try {
			con = getConnection();
			
			sql  = "select distinct * from buylist where buynum=?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, buynum);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				
				buyDTO = new BuyListDTO();
				
				buyDTO.setBuynum(rs.getInt("buynum"));
				buyDTO.setDelivery_name(rs.getString("delivery_name"));
				buyDTO.setDelivery_mtel(rs.getString("delivery_mtel"));
				buyDTO.setDelivery_address(rs.getString("delivery_address"));
				
			}//while문 끝
			
		} catch (Exception e) {
			System.out.println("getAllBuyList()메소드 내부에서의 오류 : " + e);
		} finally{
			if(pstmt!=null){ try{pstmt.close();} catch(Exception e){e.printStackTrace();}}
			if(con!=null){ try{con.close();} catch(Exception e){e.printStackTrace();}}
			if(rs!=null){ try{rs.close();} catch(Exception e){e.printStackTrace();}}
		}
	
		return buyDTO;
	}//getCartList() 메소드 끝
	
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
	
	public int buytotalprice(int buynum){
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		int totalprice=0;
		
		try {
			
			con = getConnection();
			
			sql  = "select sum((p.product_price-p.product_sale_price)*b.product_count) "
				 + "from product p join buylist b "
				 + "on p.product_num=b.product_num "
				 + "where b.buynum=?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, buynum);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				totalprice = rs.getInt(1);
			} else{
				totalprice = 0;
			}
			
		} catch (Exception e) {
			System.out.println("buytotalprice()메소드 내부의 오류 : " + e);
		} finally {
			if(pstmt!=null){ try{pstmt.close();} catch(Exception e){e.printStackTrace();}}
			if(con!=null){ try{con.close();} catch(Exception e){e.printStackTrace();}}
			if(rs!=null){ try{rs.close();} catch(Exception e){e.printStackTrace();}}
		}
		
		return totalprice;
	}
	
	public int buytotalsaleprice(int buynum, int limit){
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		int totalsaleprice=0;
		
		try {
			
			con = getConnection();
			
			sql  = "select distinct (select sum((p.product_price-p.product_sale_price)*b.product_count) "
				 + "from product p join buylist b "
				 + "on p.product_num=b.product_num "
				 + "where b.buynum=?)/100*("
				 + "select distinct c.coupon_percent "
				 + "from coupon c join buylist b "
				 + "on c.coupon_num=b.all_coupon_num "
				 + "where b.buynum=?) as sale "
				 + "from buylist "
				 + "where buynum=?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, buynum);
			pstmt.setInt(2, buynum);
			pstmt.setInt(3, buynum);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				if(rs.getInt(1)>limit)
				totalsaleprice = limit;
			} else{
				totalsaleprice = rs.getInt(1);
			}
			
		} catch (Exception e) {
			System.out.println("buytotalsaleprice()메소드 내부의 오류 : " + e);
		} finally {
			if(pstmt!=null){ try{pstmt.close();} catch(Exception e){e.printStackTrace();}}
			if(con!=null){ try{con.close();} catch(Exception e){e.printStackTrace();}}
			if(rs!=null){ try{rs.close();} catch(Exception e){e.printStackTrace();}}
		}
		
		return totalsaleprice;
	}
	
	public int coupon_limitmax(int buynum){
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		int limit=0;
		
		try {
			con = getConnection();
			
			sql = "select distinct c.coupon_limitmax "
				+ "from coupon c join buylist b "
				+ "on c.coupon_num=b.all_coupon_num "
				+ "where b.buynum=?";
			pstmt = con.prepareStatement(sql);
				
			pstmt.setInt(1, buynum);
			
			rs = pstmt.executeQuery();
				
			if(rs.next()){
				limit = rs.getInt(1);
			}
			
		} catch (Exception e) {
			System.out.println("coupon_limitmax()메소드 내부의 오류 : " + e);
		} finally {
			if(pstmt!=null){ try{pstmt.close();} catch(Exception e){e.printStackTrace();}}
			if(con!=null){ try{con.close();} catch(Exception e){e.printStackTrace();}}
			if(rs!=null){ try{rs.close();} catch(Exception e){e.printStackTrace();}}
		}
		
		return limit;
	}
	
	public int inpoint(int buynum){
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		int point=0;
		
		try {
			con = getConnection();
			
			sql = "select point from buylist where buynum=?";
			pstmt = con.prepareStatement(sql);
				
			pstmt.setInt(1, buynum);
			
			rs = pstmt.executeQuery();
				
			if(rs.next()){
				point = rs.getInt(1);
			}
			
		} catch (Exception e) {
			System.out.println("inpoint()메소드 내부의 오류 : " + e);
		} finally {
			if(pstmt!=null){ try{pstmt.close();} catch(Exception e){e.printStackTrace();}}
			if(con!=null){ try{con.close();} catch(Exception e){e.printStackTrace();}}
			if(rs!=null){ try{rs.close();} catch(Exception e){e.printStackTrace();}}
		}
		
		return point;
	}
	
	public int delivery_cost(int buynum){
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		int delivery_cost=0;
		
		try {
			con = getConnection();
			
			sql = "select delivery_cost from buylist where buynum=?";
			pstmt = con.prepareStatement(sql);
				
			pstmt.setInt(1, buynum);
			
			rs = pstmt.executeQuery();
				
			if(rs.next()){
				delivery_cost = rs.getInt(1);
			}
			
		} catch (Exception e) {
			System.out.println("delivery_cost()메소드 내부의 오류 : " + e);
		} finally {
			if(pstmt!=null){ try{pstmt.close();} catch(Exception e){e.printStackTrace();}}
			if(con!=null){ try{con.close();} catch(Exception e){e.printStackTrace();}}
			if(rs!=null){ try{rs.close();} catch(Exception e){e.printStackTrace();}}
		}
		
		return delivery_cost;
	}
	
	/* Mypage_AllBuyList */
	public Vector<BuyListDTO> getAllBuyList(String startdate, String enddate){
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		Vector<BuyListDTO> buyList = new Vector<BuyListDTO>();
		try {
			con = getConnection();
			
			sql  = "select * from buylist natural join product where buydate between ? and ? order by buynum asc";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, startdate);
			pstmt.setString(2, enddate);
			
			rs = pstmt.executeQuery();
			while(rs.next()){
				
				BuyListDTO buylistDTO = new BuyListDTO();
				
				buylistDTO.setProduct_num(rs.getInt("product_num"));
				buylistDTO.setBuynum(rs.getInt("buynum"));
				buylistDTO.setProduct_name(rs.getString("product_name"));
				buylistDTO.setProduct_price(rs.getInt("product_price"));
				buylistDTO.setProduct_sale_price(rs.getInt("product_sale_price"));
				buylistDTO.setPoint(rs.getInt("buylist.point"));
				buylistDTO.setBuynum(rs.getInt("buynum"));
				buylistDTO.setOrder_name(rs.getString("order_name"));
				buylistDTO.setId(rs.getString("id"));
				buylistDTO.setOrder_mtel(rs.getString("order_mtel"));
				buylistDTO.setOrder_email(rs.getString("order_email"));
				buylistDTO.setBuydate(rs.getString("buydate"));
				buylistDTO.setProduct_num(rs.getInt("product_num"));
				buylistDTO.setBuy_count(rs.getInt("buy_count"));
				buylistDTO.setAll_coupon_num(rs.getInt("all_coupon_num"));
				buylistDTO.setDelivery_cost(rs.getInt("delivery_cost"));
				buylistDTO.setDelivery_result(rs.getString("delivery_result"));
				buylistDTO.setDelivery_name(rs.getString("delivery_name"));
				buylistDTO.setDelivery_mtel(rs.getString("delivery_mtel"));
				buylistDTO.setDelivery_address(rs.getString("delivery_address"));
				buylistDTO.setDelivery_message(rs.getString("delivery_message"));
				buylistDTO.setPayments(rs.getString("payments"));
				buylistDTO.setImg_main(rs.getString("img_main"));
				
				buyList.add(buylistDTO);
			}
		} catch (Exception e) {
			System.out.println("getBuyList() error :" + e);
		} finally{
			if(pstmt!=null){ try{pstmt.close();} catch(Exception e){e.printStackTrace();}}
			if(con!=null){ try{con.close();} catch(Exception e){e.printStackTrace();}}
			if(rs!=null){ try{rs.close();} catch(Exception e){e.printStackTrace();}}
		}
		return buyList;
	}//getAllBuyList()
	
	
public Vector<BuyListDTO> getBuyList(String id, String startdate, String enddate){
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		Vector<BuyListDTO> buyList = new Vector<BuyListDTO>();
		try {
			con = getConnection();
			
			sql  = "select * from buylist natural join product where id=? and buydate between ? and now() order by buydate desc";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, startdate);
			
			rs = pstmt.executeQuery();
			while(rs.next()){
				
				BuyListDTO buylistDTO = new BuyListDTO();
				buylistDTO.setId(rs.getString("id"));
				buylistDTO.setProduct_num(rs.getInt("product_num"));
				buylistDTO.setBuynum(rs.getInt("buynum"));
				buylistDTO.setProduct_name(rs.getString("product_name"));
				buylistDTO.setProduct_price(rs.getInt("product_price"));
				buylistDTO.setProduct_sale_price(rs.getInt("product_sale_price"));
				buylistDTO.setPoint(rs.getInt("buylist.point"));
				buylistDTO.setOrder_name(rs.getString("order_name"));
				buylistDTO.setOrder_mtel(rs.getString("order_mtel"));
				buylistDTO.setOrder_email(rs.getString("order_email"));
				buylistDTO.setBuydate(rs.getString("buydate"));
				buylistDTO.setProduct_num(rs.getInt("product_num"));
				buylistDTO.setBuy_count(rs.getInt("buy_count"));
				buylistDTO.setAll_coupon_num(rs.getInt("all_coupon_num"));
				buylistDTO.setDelivery_cost(rs.getInt("delivery_cost"));
				buylistDTO.setDelivery_result(rs.getString("delivery_result"));
				buylistDTO.setDelivery_name(rs.getString("delivery_name"));
				buylistDTO.setDelivery_mtel(rs.getString("delivery_mtel"));
				buylistDTO.setDelivery_address(rs.getString("delivery_address"));
				buylistDTO.setDelivery_message(rs.getString("delivery_message"));
				buylistDTO.setPayments(rs.getString("payments"));
				buylistDTO.setImg_main(rs.getString("img_main"));
				
				buyList.add(buylistDTO);
			}
		} catch (Exception e) {
			System.out.println("getBuyList() error :" + e);
		} finally{
			if(pstmt!=null){ try{pstmt.close();} catch(Exception e){e.printStackTrace();}}
			if(con!=null){ try{con.close();} catch(Exception e){e.printStackTrace();}}
			if(rs!=null){ try{rs.close();} catch(Exception e){e.printStackTrace();}}
		}
		return buyList;
	}


	
	/* Mypage_BuyList */
	public Vector<BuyListDTO> getCancelList(String id, String startdate, String enddate){
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		Vector<BuyListDTO> buyList = new Vector<BuyListDTO>();
		try {
			con = getConnection();
			
			sql  = "select * from buylist natural join product where id=? and delivery_result = '주문취소' and buydate between ? and ?  order by buynum asc";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, startdate);
			pstmt.setString(3, enddate);
			
			rs = pstmt.executeQuery();
			while(rs.next()){
				
				BuyListDTO buylistDTO = new BuyListDTO();
				buylistDTO.setId(rs.getString("id"));
				buylistDTO.setProduct_num(rs.getInt("product_num"));
				buylistDTO.setBuynum(rs.getInt("buynum"));
				buylistDTO.setProduct_name(rs.getString("product_name"));
				buylistDTO.setProduct_price(rs.getInt("product_price"));
				buylistDTO.setProduct_sale_price(rs.getInt("product_sale_price"));
				buylistDTO.setPoint(rs.getInt("buylist.point"));
				buylistDTO.setOrder_name(rs.getString("order_name"));
				buylistDTO.setOrder_mtel(rs.getString("order_mtel"));
				buylistDTO.setOrder_email(rs.getString("order_email"));
				buylistDTO.setBuydate(rs.getString("buydate"));
				buylistDTO.setProduct_num(rs.getInt("product_num"));
				buylistDTO.setBuy_count(rs.getInt("buy_count"));
				buylistDTO.setAll_coupon_num(rs.getInt("all_coupon_num"));
				buylistDTO.setDelivery_cost(rs.getInt("delivery_cost"));
				buylistDTO.setDelivery_result(rs.getString("delivery_result"));
				buylistDTO.setDelivery_name(rs.getString("delivery_name"));
				buylistDTO.setDelivery_mtel(rs.getString("delivery_mtel"));
				buylistDTO.setDelivery_address(rs.getString("delivery_address"));
				buylistDTO.setDelivery_message(rs.getString("delivery_message"));
				buylistDTO.setPayments(rs.getString("payments"));
				buylistDTO.setImg_main(rs.getString("img_main"));
				
				buyList.add(buylistDTO);
			}
		} catch (Exception e) {
			System.out.println("getBuyList() error :" + e);
		} finally{
			if(pstmt!=null){ try{pstmt.close();} catch(Exception e){e.printStackTrace();}}
			if(con!=null){ try{con.close();} catch(Exception e){e.printStackTrace();}}
			if(rs!=null){ try{rs.close();} catch(Exception e){e.printStackTrace();}}
		}
		return buyList;
	}//getCancelList()
		
	
	public int getBuyListCount(String id, String startdate, String enddate){
		Connection con=null;
		PreparedStatement pstmt=null;
		String sql="";
		ResultSet rs=null;
		int count=0;
		try {
			con=getConnection();
			sql="select count(*)  from buylist natural join product where id=? and buydate between ? and ?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, startdate);
			pstmt.setString(3, enddate);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()){
				count=rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(rs!=null)try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
			if(con!=null)try{con.close();}catch(SQLException ex){}
		}
		return count;
	}
	
	
	
	/* Mypage_BuyDetail */
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
					buylistDTO.setProduct_sale_price(rs.getInt("product_sale_price"));
					buylistDTO.setPoint(rs.getInt("buylist.point"));
					buylistDTO.setBuynum(rs.getInt("buynum"));
					buylistDTO.setOrder_name(rs.getString("order_name"));
					buylistDTO.setOrder_mtel(rs.getString("order_mtel"));
					buylistDTO.setOrder_email(rs.getString("order_email"));
					buylistDTO.setBuydate(rs.getString("buydate"));
					buylistDTO.setProduct_num(rs.getInt("product_num"));
					buylistDTO.setBuy_count(rs.getInt("buy_count"));
					buylistDTO.setAll_coupon_num(rs.getInt("all_coupon_num"));
					buylistDTO.setDelivery_cost(rs.getInt("delivery_cost"));
					buylistDTO.setDelivery_result(rs.getString("delivery_result"));
					buylistDTO.setDelivery_name(rs.getString("delivery_name"));
					buylistDTO.setDelivery_mtel(rs.getString("delivery_mtel"));
					buylistDTO.setDelivery_address(rs.getString("delivery_address"));
					buylistDTO.setDelivery_message(rs.getString("delivery_message"));
					buylistDTO.setPayments(rs.getString("payments"));
					buylistDTO.setImg_main(rs.getString("img_main"));
					
					
					buyList.add(buylistDTO);
				}
				
			} catch (Exception e) {
				System.out.println("getBuyList() error :" + e);
			} finally{
				if(pstmt!=null){ try{pstmt.close();} catch(Exception e){e.printStackTrace();}}
				if(con!=null){ try{con.close();} catch(Exception e){e.printStackTrace();}}
				if(rs!=null){ try{rs.close();} catch(Exception e){e.printStackTrace();}}
			}
			return buyList;
		}//getBuyList()
	
	/* Mypage_BuyDetail */
	public Vector<BuyListDTO> getBuyCancelProcess(String id, int buynum){
			
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = "";
			Vector<BuyListDTO> buyList = new Vector<BuyListDTO>();
			
			try {
				con = getConnection();
				
				sql  = "select * from buylist natural join product where id=? and buynum=? and delivery_result ='배송완료'";
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
					buylistDTO.setProduct_sale_price(rs.getInt("product_sale_price"));
					buylistDTO.setPoint(rs.getInt("buylist.point"));
					buylistDTO.setBuynum(rs.getInt("buynum"));
					buylistDTO.setOrder_name(rs.getString("order_name"));
					buylistDTO.setOrder_mtel(rs.getString("order_mtel"));
					buylistDTO.setOrder_email(rs.getString("order_email"));
					buylistDTO.setBuydate(rs.getString("buydate"));
					buylistDTO.setProduct_num(rs.getInt("product_num"));
					buylistDTO.setBuy_count(rs.getInt("buy_count"));
					buylistDTO.setAll_coupon_num(rs.getInt("all_coupon_num"));
					buylistDTO.setDelivery_cost(rs.getInt("delivery_cost"));
					buylistDTO.setDelivery_result(rs.getString("delivery_result"));
					buylistDTO.setDelivery_name(rs.getString("delivery_name"));
					buylistDTO.setDelivery_mtel(rs.getString("delivery_mtel"));
					buylistDTO.setDelivery_address(rs.getString("delivery_address"));
					buylistDTO.setDelivery_message(rs.getString("delivery_message"));
					buylistDTO.setPayments(rs.getString("payments"));
					buylistDTO.setImg_main(rs.getString("img_main"));
					
					
					buyList.add(buylistDTO);
				}
				
			} catch (Exception e) {
				System.out.println("getBuyList() error :" + e);
			} finally{
				if(pstmt!=null){ try{pstmt.close();} catch(Exception e){e.printStackTrace();}}
				if(con!=null){ try{con.close();} catch(Exception e){e.printStackTrace();}}
				if(rs!=null){ try{rs.close();} catch(Exception e){e.printStackTrace();}}
			}
			return buyList;
		}//getBuyCancelProcess()
	
	public void updateBuyCancel(int buynum, int product_num){
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "";
		BuyListDTO buyList = new BuyListDTO();
		
		
		try {
			con = getConnection();
			
			sql  = "update buylist set delivery_result = '주문취소' where buynum = ? and product_num = ?";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, buynum);
			pstmt.setInt(2, product_num);
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("updateBuylist() error :" + e);
		} finally{
			if(pstmt!=null){ try{pstmt.close();} catch(Exception e){e.printStackTrace();}}
			if(con!=null){ try{con.close();} catch(Exception e){e.printStackTrace();}}
		}
	}
	
	public void updateBuylist(int buynum, int product_num, String delivery_result){
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "";
		BuyListDTO buyList = new BuyListDTO();
		
		
		try {
			con = getConnection();
			
			sql  = "update buylist set delivery_result = ? where buynum = ? and product_num = ?";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, delivery_result);
			pstmt.setInt(2, buynum);
			pstmt.setInt(3, product_num);
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("updateBuylist() error :" + e);
		} finally{
			if(pstmt!=null){ try{pstmt.close();} catch(Exception e){e.printStackTrace();}}
			if(con!=null){ try{con.close();} catch(Exception e){e.printStackTrace();}}
		}
	}
	
}
