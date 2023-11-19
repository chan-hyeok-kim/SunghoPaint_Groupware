/**
 * 
 */
const dropdown1=document.getElementById('dropdown1');
const dropdown2=document.getElementById('dropdown2');
const prior=document.getElementById('prior');
/*const category=document.getElementById('category');
*/

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




// 유효성
$('#notice-add-btn').click(function(){

    oEditors.getById["approvalForm"].exec("UPDATE_CONTENTS_FIELD", []);
    


    $("#frm").submit();
})


$('#notice-delete-btn').click(function(){
	console.log('삭제버튼')
	let arr = new Array();
    $('input[name=checkList]:checked').each(function() {
        arr.push($(this).val());
        
    })
    console.log(arr);
    if (!arr || arr.length==0 || arr=='') {
        swal('반드시 한개 이상 체크해주세요');
        return;
    }
	
	Swal.fire({
		text: '정말로 삭제하시겠습니까?',
		showCancelButton: true,
		confirmButtonText: '승인',
		confirmButtonColor: 'red',
		cancelButtonText: '취소',
		reverseButtons: true,
		icon: 'warning',
	}).then(function(result) {
		if (result.isConfirmed) {
			
            
			$.ajax({
				type: 'POST',
				url: '/notice/delete',
				data: {
					deleteNoList: arr
				}, success: function(result) {
					if (result.trim() > 0) {
						swal('삭제 성공')
						location.replace('/notice/list')
					}
					

				}, error: function() {
					console.log('삭제 실패')
				}
			})
		}
	})
	
	
})

