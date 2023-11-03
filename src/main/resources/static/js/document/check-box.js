/**
 * 
 */


$('#approval-add-btn').click(function() {
	let check = $('#up-type-no').val();
	location.href = "/document/add?approvalUpTypeNo=" + check;

})

$('.approval-list').find('input:checked').each(function(index) {
	const check = new Array();

	check.push($(this).val());

	if (check.length > 1 && check.length == 0) {
		swal('반드시 한개 이상 체크해주세요');
	} else {

	}
})


/* 
	문서 삭제
*/
$('#delete-btn').click(function() {

	let arr = new Array();
	$('input[name=checkList]:checked').each(function() {
		arr.push($(this).val());
	})
	console.log(arr);


	swal({
		dangerMode: true,
		text: '삭제하시겠습니까?',
		buttons: ['취소', '삭제']
	}).then(function(){
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
	})

	
})
