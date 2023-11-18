<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
							<div>문서 양식 수정</div>
						</div>
						<ul class="nav-tabs">
						</ul>

						<div>
						
							<table class="table table-bordered">
								<tbody>
								    <tr>
								    <form action="./update" method="post" id="frm">
										<td style="padding: 20px">상위양식함
										</td>
										
										<td><select id="select-form" name="upTypeCodeName">
										<option value="">-----선택하세요-----</option>
										<c:forEach items="${list}" var="vos">
										<option value="${vos.codeName}">${vos.codeName}</option>
										</c:forEach>
										</select>
										<%-- <input class="form-control" name="approvalUpTypeNo" value="${vo.approvalUpTypeVO.codeName}"></td> --%>
									</tr>
									<input type="hidden" name="approvalUpTypeNo" value="${vo.approvalUpTypeNo}">
									<input type="hidden" name="approvalTypeCd" value="${vo.approvalTypeCd}">	
									<input type="hidden" name="approvalTypeNo" value="${vo.approvalTypeNo}">
									
									<tr>
										<td style="padding: 20px">양식명</td>
										<td><input class="form-control" name="codeName" data-cd-name="${vo.approvalUpTypeVO.codeName}" 
										id="check-cd" value="${vo.codeName}"></td>
									</tr>
									<tr>
										<td style="padding: 20px">양식</td>
										<td>
										<!-- Smart Editor UI -->
							<textarea name="approvalForm" style="width: 100%" id="approvalForm" rows="10" cols="100"></textarea>
										<span style="display: none;" id="form-list-update">${vo.approvalForm}</span>
										
										</td>
									</tr>
								</tbody>
							</table>

                            
<div id="test"></div>
<div id="text-delete-btn-list">
<button type="button" class="btn btn-info" id="text-delete-btn"
					        style="margin-left: 20px;">지우기</button>
				</div>
							<div id="document-add-btn-list" style="justify-content: right; display: flex;">
								
								<button type="button" class="btn btn-info"
									onclick="location.href='/document/list'">취소</button>
								<button type="button" class="btn btn-info" id="document-update-btn"
								style="margin-left:20px;">등록</button>
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
	 
	<!-- update check  -->
    <script src="/js/document/update-check.js"></script>
    

    
</body>
</html>