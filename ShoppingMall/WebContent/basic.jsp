<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// MultipartRequest클래스의 역할: 파일 업로드를 직접적으로 담당하는 클래스
	
	// 1. 현재 실행중인 웹프로젝트에 대한 정보를 지니고 있는 컨텍스트 객체 얻기
	ServletContext ctx = getServletContext();

	// 2. 파일이 업로드될 실제 서버측의 경로 얻기
	// -실제 업로드되는 경로
	String realPath = ctx.getRealPath("/upload");
	
	out.println(realPath);
	
	// 3.업로드 할수 있는 파일의 최대 크기 지정 5MB
	int max = 1024 * 1024 * 5;
	
	// 4. 실제 MultipartRequest객체를 이용하여 파일을 업로드를 함
	// 전달값 1. <form>태그에서 요청한 request객체를 생성자로 전달~
	// 전달값2. 실제 업로드될 경로 위치
	// 전달값3. 업로드 할수 있는 최대 사이즈
	// 전달값4. 만약 파일이름이 한글일 경우 문제가 생기므로 처리할수 있게 인코딩 타입을 지정
	// 전달값5. 중복된 파일이 존재한다면 자동으로 파일이름을 변환해주는 객체 전달
	MultipartRequest multi = new MultipartRequest(request,realPath,max,"utf-8",new DefaultFileRenamePolicy());
	
	// request객체는 MultipartRequest 객체에 저장되어 있으므로
	// 우리가 입력한 텍스트 값을 얻기 위해서는 MultipartRequest객체의 multi 참조변수를 활용
	String user = multi.getParameter("user");
	String title = multi.getParameter("title");
	
	out.println(user + "," + title);
	out.println("<hr/>");
	
	// 업로드한 파일 정보는 모두 MultipartRequest객체에 저장되어 있다.
	
	// 파일 업로드시 <form>태그 내부의 모든 <input>태그의 name속성값들을 
	// MultipartRequest객체에서 꺼내와서 Enumeration반복기 역할을 하는 객체에 담습니다.
	// 그리고 Enumeration반복기 객체 자체를 반환
	Enumeration e = multi.getFileNames();
	
	while(e.hasMoreElements()){ // 업로드한 파일이 존재한다면
		
		String name = (String)e.nextElement();
		out.println("클라이언트가 업로드한 파일의 원본이름: " + multi.getOriginalFileName(name) + "<br>");
		out.println("서버에 실제로 업로드된 파일의 이름: " + multi.getFilesystemName(name) + "<br>");
		out.println("업로드 파일 타입: " + multi.getContentType(name) + "<br>");
		
		// 서버에 업로드된 파일의 정보를 객체로 얻어온다
		File f = multi.getFile(name);
		
		out.println("파일의 크기: " + f.length() + "<br>");
		
		// 파일 삭제
		// f.delete();
		
	}
%>