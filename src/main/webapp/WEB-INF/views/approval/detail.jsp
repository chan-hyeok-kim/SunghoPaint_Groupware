<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<link rel="stylesheet" href="/css/demo.css" type="text/css">
<link rel="stylesheet" href="/css/zTreeStyle/zTreeStyle.css"
	type="text/css">

<style type="text/css">
.wrapper-toolbar {
	padding: 0;
	border-bottom: 1px solid #d4d4d4;
	list-style: none;
}

.input-date {
	width: 60px;
	height: 10px;
}

.approval-line-search {
	width: 200px;
	align-content: flex-end;
	height: 18.53px;
}

.approval-line-btn {
	width: 77px;
	height: 20px;
	padding: 0px;
	height: 32.06px;
}

#approval-input-date input {
	width: 150px;
}

.title {
	width: 120px;
	display: inline-block;
	padding: 10px 0 0 10px;
}

.material-icons {
	padding: 0px;
	height: 30px;
	width: 30px;
}

#approvalForm ~iframe {
	margin-left: 75px;
}

.content-wrapper {
	padding-left: 300px;
	padding-right: 300px;
}
</style>


<!-- Smart Editor2  -->
<script type="text/javascript" src="/se2/js/HuskyEZCreator.js"
	charset="utf-8"></script>


</head>
<body>
	<div class="card">
		<div class="card-body">
			<div class="wrapper-toolbar" style="height: 56px; padding: 10px;">기안서
				확인</div>

			
				<div id="approval-content">
					<table class="table table-bordered">
						<tr>
							<td>기안일자</td>
							<td colspan="2">${vo.approvalStartDate}</td>
						</tr>
						<tr>
							<td>제목</td>
							<td colspan="2">${vo.approvalTitle}</td>
						</tr>
						<tr>
							<td rowspan="4">결재라인</td>
							<td>중간검토자</td>
							<td>${vo.midApprover}</td>
						</tr>
						<tr>
							<td>추가검토자</td>
							<td id="add-app" data-no="${vo.approvalNo}">${vo.addApprover}</td>
						</tr>
						<tr>
							<td>결재자</td>
							<td>${vo.lastApprover}</td>
						</tr>
						<tr>
							<td>구분(결재양식)</td>
							<td>${vo.approvalTypeVO.codeName}</td>
						</tr>


					</table>
				</div>
				<table class="table table-bordered">
					<tr>
						<td colspan="2">
							<div style="display: flex; justify-content: center;">
								${vo.approvalContents}</div>
						</td>
					</tr>
					<tr>
<c:choose>
<c:when test="${not empty vo.admonition}">
  <td width="20%">대표이사 김성호</td>
  <td><textarea class="form-control"
  disabled="disabled">[첨언] ${vo.admonition}</textarea></td>
</c:when>
<c:when test="${empty vo.admonition}">
<form action="/approval/oneUpdate" method="post">
								<td>첨언</td> <input type="hidden" name="approvalNo"
									value="${vo.approvalNo}">
								<td><textarea rows="5" name="admonition" class="form-control"></textarea>
								<div style="display:flex; padding:10px 0 0 0; 
								justify-content: flex-end;">
								<button class="btn btn-info" >첨언 추가</button>
								</div>
								</td>
</c:when>
</c:choose>
						
							<c:if test="${empty vo.admonition}">
							    <form action="/approval/oneUpdate" method="post">
								<td>첨언</td> <input type="hidden" name="approvalNo"
									value="${vo.approvalNo}">
								<td><textarea rows="5" name="admonition" class="form-control"></textarea>
								<div style="display:flex; padding:10px 0 0 0; 
								justify-content: flex-end;">
								<button class="btn btn-info" >첨언 추가</button>
								</div>
								</td>
							</form>
						</c:if>
					</tr>

				</table>

				<div id="form-add-btn-box">
					<button class="btn btn-info" 
					onclick="location.href='/approval/update?approvalNo=${vo.approvalNo}'">수정</button>
					<button type="button" class="btn btn-info" id="app-delete-btn"
						style="margin-left: 20px;">삭제</button>
					<button class="btn btn-info" style="margin-left: 400px;">결재</button>
				</div>
		</div>
		<input type="hidden" id="form-add-no" name="approvalTypeNo">
		

	</div>


	<!-- Modal -->

	<div class="modal fade" id="approvalModal" tabindex="-1"
		aria-labelledby="modalLabel" aria-hidden="true">
		<div class="modal-dialog modal-xl" role="document">
			<div class="modal-content"
				style="border-bottom: white; border-radius: 0rem;">
				<div class="modal-header">
					<h5 class="modal-title" id="modalLabel">결재선 선택</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">

					<div>
						<form action="GET">
							<input type="radio"> 이름 <input type="radio"> 부서 <input
								type="search">
							<button type="submit" class="btn btn-info material-icons">
								search</button>
						</form>
					</div>


					<div style="display: flex; float: left; width: 40%;">
						<div style="float: left;">

							<ul id="tree" class="ztree"></ul>
						</div>

						<div style="margin-left: 20px;" id="tree_list_empty">
							<ul id="tree_list" class="ztree"></ul>

						</div>
					</div>

					<div id="btn-box">
						<div>
							<button type="button" class="btn btn-info" id="tree-mid-app">중간
								검토자 추가</button>
						</div>
						<div>
							<button type="button" class="btn btn-info" id="tree-add-app">추가
								검토자 추가</button>
						</div>
						<div>
							<button type="button" class="btn btn-info" id="tree-last-app">결재자
								추가</button>
						</div>
					</div>


					<div style="overflow: auto; float: left;" id="tree-table-div">
						<table id="tree-table" class="table table-bordered">
							<tbody id="tree-table-body">
								<tr style="height: 20%">
									<td colspan="2">결재라인 설정</td>

								</tr>
								<tr style="height: 20%">
									<td>중간 검토자</td>
									<td id="mid-app" width="100px"></td>
								</tr>
								<tr style="height: 20%">
									<td>추가 검토자</td>
									<td id="add-app"></td>
								</tr>
								<tr style="height: 20%">
									<td>결재자</td>
									<td id="last-app"></td>
								</tr>

							</tbody>
						</table>
					</div>
				</div>









				<div class="modal-footer" style="background: white;">
					<button id="line-confirm-close" type="button"
						class="btn btn-secondary" data-dismiss="modal">취소</button>
					<button id="tree-line-btn" type="button" class="btn btn-info">확인</button>
				</div>
			</div>
		</div>
	</div>




	<!-- form modal -->
	<div class="modal fade" id="formModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-xl" id="form-modal-size"
			role="document">
			<div class="modal-content"
				style="border-bottom: white; border-radius: 0rem;">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">결재양식 선택</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">

					<div>
						<form action="GET">
							<input type="radio"> 이름 <input type="radio"> 부서 <input
								type="search">
							<button type="submit" class="btn btn-info material-icons">
								search</button>
						</form>
					</div>

					<div style="display: flex; float: left; width: 40%;">
						<div style="">

							<ul id="document-tree" class="ztree"></ul>
						</div>

						<div style="margin-left: 20px;" id="tree_list_empty">
							<ul id="form_list" class="ztree"></ul>
						</div>
						<input type="hidden">
					</div>

					<!-- 문서 data -->
					<c:forEach items="${list}" var="vo" varStatus="i">
						<span class="get-up-code-name"
							data-up-type-cd="${vo.approvalUpTypeVO.approvalUpTypeCd}"
							data-code-name="${vo.codeName}"
							data-up-code-name="${vo.approvalUpTypeVO.codeName}"
							data-no="${vo.approvalTypeNo}">${vo.approvalForm}</span>

					</c:forEach>



				</div>




				<div class="modal-footer" style="background: white;">
					<button id="modal-confirm-close" type="button"
						class="btn btn-secondary" data-dismiss="modal">취소</button>
					<button id="modal-confirm-btn" type="button" class="btn btn-info">확인</button>
				</div>
			</div>
		</div>
	</div>



	<!-- modal end -->
	
<!-- 첨언 있는지 여부 체크 -->
<script type="text/javascript">
let admonitionCheck=${not empty vo.admonition}

/* 얘는 싸인 값 받기 */
console.log('${SPRING_SECURITY_CONTEXT.authentication.principal.signature}')
const formSign='${SPRING_SECURITY_CONTEXT.authentication.principal.signature}';
</script>


	<!-- approval-form에 html style적용 -->
	<script src="/js/commons/approval-form.js"></script>

	<!-- tree -->
	<script src="/js/ztree/paint-tree.js"></script>
	<script src="/js/ztree/up-document-tree.js"></script>
	<script src="/js/approval/line-add.js"></script>


</body>
</html>
