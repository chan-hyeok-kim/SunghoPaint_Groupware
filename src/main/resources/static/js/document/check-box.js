/**
 * 
 */


$('#approval-add-btn').click(function() {
	let check = $('#up-type-no').val();
	console.log(check)
	//location.href = "/document/add?approvalUpTypeNo="+check;
	if(check===undefined || check==null){

	}
})

$('.approval-list').find('input:checked').each(function(index) {
	const check = new Array();

	check.push($(this).val());

	
})




   /* 
문서 삭제
*/
$('#delete-btn').click(function() {

	if (check.length < 1 || check.length == 0) {
		Swal.fire('반드시 한개 이상 체크해주세요');
		return;
	} 
let arr = new Array();
$('input[name=checkList]:checked').each(function() {
	arr.push($(this).val());
})
console.log(arr);


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
