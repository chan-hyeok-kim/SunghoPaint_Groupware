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
				<form action="add" method="post">
				    <tr>
				        <td	>일자</td>
				        <td><input type="date" class="form-control" name="purchaseDate"></td>
				        <td>거래처</td>
				        <td><input
							class="form-control" type="text" name="clientName"
							placeholder="거래처 입력">
						</td>
				    </tr>
				    <tr>
				        <td>담당자</td>
				        <td><input
							class="form-control" type="text" name="name"
							placeholder="담당자 입력">
						</td>
				        <td>입고창고</td>
				        <td>				        
					        <div class="btn-group" role="group" aria-label="Basic radio toggle button group">
							  <input type="radio" class="btn-check" name="" id="btnradio1" autocomplete="off" checked>
							  <label class="btn btn-outline-primary" for="btnradio1">원료 창고</label>
							
							  <input type="radio" class="btn-check" name="" id="btnradio2" autocomplete="off">
							  <label class="btn btn-outline-primary" for="btnradio2">제품 창고</label>
							</div>
						</td>
				    </tr>
				    <tr>
				        <td>납기일자</td>
				        <td><input type="date" class="form-control"></td>
				    </tr>
			</table>
			<br><br><br><br><br>
		<div style="float: right;">
			<button class="btn btn-danger" type="reset">지우기</button>
			<button class="btn btn-info" type="submit">입력완료</button>
		</div>
		</form>
		</div>


	</div>


</body>
</html>