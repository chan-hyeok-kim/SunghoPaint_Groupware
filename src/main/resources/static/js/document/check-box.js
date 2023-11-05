/**
 * 
 */

$('#approval-add-btn').click(function() {
	let upCheck = $('#up-type-no').val();
	console.log(upCheck)
	
	if(upCheck){
		location.href = "/document/add?approvalUpTypeNo="+upCheck;
	}
})






/* 
문서 체크 삭제
*/

$('#delete-btn').click(function() {
	
let arr = new Array();
$('input[name=checkList]:checked').each(function() {
	arr.push($(this).val());
	
})
console.log(arr);
if (!arr || arr.length==0) {
	swal('반드시 한개 이상 체크해주세요');
	return;
}

Swal.fire({
	text: '정말로 삭제하시겠습니까?',
	showCancelButton: true, 
	dangerMode: true,
	confirmButtonText: '승인',
	confirmButtonColor: 'red',
	cancleButtonText:'취소',
	reverseButtons: true,
	icon: 'warning',
}).then(function(result) {
	if(result.isConfirmed){
	$.ajax({
	type: 'POST',
	url: '/document/delete',
	data: {
		typeNoArr: arr
	}, success: function(result) {
		
		location.replace('/document/list');
	}, error: function() {

	}

})
}
})


})
