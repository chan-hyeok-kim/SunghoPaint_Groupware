<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- Smart Editor2  -->
<script type="text/javascript" src="/se2/js/HuskyEZCreator.js"
	charset="utf-8"></script>

</head>
<body>

<div class="card">
<div class="card-body">

<form action="/notice/add" method="post" id="frm" enctype="multipart/form-data">
  <table class="table table-bordered" id="dataTable" width="100%"
									cellspacing="0">
			
			<tbody>
				<tr>
					<th scope="row" class="point">제목</th>
					<td colspan="3" class="subject"><input type="text" name="noticeTitle" class="form-control"></td>
				</tr>
				<tr>
			<!-- 	<th>카테고리 분류</th>
					<td>
					<div class="dropdown">
  <button class="btn btn-warning dropdown-toggle" type="button" id="dropdown2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
    카테고리 선택
  </button>
  <div class="dropdown-menu" aria-labelledby="dropdown2">
    <a class="category dropdown-item" >공지 게시판</a>
    <a class="category dropdown-item" >익명 게시판</a>
    <a class="category dropdown-item" >문의 게시판</a>
    <input type="hidden" id="category" name="noticeCategoryCd">
  </div> -->
</div>
					</td>
					<th scope="row">우선순위</th>
					<td>
					<div class="dropdown">
  <button class="btn btn-gradient-custom-danger dropdown-toggle" type="button" id="dropdown1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
    우선순위 선택
  </button>
  <div class="dropdown-menu" aria-labelledby="dropdown1">
    <a class="prior dropdown-item" >중요공지(필독)</a>
    <a class="prior dropdown-item" >일반공지</a>
    <input type="hidden" id="prior" name="noticePriorityCd">
  </div>
</div>
					</td>
					
				</tr>
				<tr>
					
					<th>내용</th>
					<td colspan="3">
					
					<!-- Smart Editor UI -->
							<div style="display: flex; justify-content: center;">
								<textarea name="noticeContents" id="approvalForm" rows="10"
								 	cols="100" style="width: 100%"></textarea>
							</div>
					
					
					</td>
				</tr>
				<tr>
				<th>파일 첨부</th>
				<td colspan="3"><input name="files" type="file" class="form-control"></td>
				</tr>
			</tbody>
			</table>    
			<button id="notice-add-btn" class="btn btn-info" type="button">작성</button>
			</form>
			
			</div>
</div>
			<!-- approval-form에 html style적용 -->
	<script src="/js/approval/approval-form.js"></script>
	
	<!-- 검증 -->
	<script src="/js/notice/add-check.js"></script>
</body>
</html>