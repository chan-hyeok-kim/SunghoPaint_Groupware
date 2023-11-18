codeScroll=document.getElementsByClassName('code-scroll');

var codeDeleteNo;
$('.code-scroll tr:not(:first-child)').each(function(){
       
    $(this).click(function(){
    
        let code=$(this).children(":first").text();
        let codeName=$(this).children(":eq(1)").text();
    
        id=$(this).parent().parent().parent().parent().attr('id')
     
        i=id.substring(id.indexOf('h')+1)
        console.log(i)
         $('#code-update-check'+i).val(code);
         $('#code-name-update-check'+i).val(codeName);
         $('#code-update-check'+i).next().val(code);

         codeDeleteNo=$('#code-update-check'+i).val();
    })

    
    
})
    
$('.code-delete-btn').click(function(){

    Swal.fire({
        text: '정말로 삭제하시겠습니까?',
        showCancelButton: true, 
        confirmButtonText: '승인',
        confirmButtonColor: 'red',
        cancelButtonText:'취소',
        reverseButtons: true,
        icon: 'warning',
    }).then(function(result) {
        if(result.isConfirmed){
                $.ajax({
                    type:'POST',
                    url:'/code/delete',
                    data: {
                        code:codeDeleteNo
                    },success:function(result){
                        
                        if(result.trim()>0){
                            swal({
                                title : '삭제 성공',
                                    icon  : "success",
                                    
                            }).then(function(){
                                location.replace('/code/list')
                            });
                            
                        }
                    },error:function(){
                        swal('에러 삭제 실패')
                    }
               })
        }
    })
})

