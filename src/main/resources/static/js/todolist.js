(function($) {
  'use strict';
  $(function() {
    var todoListItem = $('.todo-list');
    var todoListInput = $('.todo-list-input');
    $('.todo-list-add-btn').on("click", function(event) {
      event.preventDefault();

      var item = $(this).prevAll('.todo-list-input').val();

      if (item) {
        
      
        let contents=item;
        console.log(contents)
        $.ajax({
            type:'POST',
            url:'/toDo/add',
            data: {
              toDoListContents:contents
            },
            success:function(){
             console.log('성공')
             $.ajax({
              type:'GET',
               url:'/toDo/lastDetail',
               success:function(result){
                   
                   console.log(result);
                   todoListItem.append("<li><div class='form-check'><label class='form-check-label'><input class='checkbox' type='checkbox'/>" + item + "<i class='input-helper'></i></label></div><i class='remove mdi mdi-close-circle-outline' data-no="+result+"></i></li>");
        
               }
             })
          }

         })
        
        todoListInput.val("");
      }

    });

    todoListItem.on('change', '.checkbox', function() {
      let no=$(this).parent().parent().next().attr('data-no');
      console.log(no)
      if ($(this).attr('checked')) {
        $(this).removeAttr('checked');
        
        $.ajax({
          type:'POST',
          url:'/toDo/update',
          data: {
            toDoListCheck:0,
            toDoListNo:no
          },
          success:function(){
           console.log('0 성공')
        }
  
       })

      } else {
        $(this).attr('checked', 'checked');

        $.ajax({
          type:'POST',
          url:'/toDo/update',
          data: {
            toDoListCheck:1,
            toDoListNo:no
          },
          success:function(){
           console.log('1 성공')
        }
  
       })
      }

      $(this).closest("li").toggleClass('completed');

    });

    todoListItem.on('click', '.remove', function() {
      $(this).parent().remove();

      let no=$(this).attr('data-no');

      //숫자조회해오기
      console.log(no);
      $.ajax({
        type:'POST',
        url:'/toDo/delete',
        data: {
          toDoListNo:no
        },
        success:function(){
         console.log('성공')
      }

     })
    });

  });
})(jQuery);