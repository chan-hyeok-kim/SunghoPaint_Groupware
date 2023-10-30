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
										<td><input class="form-control" name="approvalUpTypeNo" value="${vo.approvalUpTypeVO.codeName}"></td>
									</tr>
									<form action="./update" method="post" id="frm">
									<input type="hidden" name="approvalUpTypeNo" value="${vo.approvalUpTypeNo}">	
									<tr>
										<td style="padding: 20px">양식명</td>
										<td><input class="form-control" name="codeName" id="check-cd" value="${vo.codeName}"></td>
									</tr>
									<tr>
										<td style="padding: 20px">양식</td>
										<td>
										<!-- Smart Editor UI -->
							<textarea name="approvalForm" id="approvalForm" rows="10" cols="100" value="${vo.approvalForm}"></textarea>
										
										</td>
									</tr>
								</tbody>
							</table>

                            
<div id="test"></div>
							<div id="document-add-btn-list">
								<button type="button" class="btn btn-info"
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
	<script src="/js/commons/approval-form.js"></script>

</body>
</html>