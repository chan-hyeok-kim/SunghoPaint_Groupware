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

.material-icons {
	padding: 0px;
	height: 30px;
	width: 30px;
}
</style>

<script type="text/javascript">
    function calculateTotal() {
        var quantity = parseFloat(document.getElementById("purchaseQuantity").value);
        var materialSelect = document.getElementById("materialProductNo");
        var price = parseFloat(materialSelect.options[materialSelect.selectedIndex].getAttribute("data-price"));

        // Validate that the quantity is not negative
        if (quantity < 0) {
            alert("Purchase quantity cannot be negative.");
            document.getElementById("purchaseQuantity").value = 0; // Set quantity to 0
            return;
        }

        // Validate that the quantity and price are valid numbers
        if (!isNaN(quantity) && !isNaN(price)) {
            var totalPrice = quantity * price;
            document.getElementById("totalPrice").value = Math.round(totalPrice);
        } else {
            // Handle invalid inputs
            document.getElementById("totalPrice").value = '0원';
        }
    }

    function updateMaterialPrice() {
        var materialSelect = document.getElementById("materialProductNo");
        var priceField = document.getElementById("materialPrice");

        var selectedOption = materialSelect.options[materialSelect.selectedIndex];
        var price = parseFloat(selectedOption.getAttribute("data-price"));

        // Validate that the price is a valid number
        if (!isNaN(price)) {
            priceField.value = Math.round(price) + '원';
        } else {
            // Handle invalid input
            priceField.value = '0원';
        }
    }
</script>

</head>
<body>

    <div class="card">
        <div class="card-body">
            <div class="wrapper-toolbar">구매서 상세</div>

            <br>
            <br>

            <table class="table table-bordered">
                <form action="./update" method="post" id="frm">
                    <!-- Existing hidden fields for purchaseNo and purchaseDate -->

                    <tr>
                        <td>거래처</td>
                        <td>
                            <select class="form-control" type="text" name="clientNo">
                                <c:forEach items="${client}" var="vo">
                                        <option value="${vo.clientNo}" ${vo.clientNo == kvo.clientNo ? 'selected' : ''}>${vo.clientName}</option>
                                </c:forEach>
                            </select>
                        </td>
                        <td>원료명</td>
                        <td>
                            <select class="form-control" type="text" name="materialProductNo">
                                <c:forEach items="${material}" var="f">
                                    <c:if test="${f.materialProductCategory eq '원료'}">
                                        <option value="${f.materialProductNo}" ${f.materialProductNo == kvo.materialProductNo ? 'selected' : ''}>${f.codeName}</option>
                                    </c:if>
                                </c:forEach>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>구매수량</td>
                        <td>
                            <input class="form-control" type="number" name="purchaseQuantity" value="${kvo.purchaseQuantity}">
                        </td>
                        <td>입고창고</td>
                        <td>
                            <select class="form-control" name="factoryStorageNo">
                                <c:forEach items="${factory}" var="vo">
                                    <c:if test="${vo.factoryStorageCategory eq '창고'}">
                                        <option value="${vo.factoryStorageNo}" ${vo.factoryStorageNo == kvo.factoryStorageNo ? 'selected' : ''}>${vo.codeName}</option>
                                    </c:if>
                                </c:forEach>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>금액 합계</td>
                        <td>
                            <input class="form-control" type="number" name="totalPrice" value="${kvo.totalPrice}" readonly>
                        </td>
                        <td>납기일자</td>
                        <td>
                            <input type="date" class="form-control" name="purchaseInDate" value="${kvo.purchaseInDate}">
                        </td>
                    </tr>
                    <td>원료 가격</td>
                        <td>
                            <input class="form-control" type="text" name="materialPrice" id="materialPrice" readonly>
                        </td>
            </table>
            <br>
            <br>
            <br>
            <br>
            <br>
            <div style="float: right;">
                <button class="btn btn-danger" type="reset">되돌리기</button>
                <button class="btn btn-info" type="button" id="update-confirm-btn">수정하기</button>
            </div>
            </form>
        </div>
    </div>

    <script src="/js/purchase/update-check.js"></script>

</body>
</html>