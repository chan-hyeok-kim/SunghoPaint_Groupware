/**
 * 
 */
checkResult=[false, false];

/* add검증*/

$("#document-add-btn").mouseover(function(){
		if ($('#check-cd').val()!='') {
		checkResult[0]=true;
	}
	console.log(checkResult)
	
})


$("#document-add-btn").click(function() {
	//id가 smarteditor인 textarea에 에디터에서 대입

	oEditors.getById["approvalForm"].exec("UPDATE_CONTENTS_FIELD", []);
    
  
    let formVal=$('#approvalForm').val();
  
	// 이부분에 에디터 validation 검증
	if (formVal.trim() != '' && formVal) {
		checkResult[1]=true;
	}


	
	//폼 submit
	/*$("#frm").submit();*/
	if (!checkResult.includes(false)) {
		$("#frm").submit();
	} else {
		swal('빈 내용을 채워주세요')
	}
})


