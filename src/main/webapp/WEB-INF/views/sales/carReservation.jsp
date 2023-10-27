<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="/css/demo.css" type="text/css">
  
<style type="text/css">
  #tree_list_add{
      margin-left: 20px;

  }
  #tree-table{
      border: 1px solid black;
      height: 360px;
      width: 220px;
      padding: 10px;
  }
  #tree-table-div{
      margin: 10px;
  }
  #reservation-table{
      text-align: left; 
      width: 100%
  }
  
#title {
    text-align: left;
}

#reservation-table > :not(:last-child) > :last-child > *, .jsgrid .jsgrid-table > :not(:last-child) > :last-child > * {
    border-bottom-color: #000000;
}

#reservation-table th, .table td{
	border-color:#ffffff;
}

#reservation-table th {
        font-weight: bold;
}
    
</style>
</head>
<body id="page-top">
	<div id="wrapper">
		
		
		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">
			<div id="content">


				<div class="container-fluid">
				  
				  <h2 id="title">차량 예약</h2>
				  <br>
				  
				    <div class="card">
				  <div class="card-body">
				    1. 사용 신청 이후 운영관리자에게 차키와 운행일지를 수령, 사용 후 반납<br>
					2. 차량 반납 시 차량내부의 쓰레기 등을 반드시 수거하여 차량 청결에 유의<br>
					3. 차량 내부에서는 절대 금연함<br>
					4. 차량이용자는 운전 전 차량의 상태 (안전사항 및 청결도)를 확인하며, 이상이 있을 경우 즉시 운영관리자에게 연락함<br>
					<br><br>◎ 운영관리자 : 업무지원팀 ( ☎ 8888)
				  </div>
				  </div>
				  
				  <br><br>
				  <h2 id="title">자산별 상세 정보</h2>
				  
				    <table class="table" id="reservation-table">
				        <thead>
				           <tr>
				             <th>항목</th>
				             <th>대여 여부</th>
				           </tr>
				        </thead>
				        <tbody>
				        <c:forEach items="${list}" var="vo" varStatus="i">
				           <tr>
				             <td><c:choose>
				                <c:when test="${vo.carStatusCd eq 'C011'}">
				                    <a href="./zz" onmouseover="this.style.backgroundColor='transparent'" onmouseout="this.style.backgroundColor='transparent'"><span class="btn btn-mini" style="border:1px solid #ddd; background-color: transparent; font-weight:bold;" onmouseover="this.style.backgroundColor='transparent'" onmouseout="this.style.backgroundColor='transparent'">${vo.carModelName}</span></a>
				                </c:when>
				                <c:when test="${vo.carStatusCd eq 'C012'}">
				                    <a href="./asd" onmouseover="this.style.backgroundColor='transparent'" onmouseout="this.style.backgroundColor='transparent'"><span class="btn btn-mini" style="border:1px solid #ddd; background-color: transparent; font-weight:bold;" onmouseover="this.style.backgroundColor='transparent'" onmouseout="this.style.backgroundColor='transparent'">${vo.carModelName}</span></a>
				                </c:when>
				                <c:when test="${vo.carStatusCd eq 'C013'}">
				                    <a href="./asdd" onmouseover="this.style.backgroundColor='transparent'" onmouseout="this.style.backgroundColor='transparent'"><span class="btn btn-mini" style="border:1px solid #ddd; background-color: transparent; font-weight:bold;" onmouseover="this.style.backgroundColor='transparent'" onmouseout="this.style.backgroundColor='transparent'">${vo.carModelName}</span></a>
				                </c:when>
				                
				            </c:choose></td>
				            
				             <c:choose>
				             <c:when test="${vo.carStatusCd eq 'C011'}">
				             <td><a href="./zz" onmouseover="this.style.backgroundColor='transparent'" onmouseout="this.style.backgroundColor='transparent'"><span class="btn btn-mini" style="border:1px solid #ddd; background-color: transparent;" onmouseover="this.style.backgroundColor='transparent'" onmouseout="this.style.backgroundColor='transparent'">대여 가능</span></a></td>
				             </c:when>
				             <c:when test="${vo.carStatusCd eq 'C012'}">
				             <td><a href="./asd" onmouseover="this.style.backgroundColor='transparent'" onmouseout="this.style.backgroundColor='transparent'"><span class="btn btn-mini" style="border:1px solid #ddd; background-color: transparent;" onmouseover="this.style.backgroundColor='transparent'" onmouseout="this.style.backgroundColor='transparent'">대여 불가</span></a></td>
				             </c:when>
				             <c:when test="${vo.carStatusCd eq 'C013'}">
				             <td><a href="./asdd" onmouseover="this.style.backgroundColor='transparent'" onmouseout="this.style.backgroundColor='transparent'"><span class="btn btn-mini" style="border:1px solid #ddd; background-color: transparent;" onmouseover="this.style.backgroundColor='transparent'" onmouseout="this.style.backgroundColor='transparent'">반납</span></a></td>
				             </c:when>
				             
				             </c:choose>
				             
				           </tr>
				         </c:forEach>
				        </tbody>
				      
				    </table>

				  <br>
				  
				  <!-- pagination -->
				  <div style="text-align: center">
				  <nav aria-label="Page navigation example" style="display: inline-block;">
				  
					  <ul class="pagination">
					    <li class="page-item">
					      <a class="page-link" href="#" aria-label="Previous">
					        <i class="mdi mdi-arrow-left-drop-circle"></i>
					      </a>
					    </li>
					    <li class="page-item"><a class="page-link" href="#">1</a></li>
					    <li class="page-item"><a class="page-link" href="#">2</a></li>
					    <li class="page-item"><a class="page-link" href="#">3</a></li>
					    <li class="page-item">
					      <a class="page-link" href="#" aria-label="Next">
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
		


<script type="text/javascript">


</script>
</body>
</html>