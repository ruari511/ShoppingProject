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
	

	
	//DB�뿰寃� 硫붿냼�뱶
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
	public boolean overlappedID(String id) {
		
		//아이디 중복 또는 중복이아니다 라는 판별값을 저장할 변수 
		boolean result = false;
		
		try {
			Connection con = null;
			String sql = "";
			PreparedStatement pstmt = null;
			//커넥션풀로부터 커넥션 얻기
			con = getConnection();
			
			//오라클의 decode()함수를 이용하여 서블릿에서 전달된 ID에 해당하는 데이터를 검색하여
			//true또는 false반환하는데...
			//검색한 갯수가 1(검색한 레코드가 존재하면)이면 true를 반환,
			//존재 하지 않으면 false를 문자열로 반환하여 조회하는 SQL문을 작성
			String query = "select if(count(*)>0,'true','false') as result from member";
				   query += " where id=?";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			result = Boolean.parseBoolean(rs.getString("result"));   
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
		// �뵒鍮� �뿰�룞�븯�뒗 �봽濡쒓렇�옩 �꽕移� (JDBC)
		// JSP2 - WebContent - WEB-INF - lib -
		// mysql-connector-java-5.1.39-bin.jar
		// com�뤃�뜑 mysql �뤃�뜑 jdbc �뤃�뜑 Driver.java
		Connection con = null;
		String sql = "";
		PreparedStatement pstmt = null;

		int result = 0; // �쉶�썝媛��엯 �꽦怨듭뿬遺�

		try {
			// �삁�쇅媛� 諛쒖깮�븷 紐낅졊臾�
			// 1�떒怨� �뱶�씪�씠踰꾨줈�뜑 // 2�떒怨� �뵒鍮꾩뿰寃� => �뿰寃곗젙蹂� ���옣
			con = getConnection();
			// out.println("�뿰寃곗꽦怨�");
			// 3�떒怨� sql 媛앹껜 �깮�꽦
			// Statement PreparedStatement CallableStatement
			// String sql="insert into �뀒�씠釉붿씠由�(�뿴�씠由�,...) values(媛�,媛�)";
			sql = "insert into member(id,password,name,birth_date,gender,email,reg_date,address_main,address_detail,tel,phone,grade,totalprice,point) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1,dto.getId()); //1 臾쇱쓬�몴 �쐞移�
			pstmt.setString(2,dto.getPassword()); //2 臾쇱쓬�몴 �쐞移�
			pstmt.setString(3,dto.getName()); //3 臾쇱쓬�몴 �쐞移�
			 pstmt.setString(4,dto.getBirth_date()); //4 臾쇱쓬�몴 �쐞移�
			 pstmt.setString(5,dto.getGender()); //5 臾쇱쓬�몴 �쐞移�
			 pstmt.setString(6, dto.getEmail());
			 pstmt.setTimestamp(7, dto.getReg_date());
			 pstmt.setString(8, dto.getAddress_main());
			 pstmt.setString(9, dto.getAddress_detail());
			 pstmt.setString(10, dto.getTel());
			 pstmt.setString(11, dto.getPhone());
			 pstmt.setString(12, "bronze");
			 pstmt.setInt(13,0);
			 pstmt.setInt(14,0);

			// 4�떒怨� �떎�뻾
			result = pstmt.executeUpdate(); // �쉶�썝媛��엯 �꽦怨듯븯硫� 1由ы꽩, �떎�뙣�떆0由ы꽩

			// 留뚯빟 �쉶�썝媛��엯�뿉 �꽦怨듯븯硫�.. true由ы꽩
			if (result != 0) {
				return true;
			}
		} catch (Exception e) {
			// �삁�쇅泥섎━
			e.printStackTrace();
		} finally {
			// �삁�쇅�긽愿��뾾�씠 留덈Т由� �옉�뾽
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

		return false; // �쉶�썝媛��엯 �떎�뙣�떆! false由ы꽩

	}// insertMember()硫붿냼�뱶
		
		
}
