codeScroll=document.getElementsByClassName('code-scroll');


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
    })

    
    
})
    


