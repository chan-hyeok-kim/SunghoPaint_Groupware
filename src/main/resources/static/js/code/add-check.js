
const codeCheck=document.getElementById('code-check');
const codeNameCheck=document.getElementById('code-name-check');

const codeAddBtn=document.getElementById('code-add-btn');

let checkResult=[false, false];


     //   Swal.fire('코드는 알파벳 포함 4~5자리까지 가능합니다.\n 다시 입력해주세요.').then((result)=>{
      //    if(result.isConfirmed){
      //       swal.close();
      //    }
      //   })



//     $.ajax({
//       type:'POST',
//        url: '/code/codeCheck',
//        data:{
//           code:val
//        },success:function(result){
          
//         if(result.trim()>0){
//            swal('이미 존재하는 코드입니다. 확인 후 다시 적어주세요')
//            checkResult[0]=false;
//         }else{
//            swal('사용 가능한 코드입니다')
//            checkResult[0]=true;
//         }
          
//       }
//   })


// codeAddBtn.addEventListener("click",function(){
//     val=codeNameCheck.value;
    
 
//     val1=codeCheck.value;
//     val2=upCodeCheck.value;
//     var pattern_eng = /[a-zA-Z]/;
//     if(pattern_eng.test(val1.slice(0,1)) && pattern_eng.test(val2.slice(0,1))){
//        checkResult[1]=true;
//     }else{
//        checkResult[1]=false;
//        swal('무조건 코드의 첫 글자는 알파벳으로 시작해야 합니다');
//     }

   
//     if(val.trim()==''){
//       swal('빈 내용을 채워주세요')
//       checkResult[1]=false;
//       return;
//     }else{
//     checkResult[1]=true;
//     }


//     console.log(checkResult);
//     if(!checkResult.includes(false)){
//         $('#frm').submit();
//     }

// })

// function nullCheck(val,i){
//     if(val==''){
//        swal('빈 내용을 채워주세요')
//        checkResult[i]=false;
//        return false;
//     }else{
//     checkResult[i]=true;
//     return true;
//     }
// }


/*modal drag*/

var modalDiv;
$('.code-add-modal-btn').each(function(i) {

   $(this).click(function(){
      modalDiv = $(this).next().next();
      // modalDiv.modal({
      //   backdrop: false,
      //   show: true
      // });
      modalDiv.modal('show');
   })
   
   
 });
 
 $(document).ready(function () {
   $(".modal-dialog").draggable({
     handle: ".modal-header"
   });
 });


$('.code-close-btn').click(function(){
   console.log($(this).parent().parent().parent().parent())
   let id=$(this).parent().parent().parent().parent().attr('id');
   //$('#'+id).toggle();
  // $('#'+id).removeClass('fade');
  modalDiv.modal('hide');
   console.log(id)
   console.log(modalDiv)
})
 

 