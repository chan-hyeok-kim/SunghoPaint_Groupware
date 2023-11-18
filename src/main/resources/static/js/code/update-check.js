
codeUpdate=document.getElementsByClassName('code-update-btn');
console.log(codeUpdate)
for(let i=0; i<codeUpdate.length; i++){


const codeUpdateCheck=document.getElementById('code-update-check'+i);
const codeNameUpdateCheck=document.getElementById('code-name-update-check'+i);
const codeUpdateBtn=document.getElementById('code-update-btn'+i);


let checkResult=[false, false];



codeUpdateCheck.addEventListener("blur",function(){
  const codeVal=codeUpdateCheck.value;

  
  if(!(codeVal.length==4 || codeVal.length==5)){
    swal('코드는 알파벳 포함 4~5자리까지 가능합니다.\n 다시 입력해주세요.')
    
    checkResult[0]=false;
    return;
  }else{
    checkResult[0]=true;
  }



  $.ajax({
    type:'POST',
    url: '/code/codeCheck',
    data:{
        code:codeVal
    },success:function(result){
        
      if(result.trim()>0){
        swal('이미 존재하는 코드입니다. 확인 후 다시 적어주세요')
        checkResult[0]=false;
      }else{
        swal('사용 가능한 코드입니다')
        checkResult[0]=true;
      }
        
    }
})
  
})

codeUpdateBtn.addEventListener("click",function(){
    val=codeNameUpdateCheck.value;
 
    val1=codeUpdateCheck.value;
    
 
    //코드 체크
    const codeVal=codeUpdateCheck.value;


    if(val.trim()==''){
      swal('빈 내용을 먼저 채워주세요')
      checkResult[1]=false;
      return;
   }else{
   checkResult[1]=true;
   
   }
  
    if(!(codeVal.length==4 || codeVal.length==5)){
    swal('코드는 알파벳 포함 4~5자리까지 가능합니다.\n 다시 입력해주세요.')
    
    checkResult[0]=false;
    return;
    }else{
    checkResult[0]=true;
    }


    
    var pattern_eng = /[a-zA-Z]/;

    if(pattern_eng.test(val1.slice(0,1))){
       
    }else{
       checkResult[0]=false;
       swal('무조건 코드의 첫 글자는 알파벳으로 시작해야 합니다');
       return;
    }

    

    console.log(checkResult);
    if(!checkResult.includes(false)){
      console.log('전송체크')
        $('#frm-update'+i).submit();
    }
  })
}


/* 상위코드 수정
*/ 
const upCodeUpdateBtn=document.getElementById('up-code-update-modal-btn');
const upCodeUpdateCheck=document.getElementById('up-code-update-check');
const upCodeNameUpdateCheck=document.getElementById('up-code-name-update-check');
const upCodeUpdateForm=document.getElementById('up-code-update-frm');

upCodeUpdateCheckResult=[false, false];



var upCodeUpdateData;
$('#up-code-update-btn').click(function(){
    
    let arr=new Array();
    $('input[name=checkList]:checked').each(function(){
       arr.push($(this).val)
       upCodeUpdateCheck.value=$(this).parent().next().text();
       upCodeNameUpdateCheck.value=$(this).parent().next().next().text();
       $('#origin-up-code').val(upCodeUpdateCheck.value);
    })

   if (!arr || arr.length==0 || arr=='') {
      swal('수정할 코드를 1개만 체크해주세요.');
      $(this).attr('data-target','');
      return;
   }
  

  if(arr.length>1){
     swal('한번에 1개씩만 수정 가능합니다.')
     $(this).attr('data-target','');
     return;
  }
   
  upCodeUpdateData=arr[0];
  
  $(this).attr('data-target','#up-code-update-modal')
  

})


// 검증

upCodeUpdateBtn.addEventListener('click',function(){
  console.log(upCodeUpdateCheck.value)
  console.log(upCodeUpdateCheck.value.length)
  if(!upCodeUpdateCheck.value || upCodeUpdateCheck.value.length==0){
     upCodeUpdateCheckResult[0]=false;
     swal('상위코드를 입력해주세요')
     return;
  }else{
     upCodeUpdateCheckResult[0]=true;

  }

  let upCode=upCodeUpdateCheck.value;

  var pattern_eng = /[a-zA-Z]/;
       if(pattern_eng.test(upCode.slice(0,1))){
         upCodeUpdateCheckResult[0]=true;
      }else{
         upCodeUpdateCheckResult[0]=false;
         swal('무조건 코드의 첫 글자는 알파벳으로 시작해야 합니다');
         return;
      }
      
  $.ajax({
   type:'GET',
    url:'/code/upCodeCheck',
    data:{
     upCode:upCode
    },success:function(result){
      if(upCode==$('#origin-up-code').val()){
         return;
      }
            if(result.trim()>0){
             swal('이미 존재하는 코드입니다.')
             upCodeUpdateCheckResult[0]=false;
             return;
            }else{
             swal('등록 가능한 코드입니다.')
             upCodeUpdateCheckResult[0]=true;
            }
    }

  })



  if(!upCodeNameUpdateCheck.value || upCodeNameUpdateCheck.value.length==0){
    upCodeUpdateCheckResult[1]=false;
     swal('상위코드명을 입력해주세요')
  }else{
    upCodeUpdateCheckResult[1]=true; 
  }
   
console.log()
  if(!upCodeUpdateCheckResult.includes(false)){
     upCodeUpdateForm.submit();
  }
  
})