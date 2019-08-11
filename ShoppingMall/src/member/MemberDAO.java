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

import cart.CartDTO;
import member.MemberDTO;

public class MemberDAO {
	
	//DB연결 메소드
	private Connection getConnection() throws Exception {
		Connection con=null;
		Context init=new InitialContext();
		DataSource ds=(DataSource)init.lookup("java:comp/env/jdbc/shoppingmall");
		con=ds.getConnection();
		return con;
		
	}
	//아이디 중복체크를 위한 메소드 
	//MemberServlet서블릿 클래스로부터 전달된 ID로  SQL문의 조건식에 설정한후
	//ID에 대한 회원정보를 조회하여 그결과를 true또는 false로 반환함.
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
	/*로그인 처리시.. 사용하는 메소드*/
	//login.jsp에서 사용자로부터 입력받은 id,passwd값과 DB에 있는 id,passwd값을 확인하여 로그인처리
	public int userCheck(String id,String pass){
		Connection con=null;
		String sql="";
		PreparedStatement pstmt=null;
		int check=-1;//1 -> 아이디, 비밀번호 맞음
					//0 -> 아이디 맞음, 비밀번호 틀림
					//-1 -> 아이디 틀림
		ResultSet rs=null;
		try {
			//1단계 드라이버로더
			//2단계 디비연결
			con=getConnection();
			//3단계 sql : id에 해당하는 passwd 가져오기
			sql="select password from member where id=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			//4단계 rs = 실행
			rs=pstmt.executeQuery();
			//5단계 rs 첫번째행 이동하여.. id에 해당하는 데이터가 pass가 있으면.
			if(rs.next()){
				//로그인시.. 입려한 pass와  DB에 저장되어 있는 pass가 같으면
				if(pass.equals(rs.getString("password"))){
					check=1;//아이디 맞음,비밀번호 맞음 판별값 저장
				//비밀번호가 틀리면
				}else{
					check=0;//아이디 맞음, 비밀번호틀림 판별값 저장
				}
			//id에 해당하는 데이터가 pass가 없으면(아이디가 없다는 뜻과 같음)	
			}else{
				check=-1; //아이디 없음 판별값 저장
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			//마무리
			if(rs!=null)try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
			if(con!=null)try{con.close();}catch(SQLException ex){}
		}
		return check;
	}


	public boolean insertMember(MemberDTO dto) {
		// 디비 연동하는 프로그램 설치 (JDBC)
		// JSP2 - WebContent - WEB-INF - lib -
		// mysql-connector-java-5.1.39-bin.jar
		// com폴더 mysql 폴더 jdbc 폴더 Driver.java
		Connection con = null;
		String sql = "";
		PreparedStatement pstmt = null;

		int result = 0; // 회원가입 성공여부

		try {
			// 예외가 발생할 명령문
			// 1단계 드라이버로더 // 2단계 디비연결 => 연결정보 저장
			con = getConnection();
			// out.println("연결성공");
			// 3단계 sql 객체 생성
			// Statement PreparedStatement CallableStatement
			// String sql="insert into 테이블이름(열이름,...) values(값,값)";
			sql = "insert into member(id,password,name,birth_date,gender,email,reg_date,address_main,address_detail,tel,phone,grade,totalprice,point) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1,dto.getId()); //1 물음표 위치
			pstmt.setString(2,dto.getPassword()); //2 물음표 위치
			pstmt.setString(3,dto.getName()); //3 물음표 위치
			 pstmt.setString(4,dto.getBirth_date()); //4 물음표 위치
			 pstmt.setString(5,dto.getGender()); //5 물음표 위치
			 pstmt.setString(6, dto.getEmail());
			 pstmt.setTimestamp(7, dto.getReg_date());
			 pstmt.setString(8, dto.getAddress_main());
			 pstmt.setString(9, dto.getAddress_detail());
			 pstmt.setString(10, dto.getTel());
			 pstmt.setString(11, dto.getPhone());
			 pstmt.setString(12, "bronze");
			 pstmt.setInt(13,0);
			 pstmt.setInt(14,0);

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

		return false; // 회원가입 실패시! false리턴

	}// insertMember()메소드




	public static MemberDAO getInstance() {
		// TODO Auto-generated method stub
		return null;
	}




	public void updateMember(MemberDTO member) {
		// TODO Auto-generated method stub
		
	}




	public MemberDTO getUserInfo(String id) {
		// TODO Auto-generated method stub
		return null;
	}
		
		




/////////2019-08-10 정현 MemberDAO////////

	
	//재료 준비
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	DataSource ds;
	String sql = "";
	
 /*
	//DB연결 메소드
	private Connection getConnection() throws Exception {
		Context ctx = new InitialContext();
		ds = (DataSource)ctx.lookup("java:comp/env/jdbc/shoppingmall");
		return ds.getConnection();
	}

*/
	
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
	
	//아이디 중복확인 메소드
	public boolean checkID(String id) {
		boolean check = false;
		
		try {
			con = getConnection();
			
			String sql = "SELECT id, password FROM member WHERE id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) check = true;
			else check = false;
		} catch(Exception e) {
			System.out.println("checkID()메서드에서 에러 : " + e);
		} finally {
			CloseDB();
		}
		
		return check;
	}
	
	//로그인 시 아이디, 비밀번호 체크 메소드
	public boolean checkLogin(String id, String pass) {
		boolean check = false;
		
		try {
			con = getConnection();
			
			String sql = "SELECT id, password FROM member WHERE id=? AND password=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pass);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) check = true;
			else check = false;
		} catch(Exception e) {
			System.out.println("checkLogin()메서드에서 에러 : " + e);
		} finally {
			CloseDB();
		}
		return check;
	}
	
	public MemberDTO selectMember(String id){
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		MemberDTO member = new MemberDTO();
		
		
		try {
			con = getConnection();
			
			sql  = "select * from member where id=?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				
				member = new MemberDTO();
				
				member.setName(rs.getString("name"));
				member.setPhone(rs.getString("phone"));
				member.setEmail(rs.getString("email"));
				member.setPoint(rs.getInt("point"));
				member.setGrade(rs.getString("grade"));
				member.setPhone(rs.getString("phone"));
				
			}//while문 끝
			
		} catch (Exception e) {
			System.out.println("selectMember()메소드 내부에서의 오류 : " + e);
		} finally{
			if(pstmt!=null){ try{pstmt.close();} catch(Exception e){e.printStackTrace();}}
			if(con!=null){ try{con.close();} catch(Exception e){e.printStackTrace();}}
			if(rs!=null){ try{rs.close();} catch(Exception e){e.printStackTrace();}}
		}
		
		return member;
	}
}
	


////////2019 -08-10 철민 MemberDAO///////////

	//아이디 중복체크를 위한 메소드 
	//MemberServlet서블릿 클래스로부터 전달된 ID로  SQL문의 조건식에 설정한후
	//ID에 대한 회원정보를 조회하여 그결과를 true또는 false로 반환함.
//	public boolean overlappedID(String id) {
//		
//		//아이디 중복 또는 중복이아니다 라는 판별값을 저장할 변수 
//		boolean result = false;
//		
//		try {
//			Connection con = null;
//			String sql = "";
//			PreparedStatement pstmt = null;
//			//커넥션풀로부터 커넥션 얻기
//			con = getConnection();
//			
//			//오라클의 decode()함수를 이용하여 서블릿에서 전달된 ID에 해당하는 데이터를 검색하여
//			//true또는 false반환하는데...
//			//검색한 갯수가 1(검색한 레코드가 존재하면)이면 true를 반환,
//			//존재 하지 않으면 false를 문자열로 반환하여 조회하는 SQL문을 작성
//			String query = "select if(count(*)>0,'true','false') as result from member";
//				   query += " where id=?";
//			pstmt = con.prepareStatement(query);
//			pstmt.setString(1, id);
//			ResultSet rs = pstmt.executeQuery();
//			rs.next();
//			result = Boolean.parseBoolean(rs.getString("result"));   
//			pstmt.close();
//			rs.close();
//			con.close();
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return result;
//	}	
//	
//	}
