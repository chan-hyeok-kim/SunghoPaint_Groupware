<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
</style>


<!-- Smart Editor2  -->
<script type="text/javascript" src="/se2/js/HuskyEZCreator.js" charset="utf-8"></script>


</head>
<body>
	<div class="card">
		<div class="card-body">
			<div class="wrapper-toolbar">기안서 작성</div>


			<div id="approval-content">
				<span class="title">일자</span> <span class="input-date"><input
					type="date"></span>

				<div>
					<span class="title">제목</span> <span class="input-date"><input
						style="display: inline-block; margin-left: 4px"
						class="form-control approval-line-search" type="search"
						placeholder="" aria-label="Search" name="approvalType"> </span>
				</div>

				<div>
					<span class="title"></span> <span class="title">
라인</span> <input
						style="display: inline-block;"
						class="form-control approval-line-search" type="search"
						placeholder="" aria-label="Search">
					<button class="btn btn-info approval-line-btn" type="submit"
						data-toggle="modal" data-target="#approvalModal">
						<i class="mdi mdi-account-search"></i>
					</button>
				</div>
				<div>
					<span class="title">결재라인</span> <span class="title">검토자</span> <input
						style="display: inline-block;"
						class="form-control approval-line-search" type="search"
						placeholder="" aria-label="Search">
					<button id="top-search-btn" class="btn btn-info approval-line-btn"
						type="submit">
						<i class="mdi mdi-account-search"></i>
					</button>
				</div>
				<div>
					<span class="title"></span><span class="title">추가검토자</span> <input
						style="display: inline-block; margin-left: 4px"
						class="form-control approval-line-search" type="search"
						placeholder="" aria-label="Search">
					<button id="top-search-btn" class="btn btn-info approval-line-btn"
						type="submit">
						<i class="mdi mdi-account-search"></i>
					</button>
				</div>
				<div>
					<span class="title"></span><span class="title">결재자</span> <input
						id="last-approver" style="display: inline-block; margin-left: 4px"
						class="form-control approval-line-search" type="search"
						placeholder="" aria-label="Search" name="lastApprover">
					<button id="top-search-btn" class="btn btn-info approval-line-btn"
						type="submit">
						<i class="mdi mdi-account-search"></i>
					</button>
				</div>


				<div>
					<span class="title">구분(결재양식)</span> <input
						style="display: inline-block;"
						class="form-control approval-line-search" type="search"
						placeholder="" aria-label="Search">
					<button id="form-modal-btn" type="submit"
						class="btn btn-info material-icons" data-toggle="modal"
						data-target="#formModal">search</button>
				</div>



			</div>


			<!-- Smart Editor UI -->
			<textarea name="approvalForm" id="approvalForm" rows="10" cols="100"></textarea>


			<!-- add button -->
			<div style="margin-left: 200px;">
				<button class="btn btn-info">임시저장</button>
				<button class="btn btn-info" id="text-delete-btn">지우기</button>
				<button class="btn btn-info" style="margin-left: 230px;">결재</button>
			</div>
		</div>


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
						<div style="">

							<ul id="tree" class="ztree"></ul>
						</div>

						<div style="margin-left: 20px;" id="tree_list_empty">
							<ul id="tree_list" class="ztree"></ul>

						</div>
					</div>
					<div style="float: right; width: 40%">
						<div style="float: left;">
							<button type="button" class="btn btn-info" id="tree_list_add">결재
								></button>
						</div>

						<div style="overflow: auto; float: left;" id="tree-table-div">
							<table id="tree-table">
								<tbody id="tree-table-body">
									<tr style="height: 10%">
										<td>결재</td>
										<td>이대리<br>디자인팀 이대리
										</td>
									</tr>

								</tbody>
							</table>
						</div>
					</div>




				</div>



			
			<div class="modal-footer" style="background: white;">
				<button id="line-confirm-close" type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
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
					</div>

<!-- 문서 data -->
<c:forEach items="${list}" var="vo" varStatus="i">
						    <span class="get-up-code-name" data-up-type-cd="${vo.approvalUpTypeVO.approvalUpTypeCd}" data-code-name="${vo.codeName}"
						    data-up-code-name="${vo.approvalUpTypeVO.codeName}">${vo.approvalForm}</span>
						   <%--  <div class="save" style="display: none" data-form="${list[i.index].approvalForm}"></div> --%>
						</c:forEach>



				</div>



			
			<div class="modal-footer" style="background: white;">
				<button id="modal-confirm-close" type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
				<button id="modal-confirm-btn" type="button" class="btn btn-info">확인</button>
			</div>
			</div>
		</div>
	</div>
	


	<!-- modal end -->



	<!-- approval-form에 html style적용 -->
	<script src="/js/commons/approval-form.js"></script>

	<!-- tree -->
	<script src="/js/ztree/paint-tree.js"></script>
    <script src="/js/ztree/up-document-tree.js"></script>
    
<script type="text/javascript">
/* let formList=${list}

var formArr=new Array();

let count=$('.get-up-code-name').length;
console.log(count)

for(i=0; i<count; i++){
	
	formArr.push(formList[i].approvalForm);
}
 */
</script>
</body>
</html>