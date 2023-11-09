

/* 
문서 체크 삭제
*/

$('#delete-btn').click(function() {
	
let arr = new Array();
$('input[name=checkList]:checked').each(function() {
	arr.push($(this).val());
	
})
console.log(arr);
if (!arr || arr.length==0) {
	swal('반드시 한개 이상 체크해주세요');
	return;
}

Swal.fire({
	text: '정말로 삭제하시겠습니까?',
	showCancelButton: true, 
	dangerMode: true,
	confirmButtonText: '승인',
	confirmButtonColor: 'red',
	cancleButtonText:'취소',
	reverseButtons: true,
	icon: 'warning',
}).then(function(result) {
	if(result.isConfirmed){
	$.ajax({
	type: 'POST',
	url: '/document/delete',
	data: {
		typeNoArr: arr
	}, success: function(result) {
		
		location.replace('/document/list');
	}, error: function() {

	}

})
}
})


})



/**
 *  상위문서 추가 버튼 검증
 */
upCheckResult=[false, false];

const upTypeCheck=document.getElementById('approval-up-add-btn');
const upForm=document.getElementById('up-frm');
const upTypeCd=document.getElementById('up-type-cd');

$('#up-type-cd').blur(function(){
	let cdVal=$('#up-type-cd').val();
	
	if(cdVal.length!=4){
	   swal('상위양식코드는 4글자만 가능합니다.')
	   upCheckResult[0]=false;
	   return;
	}else{
	   upCheckResult[0]=true;
	}
   
    var pattern_eng = /[a-zA-Z]/;
    if(!pattern_eng.test(cdVal.slice(0,1))){
       upCheckResult[0]=false;
       swal('무조건 코드의 첫 글자는 알파벳으로 시작해야 합니다');
	   return;
    }
     
	$.ajax({
		type:'POST',
		url:'/document/upCheck',
		data:{
			approvalUpTypeCd:cdVal
		},success:function(result){
            if(result.trim()>0){
				swal('중복된 코드입니다. 확인 후 다른 값을 입력해주세요')
				upCheckResult[0]=false;
			}else{
				swal('사용 가능한 코드입니다')
			}
		},error:function(){
            swal('에러 발생')
		}
	})
})




upTypeCheck.addEventListener("click",function(){
   let val1=$('#up-type-cd').val();
   let val2=$('#up-cd-name').val();

   if(val1 && val1!=''){
	  upCheckResult[0]=true;  
   }else{
	  upCheckResult[0]=false;
   }


   if(val2 && val2!=''){
	  upCheckResult[1]=true;
   }else{
	  upCheckResult[1]=false;
   }
   console.log('클릭 체크')
   if(upCheckResult.includes(false)){
	  swal('필수 입력란이 비어있습니다.')
	  console.log('결과 체크')
   }else{
	  upForm.submit();
	  console.log('전송 체크')
   }

})



/**
 *  신규 양식 등록 버튼 눌렀을 때 검증
 */

$('#approval-add-btn').click(function() {
	let upCheck = $('#up-type-no').val();
	console.log(upCheck)
	
    if(!upTypeCd.value || upTypeCd.value=='' || !upCheck || upCheck==''){
       swal('새로운 양식을 추가할 상위폴더에 체크해주세요')
	   return;
	}else{

	location.href = "/document/add?approvalUpTypeNo="+upCheck;
	}
})