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
	padding-left: 50px;
	padding-right: 50px;
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
							<th>기안일자</th>
							<td id="approvalStartDate" colspan="2" 
							data-date="${vo.approvalStartDate}">${vo.approvalStartDate}</td>
						</tr>
						<tr>
							<th>제목</th>
							<td colspan="2">${vo.approvalTitle}</td>
						</tr>
						<tr>
							<th rowspan="4">결재라인</th>
							<th>중간검토자</th>
							<td>${vo.midApproverName}</td>
						</tr>
						<tr>
							<th>추가검토자</th>
							<td id="add-app" data-no="${vo.approvalNo}">${vo.addApproverName}</td>
						</tr>
						<tr>
							<th>결재자</th>
							<td>${vo.lastApproverName}</td>
						</tr>
						<tr>
							<th>구분(결재양식)</th>
							<td>${vo.approvalTypeVO.codeName}</td>
						</tr>



					</table>
				</div>
				
				<form action="/approval/check" method="post" id="app-check-frm">
				<table class="table table-bordered">
					<tr>
						<td colspan="2">
							<div id="show-contents" style="display: flex; 
							justify-content: center;">${vo.approvalContents}</div>
						 <input id="mod-contents" type="hidden" name="approvalContents">
						 <input id="check" type="hidden" name="approvalCheckCd" value="${vo.approvalCheckCd}"></td>
					     <input type="hidden" name="approvalNo" value="${vo.approvalNo}">
					     <input type="hidden" id="status-cd-check" name="approvalStatusCd" value="${vo.approvalStatusCd}">
					     
					</tr>
					<tr>
<c:choose>
<c:when test="${not empty vo.admonition}">
  <td width="20%">대표이사 김성호</td>
  <td><textarea class="form-control"
  disabled="disabled">[첨언] ${vo.admonition}</textarea></td>
</c:when>
<c:when test="${empty vo.admonition}">

								<th>첨언</th>
								<td><textarea rows="5" name="admonition" class="form-control"></textarea>
								<div style="display:flex; padding:10px 0 0 0; 
								justify-content: flex-end;">
								
								</div>
								</td>
								
</c:when>
</c:choose>
						
						
					</tr>

				</table>

<!-- bottom btn-list  -->
 				<script type="text/javascript">
 				 console.log('${vo.approvalStatusCd}')
 				</script>
				<div id="form-add-btn-box">
				<c:if test="${vo.approvalStatusCd eq 'R033'}">
				
					<button class="btn btn-info" type="button" id="app-pdf-btn"
					>PDF로 다운로드</button>
	           
				</c:if>	
				<c:if test="${SPRING_SECURITY_CONTEXT.authentication.principal.username ne vo.employeeID}">
	
					<button class="btn btn-info" type="button" style="margin-left: 20px;" id="app-reject-btn"
					>반려</button>
					
					
					<button class="btn btn-info" type="button" style="margin-left: 20px;"
					onclick="location.href='/approval/update?approvalNo=${vo.approvalNo}'">수정</button>
					<button type="button" class="btn btn-info" id="app-delete-btn"
						style="margin-left: 20px;">삭제</button>
					
					
					
					<button type="button" class="btn btn-info" id="form-mid-sign"
					style="margin-left: 400px;"
					>서명하기</button>
					<button type="button" id="approval-btn" class="btn btn-info" style="margin-left: 20px;">결재</button>
				   
				   </form>
				</div>
				 </c:if> 
<script type="text/javascript">
					 console.log('${SPRING_SECURITY_CONTEXT.authentication.principal.username}')
					 console.log('${vo.employeeID}')
					 console.log('${member}')
					
					 </script>
		</div>
		
		<input type="hidden" id="form-add-no" name="approvalTypeNo">
		

	</div>


	<!-- Modal -->


	<!-- modal end -->
	
	<!-- PDF 경로 지정 input -->
	<input type="file" style="display: none;" id="pdf-file">
	 
<!-- 첨언 있는지 여부 체크 -->
<script type="text/javascript">
let admonitionCheck=${not empty vo.admonition}

/* 얘는 싸인 값 받기 */
console.log('${SPRING_SECURITY_CONTEXT.authentication.principal.username}')
const formSign='${sign}';
</script>


	<!-- approval-form에 html style적용 -->
	<script src="/js/approval/approval-form.js"></script>
	
	<!-- 날짜 관련 -->
	<script src="/js/approval/approval-date.js"></script>
    
    <!-- 결재-검토-확인 관련 -->
    <script src="/js/approval/detail-check.js"></script>
    
	<!-- tree -->
	<script src="/js/ztree/paint-tree.js"></script>
	<script src="/js/ztree/up-document-tree.js"></script>
	<script src="/js/approval/line-add.js"></script>


</body>
</html>
