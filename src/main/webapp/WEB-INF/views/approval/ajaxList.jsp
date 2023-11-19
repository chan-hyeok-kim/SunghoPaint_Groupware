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
				    <table class="table table-hover mt-2" id="approval-table">
				        <thead>
				           <tr>
				             <th>선택</th>
				             <th>기안일자</th>
				             <th>제목</th>
				             <th>기안자</th>
				             <th>결재자</th>
				             <th>진행상태</th>
				             <th>결재 확인</th>
				           </tr>
				        </thead>
				        <tbody>
				        <c:forEach items="${list}" var="vo" varStatus="i">
				           <tr>
				             <td><input type="checkbox"></td>
				             <td class="approval-start-date">${vo.approvalStartDate}</td>
				             <td>${vo.approvalTitle}</td>
				             <td>${vo.drafter}</td>
				             <td id="check" data-check="${vo.approvalStatusCd}">${vo.lastApproverName}</td>
				             <td>
				               <c:choose>
									<c:when test="${vo.apCodeName eq '진행중'}"><label class="badge badge-gradient-info">${vo.apCodeName}</label></c:when>
									<c:when test="${vo.apCodeName eq '반려'}"><label class="badge badge-gradient-danger">${vo.apCodeName}</label></c:when>
									<c:when test="${vo.apCodeName eq '승인 완료'}"><label class="badge badge-gradient-success">${vo.apCodeName}</label></c:when>
									<c:when test="${vo.apCodeName eq '기안중'}"><label class="badge badge-gradient-primary">${vo.apCodeName}</label></c:when>
									</c:choose>
				             </td>
				             <td><a href="/approval/${vo.approvalStatusCd eq 'R031'? 'update': 'detail' }?approvalNo=${vo.approvalNo}" class="detail-proceed-btn">기안서 확인</a></td>
				           </tr>
				         </c:forEach>
				        </tbody>
				      
				    </table>
				  </div>
				  
				  <!-- pagination -->
				  <div style="text-align: center; margin: 20px 20px;">
				  <nav aria-label="Page navigation example" style="display: inline-block;">
  <ul class="pagination">
    <li class="page-item ${pager.pre?'':'disabled'}">
      <a class="page-link" href="/approval/ajaxList?page=${pager.startNum-1}&kind=${pager.kind}&search=${pager.search}" aria-label="Previous">
        <i class="mdi mdi-arrow-left-drop-circle"></i>
      </a>
    </li>
    
    <c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
    <li class="page-item"><a class="page-link" href="/approval/ajaxList?page=${i}&kind=${pager.kind}&search=${pager.search}">${i}</a></li>
    </c:forEach>
    
    <li class="page-item ${pager.next?'':'disabled'}">
      <a class="page-link" href="/approval/ajaxList?page=${pager.lastNum+1}&kind=${pager.kind}&search=${pager.search}" aria-label="Next">
        <i class="mdi mdi-arrow-right-drop-circle"></i>
      </a>
    </li>
  </ul>
</nav>

  <!-- Button List  -->
				  <div style="float: right;">
				  <button class="btn btn-info" onclick="location.href='/approval/add'">새 결재 진행</button>
				 
				</div>

  </div>
 
  <!-- 기안일자 변환 -->
  <!-- <script src="/js/approval/approval-date.js"></script> -->
  
</body>
</html>