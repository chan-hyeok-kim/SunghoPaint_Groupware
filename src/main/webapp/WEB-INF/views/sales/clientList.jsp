<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<style type="text/css">
  #tree_list_add {
	margin-left: 20px;
}

#tree-table {
	border: 1px solid black;
	height: 360px;
	width: 220px;
	padding: 10px;
}

#tree-table-div {
	margin: 10px;
}

#approval-table {
	text-align: center;
	width: 100%
}

.nav-tabs>li:before, .nav-tabs>li:after {
	content: " ";
	display: block;
	position: absolute;
	top: 0;
	height: 100%;
	width: 12px;
	background-color: #f7f7f7;
	transition: all 250ms ease;
}

.nav-tabs>li {
	float: left;
	position: relative;
	cursor: pointer;
	z-index: 2;
	transition: all 250ms ease;
	padding: 0;
	margin: 5px 12px -1px 0;
	background-color: #f7f7f7;
	border-top: 1px solid #d4d4d4;
	border-bottom: 1px solid #d4d4d4;
	list-style: none;
}

.nav-tabs>li>a {
	color: #999;
	display: block;
	padding: 4px 10px 1px 11px;
	text-decoration: none;
}

.nav-tabs>li:after {
	left: -4px;
	transform: skew(-25deg, 0deg);
	box-shadow: #d4d4d4 -1px 1px 0;
}

.nav-tabs>li {
	border-radius: 7px 7px 0 0;
}

.nav-tabs>li:before {
	right: -4px;;
	transform: skew(25deg, 0deg);
	box-shadow: #d4d4d4 1px 1px 0;
}

.nav-tabs>li:before {
	border-radius: 0 2px 0 0;
}

.nav-tabs>li:after {
	border-radius: 2px 0 0 0;
}

.link-tab:hover {
	background: #f7f7f7;
}

.wrapper-toolbar {
	padding: 10px 10px;
}

ul.nav-tabs {
	border-bottom: 1px solid #d4d4d4;
}

#grid-top-date {
	margin: 4px 0;
	line-height: 1.7;
	position: relative;
	display: inline-block;
}

#top-search-bar {
	width: 200px;
	align-content: flex-end;
	height: 18.53px;
}

#top-search-btn {
	width: 77px;
	height: 20px;
	padding: 0px;
	height: 32.06px;
}

#top-search-select {
	width: 77px;
	height: 20px;
	padding: 0px;
	height: 32.06px;
}

</style>
</head>
<body id="page-top">
	<div id="wrapper">


		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">
			<div class="card">
				<div class="card-body">

					<div class="wrapper-toolbar">

						<div style="float:left">거래처 관리</div> 
						<div style="text-align: right;">
							<form class="form-inline">

								<!-- 검색 설정 -->
								<select class="btn btn-gradient-light" id="top-search-select">
									<option selected="selected">거래처명</option>
									<option>담당자명</option>
								</select> 
								
								
								<input style="display: inline-block;" id="top-search-bar"
									class="form-control" type="search" placeholder="입력 후 [Enter]"
									aria-label="Search">
								<button id="top-search-btn" class="btn btn-info" type="submit">검색</button>

							</form>
						</div>
					</div>
					<br>
					
					

					<ul class="nav-tabs">
					</ul>
					<br>

					<a href="#accountAddModal" data-toggle="modal" onmouseover="this.style.backgroundColor='transparent'" onmouseout="this.style.backgroundColor='transparent'">
					<span class="btn btn-mini" style="border:1px solid #ddd; background-color: transparent; font-size: 12px; padding: 5px 10px;" onmouseover="this.style.backgroundColor='transparent'" onmouseout="this.style.backgroundColor='transparent'">거래처 등록</span></a>

					<div style="text-align: right; padding-top: 20px; padding-right: 10px">
						<div id="grid-top-date"></div>
					</div>
					<div id="content">


						<div class="container-fluid">

							<table class="table">
							  <thead>
							    <tr>
							      <th scope="col" style="font-weight:bold;">번호</th>
							      <th scope="col" style="font-weight:bold;">거래처명</th>
							      <th scope="col" style="font-weight:bold;">구분</th>
							      <th scope="col" style="font-weight:bold;">대표자명</th>
							      <th scope="col" style="font-weight:bold;">대표 번호</th>
							      <th scope="col" style="font-weight:bold;">사업장 주소</th>
							      <th scope="col" style="font-weight:bold;">거래처 등록자</th>
							      <th scope="col" style="font-weight:bold;">거래처 최초 등록일</th>
							    </tr>
							  </thead>
							  <tbody>
							   <c:forEach items="${getClientList}" var="vo" varStatus="i">
						           <tr>
						           	<td>${i.index + 1}</td>
						             <td><a href="./clientDetail?clientNo=${vo.clientNo}">${vo.clientName}</a></td>
						             <c:choose>
							            <c:when test="${vo.clientTypeCd eq 'C021'}">
							                <td>매출처</td>
							            </c:when>
							            <c:when test="${vo.clientTypeCd eq 'C022'}">
							                <td>매입처</td>
							            </c:when>
							            <c:when test="${vo.clientTypeCd eq 'C023'}">
							                <td>매출/매입처</td>
							            </c:when>
							        </c:choose>
						             <td>${vo.clientRepresent}</td>
						             <td>${vo.clientNumber}</td>
						             <td>${vo.clientAddress}</td>
						             <td>${vo.name} ${vo.codeName}</td>
						             <td>${vo.clientDate}</td>
						           </tr>
						         </c:forEach>
							  </tbody>
							</table>
				  </div>
				  </div>
				  
				  <!-- pagination -->
				  <div style="text-align: center; margin: 20px 20px">
				  <nav aria-label="Page navigation example" style="display: inline-block;">
  <ul class="pagination">
    <li class="page-item ${pager.pre?'':'disabled'}">
      <a class="page-link" href="/approval/getList?page=${startNum-1}" aria-label="Previous">
        <i class="mdi mdi-arrow-left-drop-circle"></i>
      </a>
    </li>
    
    <c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
    <li class="page-item"><a class="page-link" href="/approval/getList?page=${i}"><%-- ${i} --%>1</a></li>
    </c:forEach>
    
    <li class="page-item ${pager.next?'':'disabled'}">
      <a class="page-link" href="/approval/getList?page=${lastNum+1}" aria-label="Next">
        <i class="mdi mdi-arrow-right-drop-circle"></i>
      </a>
    </li>
  </ul>
</nav>

				  
  					</div>
				</div>
              </div>
			</div>
</div>
		
		
		 <div class="modal fade" id="accountAddModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">거래처 등록</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                
                <form id="addForm" action="./addClient" method="post">
                <div class="modal-body">
                    <div class="row">
                    	<div class="col-md-6">
                    	<label for="taskId" class="col-form-label">거래처명</label><br>
                        <input type="text" class="form-control" id="client_name" name="clientName">
                    	</div>
                    	<div class="col-md-6">
                    	<label for="taskId" class="col-form-label">업종</label><br>
                        <input type="text" class="form-control" id="industry_list" name="clientIndustry">
                    	</div>
                    </div>
                    
                    <div class="row">
                    	<div class="col-md-6">
                    	<label for="taskId" class="col-form-label">거래처 구분</label>
                        <select class="form-select form-select-sm" aria-label="Small select example" id="client_type_cd" name="clientTypeCd">
						  <option selected>항목을 선택하세요</option>
						  <c:forEach items="${getDivision}" var="di">
					        <option value="${di.code}">${di.codeName}</option>
					    </c:forEach>
						</select>
                        </div>
                        <div class="col-md-6">
                        <label for="taskId" class="col-form-label">대표자명</label><br>
                        <input type="text" class="form-control" id="client_represent" name="clientRepresent">
                        </div>
                    </div>
                    
                    <div class="row">
                    	<div class="col-md-6">
                        <label for="taskId" class="col-form-label">회사 대표번호</label><br>
                        <input type="tel" class="form-control" id="client_number" name="clientNumber">
                        </div>
                        
                        <div class="col-md-6">
                        <label for="taskId" class="col-form-label">거래처 담당자</label><br>
                        
                        <select class="form-select form-select-sm" aria-label="Small select example" id="client_manager" name="clientManager">
						  <option selected>항목을 선택하세요</option>
						  <c:forEach items="${getManager}" var="car">
					        <option value="${car.name}">${car.name} ${car.codeName}</option>
					    </c:forEach>
						</select>
						
                        </div>
                    </div>
                    
                    <div class="row">
                    	<div class="col-md-6">
	                    	<label for="taskId" class="col-form-label">담당자 연락처</label><br>
	                        <input type="tel" class="form-control" id="client_phone" name="clientPhone" readonly>
                        </div>
                        
                        <div class="col-md-6">
                        	<label for="taskId" class="col-form-label">은행명</label><br>
                        	<input type="text" class="form-control" id="client_bank" name="clientBank">
                        </div>
                    </div>
                    
                    <div class="row">
                    	<div class="col-md-6">
                        	<label for="taskId" class="col-form-label">계좌번호</label><br>
                        	<input type="text" class="form-control" id="client_account_no" name="clientAccountNo">
                        </div>
                        
                        <div class="col-md-6">
                        	<label for="taskId" class="col-form-label">예금주명</label><br>
                        	<input type="text" class="form-control" id="client_bank_name" name="clientBankName">
                        </div>
                    </div>
                    
                        <label for="taskId" class="col-form-label">거래처 주소</label><br>
	                        <input type="text" class="form-control" id="sample6_postcode" name="clientZipCode" placeholder="우편번호">
							<input type="button" class="form-control" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
							<input type="text" class="form-control" id="sample6_address" name="clientAddress" placeholder="주소"><br>
							<input type="text" class="form-control" id="sample6_detailAddress" name="clientDetailAddress" placeholder="상세주소">
							<input type="text" class="form-control" id="sample6_extraAddress" name="clientRefAddress" placeholder="참고항목">
                        
                        <input type="hidden" id="clientDate" name="clientDate" value="" >
                    	<input type="hidden" id="name" name="employeeId" value="${empId}" >
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-warning" id="addClient">추가</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal"
                        id="sprintSettingModalClose">취소</button>
                </div>
    			</form>
            </div>
        </div>
    </div>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
    
    
var currentDate = new Date();
var formattedDate = currentDate.toISOString().slice(0, 10); // "2023-11-07"

document.getElementById('clientDate').value = formattedDate;


const arr = new Array();


$(document).ready(function() {
    // 담당자 선택 시
    $('#client_manager').change(function() {
        // 선택된 담당자의 연락처 찾기
        let selectedManager = $(this).val();
        let managerInfo = findManagerInfo(selectedManager);

        // 연락처 입력란에 값 채우기
        $('#client_phone').val(managerInfo.phone);
    });

    // 담당자 정보 배열
    let arr = [];
    
    
$.ajax({
	  type: "GET", 
	  url: "/sales/getManagerPhone",
	  async: false,
	  success: function (res) {
	    for (const key in res) {
	      let obj = new Object();
	      
	      obj.id = res[key].employeeID;
	      obj.name = res[key].name;
	      obj.phone = res[key].phone;
	      
	      arr.push(obj);
	    }
	    console.log(arr);
	    console.log(arr[0].phone)
	
	  },
	  error: function (XMLHttpRequest, textStatus, errorThrown) {
	    console.log('error')
	  },
	});
	
//담당자 정보 찾기 함수
function findManagerInfo(managerName) {
    for (let i = 0; i < arr.length; i++) {
        if (arr[i].name === managerName) {
            return arr[i];
        }
    }
    return null; // 해당하는 담당자가 없으면 null 반환
}
});
    </script>
</body>
</html>