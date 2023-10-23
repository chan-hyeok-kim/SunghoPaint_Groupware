<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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
	<div id="wrapper">


		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<div class="card">
				<div class="card-body">
					<form action="./add" method="post">
						<div class="wrapper-toolbar">
							<div>문서 양식 등록</div>
						</div>
						<ul class="nav-tabs">
						</ul>

						<div>
							<table class="table table-bordered">
								<tbody>
								    <tr>
										<td style="padding: 20px">코드명</td>
										<td><input class="form-control" name="approvalTypeCd"></td>
									</tr>
									<tr>
										<td style="padding: 20px">양식명</td>
										<td><input class="form-control" name="codeName"></td>
									</tr>
								</tbody>
							</table>

							<!-- Toast UI -->
							<div id="editor"></div>

<div id="test"></div>
							<div id="document-add-btn-list">
								<button type="button" class="btn btn-info"
									onclick="location.href='/document/list'">취소</button>
								<button class="btn btn-info" id="document-add-btn">등록</button>
							</div>
						</div>
						<!-- Wrapper Toolbar End -->
					</form>


				</div>
			</div>
			<!-- Card End  -->


		</div>
	</div>



	<script src="/js/commons/toast-ui.js"></script>

</body>
</html>