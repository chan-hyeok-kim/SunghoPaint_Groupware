
codeUpdate=document.getElementsByClassName('code-update-btn');
console.log(codeUpdate)
for(let i=0; i<codeUpdate.length; i++){


const upCodeUpdateCheck=document.getElementById('up-code-update-check'+i);
const codeUpdateCheck=document.getElementById('code-update-check'+i);
const codeNameUpdateCheck=document.getElementById('code-name-update-check'+i);
const codeUpdateBtn=document.getElementById('code-update-btn'+i);

let originVal=codeUpdateCheck.value;

let checkResult=[false, false, false];

upCodeUpdateCheck.addEventListener("blur",function(){
  const upVal=upCodeUpdateCheck.value;

  
  if(upVal.length!=3){
    swal('상위코드는 알파벳 포함 3자릿수까지입니다.\n 다시 입력해주세요.')
    
    checkResult[0]=false;
  }else{
    checkResult[0]=true;
  }

})

codeUpdateCheck.addEventListener("blur",function(){
  const codeVal=codeUpdateCheck.value;

  
  if(!(codeVal.length==4 || codeVal.length==5)){
    swal('코드는 알파벳 포함 4~5자리까지 가능합니다.\n 다시 입력해주세요.')
    
    checkResult[1]=false;
    return;
  }else{
    checkResult[1]=true;
  }



  $.ajax({
    type:'POST',
    url: '/code/codeCheck',
    data:{
        code:codeVal
    },success:function(result){
        
      if(result.trim()>0){
        swal('이미 존재하는 코드입니다. 확인 후 다시 적어주세요')
        checkResult[1]=false;
      }else{
        swal('사용 가능한 코드입니다')
        checkResult[1]=true;
      }
        
    }
})
  
})

codeUpdateBtn.addEventListener("click",function(){
    val=codeNameUpdateCheck.value;
 
    val1=codeUpdateCheck.value;
    val2=upCodeUpdateCheck.value;
    
    //업코드 체크
    const upVal=upCodeUpdateCheck.value;

    if(upVal.length!=3){
      swal('상위코드는 알파벳 포함 3자릿수까지입니다.\n 다시 입력해주세요.')
      
      checkResult[0]=false;
    }else{
      checkResult[0]=true;
    }

    //코드 체크
    const codeVal=codeUpdateCheck.value;

  
    if(!(codeVal.length==4 || codeVal.length==5)){
    swal('코드는 알파벳 포함 4~5자리까지 가능합니다.\n 다시 입력해주세요.')
    
    checkResult[1]=false;
    return;
    }else{
    checkResult[1]=true;
    }


    
    var pattern_eng = /[a-zA-Z]/;

    if(pattern_eng.test(val1.slice(0,1)) && pattern_eng.test(val2.slice(0,1))){
       
    }else{
       checkResult[0]=false;
       checkResult[1]=false;
       swal('무조건 코드의 첫 글자는 알파벳으로 시작해야 합니다');
       return;
    }

    if(val.trim()==''){
      swal('빈 내용을 채워주세요')
      checkResult[2]=false;
      return;
   }else{
   checkResult[2]=true;
   
   }

    console.log(checkResult);
    if(!checkResult.includes(false)){
      console.log('전송체크')
        $('#frm-update'+i).submit();
    }
  })
}