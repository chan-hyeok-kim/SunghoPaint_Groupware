// const addTaskBtn=document.getElementById('add-task');


//$('#toggle-slide-List').

const leftToggle=document.getElementById('minimize-toggle')
             
             leftToggle.addEventListener("click", function() {
                 if ((document.querySelector('body').classList.contains('sidebar-toggle-display')) || (document.querySelector('body').classList.contains('sidebar-absolute'))) {
                	 document.querySelector('body').classList.toggle('sidebar-hidden');
                 } else {
                	 document.querySelector('body').classList.toggle('sidebar-icon-only');
                 }
               });


const rightToggle=document.getElementById('todolist-toggle')

rightToggle.addEventListener('click',function(){
    console.log('클릭 확인')
    $('.toggle-slide-List').toggleClass('active')

})

$(document).ready(function(){
    $.ajax({
        type:'GET',
         url:'/todolist',
         success:function(result){
              $('#to-do-list-div').html(result);
             console.log(result);
         }
    })
})

