
codeUpdate=document.getElementsByClassName('code-update-btn');
console.log(codeUpdate)
for(let i=0; i<codeUpdate.length; i++){


const upCodeUpdateCheck=document.getElementById('up-code-update-check'+i);
const codeUpdateCheck=document.getElementById('code-update-check'+i);
const codeNameUpdateCheck=document.getElementById('code-name-update-check'+i);
const codeUpdateBtn=document.getElementById('code-update-btn'+i);



let checkResult=[false, false, false];

upCodeUpdateCheck.addEventListener("blur",function(){
  let val=upCodeUpdateCheck.value;

  
  if(val.length!=3){
    swal('상위코드는 알파벳 포함 3자릿수까지입니다.\n 다시 입력해주세요.')
    
    checkResult[0]=false;
  }else{
    checkResult[0]=true;
  }

})

codeUpdateCheck.addEventListener("blur",function(){
    let val=codeUpdateCheck.value;
  
    
     
    if(!(val.length==4 || val.length==5)){
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
          code:val
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
    j=2;
    result=nullCheck(val,j);
 
    val1=codeUpdateCheck.value;
    val2=upCodeUpdateCheck.value;
    var pattern_eng = /[a-zA-Z]/;
    if(pattern_eng.test(val1.slice(0,1)) && pattern_eng.test(val2.slice(0,1))){
       checkResult[0]=true;
    }else{
       checkResult[0]=false;
       swal('무조건 코드의 첫자는 알파벳이어야 합니다');
    }

    if(!result){
        return;
    }
    console.log(checkResult);
    if(!checkResult.includes(false)){
        $('#frm-update'+i).submit();
    }
})

function nullCheck(val,i){
    if(val==''){
       swal('빈 내용을 채워주세요')
       checkResult[i]=false;
       return false;
    }
    checkResult[i]=true;
    return true;
}

}