<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- Smart Editor2  -->
<script type="text/javascript" src="/se2/js/HuskyEZCreator.js" charset="utf-8"></script>


</head>


<body>
	<div id="wrapper">


		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<div class="card">
				<div class="card-body">
					
						<div class="wrapper-toolbar">
							<div>문서 양식 등록</div>
						</div>
						<ul class="nav-tabs">
						</ul>

						<div>
						
							<table class="table table-bordered">
								<tbody>
								    <tr>
										<td style="padding: 20px">상위양식함명</td>
										<td><input disabled="disabled" class="form-control" name="approvalUpTypeNo" value="${vo.codeName}"></td>
									</tr>
									<form action="./add" method="post" id="frm">
									<input type="hidden" name="approvalUpTypeNo" value="${vo.approvalUpTypeNo}">	
									<tr>
										<td style="padding: 20px">양식명</td>
										<td><input class="form-control" name="codeName" id="check-cd"></td>
									</tr>
									<tr>
										<td style="padding: 20px">양식</td>
										<td>
										<!-- Smart Editor UI -->
							<textarea name="approvalForm" style="width: 100%;"
							id="approvalForm" rows="10" cols="100"></textarea>
										
										</td>
									</tr>
								</tbody>
							</table>

                            
<div id="test"></div>
							
							<div style="float:left; margin-top:20px;">
							<button type="button" class="btn btn-info" id="text-delete-btn"
					        style="margin-left: 20px;">지우기</button>
							<button type="button" class="btn btn-info" id="se2-line-add-btn"
					        style="margin-left: 20px;">결재선 추가</button>
					        </div>
					        <div style="float:right; margin-top:20px; margin-right:20px;">
								<button type="button" class="btn btn-info" style="margin-right:20px;"
									onclick="location.href='/document/list'">취소</button>
								<button type="button" class="btn btn-info" id="document-add-btn">등록</button>
							</div>
							
						</div>
						<!-- Wrapper Toolbar End -->
					</form>


				</div>
			</div>
			<!-- Card End  -->


		</div>
	</div>


<!-- approval-form에 html style적용 -->
	<script src="/js/approval/approval-form.js"></script>
    
    <!-- 유효성 검증 -->
    <script src="/js/document/add-check.js"></script>
    <!-- 결재선 추가 -->
    <script src="/js/document/line-add.js"></script>
    
    
</body>
</html>