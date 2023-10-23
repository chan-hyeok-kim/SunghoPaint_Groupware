<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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


.material-icons{
      padding: 0px;
      height: 30px;
      width: 30px;
}
</style>


<!-- Toast API -->
<link rel="stylesheet"
	href="https://uicdn.toast.com/editor/latest/toastui-editor.css" />

<script
	src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
<script src="https://uicdn.toast.com/editor/latest/i18n/ko-kr.js"></script>


<!-- Toast Plugin -->
<!-- 토스트 UI 컬러피커 -->
<link rel="stylesheet" href="https://uicdn.toast.com/tui-color-picker/latest/tui-color-picker.css" />
<script src="https://uicdn.toast.com/tui-color-picker/latest/tui-color-picker.min.js"></script>

<!-- 토스트 UI 컬러피커와 에디터 연동 플러그인 -->
<link rel="stylesheet" href="https://uicdn.toast.com/editor-plugin-color-syntax/latest/toastui-editor-plugin-color-syntax.min.css" />
<script src="https://uicdn.toast.com/editor-plugin-color-syntax/latest/toastui-editor-plugin-color-syntax.min.js"></script>

<!-- 토스트 UI 차트 -->
<link rel="stylesheet" href="https://uicdn.toast.com/chart/latest/toastui-chart.css">
<script src="https://uicdn.toast.com/chart/latest/toastui-chart.js"></script>
<!-- 토스트 UI 차트와 토스트 UI 에디터를 연결  -->
<script src="https://uicdn.toast.com/editor-plugin-chart/latest/toastui-editor-plugin-chart.min.js"></script>


<!-- 토스트 UI 에디터 플러그인, 코드 신텍스 하이라이터 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/prism/1.28.0/themes/prism-okaidia.min.css">
<link rel="stylesheet" href="https://uicdn.toast.com/editor-plugin-code-syntax-highlight/latest/toastui-editor-plugin-code-syntax-highlight.min.css">
<script src="https://uicdn.toast.com/editor-plugin-code-syntax-highlight/latest/toastui-editor-plugin-code-syntax-highlight-all.min.js"></script>


<link rel="stylesheet" href="https://uicdn.toast.com/editor-plugin-table-merged-cell/latest/toastui-editor-plugin-table-merged-cell.min.css" />
<script src="https://uicdn.toast.com/editor-plugin-table-merged-cell/latest/toastui-editor-plugin-table-merged-cell.min.js"></script>
<script src="https://uicdn.toast.com/editor-plugin-uml/latest/toastui-editor-plugin-uml.min.js"></script>
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
						name="approvalTitle"> </span>
				</div>

				<div>
					<span class="title"></span> <span class="title">결재라인</span> <input
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
						style="display: inline-block;"
						class="form-control approval-line-search" type="search"
						placeholder="" aria-label="Search">
					<button id="top-search-btn" class="btn btn-info approval-line-btn"
						type="submit">
						<i class="mdi mdi-account-search"></i>
					</button>
				</div>
				<div>
					<span class="title"></span><span class="title">결재자</span> <input
						style="display: inline-block;"
						class="form-control approval-line-search" type="search"
						placeholder="" aria-label="Search">
					<button id="top-search-btn" class="btn btn-info approval-line-btn"
						type="submit">
						<i class="mdi mdi-account-search"></i>
					</button>
				</div>


				<div>
					구분(결재양식) <input style="display: inline-block;"
						class="form-control approval-line-search" type="search"
						placeholder="" aria-label="Search">
					<button id="top-search-btn" class="btn btn-info approval-line-btn"
						type="submit">
						<i class="mdi mdi-account-search"></i>
					</button>
				</div>


				</ul>
			</div>

			<!-- Toast UI -->
			<div id="editor"></div>


			<!-- add button -->
			<button class="btn btn-info">임시저장</button>
			<button class="btn btn-info">지우기</button>
			<button class="btn btn-info">결재</button>
		</div>


	</div>


	<!-- Modal -->

	<div class="modal fade" id="approvalModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-xl" role="document">
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
						 <input type="radio"> 이름 
						 <input type="radio"> 부서
						 <input type="search">
						 <button type="submit" class="btn btn-info material-icons">search</span>
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



			</div>
			<div class="modal-footer" style="background: white;">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
				<button type="button" class="btn btn-info">확인</button>
			</div>
		</div>
	</div>
	</div>
	<!-- modal end -->



	<script src="/js/commons/toast-ui.js"></script>

	<!-- tree -->
	<script src="/js/ztree/paint-tree.js"></script>


</body>
</html>