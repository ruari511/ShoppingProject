package member;

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

import member.MemberDTO;

public class MemberDAO {
	//DB占쎈염野껓옙 筌롫뗄�꺖占쎈굡
	private Connection getConnection() throws Exception {
		Connection con=null;
		Context init=new InitialContext();
		DataSource ds=(DataSource)init.lookup("java:comp/env/jdbc/shoppingmall");
		con=ds.getConnection();
		return con;
		
	}
	//�븘�씠�뵒 以묐났泥댄겕瑜� �쐞�븳 硫붿냼�뱶 
	//MemberServlet�꽌釉붾┸ �겢�옒�뒪濡쒕��꽣 �쟾�떖�맂 ID濡�  SQL臾몄쓽 議곌굔�떇�뿉 �꽕�젙�븳�썑
	//ID�뿉 ���븳 �쉶�썝�젙蹂대�� 議고쉶�븯�뿬 洹멸껐怨쇰�� true�삉�뒗 false濡� 諛섑솚�븿.
	public int overlappedID(String id) {
		int result = 0;
		
		try {
			Connection con = null;
			String sql = "";
			PreparedStatement pstmt = null;
			con = getConnection();
			
			String query = "select if(count(*)>0,'1','0') as result from member";
				   query += " where id=?";
				   // 중복되는게 있으면 1, 중복되느게 없으면 0
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			result = rs.getInt("result");   
			pstmt.close();
			rs.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public int overlappedPhone(String phone) {
		int result = 0;
		
		try {
			Connection con = null;
			String sql = "";
			PreparedStatement pstmt = null;
			con = getConnection();
			
			String query = "select if(count(*)>0,'1','0') as result from member";
				   query += " where phone=?";
				   // 중복되는게 있으면 1, 중복되느게 없으면 0
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, phone);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			result = rs.getInt("result");   
			pstmt.close();
			rs.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
		
	
	/*嚥≪뮄�젃占쎌뵥 筌ｌ꼶�봺占쎈뻻.. 占쎄텢占쎌뒠占쎈릭占쎈뮉 筌롫뗄�꺖占쎈굡*/
	//login.jsp占쎈퓠占쎄퐣 占쎄텢占쎌뒠占쎌쁽嚥≪뮆占쏙옙苑� 占쎌뿯占쎌젾獄쏆룇占� id,passwd揶쏅�⑤궢 DB占쎈퓠 占쎌뿳占쎈뮉 id,passwd揶쏅�れ뱽 占쎌넇占쎌뵥占쎈릭占쎈연 嚥≪뮄�젃占쎌뵥筌ｌ꼶�봺
	public int userCheck(String id,String pass){
		Connection con=null;
		String sql="";
		PreparedStatement pstmt=null;
		int check=-1;//1 -> 占쎈툡占쎌뵠占쎈탵, �뜮袁⑨옙甕곕뜇�깈 筌띿쉸�벉
					//0 -> 占쎈툡占쎌뵠占쎈탵 筌띿쉸�벉, �뜮袁⑨옙甕곕뜇�깈 占쏙옙�뵳占�
					//-1 -> 占쎈툡占쎌뵠占쎈탵 占쏙옙�뵳占�
		ResultSet rs=null;
		try {
			//1占쎈뼊�⑨옙 占쎈굡占쎌뵬占쎌뵠甕곌쑬以덌옙�쐭
			//2占쎈뼊�⑨옙 占쎈탵�뜮袁⑸염野껓옙
			con=getConnection();
			//3占쎈뼊�⑨옙 sql : id占쎈퓠 占쎈퉸占쎈뼣占쎈릭占쎈뮉 passwd 揶쏉옙占쎌죬占쎌궎疫뀐옙
			sql="select password from member where id=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			//4占쎈뼊�⑨옙 rs = 占쎈뼄占쎈뻬
			rs=pstmt.executeQuery();
			//5占쎈뼊�⑨옙 rs 筌ｃ꺂苡뀐쭪紐낅뻬 占쎌뵠占쎈짗占쎈릭占쎈연.. id占쎈퓠 占쎈퉸占쎈뼣占쎈릭占쎈뮉 占쎈쑓占쎌뵠占쎄숲揶쏉옙 pass揶쏉옙 占쎌뿳占쎌몵筌롳옙.
			if(rs.next()){
				//嚥≪뮄�젃占쎌뵥占쎈뻻.. 占쎌뿯占쎌젻占쎈립 pass占쏙옙  DB占쎈퓠 占쏙옙占쎌삢占쎈┷占쎈선 占쎌뿳占쎈뮉 pass揶쏉옙 揶쏆늿�몵筌롳옙
				if(pass.equals(rs.getString("pass"))){
					check=1;//占쎈툡占쎌뵠占쎈탵 筌띿쉸�벉,�뜮袁⑨옙甕곕뜇�깈 筌띿쉸�벉 占쎈솇癰귢쑨而� 占쏙옙占쎌삢
				//�뜮袁⑨옙甕곕뜇�깈揶쏉옙 占쏙옙�뵳�됥늺
				}else{
					check=0;//占쎈툡占쎌뵠占쎈탵 筌띿쉸�벉, �뜮袁⑨옙甕곕뜇�깈占쏙옙�뵳占� 占쎈솇癰귢쑨而� 占쏙옙占쎌삢
				}
			//id占쎈퓠 占쎈퉸占쎈뼣占쎈릭占쎈뮉 占쎈쑓占쎌뵠占쎄숲揶쏉옙 pass揶쏉옙 占쎈씨占쎌몵筌롳옙(占쎈툡占쎌뵠占쎈탵揶쏉옙 占쎈씨占쎈뼄占쎈뮉 占쎌몴�⑨옙 揶쏆늿�벉)	
			}else{
				check=-1; //占쎈툡占쎌뵠占쎈탵 占쎈씨占쎌벉 占쎈솇癰귢쑨而� 占쏙옙占쎌삢
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			//筌띾뜄龜�뵳占�
			if(rs!=null)try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
			if(con!=null)try{con.close();}catch(SQLException ex){}
		}
		return check;
	}


	public boolean insertMember(MemberDTO dto) {
		// 占쎈탵�뜮占� 占쎈염占쎈짗占쎈릭占쎈뮉 占쎈늄嚥≪뮄�젃占쎌삪 占쎄퐬燁삼옙 (JDBC)
		// JSP2 - WebContent - WEB-INF - lib -
		// mysql-connector-java-5.1.39-bin.jar
		// com占쎈쨨占쎈쐭 mysql 占쎈쨨占쎈쐭 jdbc 占쎈쨨占쎈쐭 Driver.java
		Connection con = null;
		String sql = "";
		PreparedStatement pstmt = null;

		int result = 0; // 占쎌돳占쎌뜚揶쏉옙占쎌뿯 占쎄쉐�⑤벊肉ч겫占�

		try {
			// 占쎌굙占쎌뇚揶쏉옙 獄쏆뮇源�占쎈막 筌뤿굝議딂눧占�
			// 1占쎈뼊�⑨옙 占쎈굡占쎌뵬占쎌뵠甕곌쑬以덌옙�쐭 // 2占쎈뼊�⑨옙 占쎈탵�뜮袁⑸염野껓옙 => 占쎈염野껉퀣�젟癰귨옙 占쏙옙占쎌삢
			con = getConnection();
			// out.println("占쎈염野껉퀣苑��⑨옙");
			// 3占쎈뼊�⑨옙 sql 揶쏆빘猿� 占쎄문占쎄쉐
			// Statement PreparedStatement CallableStatement
			// String sql="insert into 占쎈�믭옙�뵠�뇡遺우뵠�뵳占�(占쎈였占쎌뵠�뵳占�,...) values(揶쏉옙,揶쏉옙)";
			sql = "insert into member(id,password,name,birth_date,gender,email,reg_date,address_main,address_detail,tel,phone,grade,totalprice,point) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1,dto.getId()); //1 �눧�눘�벉占쎈ご 占쎌맄燁삼옙
			pstmt.setString(2,dto.getPassword()); //2 �눧�눘�벉占쎈ご 占쎌맄燁삼옙
			pstmt.setString(3,dto.getName()); //3 �눧�눘�벉占쎈ご 占쎌맄燁삼옙
			 pstmt.setString(4,dto.getBirth_date()); //4 �눧�눘�벉占쎈ご 占쎌맄燁삼옙
			 pstmt.setString(5,dto.getGender()); //5 �눧�눘�벉占쎈ご 占쎌맄燁삼옙
			 pstmt.setString(6, dto.getEmail());
			 pstmt.setTimestamp(7, dto.getReg_date());
			 pstmt.setString(8, dto.getAddress_main());
			 pstmt.setString(9, dto.getAddress_detail());
			 pstmt.setString(10, dto.getTel());
			 pstmt.setString(11, dto.getPhone());
			 pstmt.setString(12, "bronze");
			 pstmt.setInt(13,0);
			 pstmt.setInt(14,0);

			// 4占쎈뼊�⑨옙 占쎈뼄占쎈뻬
			result = pstmt.executeUpdate(); // 占쎌돳占쎌뜚揶쏉옙占쎌뿯 占쎄쉐�⑤벏釉�筌롳옙 1�뵳�뗪쉘, 占쎈뼄占쎈솭占쎈뻻0�뵳�뗪쉘

			// 筌띾슣鍮� 占쎌돳占쎌뜚揶쏉옙占쎌뿯占쎈퓠 占쎄쉐�⑤벏釉�筌롳옙.. true�뵳�뗪쉘
			if (result != 0) {
				return true;
			}
		} catch (Exception e) {
			// 占쎌굙占쎌뇚筌ｌ꼶�봺
			e.printStackTrace();
		} finally {
			// 占쎌굙占쎌뇚占쎄맒�꽴占쏙옙毓억옙�뵠 筌띾뜄龜�뵳占� 占쎌삂占쎈씜
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (con != null)
				try {
					con.close();
				} catch (SQLException ex) {
				}
		}

		return false; // 占쎌돳占쎌뜚揶쏉옙占쎌뿯 占쎈뼄占쎈솭占쎈뻻! false�뵳�뗪쉘

	}// insertMember()筌롫뗄�꺖占쎈굡
	
		
		
}
