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
				        <td>거래처</td>
				        <td data-toggle="modal" data-target="#clientlModal">
				        <input style="display: inline-block; margin-left: 2px"
								class="form-control client-line-search"
								type="search" placeholder="${clientName}" aria-label="Search" />
						</td>
						<td>제품명</td>
						<td data-toggle="modal" data-target="#productModal">
						<input style="display: inline-block;"
								class="form-control product-line-search"
								type="search" placeholder="선택해주세요" aria-label="Search" />
						</td>
				    </tr>
				    <tr>
				        <td>담당자</td>
				        <td data-toggle="modal" data-target="#humanModal">
				        <input style="display: inline-block;"
								class="form-control human-line-search"
								type="search" placeholder="선택해주세요" aria-label="Search" />
						</td>
				        <td>총액</td>
				        <td><input type="number" class="form-cotrol" name="totalPrice" />원</td>
				    </tr>
				    <tr>
				        <td>납기일자</td>
				        <td><input type="date" class="form-control" name="purchaseInDate" /></td>
				        <td>입고창고</td>
				        <td>
				        	<!-- <input type="hidden" name="factoryStorageNo"> -->
				        	<select class="form-select" name="fcode">
				        		<option value="원료창고">원료창고</option>
				        		<option value="제품창고">제품창고</option>
				        	</select>
				        </td>
				    </tr>
				    <c:forEach items="${list}" var="vo" varStatus="i">
				           <tr>
				             <td>${vo.PurchaseVO.clientVO.clientName}</td>
				             <td>${vo.PurchaseVO.materialProductVO.codeVO.codeName}</td>
				             <td>${vo.PurchaseVO.humanResourceVO.name}</td>
				             <td>${vo.totalPrice}</td>
				             <td>${vo.purchaseInDate}</td>
				             <td>${vo.PurchaseVO.factoryStorageVO.factoryStorageCd}</td>
				           </tr>
				    </c:forEach>
			</table>
			<br><br><br><br><br>
		<div style="float: right;">
			<button class="btn btn-danger" type="reset">지우기</button>
			<button class="btn btn-info" type="submit">입력완료</button>
		</div>
		</form>
		</div>
		
		<!-- Modal 설정 -->
		<!-- client Modal -->
		<div class="modal fade" id="clientlModal" tabindex="-1" role="dialog" aria-labelledby="ModalLabel" aria-hidden="true">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="ModalLabel">거래처 선택</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>

		      <div class="modal-body">
			      <input class="form-control" list="clientOptions" id="clientName" placeholder="거래처 선택">
						<datalist id="clientOptions">
						  <option value="대박상회"></option>
						  <option value="화학케미컬"></option>
						  <option value="초전도체혁"></option>
						  <option value="윤기화학물"></option>
						  <option value="기타"></option>
						</datalist>
		      </div>

		      <div class="modal-footer">
		        <form class="row g-3">
				  <div class="col-auto">
				    <button type="submit" class="btn btn-primary mb-3" >선택완료</button>
				  </div>
				</form>
		      </div>
		    </div>
		  </div>
		</div>
		
		<!-- product Modal -->
		<div class="modal fade" id="productModal" tabindex="-1" role="dialog" aria-labelledby="ModalLabel" aria-hidden="true">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="ModalLabel">제품 선택</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>

		      <div class="modal-body">
			      <input class="form-control" list="productOptions" id="productpic" placeholder="거래처 선택">
						<datalist id="productOptions">
						  <option value=""></option>
						  <option value=""></option>
						  <option value=""></option>
						  <option value=""></option>
						  <option value=""></option>
						</datalist>
		      </div>

		      <div class="modal-footer">
		        <form class="row g-3">
				  <div class="col-auto">
				    <button type="submit" class="btn btn-primary mb-3">선택완료</button>
				  </div>
				</form>
		      </div>
		    </div>
		  </div>
		</div>
		
		<!-- human Modal -->
		<div class="modal fade" id="humanModal" tabindex="-1" role="dialog" aria-labelledby="ModalLabel" aria-hidden="true">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="ModalLabel">담당자 선택</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>

		      <div class="modal-body">
			      <input class="form-control" list="humanOptions" id="humanpic" placeholder="거래처 선택">
						<datalist id="humanOptions">
						  <option value=""></option>
						  <option value=""></option>
						  <option value=""></option>
						  <option value=""></option>
						  <option value=""></option>
						</datalist>
		      </div>

		      <div class="modal-footer">
		        <form class="row g-3">
				  <div class="col-auto">
				    <button type="submit" class="btn btn-primary mb-3">선택완료</button>
				  </div>
				</form>
		      </div>
		    </div>
		  </div>
		</div>


	</div>


</body>
</html>