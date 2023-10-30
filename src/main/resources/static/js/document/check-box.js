/**
 * 
 */


$('#approval-add-btn').click(function(){
   let check=$('#up-type-no').val();
   location.href="/document/add?approvalUpTypeNo="+check;
   	
})

$('.approval-list').find('input:checked').each(function(index){
    const check=new Array();
    
    check.push($(this).val());
  
    if(check.length>1 && check.length==0){
		alert('반드시 한개 이상 체크해주세요');
	}else{
   	
   	}
})

