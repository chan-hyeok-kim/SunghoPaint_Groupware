
const se2LineBtn=document.getElementById('se2-line-add-btn');

console.log(se2LineBtn);

se2LineBtn.addEventListener("click",function(){
    console.log('check')
    const appLine='<td style="text-align: right; padding: 0px!important; border: 0!important; vertical-align: top !important" class="dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l" id="approval-line-add-blank">[결재선]</td>';

    oEditors.getById["approvalForm"].exec("PASTE_HTML", [appLine]);
    oEditors.getById["approvalForm"].exec("UPDATE_CONTENTS_FIELD", []);

})