<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제목 입력</title>

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
    function calculateTotal() {
        var quantity = parseFloat(document.getElementById("purchaseQuantity").value);
        var materialSelect = document.getElementById("materialProductNo");
        var price = parseFloat(materialSelect.options[materialSelect.selectedIndex].getAttribute("data-price"));

        // 수량과 가격이 유효한 숫자인지 확인
        if (!isNaN(quantity) && !isNaN(price)) {
            var totalPrice = quantity * price;
            document.getElementById("totalPrice").value = Math.round(totalPrice);
        } else {
            // 잘못된 입력 처리, 예를 들어 총 가격을 0으로 설정하거나 오류 메시지 표시
            document.getElementById("totalPrice").value = '0원';
        }
    }

    function updateMaterialPrice() {
        var materialSelect = document.getElementById("materialProductNo");
        var priceField = document.getElementById("materialPrice");

        var selectedOption = materialSelect.options[materialSelect.selectedIndex];
        var price = parseFloat(selectedOption.getAttribute("data-price"));

        // 가격이 유효한 숫자인지 확인
        if (!isNaN(price)) {
            priceField.value = Math.round(price) + '원';
        } else {
            // 잘못된 입력 처리, 예를 들어 원료 가격을 0으로 설정하거나 오류 메시지 표시
            priceField.value = '0원';
        }
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
                            <select class="form-control" type="text" name="materialProductNo" id="materialProductNo" onchange="updateMaterialPrice(); calculateTotal()">
                                <c:forEach items="${material}" var="f">
                                    <c:if test="${f.materialProductCategory eq '원료'}">
                                        <option value="${f.materialProductNo}" data-price="${f.materialProductPrice}">${f.codeName}</option>
                                    </c:if>
                                </c:forEach>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>구매수량</td>
                        <td><input class="form-control" type="number" name="purchaseQuantity" id="purchaseQuantity" placeholder="구매 수량 입력해주세요" oninput="calculateTotal()"></td>
                        <td>입고창고</td>
                        <td>
                            <select class="form-control" type="text" name="factoryStorageNo">
                                <c:forEach items="${factory}" var="vo">
                                <c:if test="${vo.factoryStorageCategory eq '창고'}">
                                    <option value="${vo.factoryStorageNo}">${vo.codeName}</option>
                                </c:if>
                                </c:forEach>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>금액 합계</td>
                        <td>
                            <input class="form-control" type="text" name="totalPrice" id="totalPrice" readonly>
                        </td>
                        <td>납기일자</td>
                        <td><input type="date" class="form-control" name="purchaseInDate"></td>
                    </tr>
                    <tr>
                        <td>원료 가격</td>
                        <td>
                            <input class="form-control" type="text" name="materialPrice" id="materialPrice" readonly>
                        </td>
                        <td></td>
                        <td></td>
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