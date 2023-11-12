<%@page import="java.net.URLEncoder"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE>

<%
	String realFolder = request.getSession().getServletContext().getRealPath("/storage");
	System.out.println("파일이 실제로 저장되는 경로 : " + realFolder);
	
	/*
		ㆍ세 번째 인자 : 허용 가능한 최대 파일 크기
		ㆍ네 번째 인자 : 파일 이름 인코딩 방식
		ㆍ다섯 번째 인자 : 파일 이름이 중복될 시 기존의 파일 이름 뒤에 숫자를 덧붙여서 저장시키겠다.
	*/
	MultipartRequest multipart_req = new MultipartRequest(request, realFolder, 5 * 1024 * 1024, "UTF-8", new DefaultFileRenamePolicy()); // 업로드
	
	// request.getParameter("subject"); // 일반 request 객체로는 데이터를 꺼낼 수 없다.
	String subject = multipart_req.getParameter("subject");
	String contents = multipart_req.getParameter("contents");
	
	// 클라이언트로부터 넘어온 오리지널 파일 이름
	String originalFileName01 = multipart_req.getOriginalFileName("upload01");
	String originalFileName02 = multipart_req.getOriginalFileName("upload02");
	
	// 파일이 storage 폴더에 어떤 이름으로 저장되었는지 반환
	String fileName01 = multipart_req.getFilesystemName("upload01");
	String fileName02 = multipart_req.getFilesystemName("upload02");
	
	File file01 = multipart_req.getFile("upload01");
	File file02 = multipart_req.getFile("upload02");
	
	long fileSize01 = 0;
	long fileSize02 = 0;
	if(file01 != null) fileSize01 = file01.length();
	if(file02 != null) fileSize02 = file02.length();
%>

<html>
<head>
	<title></title>
</head>
<body>
	<h2>업로드 완료!</h2>
	<ul>
		<li>제목 : <%= subject %>
		<li>내용 : <%= contents %>
		<li>파일01 : <a href="fileDownload.jsp?fileName=<%= URLEncoder.encode(originalFileName01,"UTF-8") %>"><%= originalFileName01 %></a> &nbsp;&nbsp;&nbsp; <%= fileName01 %>
		<li>크기 : <%= fileSize01 %>
		<br><br>
		<li>파일02 : <%= originalFileName02 %> &nbsp; &nbsp; &nbsp; <%= fileName02 %>
		<li>크기 : <%= fileSize02 %>
	</ul>
</body>
</html>