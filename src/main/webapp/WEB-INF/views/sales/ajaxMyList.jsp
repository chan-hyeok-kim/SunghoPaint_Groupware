<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<table class="table">
							  <thead>
							    <tr>
							      <th scope="col" style="font-weight:bold;">번호</th>
							      <th scope="col" style="font-weight:bold;">차종</th>
							      <th scope="col" style="font-weight:bold;">예약 시간</th>
							      <th scope="col" style="font-weight:bold;">반납 예정일</th>
							      <th scope="col" style="font-weight:bold;">취소/반납</th>
							    </tr>
							  </thead>
							  <tbody>
									   <c:forEach items="${list}" var="vo" varStatus="i">
						           <tr>
						           	 <td>${i.index + 1}</td>
						             <td>${vo.carModelName}</td>
						             <td>${vo.carReservationVO.rentalDate}</td>
						             <td>${vo.carReservationVO.returnDate}</td>
						             <c:choose>
						             <c:when test="${vo.carStatusCd eq 'C012'}">
						             <td><a class="sweet" data-num="${vo.carReservationVO.rentalNo}" data-num-no="${vo.carNo}" onmouseover="this.style.backgroundColor='transparent'" onmouseout="this.style.backgroundColor='transparent'"><span class="btn btn-mini" style="border:1px solid #ddd; background-color: transparent; color:red;" onmouseover="this.style.backgroundColor='transparent'" onmouseout="this.style.backgroundColor='transparent'">반납</span></a></td>
						             </c:when>
						             <c:when test="${vo.carStatusCd eq 'C011'}">
						             <td>반납 완료</td>
						             </c:when>
						             </c:choose>
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
        $('#approval-table tbody').append('<tr><td colspan="5">예약 목록이 없습니다.</td></tr>');
    }
    
$('.sweet').click(function(){
	let a = $(this).attr("data-num");
	let b = $(this).attr("data-num-no");
	console.log(a);
	swal({
		  buttons: ["아니요", "네"],
		  text: "차량을 반납하시겠습니까?",
		  
		}).then(function(willSubmit){
			
			if(willSubmit){
			console.log('z')
				
			let form = $('<form action="./deleteMyStatus" method="post"></form>');

            // 필요한 데이터를 추가
            form.append('<input type="hidden" name="rentalNo" value="a">');
            form.append('<input type="hidden" name="carNo" value="b">');

            // 값들을 설정
            form.find('[name="rentalNo"]').val(a); 
            form.find('[name="carNo"]').val(b);
            // 폼을 body에 추가
            $('body').append(form);

            // 폼을 제출
            form.submit();
			}
			 

			/* 
			$.ajax({
                type: "POST",
                url: "./deleteMyStatus",
                data: { rentalNo: a, carNo: b },
                success: function(data){
                    console.log("성공");
                    
                },
                error: function(){
                    console.log("실패");
                    
                }
            });
			 */
		});
		
	});
	
});
</script>