/**
 * 업데이트 검증
 */
checkResultUpdate=[false,false,false];

$("#document-update-btn").mouseover(function(){
		if ($('#check-cd').val()!='') {
		checkResultUpdate[0]=true;
	}else{
		swal('양식명을 입력해주세요')
		checkResultUpdate[0]=false;
	}
	console.log(checkResultUpdate)
	
})

$('#document-update-btn').mouseover(function(){
	$('#select-form').val();
	console.log($('#select-form').val());
	if($('#select-form option:selected').val()!=''){
		checkResultUpdate[2]=true;
	}else{
		swal('양식 내용을 넣어주세요')
		checkResultUpdate[2]=false;
		return;

	}

	if($('#select-form option:selected').val().trim().length>10){
		swal('상위 양식함을 선택해주세요')
		checkResultUpdate[2]=false;
		return;
	
	}else{
		checkResultUpdate[2]=true;
		
	}
})



$("#document-update-btn").click(function() {
	//id가 smarteditor인 textarea에 에디터에서 대입
	console.log($('#approvalForm').val())

	oEditors.getById["approvalForm"].exec("UPDATE_CONTENTS_FIELD", []);
    
 
	// 이부분에 에디터 validation 검증
	if ($('#approvalForm').val() != '') {
		checkResultUpdate[1]=true;
	}
	console.log($('#approvalForm').val())
	console.log(checkResultUpdate)
	//폼 submit
	/*$("#frm").submit();*/
	if (!checkResultUpdate.includes(false)) {
		$("#frm").submit();
	} else {
		swal('빈 내용을 채워주세요')
	}
})



let upTypeCdName=$('#check-cd').attr('data-cd-name');

$('#select-form').val(upTypeCdName).prop("selected",true);
//해당 밸류를 가진 옵션 셀렉티드








