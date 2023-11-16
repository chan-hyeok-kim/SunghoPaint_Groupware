/**
 * 
 */
const dropdown1=document.getElementById('dropdown1');
const dropdown2=document.getElementById('dropdown2');
const prior=document.getElementById('prior');
const category=document.getElementById('category');


$('.prior').each(function(){
    $(this).click(function(){
        dropdown1.innerText=$(this).text();
        let priorCd='';

        if(dropdown1.innerText.trim()=='일반공지'){
            priorCd='B002';
        }else{
            priorCd='B001';
        }
        prior.value=priorCd;
    })
})


$('.category').each(function(){
    $(this).click(function(){
        dropdown2.innerText=$(this).text();
        let categoryCd='';

        if(dropdown2.innerText.trim()=='문의 게시판'){
            categoryCd='B013';
            dropdown1.setAttribute("disabled","disabled");
            dropdown1.innerText='우선순위 선택';
            prior.value='B002';
        }else if(dropdown2.innerText.trim()=='익명 게시판'){
            categoryCd='B012';
            dropdown1.setAttribute("disabled","disabled");
            dropdown1.innerText='우선순위 선택';
            prior.value='B002';
        }else{
            categoryCd='B011'; 
            dropdown1.removeAttribute("disabled");
        } 
        category.value=categoryCd;
    })
})

// 유효성
$('#notice-add-btn').click(function(){

    oEditors.getById["approvalForm"].exec("UPDATE_CONTENTS_FIELD", []);
    


    $("#frm").submit();
})
