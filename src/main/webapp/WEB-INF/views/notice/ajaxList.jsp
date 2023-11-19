<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
				     <table class="table-bordered mt-2" id="approval-table">
				        <thead>
				           <tr>
				             <th>작성일자</th>
				             <th>제목</th>
				             <th>작성자</th>
				           </tr>
				        </thead>
				        <tbody>
				        <c:forEach items="${list}" var="vo" varStatus="i">
				           <tr>
				             <td class="approval-start-date">${vo.regDate}</td>
				             <td><a style="text-decoration: none;" href="/notice/detail?noticeNo=${vo.noticeNo}">${vo.noticeTitle}</a></td>
				             <td>${vo.humanResourceVO.name}</td>
				           </tr>
				         </c:forEach>
				        </tbody>
				      
				    </table>
				
				  
				  
				  
				
</body>
</html>