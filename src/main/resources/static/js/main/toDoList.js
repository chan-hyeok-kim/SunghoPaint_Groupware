
const leftMainToggle=document.getElementById('minimize-toggle')
             
    leftMainToggle.addEventListener("click", function() {
        if ((document.querySelector('body').classList.contains('sidebar-toggle-display')) || (document.querySelector('body').classList.contains('sidebar-absolute'))) {
            document.querySelector('body').classList.toggle('sidebar-hidden');
        } else {
            document.querySelector('body').classList.toggle('sidebar-icon-only');
        }
    });


const rightMainToggle=document.getElementById('todolist-toggle')

rightMainToggle.addEventListener('click',function(){
    console.log('클릭 확인')
    $('.toggle-slide-List').toggleClass('active')

})

$(document).ready(function(){
    $.ajax({
        type:'GET',
         url:'/todolist',
         success:function(result){
              $('#to-do-list-div').html(result);
            
         }
    })
})

// $('#notification-toggle-li').click(function(){
//     if(document.getElementById('notification-modal').style.visibility=='hidden'){
//       document.getElementById('notification-modal').style.visibility='visible';
//     }else{
//       document.getElementById('notification-modal').style.visibility='hidden'
//     }
//   })