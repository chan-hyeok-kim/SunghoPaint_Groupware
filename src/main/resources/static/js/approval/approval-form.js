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



// 서명하기 버튼
$('#form-add-sign').click(function(){
	const imgTag='<img width="70px" height="40px" src="'+formSign+'">'
	 /* 결재선 내부에 이미지 추가*/
	
    oEditors.getById["approvalForm"].exec("PASTE_HTML", [imgTag]);
    oEditors.getById["approvalForm"].exec("UPDATE_CONTENTS_FIELD", []);

    //$('#form-sign-span').html('<img width="70px" height="40px" src="'+formSign+'">');
})

