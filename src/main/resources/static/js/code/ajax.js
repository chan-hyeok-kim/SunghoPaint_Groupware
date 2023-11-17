
$('input[name=checkList]').each(function(i){
     
    let upCd=$(this).val();
  
    $.ajax({
        type:'GET',
         url:'/code/listByUpCode',
         data:{
             upCode:upCd
         }
         ,success:function(result){
            $('#ajax-list-th'+i).html(result);
         }
    })

    

})


