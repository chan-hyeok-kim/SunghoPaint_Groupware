/**
 * 
 */


var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: "approvalForm",
	sSkinURI: "/se2/SmartEditor2Skin.html",
	fCreator: "createSEditor2",
});


let check = [false, false];
$('.form-cotrol').each(function(){
	if ($(this).val()!='') {
		check[0] == true;
	}
})






$("#document-add-btn").click(function() {
	//id가 smarteditor인 textarea에 에디터에서 대입
	console.log($('#approvalForm').val())




	oEditors.getById["approvalForm"].exec("UPDATE_CONTENTS_FIELD", []);

	// 이부분에 에디터 validation 검증
	if ($('#approvalForm').val() != '') {
		check[1] == true;
	}
	console.log($('#approvalForm').val())
	console.log(check)
	//폼 submit
	/*$("#frm").submit();*/
	if (!check.includes(false)) {
		$("#frm").submit();
	} else {
		alert('빈 내용을 채워주세요')
	}
})

/*$('#document-add-btn').mouseover(function(){
	$('#se2_iframe').attr('name','approvalName')
	
})*/

$('#text-delete-btn').click(function() {
	oEditors.getById["approvalForm"].exec("SET_IR", [""]);


})

$('#modal-confirm-btn').click(function() {
	let formHtml = $('#form_list').html();
	oEditors.getById["approvalForm"].exec("PASTE_HTML", [formHtml]);

	$('#modal-confirm-close').click();

});
