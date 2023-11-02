<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<table class="table-bordered mt-2" id="approval-table">
				        <thead>
				           <tr>
				             <th>번호</th>
				             <th>차종</th>
				             <th>예약 시간</th>
				             <th>반납 시간</th>
				             <th>대여자</th>
				           </tr>
				        </thead>
				        <tbody>
				        <c:forEach items="${list}" var="vo" varStatus="i">
				           <tr>
				             <td>${i.index + 1}</td>
				             <td>${vo.carModelName}</td>
				             <td>${vo.carReservationVO.rentalDate}</td>
				             <td>${vo.carReservationVO.returnDate}</td>
				             <td>${vo.carReservationVO.employeeId}</td>
				           </tr>
				         </c:forEach>
				        </tbody>
				      
				    </table>
				    
				    
<script type="text/javascript">
$(document).ready(function() {
    // 테이블의 행 개수를 체크
    var rowCount = $('#approval-table tbody tr').length;

    // 만약 행이 없다면 메시지를 추가
    if (rowCount === 0) {
        $('#approval-table tbody').append('<tr><td colspan="4">예약 목록이 없습니다.</td></tr>');
    }
    
});
</script>