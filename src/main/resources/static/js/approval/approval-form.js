/**
 * 
 */



var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: "approvalForm",
	sSkinURI: "/se2/SmartEditor2Skin.html",
	fCreator: "createSEditor2",
	fOnAppLoad : function(){
        formUpdateHtml = $('#form-list-update').html();
        if(formUpdateHtml===undefined || formUpdateHtml==''){
			formUpdateHtml='';
			console.log(formUpdateHtml)
			
		}
        oEditors.getById["approvalForm"].exec("PASTE_HTML", [formUpdateHtml]);
    }
});







/*지우기*/

$('#text-delete-btn').click(function() {
	oEditors.getById["approvalForm"].exec("SET_IR", [""]);


})

var formHtml;
/*버튼 누르면 내용 추가하고 모달 닫기*/
$('#modal-confirm-btn').click(function() {
	formHtml=$('#form_list').html();
    let formName=$('#form_list').attr('data-name');
    //비어있지 않으면 초기화
    if($('#approvalForm').val()!=''){
		oEditors.getById["approvalForm"].exec("SET_IR", [""]);
	}
	
	

	
	//내용 세팅
	oEditors.getById["approvalForm"].exec("PASTE_HTML", [formHtml]);
    oEditors.getById["approvalForm"].exec("UPDATE_CONTENTS_FIELD", []);
    
    $('#form-add-name').val(formName);
    
	$('#modal-confirm-close').click();

});


var drafterSignCheck=0
// 서명하기 버튼
// ->폼 불러왔을 때 자동 서명되게 바꾸기

// $('#form-add-sign').click(function(){
	
// 	const imgTag='<img width="70px" height="40px" src="'+formSign+'">'
// 	 /* 결재선 내부에 이미지 추가*/
	
//     oEditors.getById["approvalForm"].exec("PASTE_HTML", [imgTag]);
//     oEditors.getById["approvalForm"].exec("UPDATE_CONTENTS_FIELD", []);
//     drafterSignCheck=1;
//     //$('#form-sign-span').html('<img width="70px" height="40px" src="'+formSign+'">');
	
// })


appAddCheckResult=[false,false,false,false];

$('#app-add-btn').click(function(){

     console.log($('#mid-drafter-tab').text());

    console.log($('input[name=approvalTitle]').val());
   
	let check1=$('input[name=approvalTitle]').val();
	let check2=$('input[name=midApprover]').val();
    let check3=$('input[name=lastApprover]').val();

	let check4=$('input[name=approvalTypeNo]').val();

	let check5=$('#approvalForm').val();

    if(check1 || check1.length!=''){
       appAddCheckResult[0]=true;
	}else{
	   swal('제목을 입력해주세요')
	   appAddCheckResult[0]=false;
	   return;
	}

	if((check2 && check3) || (check2.length!='' || check3.length!='')){
		appAddCheckResult[1]=true;
	}else{
		swal('결재선을 입력해주세요')
		appAddCheckResult[1]=false;
		return;
	}

    if(check4 && check4.length!=''){
		appAddCheckResult[2]=true;
	}else{
		swal('결재양식을 선택해주세요')
		appAddCheckResult[2]=false;
		return;
	}
	
	oEditors.getById["approvalForm"].exec("UPDATE_CONTENTS_FIELD", []);
	
	if(check5 && check5.trim().length!=0){
		appAddCheckResult[3]=true;
	}else{
		swal('결재내용을 입력해주세요')
		appAddCheckResult[3]=false;
		return;
	}
	
    console.log(appAddCheckResult)
    if(appAddCheckResult.includes(false)){
		swal('빈 내용들을 입력해주세요')
		return;
	}else{
		$('#app-add-frm').submit();
	}
     
	

	
})


// 임시저장

$('#app-save-btn').click(function(){ 
	const check1=$('input[name=approvalTitle]').val();
	const check2=$('input[name=midApprover]').val();
    const check3=$('input[name=lastApprover]').val();
    const check4=$('input[name=approvalTypeNo]').val();
	oEditors.getById["approvalForm"].exec("UPDATE_CONTENTS_FIELD", []);
	
    const check5=$('#approvalForm').val();
    const check6=$('input[name=addApprover]').val();

	console.log(check1)
	$.ajax({
		type: 'POST',
		url:'/approval/save',
		data:{
			approvalStatusCd:'R031',
            approvalTitle:check1,
			midApprover:check2,
			lastApprover:check3,
			approvalTypeNo:check4,
			approvalContents:check5,
			addApprover:check6
		},success:function(result){
            if(result.trim()>0){
				Swal.fire({
					title:'저장 성공!',
					text:'임시저장한 내용은 기안중 란에서 확인하실 수 있습니다.',
					icon:'success'
				}).then(function(){
					location.href="/apporval/list";
				})
			}
		}
	})

})   