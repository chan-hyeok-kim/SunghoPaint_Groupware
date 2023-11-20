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


#smart_editor2{
    width: 100%;
}

.content-wrapper {
	padding-left: 10%;
	padding-right: 10%;
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
				작성</div>


			<form action="add" method="post" id="app-add-frm">
				<div id="approval-content">
					<table class="table table-bordered">
						<tr>
							<th>기안일자</th>
							<td colspan="3"><input id="currentDate" readonly="readonly"
								style="display: inline-block; margin-left: 4px"
								class="form-control approval-line-search" type="date"
								name="approvalStartDate"></td>
						</tr>
						<tr>
							<th>제목</th>
							<td colspan="3"><span class="input-date"><input
									style="display: inline-block; margin-left: 4px"
									class="form-control approval-line-search" type="search"
									placeholder="" aria-label="Search" name="approvalTitle"></td>
						</tr>

						<tr>
							<th rowspan="4">결재라인</th>
							<th>라인</th>
							<td colspan="2"><input style="display: inline-block;"
								disabled="disabled" class="form-control approval-line-search"
								type="search" placeholder="" aria-label="Search">
								<button class="btn btn-info approval-line-btn" type="button"
									data-toggle="modal" data-target="#approvalModal">
									<i class="mdi mdi-account-search"></i>
								</button></td>
						</tr>
						<tr>
							<th>검토자</th>
							<td colspan="2"><input id="mid-approver" style="display: inline-block;"
								class="form-control approval-line-search" type="search"
								 placeholder="" aria-label="Search"></td>
						</tr>
						<tr>
							<th>추가검토자</th>
							<td colspan="2"><input style="display: inline-block; margin-left: 4px"
								id="add-approver" class="form-control approval-line-search"
								type="search" placeholder="" aria-label="Search"
								></td>
						</tr>
						<tr>
							<th>결재자</th>
							<td colspan="2"><input id="last-approver"
								style="display: inline-block; margin-left: 4px"
								class="form-control approval-line-search" type="search"
								placeholder="" aria-label="Search"></td>
						</tr>
						<input type="hidden" name="lastApprover" id="last-data-id">
								<input type="hidden" name="midApprover" id="mid-data-id">
								<input type="hidden" name="addApprover" id="add-data-id">
						<tr>
							<th>구분(결재양식)</th>
							<td colspan="3"><input id="form-add-name" readonly
								style="display: inline-block; margin-left: 4px"
								class="form-control approval-line-search" type="search"
								placeholder="" aria-label="Search">
								<button id="form-modal-btn" type="button"
									class="btn btn-info material-icons" data-toggle="modal"
									data-target="#formModal">search</button></td>
						</tr>
						<tr id="annualTr">
						</tr>
						<tr>
						</tr>
					</table>
				</div>


				<!-- Smart Editor UI -->
				<table class="table table-bordered">
					<tr>
						<td>
							<div style="display: flex; justify-content: center;">
								<textarea name="approvalContents" id="approvalForm" rows="10"
								 	cols="100" style="width: 100%; height: 800px;"></textarea>
							</div>
						</td>
					</tr>
				</table>

				<!-- add button -->
				<div id="form-add-btn-box" style="float:left;">
					<!-- <button type="button" class="btn btn-info"
					style="margin-left: 20px;" id="app-save-btn">임시저장</button> -->
					<button type="button" class="btn btn-info" id="text-delete-btn"
					style="margin-left: 20px;">지우기</button>
				</div>
				<div style="float:right; margin:20px 20px 0 0;">
					<button id="app-add-btn" type="button" class="btn btn-info">결재</button>
				</div>
		</div>
		<input type="hidden" id="form-add-no" name="approvalTypeNo">
		</form>

	</div>




	<!-- Modal -->

	<div class="modal fade" id="approvalModal" tabindex="-1"
		aria-labelledby="modalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" style="width:1050px" role="document">
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
						
							 <input	type="search" name="search" placeholder="사원명을 검색하세요">
							<button id="searchTeamList" type="button" class="btn btn-info material-icons">
								search</button>
				
					</div>


					<div style="display: flex; float: left; width: 42%;">
						<div style="float: left;">

							<ul id="tree" class="ztree"></ul>
						</div>

						<div style="margin-left: 20px;" id="tree_list_empty">
							<ul id="tree_list" class="ztree"></ul>

						</div>
					</div>

					<div id="btn-box">
						<div>
							<button type="button" class="btn btn-secondary btn-icon-text" id="tree-mid-app" data-id="">
							중간<i class="mdi mdi-file-check btn-icon-append"></i></button>
						</div>
						<div>
							<button type="button" class="btn btn-secondary btn-icon-text" id="tree-add-app" data-id="">
							검토<i class="mdi mdi-file-check btn-icon-append"></i></button>
						</div>
						<div>
							<button type="button" class="btn btn-secondary btn-icon-text" id="tree-last-app" data-id="">
							결재<i class="mdi mdi-file-check btn-icon-append"></i></button>
						</div>
					</div>


					<div style="overflow: auto; float: left; margin-left:10px" id="tree-table-div">
					<label class="badge badge-gradient-light" style="color:black; height:32px; width: 100%; text-align: left; font-weight: bold">결재선</label>
					
					
					<div style="background: white;" class="tree-table">
					<div style="display: flex; ">
					<div style="display: flex; ">
					<i class="material-symbols-outlined" style="font-size:50px;">account_circle</i> 
					<p><span style="font-size:24px; color:gray;" id="my-rank"></span><br>
					  <span></span>  
					 </p>
					 </div>
					 <div style="display:flex; justify-content: flex-end; margin-left:auto"> 
					 <span style="text-align: right"><span id="my-dept"></span><br>
					 <label class="badge badge-gradient-drafter">기안</label><br>
					 <span id="app-date-span"></span>
					 </span></div>
					  </div>
					</div>
					
					<div style="background: white;" class="tree-table">
					<div style="display: flex; ">
					<div style="display: flex; ">
					<i class="material-symbols-outlined" style="font-size:50px;">account_circle</i> 
					<p><span style="font-size:24px; color:gray;" id="mid-app"></span><br>
					 <span></span> 
					 </p>
					 </div>
					 <div style="display:flex; justify-content: flex-end; margin-left:auto"> 
					 <span style="text-align: right"><span id="mid-app-dept"></span><br>
					 <label class="badge badge-gradient-mid">검토</label><br>
					 </span></div>
					  </div>
					</div>
					
					<div style="background: white;" class="tree-table">
					<div style="display: flex; ">
					<div style="display: flex; ">
					<i class="material-symbols-outlined" style="font-size:50px;">account_circle</i> 
					<p><span style="font-size:24px; color:gray;" id="add-app"></span><br>
					 <span></span>
					 </p>
					 </div>
					 <div style="display:flex; justify-content: flex-end; margin-left:auto"> 
					 <span style="text-align: right"><span id="add-app-dept"></span><br>
					 <label class="badge badge-gradient-mid">검토</label><br>
					 </span></div>
					  </div>
					</div>
					
					<div style="background: white;" class="tree-table">
					<div style="display: flex; ">
					<div style="display: flex; ">
					<i class="material-symbols-outlined" style="font-size:50px;">account_circle</i> 
					<p><span style="font-size:24px; color:gray;" id="last-app"></span><br>
					 <span></span> 
					 </p>
					 </div>
					 <div style="display:flex; justify-content: flex-end; margin-left:auto"> 
					 <span style="text-align: right"><span id="last-app-dept"></span><br>
					 <label class="badge badge-gradient-last">결재</label><br>
					 </span></div>
					  </div>
					</div>
					
					
					
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

                <div style="background: white; width:; padding: 25px; display: block; border: 1px solid gray;">
                [사용안내]<br>
                ㆍ아래 목록에서 기안서를 작성할 양식에 체크해주세요.<br>
				ㆍ우측 하단의 '확인' 버튼을 눌러 양식을 가져올 수 있습니다.
				</div>

					<div style="margin-top:20px; display: flex; float: left; width: 42%;">
						<div style="">

							<ul id="document-tree" class="ztree"></ul>
						</div>

						<div style="margin-left: 20px;" id="tree_list_empty">
							<ul id="form_list" data-name=""
               					class="ztree"></ul>
						</div>
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
  
 


<script type="text/javascript">

const formSign='${sign}';
const me='${member.username}'

const myDept='${member.departmentCdName}'
const myRank='${member.codeName}'
const myName='${member.name}'

</script>

	<!-- approval-form에 html style적용 -->
	<script src="/js/approval/approval-form.js"></script>
	<script src="/js/approval/approval-date.js"></script>

	<!-- tree -->
	<script src="/js/ztree/paint-tree.js"></script>
	<script src="/js/ztree/up-document-tree.js"></script>


</body>
</html>
