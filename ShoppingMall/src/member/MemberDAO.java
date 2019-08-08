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
	
	//DB연결 메소드
	private Connection getConnection() throws Exception {
		Connection con=null;
		Context init=new InitialContext();
		DataSource ds=(DataSource)init.lookup("java:comp/env/jdbc/shoppingmall");
		con=ds.getConnection();
		return con;
		
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
				if(pass.equals(rs.getString("pass"))){
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
		
		
}
