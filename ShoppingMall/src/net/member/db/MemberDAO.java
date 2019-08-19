package net.member.db;

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

public class MemberDAO {
   
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
   //아이디 중복체크를 위한 메소드 
   //MemberServlet서블릿 클래스로부터 전달된 ID로  SQL문의 조건식에 설정한후
   //ID에 대한 회원정보를 조회하여 그결과를 true또는 false로 반환함.
   public int overlappedID(String id) {
      int result = 0;
      
      try {
         con = null;
         sql = "";
         pstmt = null;
         con = getConnection();
         
         String query = "select if(count(*)>0,'1','0') as result from member";
               query += " where id=?";
               // 중복되는게 있으면 1, 중복되느게 없으면 0
         pstmt = con.prepareStatement(query);
         pstmt.setString(1, id);
         rs = pstmt.executeQuery();
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
         con = null;
         sql = "";
         pstmt = null;
         con = getConnection();
         
         String query = "select if(count(*)>0,'1','0') as result from member";
               query += " where phone=?";
               // 중복되는게 있으면 1, 중복되느게 없으면 0
         pstmt = con.prepareStatement(query);
         pstmt.setString(1, phone);
         rs = pstmt.executeQuery();
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
      con=null;
      sql="";
      pstmt=null;
      int check=-1;//1 -> 아이디, 비밀번호 맞음
               //0 -> 아이디 맞음, 비밀번호 틀림
               //-1 -> 아이디 틀림
      rs=null;
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
         sql = "insert into member(id,password,name,birth_date,gender,email,reg_date,address_main,address_detail,phone,grade,totalprice,point) values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
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
          pstmt.setString(10, dto.getPhone());
          pstmt.setString(11, "bronze");
          pstmt.setInt(12,0);
          pstmt.setInt(13,0);

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


   
   // 회원 삭제 메서드
   public int deleteMember(String id, String pw) {
         
         con = null;
         pstmt = null;
         rs = null;
         sql = "";
         MemberDTO member = new MemberDTO();
         
         String dbpw = ""; // DB상의 비밀번호를 담아둘 변수
         int x = -1;

         try {
            // 회원 삭제
            sql = "DELETE FROM MEMBER WHERE ID=?";
            
            con = getConnection();

            // 자동 커밋을 false로 한다.
            con.setAutoCommit(false);
            
            // 1. 아이디에 해당하는 비밀번호를 조회한다.
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();

            if (rs.next()) {
               dbpw = rs.getString("password");
               if (dbpw.equals(pw)){ // 입력된 비밀번호와 DB비번 비교
                  // 같을경우 회원삭제 진행
                  pstmt = con.prepareStatement(sql);
                  pstmt.setString(1, id);
                  pstmt.executeUpdate();
                  con.commit(); 
                  x = 1; // 삭제 성공
               } else {
                  x = 0; // 비밀번호 비교결과 - 다름
               }
            }

            return x;

         } catch (Exception e) {
               e.printStackTrace();
         } finally {
            try{
               if ( pstmt != null ){ pstmt.close(); pstmt=null; }
               if ( con != null ){ con.close(); con=null;   }
            }catch(Exception e){
               e.printStackTrace();
            }
         }
         return x;
      }// 회원탈퇴 메소드
   

   //구매하기 페이지의 주문자 정보란에 회원정보 뿌려주기
   public MemberDTO selectMember(String id){
      
      con = null;
      pstmt = null;
      rs = null;
      sql = "";
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
   
   /*ID 찾기 처리시.. 사용하는 메소드*/
   //find_ID.jsp에서 사용자로부터 입력받은 이메일 값을 받아 DB에 있는지 확인
   public int find_id(String email){
      con=null;
      sql="";
      pstmt=null;
      int check =-1;//1 -> 아이디, 비밀번호 맞음
               //0 -> 아이디 맞음, 비밀번호 틀림
               //-1 -> 아이디 틀림
      rs=null;
      try {
         //1단계 드라이버로더
         //2단계 디비연결
         con=getConnection();
         
         //3단계 sql : email에 해당하는 email 가져오기
         sql="select email from member where email=?";
         pstmt=con.prepareStatement(sql);
         pstmt.setString(1, email);
         
         //4단계 rs = 실행
         rs=pstmt.executeQuery();
        		 
         //5단계 rs 첫번째행 이동하여.. email에 해당하는 데이터가 있으면.
         if(rs.next()){
            //아이디 찾을시.. 입력한 email와  DB에 저장되어 있는 email가 같으면
            if(email.equals(rs.getString("email"))){
               check = 1;// 이메일 맞음 판별값 저장

            }
         // 이메일에 해당하는 데이터가 없으면(아이디가 없다는 뜻과 같음)   
         }else{
            check =-1; //아이디 없음 판별값 저장
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
   
   /*PW 찾기 처리시.. 사용하는 메소드*/
   //find_PW.jsp에서 사용자로부터 입력받은 이메일 값을 받아 DB에 있는지 확인
   public int find_pw(String id, String phone){
      con=null;
      sql="";
      pstmt=null;
      int check = 0;//1 -> 아이디, 비밀번호 맞음
               //0 -> 아이디 맞음, 비밀번호 틀림
               //-1 -> 아이디 틀림
      rs=null;
      try {
         //1단계 드라이버로더
         //2단계 디비연결
         con=getConnection();
         
         //3단계 sql : id에 해당하는 정보 가져오기
         sql="select * from member where id=?";
         pstmt=con.prepareStatement(sql);
         pstmt.setString(1, id);
         
         //4단계 rs = 실행
         rs=pstmt.executeQuery();
        		 
         //5단계 rs 첫번째행 이동하여.. id에 해당하는 데이터가 pass가 있으면.
         if(rs.next()){
            //로그인시.. 입력한 pass와  DB에 저장되어 있는 pass가 같으면
            if(id.equals(rs.getString("id"))){
            	if(phone.equals(rs.getString("phone"))){
            		check = 1;// 이메일 맞음 판별값 저장
            	}
            }
         // 이메일에 해당하는 데이터가 없으면(아이디가 없다는 뜻과 같음)   
         }else{
            check =-1; //아이디 없음 판별값 저장
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
   
   // 이메일 입력하여 아이디 찾기 위한 작업
   public MemberDTO find_info_id(String email) {
	   con=null;
	   sql="";
	   pstmt=null;
	   rs=null;
	   
	   MemberDTO dto = new MemberDTO();
	   
	   try {
	         //1단계 드라이버로더
	         //2단계 디비연결
	         con=getConnection();
	         
	         //3단계 sql : email에 해당하는 id 가져오기
	         sql="select id from member where email=?";
	         pstmt=con.prepareStatement(sql);
	         pstmt.setString(1, email);
	         
	         //4단계 rs = 실행
	         rs=pstmt.executeQuery();
	        
	         if(rs.next()){
	        	 dto.setId(rs.getString("id"));
	         }
	         
	      } catch (Exception e) {
	         e.printStackTrace();
	      }finally{
	         //마무리
	         if(rs!=null)try{rs.close();}catch(SQLException ex){}
	         if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
	         if(con!=null)try{con.close();}catch(SQLException ex){}
	      }
      return dto;
   }
   
   // 아이디 / 핸드폰 번호를 입력해 비밀번호 찾기 위한 작업
   public MemberDTO find_info_pw(String id, String phone) {
	   con=null;
	   sql="";
	   pstmt=null;
	   rs=null;
	   
	   MemberDTO dto = new MemberDTO();
	   
	   try {
	         //1단계 드라이버로더
	         //2단계 디비연결
	         con=getConnection();
	         
	         //3단계 sql : email에 해당하는 id 가져오기
	         sql="select * from member where id=?";
	         pstmt=con.prepareStatement(sql);
	         pstmt.setString(1, id);
	         
	         //4단계 rs = 실행
	         rs=pstmt.executeQuery();
	        
	         if(rs.next()){
	        	 dto.setPassword(rs.getString("password"));
	         }
	         
	      } catch (Exception e) {
	         e.printStackTrace();
	      }finally{
	         //마무리
	         if(rs!=null)try{rs.close();}catch(SQLException ex){}
	         if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
	         if(con!=null)try{con.close();}catch(SQLException ex){}
	      }
      return dto;
   }
   

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
      

   
   }