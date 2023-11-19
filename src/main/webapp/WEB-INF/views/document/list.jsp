<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>






<!-- Tree Css -->
<link rel="stylesheet" href="/css/demo.css" type="text/css">
<link rel="stylesheet" href="/css/zTreeStyle/zTreeStyle.css"
	type="text/css">

</head>
<body id="page-top">
	<div id="wrapper">


		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">
			<div class="card">
				<div class="card-body">

					<div class="wrapper-toolbar">

						<div style="float: left">문서양식함 관리</div>
						<div style="text-align: right;">
							<form class="form-inline" action="./list">

								<!-- 검색 설정 -->
								<select name="kind" class="btn btn-gradient-light" id="top-search-select">
									<option value="upCodeName" selected="selected">상위폴더명</option>
									<option value="CodeName">양식명</option>
								</select> <input style="display: inline-block;" id="top-search-bar"
									class="form-control" type="search" placeholder="입력 후 [Enter]"
									aria-label="Search" name="search">
								<button id="top-search-btn" class="btn btn-info" type="submit">검색</button>

							</form>
						</div>
					</div>

					<ul class="nav-tabs">
						
					</ul>


					
					<div id="content">


						<!-- 내용 -->
						<div class="container-fluid">

							<!-- 문서양식함 트리 -->
							<div id="document-tree-wrapper-div">
							<div style="float: left">

								<ul id="document-tree" class="ztree"></ul>
							</div>

							<div style="float: left">
								<button class="btn btn-info" id="document-tree-btn">문서양식함
									추가 
								<i class="mdi mdi-arrow-right-bold"></i>	
									</button>
							</div>


							<div>
								<div class="card" id="document-card">
								
								<table class="table table-bordered">
								<input type="hidden" id="up-type-no">
								<form action="upAdd" method="post" id="up-frm">
								<tbody>
								   <tr>
								      <td>상위양식코드</td>
								      <td><input id="up-type-cd" class="form-control document-card-input" name="approvalUpTypeCd"></td>
								   </tr>
								   <tr>
								      <td>상위양식함명</td>
								      <td><input id="up-cd-name" class="form-control document-card-input" name="codeName"></td>   
								   </tr>
								   <tr>
								   <td>
								   <button type="button" id="approval-up-add-btn" class="btn btn-info">추가</button>
								   </td>
								   </form>
								   <td>
								   <button id="approval-add-btn" class="btn btn-info">신규 양식 등록</button>
								   </td>
								   </tr>
								   
								   
								
								</tbody>
								
								
								
								</table>
									
								</div>
							</div>
							
							</div>

							<table class="table table-hover" id="approval-table">
								<thead>
									<tr>
										<th>선택</th>
										<th>상위폴더</th>
										<th>문서양식명</th>
										<th>등록일</th>
										<th>관리</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${list}" var="vo" varStatus="i">
									   <c:if test="${not empty vo.codeName}">
										  <tr class="approval-list">
											<td><input type="checkbox" class="approval-check-box" name="checkList" value="${vo.approvalTypeNo}"></td>
											<td>${vo.approvalUpTypeVO.codeName}</td>
											<td>${vo.codeName}</td>
											<td class="approval-reg-date">${vo.regDate}</td>
											<td><button class="btn btn-info document-update" onclick="location.href='/document/update?approvalTypeNo=${vo.approvalTypeNo}'">수정</button></td>
										  </tr>
									   </c:if>
									</c:forEach>
								</tbody>

							</table>
						<c:forEach items="${list}" var="vo" varStatus="i">
						    <span style="display: none;" class="get-up-code-name" data-up-type-cd="${vo.approvalUpTypeVO.approvalUpTypeCd}" data-code-name="${vo.codeName}" data-up-code-name="${vo.approvalUpTypeVO.codeName}"
						    data-up-up-no="${vo.approvalUpTypeVO.approvalUpTypeNo}" data-up-no="${vo.approvalUpTypeNo}"></span>
						</c:forEach>
						</div>
					</div>

				<!-- pagination -->
				  <div style="text-align: center; margin: 20px 20px;">
				  <nav aria-label="Page navigation example" style="display: inline-block;">
  <ul class="pagination">
    <li class="page-item ${pager.pre?'':'disabled'}">
      <a class="page-link" href="/document/list?page=${pager.startNum-1}&kind=${pager.kind}&search=${pager.search}" aria-label="Previous">
        <i class="mdi mdi-arrow-left-drop-circle"></i>
      </a>
    </li>
    
    <c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
    <li class="page-item"><a class="page-link" href="/document/list?page=${i}&kind=${pager.kind}&search=${pager.search}">${i}</a></li>
    </c:forEach>
    
    <li class="page-item ${pager.next?'':'disabled'}">
      <a class="page-link" href="/document/list?page=${pager.lastNum+1}&kind=${pager.kind}&search=${pager.search}" aria-label="Next">
        <i class="mdi mdi-arrow-right-drop-circle"></i>
      </a>
    </li>
    
   
     
 
  </ul>
  
  
</nav>			
							<!-- Button List -->
							
								<div style="float:right;">
								<!-- <div style="margin-left:35%; display: inline-block;"> -->
								<button id="delete-btn" class="btn btn-inverse-dark">삭제하기
								</button>
								</div>
								<!-- Button List End -->	
										
</div>



					
				</div>
			</div>



		    <script src="/js/ztree/up-document-tree.js"></script>
			<!-- 유효성 검증 -->
			<script src="/js/document/check-box.js"></script>
			<script src="/js/approval/ajax-search.js"></script>
			
			<!-- 등록일자 변환 -->
			<script src="/js/approval/approval-date.js"></script>
			
</body>
</html>