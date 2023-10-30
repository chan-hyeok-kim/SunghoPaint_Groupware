<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="/css/demo.css" type="text/css">
<link rel="stylesheet" href="/css/zTreeStyle/zTreeStyle.css"
	type="text/css">
<!-- Toast API -->
<link rel="stylesheet"
	href="https://uicdn.toast.com/editor/latest/toastui-editor.css" />
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

.purchase-line-search {
	width: 200px;
	align-content: flex-end;
	height: 18.53px;
}

.purchase-line-btn {
	width: 77px;
	height: 20px;
	padding: 0px;
	height: 32.06px;
}

#purchase-input-date input {
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


</head>
<body>



	<div class="card">
		<div class="card-body">
			<div class="wrapper-toolbar">구매서 작성</div>
			
			<br><br>
			
			<table class="table table-bordered">
			    <tr>
			        <td	>일자</td>
			        <td><input type="date" placeholder="날짜 입력"></td>
			        <td>거래처</td>
			        <td><input
						style="display: inline-block;"
						class="form-control purchase-line-search" type="search"
						placeholder="거래처 입력"  aria-label="Search">
					</td>
			    </tr>
			    <tr>
			        <td>담당자</td>
			        <td><input
						style="display: inline-block;"
						class="form-control purchase-line-search" type="search"
						placeholder="담당자 입력"  aria-label="Search">
					</td>
			        <td>입고창고</td>
			        <td><input
						style="display: inline-block;"
						class="form-control purchase-line-search" type="search"
						placeholder="입고창고 입력"  aria-label="Search">
					</td>
			    </tr>
			    <tr>
			        <td>납기일자</td>
			        <td><input type="date" ></td>
			        
			        <!-- <td>거래유형</td>
			        <td><div class="dropdown">
						  <button class="btn btn-info dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
						    Dropdown button
						  </button>
						  <ul class="dropdown-menu info">
						    <li><a class="dropdown-item" href="#">Action</a></li>
						    <li><a class="dropdown-item" href="#">Another action</a></li>
						    <li><a class="dropdown-item" href="#">Something else here</a></li>
						  </ul>
						</div></td> -->
			    </tr>
			</table>
			<br><br><br><br><br>
			<table class="table table-bordered">
			    <tr>
			        <td>#</td>
			        <td>일자</td>
			        <td>거래처</td>
			        <td>담당자</td>
			        <td>입고창고</td>
			        <td>납기일자</td>
			    </tr>
				    <c:forEach items="${add}" var="vo" varStatus="i">
					    <tr>
					        <%-- <td></td>
					        <td>${vo.}</td>
					        <td>${vo.}</td>
					        <td>${vo.}</td>
					        <td>${vo.}</td>
					        <td>${vo.}</td> --%>
					    </tr>
				    </c:forEach>
			</table>



	<br><br><br>
		<div style="float: right;">
			<button class="btn btn-info">임시저장</button>
			<button class="btn btn-info">지우기</button>
			<button class="btn btn-info" type="submit">입력완료</button>
		</div>
		</div>


	</div>


</body>
</html>