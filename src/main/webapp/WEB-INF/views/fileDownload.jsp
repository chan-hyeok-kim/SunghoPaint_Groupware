<%@page import="java.io.BufferedOutputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.BufferedInputStream"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.io.File"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE>

<%
	String fileName = request.getParameter("fileName");
	String realFolder = request.getSession().getServletContext().getRealPath("/storage");
	
	File file = new File(realFolder, fileName);
	System.out.println("file : " + file);
	
	/*
		◆ "Content-Disposition", "inline;" ◆ 
		웹 브라우저가 인식할 수 있는 확장자를 가진 파일들에 대해서는 웹 브라우저 상에 내용을 바로 출력하고,
		그 외 파일들에 대해서는 파일 다운로드 창이 뜨도록 하겠다.
		
		◆ "Content-Disposition", "attachment;" ◆
		경우에 상관없이 무조건 파일 다운로드 창이 뜨도록 하겠다.
		
		(참고)
		replaceAll("\\+", " ") 의미 : http://kin.naver.com/qna/detail.nhn?d1id=1&dirId=1040201&docId=281609667
	*/
	response.setHeader("Content-Disposition", "attachment; filename=" + new String(URLEncoder.encode(fileName, "UTF-8")).replaceAll("\\+", " "));
	response.setHeader("Content-Length", String.valueOf(file.length()));
	
	
	// https://blog.naver.com/dngu_icdi/221389488172 참고
	out.clear();
	out = pageContext.pushBody();
	
	
	BufferedInputStream bis = new BufferedInputStream(new FileInputStream(file));
	BufferedOutputStream bos = new BufferedOutputStream(response.getOutputStream());
	
	byte[] data = new byte[(int)file.length()];
	bis.read(data, 0, data.length);
	
	bos.write(data);
	
	bis.close();
	bos.close();
%>


<html>
<head>
	<title></title>
</head>
<body>
	
</body>
</html>