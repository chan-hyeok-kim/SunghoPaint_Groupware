/**
 * 업데이트 검증
 */
checkResultUpdate=[false,false,false,false,false,false];

const approvalUpdateBtn=document.getElementById('update-confirm-btn');


$("#update-confirm-btn").mouseover(function(){
		if ($('#mid-approver').val()!='') {
		checkResultUpdate[0]=true;
	}
	console.log(checkResultUpdate)
	
})

$('#update-confirm-btn').mouseover(function(){
	$('#select-form').val();
	console.log($('#select-form').val());
	if($('#last-approver').val()!=''){
		checkResultUpdate[2]=true;
	}
})

$('#update-confirm-btn').mouseover(function(){
	$('#select-form').val();
	console.log($('input[name=appprovalTitle]').val());
	if($('input[name=appprovalTitle]').val()!=''){
		checkResultUpdate[3]=true;
	}
})



approvalUpdateBtn.addEventListener("click",function(){
	//id가 smarteditor인 textarea에 에디터에서 대입
	console.log($('#approvalContents').val())
	oEditors.getById["approvalForm"].exec("UPDATE_CONTENTS_FIELD", []);
    console.log($('#approvalForm').val())
 
	// 이부분에 에디터 validation 검증
	if ($('#approvalForm').val() != '') {
		checkResultUpdate[1]=true;
	}
	
	console.log(checkResultUpdate)
	//폼 submit
	$("#frm").submit();

	// if (!checkResultUpdate.includes(false)) {
	// 	$("#frm").submit();
	// } else {
	// 	swal('빈 내용을 채워주세요')
	// }
})



