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


$("#document-add-btn").click(function(){
        //id가 smarteditor인 textarea에 에디터에서 대입
        oEditors.getById["approvalForm"].exec("UPDATE_CONTENTS_FIELD", []);
         
        // 이부분에 에디터 validation 검증
         
        //폼 submit
        $("#frm").submit();
    })

/*$('#document-add-btn').mouseover(function(){
	$('#se2_iframe').attr('name','approvalName')
	
})*/

$('#text-delete-btn').click(function(){
	oEditors.getById["approvalForm"].exec("SET_IR", [""]);


})

$('#modal-confirm-btn').click(function(){
	   let formHtml=$('#form_list').val();
	   console.log(formHtml);
	   oEditors.getById["approvalForm"].exec("PASTE_HTML",["formHtml"]);


   });
