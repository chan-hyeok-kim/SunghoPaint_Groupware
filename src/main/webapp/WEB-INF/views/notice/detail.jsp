<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

  <table class="table table-bordered" id="dataTable" width="100%"
									cellspacing="0">
			
			<tbody>
				<tr>
					<th scope="row" class="point">제목</th>
					<td colspan="3" class="subject">${nvo.boardTitle}</td>
				</tr>
				<tr>
					<th scope="row">작성자</th>
					<td>${nvo.boardWriter}</td>
					<th scope="row">작성일</th>
					<td>${nvo.boardDate}</td>
				</tr>
				<tr>
					<th scope="row">조회수</th>
					<td colspan="3">${nvo.boardHit}
						
					</td>
				</tr>
				<tr>
					
					<td colspan="4">
					<c:forEach items="${nvo.noticeFileVOs}" var="f">
					    <img alt="" src="../files/${board}/${f.fileName}">
					    <a href="./fileDown?fileNo=${f.fileNo}">${f.oriName}</a>
					</c:forEach>
					${nvo.boardContents}</td>
				</tr>
			</tbody>
			</table>    
			
</body>
</html>