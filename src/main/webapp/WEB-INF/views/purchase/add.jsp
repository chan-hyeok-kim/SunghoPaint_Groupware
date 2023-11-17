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
<script type="text/javascript">
    function 총액_업데이트() {
        var Quantity = parseInt(document.getElementById("purchaseQuantity").value);
        var Price = parseFloat(document.getElementById("materialProductPrice").value);
        var TotalPrice = Quantity * Price;

        // 계산된 총액을 표시
        document.getElementById("totalPrice").value = TotalPrice.toFixed(2);
    }
</script>

</head>
<body>



	<div class="card">
		<div class="card-body">
			<div class="wrapper-toolbar">구매서 작성</div>
			
			<br><br>
			
			<table class="table table-bordered">
			
				<form action="add" method="post">
					
				    <tr>
				        <td>거래처</td>
				        <td>
						<select class="form-control" type="text" name="clientNo">
					    <c:forEach items="${client}" var="vo">
					    <option value="${vo.clientNo}">${vo.clientName}</option>
					    </c:forEach>
					    </select>
						</td>
						<td>원료명</td>
						<td>
							<select class="form-control" type="text" name="materialProductNo" id="materialProductNo" onchange="총액_업데이트()">
						 	<c:forEach items="${material}" var="f">
						 	<c:if test="${f.materialProductCategory eq '원료'}">
							<option value=${f.materialProductNo}>${f.codeName}</option>	
						 	</c:if>						
					 		</c:forEach>
							</select>
						</td>
				    </tr>
				    <tr>
				        <td>구매수량</td>
				        <td><input class="form-control" type="number" name="purchaseQuantity" placeholder="구매 수량 입력해주세요"></td>
				          <td>입고창고</td>
				        <td>
				        <select class="form-control" type="text" name="factoryStorageNo">
				        <c:forEach items="${factory}" var="vo">
				        <option value=${vo.factoryStorageNo}>${vo.codeName}</option>
				        </c:forEach>
				        </select>
						</td>
				    </tr>
				    <tr>
				    	<td>총액</td>
				        <td>
				        <input class="form-control" type="number" name="totalPrice" value="result">
				        <c:set var="quantity" value="${purchaseQuantity}"/>
				        <c:set var="price" value="${materialProductVO.materialProductPrice}"/>
				        <c:set var="result" value="${quantity * price}"/>
				        </td>
				        <td>납기일자</td>
				        <td><input type="date" class="form-control" name="purchaseInDate"></td>
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