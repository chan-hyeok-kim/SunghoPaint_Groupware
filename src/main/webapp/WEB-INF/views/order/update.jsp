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
			<div class="wrapper-toolbar">구매서 상세</div>
			
			<br><br>
			
			<table class="table table-bordered">
				<form action="update" method="post">
					<input type="hidden" name="purchaseNo" value="${kvo.purchaseNo}">
				
					    <tr>
					        <td	>일자</td>
					        <td><input type="date" class="form-control" name="purchaseDate" value="${kvo.purchaseDate}"></td>
					        <td>거래처</td>
					        <td><input type="text" class="form-control" name="clientName" value="${kvo.clientVO.clientName}"></td>
					    </tr>
					    <tr>
	     					<td>담당자</td>
					        <td><input type="text" class="form-control" name="name" value="${kvo.humanResourceVO.name}"></td>
					        <td>총액</td>
				        	<td><input type="number" class="form-cotrol" name="totalPrice" value="${kvo.totalPrice}">원</td>
					    </tr>
					    <tr>
					        <td>납기일자</td>
					        <td><input type="date" class="form-control" name="purchaseInDate" value="${kvo.purchaseInDate}"></td>
					        <td>입고창고</td>
					        <td>
					        <%-- <input type="hidden" name="factoryStorageNo" value="${kvo.factoryStorageNo}"> --%>
				        	<select class="form-select" name="fcode">
				        		<option value="원료창고">원료창고</option>
				        		<option value="제품창고">제품창고</option>
				        	</select>
							</td>
					    </tr>
			</table>
			<br><br><br><br><br>
					<div style="float: right;">
						<button class="btn btn-info" type="reset" >되돌리기</button>
						<button class="btn btn-success" type="submit" >수정하기</button>
					</div>
			    </form>
		</div>
	</div>
</body>
</html>