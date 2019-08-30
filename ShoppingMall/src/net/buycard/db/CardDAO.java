package net.buycard.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class CardDAO {
	
	DataSource ds;
	
	//DB연결 메소드
	private Connection getConnection() throws Exception {
		Context ctx = new InitialContext();
		ds = (DataSource)ctx.lookup("java:comp/env/jdbc/shoppingmall");
		return ds.getConnection();
	}
	
	public int cardCheck(CardDTO cdto){
		
		int cardCheck = 0;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		try {
			
			con = getConnection();
			sql = "select * from card where cardNum=? AND cardDate=? AND cardCvc=? AND cardPass=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, cdto.getCardNum());
			pstmt.setString(2, cdto.getCardDate());
			pstmt.setString(3, cdto.getCardCvc());
			pstmt.setString(4, cdto.getCardPass());
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				cardCheck = 1;
			}
			
		} catch (Exception e) {
			System.out.println("cardCheck()메소드 내부에서의 오류 : " + e);
		} finally{
			if(pstmt!=null){ try{pstmt.close();} catch(Exception e){e.printStackTrace();}}
			if(con!=null){ try{con.close();} catch(Exception e){e.printStackTrace();}}
			if(rs!=null){ try{rs.close();} catch(Exception e){e.printStackTrace();}}
		}
		
		return cardCheck;
	}
	
	public void BuyCardInsert(String id, int passfail, CardDTO cdto, int buynum){
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		try {
			
			con = getConnection();
			sql = "insert into buycard values(null,?,?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, cdto.getCardNum());
			pstmt.setString(3, cdto.getCardDate());
			pstmt.setString(4, cdto.getCardCvc());
			pstmt.setString(5, cdto.getCardPass());
			pstmt.setInt(6, passfail);
			pstmt.setString(7, cdto.getBank());
			pstmt.setInt(8, cdto.getInstallment());
			pstmt.setInt(9, buynum);
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("BuyCardInsert()메소드 내부에서의 오류 : " + e);
		} finally{
			if(pstmt!=null){ try{pstmt.close();} catch(Exception e){e.printStackTrace();}}
			if(con!=null){ try{con.close();} catch(Exception e){e.printStackTrace();}}
			if(rs!=null){ try{rs.close();} catch(Exception e){e.printStackTrace();}}
		}
	}
	
	public BuyCardDTO selectBuyCard(int bcnum){
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		BuyCardDTO bcDTO = new BuyCardDTO();
		
		try {
			
			con = getConnection();
			sql = "select * from buycard where bcnum=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bcnum);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				bcDTO.setBcnum(bcnum);
				bcDTO.setId(rs.getString("id"));
				bcDTO.setCardNum(rs.getString("cardNum"));
				bcDTO.setCardDate(rs.getString("cardDate"));
				bcDTO.setCardCvc(rs.getString("cardCvc"));
				bcDTO.setCardPass(rs.getString("cardPass"));
				bcDTO.setPassfail(rs.getInt("passfail"));
				bcDTO.setBank(rs.getString("bank"));
				bcDTO.setInstallment(rs.getInt("installment"));
			}
			
		} catch (Exception e) {
			System.out.println("BuyCardInsert()메소드 내부에서의 오류 : " + e);
		} finally{
			if(pstmt!=null){ try{pstmt.close();} catch(Exception e){e.printStackTrace();}}
			if(con!=null){ try{con.close();} catch(Exception e){e.printStackTrace();}}
			if(rs!=null){ try{rs.close();} catch(Exception e){e.printStackTrace();}}
		}
		
		return bcDTO;
		
	}
	
	public int maxBcNum(String id){
		
		int maxbcNum = 0;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		try {
			
			con = getConnection();
			sql = "select max(bcnum) from buycard where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				maxbcNum = rs.getInt(1);
			}
			
		} catch (Exception e) {
			System.out.println("maxBcNum()메소드 내부에서의 오류 : " + e);
		} finally{
			if(pstmt!=null){ try{pstmt.close();} catch(Exception e){e.printStackTrace();}}
			if(con!=null){ try{con.close();} catch(Exception e){e.printStackTrace();}}
			if(rs!=null){ try{rs.close();} catch(Exception e){e.printStackTrace();}}
		}
		
		return maxbcNum;
	}

}
