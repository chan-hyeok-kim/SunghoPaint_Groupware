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
				             <th>작성일자</th>
				             <th>제목</th>
				             <th>작성자</th>
				             <th>조회수</th>
				           </tr>
				        </thead>
				        <tbody>
				        <c:forEach items="${list}" var="vo" varStatus="i">
				           <tr>
				             <td><input type="checkbox"></td>
				             <td class="approval-start-date">${vo.RegDate}</td>
				             <td><a href="/notice/detail?approvalNo=${vo.approvalNo}">${vo.noticeTitle}</a></td>
				             <td>${vo.humanResourceVO.name}</td>
				             <td>${vo.noticeHit}</td>
				             <td><a href="/notice/detail?approvalNo=${vo.approvalNo}">기안서 확인</a></td>
				           </tr>
				         </c:forEach>
				        </tbody>
				      
				    </table>
				  </div>
				  
				  
				  
				    <!-- pagination -->
				  <div style="text-align: center; margin: 20px 20px">
				  <nav aria-label="Page navigation example" style="display: inline-block;">
  <ul class="pagination">
    <li class="page-item ${pager.pre?'':'disabled'}">
      <a class="page-link" href="/notice/list?page=${startNum-1}" aria-label="Previous">
        <i class="mdi mdi-arrow-left-drop-circle"></i>
      </a>
    </li>
    
    <c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
    <li class="page-item"><a class="page-link" href="/notice/list?page=${i}">${i}</a></li>
    </c:forEach>
    
    <li class="page-item ${pager.next?'':'disabled'}">
      <a class="page-link" href="/notice/list?page=${lastNum+1}" aria-label="Next">
        <i class="mdi mdi-arrow-right-drop-circle"></i>
      </a>
    </li>
  </ul>
</nav>

  <!-- Button List  -->
				  <div style="float: right;">
				  <button class="btn btn-info" onclick="location.href='/notice/add'">글 작성</button>
				 
				</div>

  </div>
				  
  <!-- 기안일자 변환 -->
  <!-- <script src="/js/approval/approval-date.js"></script> -->
</body>
</html>