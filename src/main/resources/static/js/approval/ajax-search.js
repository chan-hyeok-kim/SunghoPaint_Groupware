var cdForSearch;
liForSearch=document.querySelectorAll('my-list-tabs li');
liForTotalSearch=document.querySelectorAll('total-list-tabs li');


$('.my-list-tabs li').click(function(){
    if($(this).attr('data-cd')){
        $('#top-search-btn').prop('type','button');
        cdForSearch=$(this).attr('data-cd');
    }else{
        $('#top-search-btn').prop('type','submit');
    }

})

$('.total-list-tabs li').click(function(){
    if($(this).attr('data-cd')){
        $('#top-search-btn').prop('type','button');
        cdForSearch=$(this).attr('data-cd');
    }else{
        $('#top-search-btn').prop('type','submit');
    }


})

$("#top-search-bar").keypress(function(e){
    
    if(e.keyCode && e.keyCode == 13){
       

        e.preventDefault();	
        if($(this).val().trim()==''){
            swal('검색어를 입력해주세요')
            console.log($(this).val)
            return;
        }
        $('#top-search-btn').click();
        
  }
    

})

$('#top-search-btn').click(function(){
    if($("#top-search-bar").val().trim()==''){
        swal('검색어를 입력해주세요')
        return;
    }
   if($(this).prop('type')=='button' && liForSearch){
       
    let url='/approval/ajaxList';
    ajaxSearch(url,liForSearch);

   }else{
    let url='/approval/ajaxTotalList';
    ajaxSearch(url,liForTotalSearch);
   }

   

   

})

function ajaxSearch(url,liForSearch){
    let search=$('#top-search-bar').val();

    $.ajax({
      type:'GET',
       url:url,
       data:{
          search:search,
          approvalStatusCd:cdForSearch
       },success:function(result){
          contentDiv.innerHTML=result;
          
          for(l of liForSearch){
              if(l.attr('data-cd')==cdForSearch){
                  l.classList.add('active');
              }
          }
       }
    })

}
