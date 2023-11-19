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
<table class="table table-hover mt-2" id="approval-table">
					<thead>
						<tr>
							<th>알림 시간</th>
							<th>제목</th>
							<th>내용</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list}" var="vo" varStatus="i">
							<c:if test="${i.index lt 5}">
								<tr>
									<td class="message-reg-date">${vo.regDate}</td>
									<td>${vo.notificationTitle}</td>
									<td>${vo.notificationContents}</td>
								</tr>
							</c:if>
						</c:forEach>
					</tbody>
				</table>
</body>
</html>