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
	<div class="container-fluid">
				    <table class="table-bordered mt-2" id="approval-table">
				        <thead>
				           <tr>
				             <th>선택</th>
				             <th>기안일자</th>
				             <th>제목</th>
				             <th>구분</th>
				             <th>기안자</th>
				             <th>결재자</th>
				             <th>진행상태</th>
				            
				           </tr>
				        </thead>
				        <tbody>
				        <c:forEach items="${list}" var="vo" varStatus="i">
				           <tr>
				             <td><input type="checkbox"></td>
				             <td>${vo.approvalStartDate}</td>
				             <td>${vo.approvalTitle}</td>
				             <td>${vo.codeName}</td>
				             <td>${vo.drafter}</td>
				             <td id="check" data-check="${vo.approvalStatusCd}">${vo.lastApprover}</td>
				           
				             <td><a>기안서 확인</a></td>
				           </tr>
				         </c:forEach>
				        </tbody>
				      
				    </table>
				  </div>
</body>
</html>