<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="/css/calendarStyle/calendar.css">
<link rel="stylesheet" href="/css/myCustomStyle/main.css">


</head>
<body>



	<div class="row">
		<div class="col-md-12 grid-margin stretch-card">
			<div class="card">
				<div class="card-body" style="display: flex; padding:10px;">
				
				
					<div class="top-btn-box">
						<div style="">
							<button class="btn btn-gradient-primary main-app-btn">

								<span class="material-symbols-outlined main-top-icon">
									campaign </span>
								<p
									class="top-btn-p">
									New task<br> 검토할 문서가 등록되었습니다
								</p>
							</button>

						</div>
						<div style="display: flex; flex-direction: column;">
							<button class="btn btn-primary main-btn-check">
								<i class="mdi mdi-check"></i>
							</button>
							<div style="margin-top: 2px;">
								<button class="btn btn-primary main-btn">
									<i class="mdi mdi-close"></i>
								</button>
							</div>
						</div>
					</div>


<div class="top-btn-box">
						<div style="">
							<button class="btn btn-gradient-success main-app-btn">

								<span class="material-symbols-outlined main-top-icon" style="color:#3dd6bf">
									task </span>
								<p class="top-btn-p"
									>
									New Approval<br>내 기안서 현황을 확인해보세요
								</p>
							</button>

						</div>
						<div style="display: flex; flex-direction: column;">
							<button class="btn btn-success main-btn-check">
								<i class="mdi mdi-check"></i>
							</button>
							<div style="margin-top: 2px;">
								<button class="btn btn-success main-btn">
									<i class="mdi mdi-close"></i>
								</button>
							</div>
						</div>
					</div>
					
					
					<div class="top-btn-box">
						<div style="">
							<button class="btn btn-gradient-info main-app-btn">

								<span class="material-symbols-outlined main-top-icon" style="color:#047edf">
									notifications_active </span>
								<p
									class="top-btn-p">
									New messages<br> 새로운 알림이 도착했습니다
								</p>
							</button>

						</div>
						<div style="display: flex; flex-direction: column;">
							<button class="btn btn-info main-btn-check">
								<i class="mdi mdi-check"></i>
							</button>
							<div style="margin-top: 2px;">
								<button class="btn btn-info main-btn">
									<i class="mdi mdi-close"></i>
								</button>
							</div>
						</div>
					</div>
					
					<div class="top-btn-box">
						<div style="">
							<button class="btn btn-gradient-danger main-app-btn">

								<span class="material-symbols-outlined main-top-icon" style="color:#fe90a6;">
									list_alt </span>
								<p
									class="top-btn-p">
									New Notice<br> 새 공지가 올라왔습니다
								</p>
							</button>

						</div>
						<div style="display: flex; flex-direction: column;">
							<button class="btn btn-danger main-btn-check">
								<i class="mdi mdi-check"></i>
							</button>
							<div style="margin-top: 2px;">
								<button class="btn btn-danger main-btn">
									<i class="mdi mdi-close"></i>
								</button>
							</div>
						</div>
					</div>
					


				</div>
			</div>
		</div>



<!-- stock -->

    <div class="col-md-7 grid-margin stretch-card" style="height: 520px;" id="material-product-amount">
        <div class="card">
            <div class="card-body">
                <h4 style="font-weight: bold">주간 제품 생산량</h4>
                
                
                <div>
  <canvas id="myChart"></canvas>
</div>
</div>
</div>
</div>


<!-- stock end -->


		<!-- calendar start -->
		
		<div class="col-md-5 grid-margin stretch-card" style="flex: right; height: 520px;">

			<div class="card">
				<div class="card-body">

					<div id='calendar'></div>
				</div>
			</div>
		</div>
	
	
	<!-- calendar end -->

	<!-- progress start -->

	<div class="col-6 grid-margin stretch-card" id="my-app-list"
		style=" height: 520px;">
		<div class="card">
			<div class="card-body">
				<div style="float: left">
					<h4 class="card-title">내 검토 목록</h4>
				</div>
				<div style="float: right; margin-bottom: 10px;">

				</div>
				<table class="table table-hover mt-2" id="approval-table">
					<thead>
						<tr>
							<th>기안일자</th>
							<th>제목</th>
							<th>기안자</th>
							<th>결재자</th>
							<th>진행상태</th>
							<th>결재 확인</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${approvalList}" var="vo" varStatus="i">
							<c:if test="${i.index lt 4}">
								<tr>
									<td class="approval-start-date">${vo.approvalStartDate}</td>
									<td>${vo.approvalTitle}</td>
									<td>${vo.drafter}</td>
									<td id="check" data-check="${vo.approvalStatusCd}">${vo.lastApproverName}</td>
									<td>
									<c:choose>
									<c:when test="${vo.apCodeName eq '진행중'}"><label class="badge badge-gradient-info">${vo.apCodeName}</label></c:when>
									<c:when test="${vo.apCodeName eq '반려'}"><label class="badge badge-gradient-danger">${vo.apCodeName}</label></c:when>
									<c:when test="${vo.apCodeName eq '승인 완료'}"><label class="badge badge-gradient-success">${vo.apCodeName}</label></c:when>
									<c:when test="${vo.apCodeName eq '기안중'}"><label class="badge badge-gradient-primary">${vo.apCodeName}</label></c:when>
																	
									</c:choose>
									</td>
									<td><a data-no="${vo.approvalNo}"
										class="detail-proceed-btn" href="/approval/detail?approvalNo=${vo.approvalNo}">기안서 확인</a></td>
								</tr>
							</c:if>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>



	<!-- progress end -->







	<!-- pending approval -->

	<div class="col-6 grid-margin stretch-card" id="app-list"
		style=" height: 520px">
		<div class="card">
			<div class="card-body">

				<div style="float: left">
					<h4 class="card-title">내 결재 목록</h4>
				</div>
				<div style="float: right; margin-bottom: 10px;">
					<button class="btn btn-light" onclick="location.href='/approval/add'">
						<span class="material-symbols-outlined"> edit_square </span>
					</button>

				</div>
				<div></div>
				<table class="table table-hover mt-2" id="approval-table">
					<thead>
						<tr>
							<th>기안일자</th>
							<th>제목</th>
							
							<th>결재자</th>
							<th>진행상태</th>
							<th>결재 확인</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list}" var="vo" varStatus="i">
							<c:if test="${i.index lt 5}">
								<tr>
									<td class="approval-start-date">${vo.approvalStartDate}</td>
									<td>${vo.approvalTitle}</td>
									
									<td id="check" data-check="${vo.approvalStatusCd}">${vo.lastApproverName}</td>
									<td>
									<c:choose>
									<c:when test="${vo.apCodeName eq '진행중'}"><label class="badge badge-gradient-info">${vo.apCodeName}</label></c:when>
									<c:when test="${vo.apCodeName eq '반려'}"><label class="badge badge-gradient-danger">${vo.apCodeName}</label></c:when>
									<c:when test="${vo.apCodeName eq '승인 완료'}"><label class="badge badge-gradient-success">${vo.apCodeName}</label></c:when>
																	
									</c:choose>
									</td>
									<td><a data-no="${vo.approvalNo}"
										class="detail-proceed-btn" href="/approval/detail?approvalNo=${vo.approvalNo}">기안서 확인</a></td>
								</tr>
							</c:if>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<!-- pending approval end -->
    
    <!-- alarm -->
    <div class="col-6 grid-margin stretch-card" id="message-list"
		style=" height: 520px">
		<div class="card">
			<div class="card-body">

				<div style="float: left">
					<h4 class="card-title">최근 도착한 메시지</h4>
				</div>
				<div style="float: right; margin-bottom: 10px;">
					<button class="btn btn-light" id="message-refresh-btn">
						<span class="material-symbols-outlined"> cached </span>
					</button>

				</div>
				<div id="message-ajax-list"></div>
				
			</div>
		</div>
	</div>
    <!-- alarm end-->
    
    <!-- notice -->
    <div class="col-6 grid-margin stretch-card" id="notice-list"
		style=" height: 520px">
		<div class="card">
			<div class="card-body">

				<div style="float: left">
					<h4 class="card-title">공지사항 </h4>
				</div>
				<div style="float: right; margin-bottom: 10px;">
					<button class="btn btn-light" id="notice-refresh-btn">
						<span class="material-symbols-outlined"> cached </span>
					</button>

				</div>
				<div id="notice-ajax-list">
				<table class="table table-hover mt-2" id="approval-table">
					<thead>
						<tr>
							<th>작성일자</th>
							<th>제목</th>
							<th>작성자</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${noticeList}" var="vo" varStatus="i">
							<c:if test="${i.index lt 5}">
								<tr>
									<td class="notice-reg-date">${vo.regDate}</td>
									<td><a style="text-decoration: none;" href="/notice/detail?noticeNo=${vo.noticeNo}">${vo.noticeTitle}</a></td>
									<td>${vo.humanResourceVO.name}</td>
								</tr>
							</c:if>
						</c:forEach>
					</tbody>
				</table>
				</div>
			</div>
		</div>
	</div>
    <!-- notice end -->

  
  

<!------------------------------------------------- Add modal ------------------------------------------------->
 <div class="modal fade" id="calendarAddModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">연차 등록</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                
                <form id="addForm" action="./addAnnual" method="post">
                <div class="modal-body">
                    <div class="form-group">
						
                        <label for="taskId" class="col-form-label">시작일</label>
                        <input type="date" class="form-control" id="calendar_start_date" name="scheduleDate">
                        
                        <label for="taskId" class="col-form-label">종료일</label>
                        <input type="date" class="form-control" id="calendar_end_date" name="scheduleEndDate">
                        
                        <label for="taskId" class="col-form-label">사용자</label>
                        <input type="text" class="form-control" id="calendar_name" value="${empName} ${position}" readonly>
                        <input type="hidden" class="form-control" name="employeeId" value="${empId}">
                        
                        <label for="taskId" class="col-form-label">휴가 사유</label>
                        <input type="text" class="form-control" id="calendar_location" name="scheduleContents">
                        
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-warning" id="addCalendar">추가</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal"
                        id="sprintSettingModalClose">취소</button>
                </div>
    			</form>
            </div>
        </div>
    </div>
<!------------------------------------------------- Add modal ------------------------------------------------->
 <!-- chart js -->
   <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
   
	<!-- calendar -->

	<script
		src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.9/index.global.min.js'></script>
	<script src='/js/main/mainCalendar.js'></script>
    <script src='/js/main/main.js'></script>
    

</body>
</html>