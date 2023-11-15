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
									style="margin-bottom: 0px; text-align: left; width: 260px; vertical-align: middle;">
									New task<br> 결재할 문서가 등록되었습니다
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
								<p
									style="margin-bottom: 0px; text-align: left; width: 260px; vertical-align: middle;">
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
									style="margin-bottom: 0px; text-align: left; width: 260px; vertical-align: middle;">
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
									style="margin-bottom: 0px; text-align: left; width: 260px; vertical-align: middle;">
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
<div class="row">
    <div class="col-md-7 grid-margin stretch-card" style="height: 500px;">
        <div class="card">
            <div class="card-body">
                <h4 style="font-weight: bold">주간 원료 생산량</h4>
                
                
                <div>
  <canvas id="myChart"></canvas>
</div>
</div>
</div>
</div>

<%-- <div style="margin-top:50px;">


 <h4 style="font-weight: bold">재고 현황</h4>

                    <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
                        <div class="carousel-inner">
                            <div class="carousel-item active">
                                <div style="display: flex;">
                                    <c:forEach items="${materList}" var="vo" varStatus="i">
                                        <c:if test="${i.count lt 4}">
                                            <div>
                                                <p><h5>${vo.materialProductName}</h5></p>
                                                <div class="pie-chart pie-chart${i.count}">
                                                    <span class="center">${vo.materialProductStock}</span>
                                                </div>
                                            </div>
                                        </c:if>
                                    </c:forEach>
                                </div>
                            </div>

                            <div class="carousel-item">
                                <div style="display: flex;">
                                    <c:forEach items="${materList}" var="vo" varStatus="i">
                                        <c:if test="${i.count gt 3 and i.count lt 7}">
                                            <div>
                                                <p><h3>${vo.materialProductName}</h3></p>
                                                <div class="pie-chart pie-chart${i.count}">
                                                    <span class="center">${vo.materialProductStock}</span>
                                                </div>
                                            </div>
                                        </c:if>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                        <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="sr-only" style="color: black;">Previous</span>
                        </a>
                        <a style="color: black;" class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="sr-only">Next</span>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div> --%>
<!-- stock end -->


		<!-- calendar start -->
		
		<div class="col-md-5 grid-margin stretch-card" style="flex: right; height: 500px;">

			<div class="card">
				<div class="card-body">

					<div id='calendar'></div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- calendar end -->

	<!-- progress start -->

	<div class="col-6 grid-margin stretch-card" id="my-app-list"
		style="width: 765px; height: 400px;">
		<div class="card">
			<div class="card-body">
				<div style="float: left">
					<h4 class="card-title">내 결재현황</h4>
				</div>
				<div style="float: right; margin-bottom: 10px;">
					<button class="btn btn-light">
						<span class="material-symbols-outlined"> edit_square </span>
					</button>

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
						<c:forEach items="${list}" var="vo" varStatus="i">
							<c:if test="${i.index lt 4}">
								<tr>
									<td class="approval-start-date">${vo.approvalStartDate}</td>
									<td>${vo.approvalTitle}</td>
									<td>${vo.drafter}</td>
									<td id="check" data-check="${vo.approvalStatusCd}">${vo.lastApproverName}</td>
									<td>${vo.apCodeName}</td>
									<td><a data-no="${vo.approvalNo}"
										class="detail-proceed-btn">기안서 확인</a></td>
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
		style="width: 765px; height: 500px">
		<div class="card">
			<div class="card-body">

				<div style="float: left">
					<h4 class="card-title">승인 대기중인 결재목록</h4>
				</div>
				<div style="float: right; margin-bottom: 10px;">
					<button class="btn btn-light">
						<span class="material-symbols-outlined"> edit_square </span>
					</button>

				</div>
				<div></div>
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
							<c:if test="${i.index lt 5}">
								<tr>
									<td class="approval-start-date">${vo.approvalStartDate}</td>
									<td>${vo.approvalTitle}</td>
									<td>${vo.drafter}</td>
									<td id="check" data-check="${vo.approvalStatusCd}">${vo.lastApproverName}</td>
									<td>${vo.apCodeName}</td>
									<td><a data-no="${vo.approvalNo}"
										class="detail-proceed-btn">기안서 확인</a></td>
								</tr>
							</c:if>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<!-- pending approval end -->

	
<!--  -->
	<div class="row">
	
	
	</div>


 <!-- chart js -->
   <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
   
	<!-- calendar -->

	<script
		src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.9/index.global.min.js'></script>
	<script src='/js/main/mainCalendar.js'></script>
    <script src='/js/main/main.js'></script>


</body>
</html>